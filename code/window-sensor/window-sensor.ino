/*
 * Copyright (c) 2015, Majenko Technologies
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without modification,
 * are permitted provided that the following conditions are met:
 *
 * * Redistributions of source code must retain the above copyright notice, this
 *   list of conditions and the following disclaimer.
 *
 * * Redistributions in binary form must reproduce the above copyright notice, this
 *   list of conditions and the following disclaimer in the documentation and/or
 *   other materials provided with the distribution.
 *
 * * Neither the name of Majenko Technologies nor the names of its
 *   contributors may be used to endorse or promote products derived from
 *   this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
 * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
 * WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR
 * ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON
 * ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

/* Create a WiFi access point and provide a web server on it. */

#include <ESP8266WiFi.h>
#include <WiFiClient.h>
#include <ESP8266WebServer.h>
#include <ESP8266mDNS.h>
#include <EEPROM.h>
#include <Arduino.h>
#include <ESP8266WiFi.h>
#include <ESP8266WiFiMulti.h>
#include <WebSocketsClient.h>
#include <Hash.h>
ESP8266WiFiMulti WiFiMulti;
WebSocketsClient webSocket;

/** the current address in the EEPROM (i.e. which byte we're going to write to next) **/
int addr = 0;

/* Set these to your desired credentials. */
const char *ap_ssid = "Window Sensor ";
const char *ap_password = "password";
char html[5000] = "";
bool scan_complete = false;
bool ap_started = false;
bool connect_to_ap = false;
const int led = 13;
int address = 0;
int ssid_ptr = 0;
int password_addr = 0;
byte value;
char new_ssid[50] = "";
char ssid[sizeof(new_ssid)] = "";  
char new_password[50] = "";
char password[sizeof(new_password)] = "";
const int bufferSize = 2000;
char analog_data[bufferSize] = "";
byte mac[6];                     // the MAC address of your Wifi shield
char current_ssid[100];
  
ESP8266WebServer server(80);

/* Just a little test message.  Go to http://192.168.4.1 in a web browser
 * connected to this access point to see it.
 */
void handleRoot() {
  server.send(200, "text/html", html);
}

void handleSensor() {
  digitalWrite ( led, 1 );
  char temp[400];
  int sec = millis() / 1000;
  int min = sec / 60;
  int hr = min / 60;
  snprintf ( temp, 400,
"<html>\
  <head>\
    <meta http-equiv='refresh' content='5'/>\
    <title>ESP8266 Demo</title>\
    <style>\
      body { background-color: #cccccc; font-family: Arial, Helvetica, Sans-Serif; Color: #000088; }\
    </style>\
  </head>\
  <body>\
    <h1>Hello from ESP8266!</h1>\
    <p>Uptime: %02d:%02d:%02d</p>\
    <img src=\"/test.svg\" />\
  </body>\
</html>",
    hr, min % 60, sec % 60
  );
  server.send ( 200, "text/html", temp );
  digitalWrite ( led, 0 );
}

void handleNotFound() {
  digitalWrite ( led, 1 );
  String message = "File Not Found\n\n";
  message += "URI: ";
  message += server.uri();
  message += "\nMethod: ";
  message += ( server.method() == HTTP_GET ) ? "GET" : "POST";
  message += "\nArguments: ";
  message += server.args();
  message += "\n";
  for ( uint8_t i = 0; i < server.args(); i++ ) {
    message += " " + server.argName ( i ) + ": " + server.arg ( i ) + "\n";
  }
  server.send ( 404, "text/plain", message );
  digitalWrite ( led, 0 );
}

void drawGraph() {
  String out = "";
  char temp[100];
  out += "<svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"400\" height=\"150\">\n";
  out += "<rect width=\"400\" height=\"150\" fill=\"rgb(250, 230, 210)\" stroke-width=\"1\" stroke=\"rgb(0, 0, 0)\" />\n";
  out += "<g stroke=\"black\">\n";
  int y = rand() % 130;
  for (int x = 10; x < 390; x+= 10) {
    int y2 = rand() % 130;
    sprintf(temp, "<line x1=\"%d\" y1=\"%d\" x2=\"%d\" y2=\"%d\" stroke-width=\"1\" />\n", x, 140 - y, x + 10, 140 - y2);
    out += temp;
    y = y2;
  }
  out += "</g>\n</svg>\n";
  server.send ( 200, "image/svg+xml", out);
}

