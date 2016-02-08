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

/** the current address in the EEPROM (i.e. which byte we're going to write to next) **/
int addr = 0;

/* Set these to your desired credentials. */
const char *ap_ssid = "Window Sensor AA:BB:CC:DD:EE:FF";
const char *ap_password = "password";
char html[5000] = "";
bool scan_complete = false;
bool ap_started = false;
const int led = 13;
int address = 0;
byte value;

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

void get_input_data(){
  Serial.print("grabbing 32 bytes of analog data");
  int sensorValue = analogRead(A0);
}

void store_wifi() {
  char ssid[100] = "";
  char new_ssid[100] = "";
  char new_password[100] = "";
  char html2[500] = "";
  strcpy(ssid,server.arg(0).c_str());
  strcpy(new_password,server.arg(1).c_str());
  Serial.print("storing | SSID (");
  Serial.print(ssid);
  Serial.print(")  PASSWORD (");
  Serial.print(new_password);
  Serial.print(")\n");
  strcat(html2,"updated ssid (");
  strcat(html2,ssid);
  strcat(html2,"( and password (");
  strcat(html2,new_password);
  strcat(html2,")");
  //snprintf(html2, 400, server.arg(0));
  server.send(200, "text/html",html2);
  //for(int x=0; x < 100; x++)
  //{
  //EEPROM.write(addr,ssid[addr]);
  EEPROM.write(0,'h');
  EEPROM.write(1,'e');
  EEPROM.write(2,'l');
  EEPROM.write(3,'l');
  EEPROM.write(4,'o');
  EEPROM.write(5,'!');
  EEPROM.write(6,'\\');
  EEPROM.write(7,'n'); 

  for (int i = *ssid; i < sizeof(ssid) ; i++){
    Serial.print(ssid[i-*ssid]);
    Serial.print(" (loop) ");
    EEPROM.write(i-*ssid,ssid[i-*ssid]);    
    if (ssid[i-*ssid] == '\n'){
        Serial.println("!! end of line !!");
        strcpy(new_ssid,ssid);
        Serial.println(new_ssid);
    }
      
  }

  //}

  addr = addr + 1;
  if (addr == 100)
  {
    addr = 0;
    EEPROM.commit();
  }
  EEPROM.commit();
}

void start_ap() {
  Serial.begin(115200);
  Serial.println("Configuring access point...");
  // WiFi.softAP(ap_ssid, ap_password);
  WiFi.softAP(ap_ssid);
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
  Serial.print(myIP);
  Serial.println();
}

void get_wifi_info(){
  Serial.println("checking wifi info | ");
  char c0 = (char)EEPROM.read(0);
  char c1 = (char)EEPROM.read(1);
  char c2 = (char)EEPROM.read(2);
  char c3 = (char)EEPROM.read(3);
  char c4 = (char)EEPROM.read(4);
  char c5 = (char)EEPROM.read(5);
  char c6 = (char)EEPROM.read(6);
  char c7 = (char)EEPROM.read(7);
  
  char ssid_string[50] = "";
  ssid_string[0] = c0;
  ssid_string[1] = c1;
  ssid_string[2] = c2;
  ssid_string[3] = c3;
  ssid_string[4] = c4;
  ssid_string[5] = c5;
  ssid_string[6] = c6;
  ssid_string[7] = c7;
    
  Serial.print(c0);
  Serial.print(" ");
  Serial.print(c1);
  Serial.print(" ");
  Serial.print(c2);
  Serial.print(" ");
  Serial.print(c3);
  Serial.print(" ");
  Serial.print(c4);
  Serial.print(" ");
  Serial.print(c5);
  Serial.print(" ");
  Serial.print(c6);
  Serial.print(" ");
  Serial.print(c7);    
  Serial.println();
  
  if (c6 == '\\'){
    if (c7 == 'n'){
      Serial.println("end of line");  
    }
  }
  // advance to the next address of the EEPROM
  address = address + 1;
  // there are only 512 bytes of EEPROM, from 0 to 511, so if we're
  // on address 512, wrap around to address 0
  if (address == 100)
    address = 0;
}

void scan() {
  Serial.println("scan start");
  // WiFi.scanNetworks will return the number of networks found
  int n = WiFi.scanNetworks();
  Serial.println("scan done");
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
      char ssid[100] = "";
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
  Serial.println(html);
}

void setup() {
  Serial.begin(115200);
  // Set WiFi to station mode and disconnect from an AP if it was previously connected
  WiFi.mode(WIFI_STA);
  WiFi.disconnect();
  EEPROM.begin(512);
  get_wifi_info();  
}

void loop() {
  if (scan_complete) {
    if (!ap_started){
      start_ap();
      ap_started = true;
    }
  } else {
    scan();
  }
  //store_wifi();
  server.handleClient();
  delay(100);
} 