void get_analog_data(){
  int average_magnitude = 0;
  uint8_t analog_data[bufferSize];
  for (int i = 0; i < bufferSize; i++){
    analog_data[i] = analogRead(A0);
    average_magnitude += analog_data[i];
    Serial.print(analog_data[i]);
    Serial.print(" ");
    //delay(1);
  }
  average_magnitude = average_magnitude / bufferSize;
  Serial.print("sending 2kbytes bytes of analog data (average magnitude "); 
  Serial.print(average_magnitude);
  Serial.println(")");

  //webSocket.sendTXT(current_ssid);
  webSocket.sendBIN(analog_data, bufferSize);
  //delay(1);
}

void store_wifi() {
  char new_password[100] = "";
  char html2[500] = "";
  strcpy(new_ssid,server.arg(0).c_str());
  strcpy(new_password,server.arg(1).c_str());
  Serial.print("storing | SSID (");
  Serial.print(new_ssid);
  Serial.print(")  PASSWORD (");
  Serial.print(new_password);
  Serial.print(")\n");
  strcat(html2,"updated ssid (");
  strcat(html2,new_ssid);
  strcat(html2,") and password (");
  strcat(html2,new_password);
  strcat(html2,")");

  server.send(200, "text/html",html2);

  int j = 0;
  int i = 0;
  ssid_ptr = 0;

  for (int i = 0; i < 100; i++) //clear some memory
    EEPROM.write(i, 0);
  
  for (i = 0; i < sizeof(new_ssid) ; i++){
    if (new_ssid[i]) {
      Serial.print(" (loop) ");
      Serial.print(i);
      Serial.print(" ");
      Serial.println(new_ssid[i]);
      EEPROM.write(i,new_ssid[i]);      
    } else {
      j = i;
      i = sizeof(new_ssid);          
    }
  }
  Serial.print(" (adding) ");
  Serial.print(j);
  Serial.println(" null ");
  EEPROM.write(j,0);
  j++;
  for (i = 0; i < sizeof(new_password) ; i++,j++){
    if (new_password[i]) {
      Serial.print(" (loop) ");
      Serial.print(j);
      Serial.print(" ");
      Serial.println(new_password[i]);
      EEPROM.write(j,new_password[i]);       
    } else {
      i = sizeof(new_password);
    }
  }
  Serial.print(" (adding) ");
  Serial.print(j);
  Serial.println(" null ");
  EEPROM.write(j,0);
  EEPROM.commit();
  Serial.println((char)EEPROM.read(j+1));
}

void start_ap() {
  Serial.begin(115200);
  Serial.println("Configuring access point...");
  // WiFi.softAP(ap_ssid, ap_password);
  WiFi.softAP(current_ssid);
  IPAddress myIP = WiFi.softAPIP();
  server.on("/", handleRoot);
  server.on("/store_wifi", store_wifi);
  server.on( "/sensor", handleSensor );
  server.on( "/test.svg", drawGraph );
  server.on( "/inline", []() {
  server.send( 200, "text/plain", "this works as well" );
  } );
  server.onNotFound ( handleNotFound );
  server.begin();
  Serial.print("gui access on http://");
  Serial.println(myIP);
}

void scan() {
  // WiFi.scanNetworks will return the number of networks found
  int n = WiFi.scanNetworks();
  scan_complete = true;
  strcat(html,"<form action='/store_wifi' method='get'>");
  strcat(html,"<select name='ssid'>");
  if (n == 0)
    Serial.println("no networks found");
  else
  {
    Serial.print(n);
    Serial.println(" networks found");
    for (int i = 0; i < n; ++i)
    {
      //char ssid[50] = "";
      strcpy(ssid,WiFi.SSID(i).c_str());
      strcat(html,"<option value='");
      strcat(html,ssid);
      strcat(html,"'>");
      strcat(html,ssid);
      strcat(html,"</option>");
      Serial.print(i + 1);
      Serial.print(": ");
      Serial.print(WiFi.SSID(i));
      Serial.print(" (");
      Serial.print(WiFi.RSSI(i));
      Serial.print(")");
      Serial.println((WiFi.encryptionType(i) == ENC_TYPE_NONE)?" ":"*");
      delay(10);
    }
  }
  strcat(html,"</select><br>");
  strcat(html,"<input name='password' type='text' placeholder='password'></input><br>");
  strcat(html,"<input type='submit' value='Submit'></button></form>");
  //Serial.println(html);
  start_ap();
}

void ap_connect(){
  delay(500);

  WiFi.disconnect();
  WiFi.mode(WIFI_AP);
  const char* ssid2     = ssid;
  const char* password2 = password;

  const char* host = "data.sparkfun.com";
  const char* streamId   = "....................";
  const char* privateKey = "....................";

  Serial.print("connecting to ");
  Serial.print(ssid);
  Serial.print(" with ");
  Serial.println(password);
  Serial.print("password ");
  Serial.println(password2);
  WiFi.begin(ssid2, password2);
  int count = 0;
  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.print(".");
    count++;
    if ( count == 20 ) {
      scan();
      return;
    }
  }
    
  scan();
  Serial.println("");
  Serial.println("WiFi connected");
  Serial.println(WiFi.localIP());

}

void get_wifi_info(){
  Serial.println();
  Serial.println("getting wifi info...");

  //reading ssid
  for (int i = 0; i < sizeof(ssid); i++){
    ssid[i] = (char)EEPROM.read(i);    
    if (!ssid[i]){
      password_addr = i+1; //advance passed the null
      i = sizeof(ssid);
    }
  }

  //reading ssid password
  for (int i = 0; i < sizeof(password); i++,password_addr++){
    password[i] = (char)EEPROM.read(password_addr);
    Serial.print(" (reading password) ");
    Serial.println(password[i]);
    if (!password[i]){
      i = sizeof(password);
    }
  }

  if (sizeof(password) > 4 && sizeof(ssid) > 4){
    ap_connect();
  }
  
  address = address + 1;
  // there are only 512 bytes of EEPROM, from 0 to 511, so if we're
  // on address 512, wrap around to address 0
  if (address == 100)
    address = 0;
}

void webSocketEvent(WStype_t type, uint8_t * payload, size_t lenght) {


    switch(type) {
        case WStype_DISCONNECTED:
            Serial.printf("[WSc] Disconnected!\n");
            break;
        case WStype_CONNECTED:
            {
                Serial.printf("[WSc] Connected to url: %s\n",  payload);
        
              // send message to server when Connected
              char data[200] = "hello from ";
              strcat(data,ap_ssid);
              webSocket.sendTXT(data);
            }
            break;
        case WStype_TEXT:
            Serial.printf("[WSc] get text: %s\n", payload);

      // send message to server
      // webSocket.sendTXT("message here");
            break;
        case WStype_BIN:
            Serial.printf("[WSc] get binary lenght: %u\n", lenght);
            hexdump(payload, lenght);

            // send data to server
            // webSocket.sendBIN(payload, lenght);
            break;
    }

}

void setup() {
  Serial.begin(115200);
  // Set WiFi to station mode and disconnect from an AP if it was previously connected
  WiFi.mode(WIFI_STA);
  WiFi.disconnect();
  EEPROM.begin(512);
  get_wifi_info();

  for(uint8_t t = 2; t > 0; t--) {
    Serial.printf("[SETUP] BOOT WAIT %d...\n", t);
    Serial.flush();
    delay(1000);
  }
  
  //WiFi.disconnect();
  while(WiFiMulti.run() != WL_CONNECTED) {
      delay(100);
  }

  webSocket.begin("68.12.157.176", 3131);
  webSocket.onEvent(webSocketEvent);
  char mac_addr[20] = "";
  WiFi.macAddress(mac);
  Serial.print("MAC: ");
  Serial.print(mac[5],HEX);
  Serial.print(":");
  Serial.print(mac[4],HEX);
  Serial.print(":");
  Serial.print(mac[3],HEX);
  Serial.print(":");
  Serial.print(mac[2],HEX);
  Serial.print(":");
  Serial.print(mac[1],HEX);
  Serial.print(":");
  Serial.println(mac[0],HEX);
  sprintf(mac_addr,"%02x:%02x:%02x:%02x:%02x:%02x",mac[5],mac[4],mac[3],mac[2],mac[1],mac[0]);  
  strcpy(current_ssid,ap_ssid);
  strcat(current_ssid,mac_addr);
}

void loop() {
  /*if (scan_complete) {
    if (!ap_started){
      start_ap();
      ap_started = true;
    }
  } else {
    scan();
  }*/
  webSocket.loop();  
  server.handleClient();
  get_analog_data();
  delay(100);
  webSocket.sendTXT(current_ssid);  
} 
