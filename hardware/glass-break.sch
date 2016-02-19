EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:glass-break
LIBS:glass-break-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L esp12 U?
U 1 1 56C613D6
P 5650 2350
F 0 "U?" H 6000 1650 60  0000 C CNN
F 1 "esp12" V 5650 2250 60  0000 C CNN
F 2 "" H 5700 2700 60  0000 C CNN
F 3 "" H 5700 2700 60  0000 C CNN
	1    5650 2350
	-1   0    0    1   
$EndComp
$Comp
L CONN_01X06 JP1
U 1 1 56C62737
P 8900 5800
F 0 "JP1" H 8900 6150 50  0000 C CNN
F 1 "CONN_01X06" V 9000 5800 50  0000 C CNN
F 2 "" H 8900 5800 50  0000 C CNN
F 3 "" H 8900 5800 50  0000 C CNN
	1    8900 5800
	0    -1   -1   0   
$EndComp
$Comp
L CONN_01X10 JP4
U 1 1 56C6288D
P 8500 5000
F 0 "JP4" H 8500 5550 50  0000 C CNN
F 1 "CONN_01X10" V 8600 5000 50  0000 C CNN
F 2 "" H 8500 5000 50  0000 C CNN
F 3 "" H 8500 5000 50  0000 C CNN
	1    8500 5000
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X10 JP5
U 1 1 56C628CA
P 9250 5000
F 0 "JP5" H 9250 5550 50  0000 C CNN
F 1 "CONN_01X10" V 9350 5000 50  0000 C CNN
F 2 "" H 9250 5000 50  0000 C CNN
F 3 "" H 9250 5000 50  0000 C CNN
	1    9250 5000
	-1   0    0    1   
$EndComp
$Comp
L GND #PWR?
U 1 1 56C6419A
P 9150 6100
F 0 "#PWR?" H 9150 5850 50  0001 C CNN
F 1 "GND" H 9150 5950 50  0000 C CNN
F 2 "" H 9150 6100 50  0000 C CNN
F 3 "" H 9150 6100 50  0000 C CNN
	1    9150 6100
	1    0    0    -1  
$EndComp
Text Label 8000 4550 0    39   ~ 0
RESET_5V
Text Label 8000 4650 0    39   ~ 0
ADC
Text Label 8000 4750 0    39   ~ 0
CH_PD
Text Label 8000 4850 0    39   ~ 0
GPIO16
Text Label 8000 4950 0    39   ~ 0
GPIO14
Text Label 8000 5050 0    39   ~ 0
GPIO12
Text Label 8000 5150 0    39   ~ 0
GPIO13
Text Label 8000 5250 0    39   ~ 0
VIN
Text Label 8000 5350 0    39   ~ 0
VBAT
Text Label 8000 5450 0    39   ~ 0
GND
Text Label 9500 4550 0    39   ~ 0
TXD
Text Label 9500 4650 0    39   ~ 0
RXD_5V
Text Label 9500 4750 0    39   ~ 0
GPIO5
Text Label 9500 4850 0    39   ~ 0
GPIO4
Text Label 9500 4950 0    39   ~ 0
GPIO0
Text Label 9500 5050 0    39   ~ 0
GPIO2
Text Label 9500 5150 0    39   ~ 0
GPIO15
Text Label 9500 5250 0    39   ~ 0
3.3V
Text Label 9500 5350 0    39   ~ 0
LDO_EN
Text Label 9500 5450 0    39   ~ 0
GND
Text Label 8750 6300 1    39   ~ 0
TXD
Text Label 8850 6300 1    39   ~ 0
RXD_5V
$Comp
L VIN #PWR?
U 1 1 56C65773
P 8950 6100
F 0 "#PWR?" H 8950 5850 50  0001 C CNN
F 1 "VIN" H 8950 5950 50  0000 C CNN
F 2 "" H 8950 6100 50  0000 C CNN
F 3 "" H 8950 6100 50  0000 C CNN
	1    8950 6100
	1    0    0    -1  
$EndComp
$Comp
L SPX3819 U1?
U 1 1 56C65BE9
P 3500 6800
F 0 "U1?" H 3250 7150 50  0000 C CNN
F 1 "SPX3819" H 3650 7150 50  0000 C CNN
F 2 "" H 3500 6400 50  0000 C CIN
F 3 "" H 3550 6300 50  0001 C CNN
	1    3500 6800
	1    0    0    -1  
$EndComp
$Comp
L R R3
U 1 1 56C65DB7
P 2200 7050
F 0 "R3" V 2280 7050 50  0000 C CNN
F 1 "10K" V 2200 7050 50  0000 C CNN
F 2 "" V 2130 7050 50  0000 C CNN
F 3 "" H 2200 7050 50  0000 C CNN
	1    2200 7050
	1    0    0    -1  
$EndComp
$Comp
L C C?
U 1 1 56C6600B
P 1850 7050
F 0 "C?" H 1875 7150 50  0000 L CNN
F 1 "10UF" H 1875 6950 50  0000 L CNN
F 2 "" H 1888 6900 50  0000 C CNN
F 3 "" H 1850 7050 50  0000 C CNN
	1    1850 7050
	1    0    0    -1  
$EndComp
$Comp
L ZENER MBR120
U 1 1 56C66052
P 2200 6250
F 0 "MBR120" H 2200 6350 50  0000 C CNN
F 1 "ZENER" H 2200 6150 50  0000 C CNN
F 2 "" H 2200 6250 50  0000 C CNN
F 3 "" H 2200 6250 50  0000 C CNN
	1    2200 6250
	0    -1   -1   0   
$EndComp
$Comp
L ZENER MBR120
U 1 1 56C660C8
P 1850 6250
F 0 "MBR120" H 1850 6350 50  0000 C CNN
F 1 "ZENER" H 1850 6150 50  0000 C CNN
F 2 "" H 1850 6250 50  0000 C CNN
F 3 "" H 1850 6250 50  0000 C CNN
	1    1850 6250
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR?
U 1 1 56C6667E
P 1850 7200
F 0 "#PWR?" H 1850 6950 50  0001 C CNN
F 1 "GND" H 1850 7050 50  0000 C CNN
F 2 "" H 1850 7200 50  0000 C CNN
F 3 "" H 1850 7200 50  0000 C CNN
	1    1850 7200
	1    0    0    -1  
$EndComp
$Comp
L VIN #PWR?
U 1 1 56C666B8
P 1850 6000
F 0 "#PWR?" H 1850 5750 50  0001 C CNN
F 1 "VIN" H 1850 5850 50  0000 C CNN
F 2 "" H 1850 6000 50  0000 C CNN
F 3 "" H 1850 6000 50  0000 C CNN
	1    1850 6000
	1    0    0    1   
$EndComp
$Comp
L +BATT #PWR?
U 1 1 56C66744
P 2200 5900
F 0 "#PWR?" H 2200 5750 50  0001 C CNN
F 1 "+BATT" H 2200 6040 50  0000 C CNN
F 2 "" H 2200 5900 50  0000 C CNN
F 3 "" H 2200 5900 50  0000 C CNN
	1    2200 5900
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR?
U 1 1 56C668EA
P 4150 6450
F 0 "#PWR?" H 4150 6300 50  0001 C CNN
F 1 "+3.3V" H 4150 6590 50  0000 C CNN
F 2 "" H 4150 6450 50  0000 C CNN
F 3 "" H 4150 6450 50  0000 C CNN
	1    4150 6450
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 56C6694A
P 2750 7150
F 0 "#PWR?" H 2750 6900 50  0001 C CNN
F 1 "GND" H 2750 7000 50  0000 C CNN
F 2 "" H 2750 7150 50  0000 C CNN
F 3 "" H 2750 7150 50  0000 C CNN
	1    2750 7150
	1    0    0    -1  
$EndComp
Text Label 2850 6800 2    39   ~ 0
LDO_EN
$Comp
L D D?
U 1 1 56C670E7
P 4000 5400
F 0 "D?" H 4000 5500 50  0000 C CNN
F 1 "D" H 4000 5300 50  0000 C CNN
F 2 "" H 4000 5400 50  0000 C CNN
F 3 "" H 4000 5400 50  0000 C CNN
	1    4000 5400
	1    0    0    -1  
$EndComp
$Comp
L D D?
U 1 1 56C67193
P 4000 5850
F 0 "D?" H 4000 5950 50  0000 C CNN
F 1 "D" H 4000 5750 50  0000 C CNN
F 2 "" H 4000 5850 50  0000 C CNN
F 3 "" H 4000 5850 50  0000 C CNN
	1    4000 5850
	1    0    0    -1  
$EndComp
Text Label 4500 5400 2    39   ~ 0
RESET
Text Label 4450 5850 2    39   ~ 0
RXD
Text Label 3550 5400 0    39   ~ 0
RESET_5V
Text Label 3550 5850 0    39   ~ 0
RXD_5V
$Comp
L R R?
U 1 1 56C687F1
P 1550 2350
F 0 "R?" V 1630 2350 50  0000 C CNN
F 1 "1k" V 1550 2350 50  0000 C CNN
F 2 "" V 1480 2350 50  0000 C CNN
F 3 "" H 1550 2350 50  0000 C CNN
	1    1550 2350
	1    0    0    -1  
$EndComp
$Comp
L D red
U 1 1 56C68878
P 1550 2050
F 0 "red" H 1550 2150 50  0000 C CNN
F 1 "D" H 1550 1950 50  0000 C CNN
F 2 "" H 1550 2050 50  0000 C CNN
F 3 "" H 1550 2050 50  0000 C CNN
	1    1550 2050
	0    -1   -1   0   
$EndComp
$Comp
L +3.3V #PWR?
U 1 1 56C68AB7
P 1550 1450
F 0 "#PWR?" H 1550 1300 50  0001 C CNN
F 1 "+3.3V" H 1550 1590 50  0000 C CNN
F 2 "" H 1550 1450 50  0000 C CNN
F 3 "" H 1550 1450 50  0000 C CNN
	1    1550 1450
	1    0    0    -1  
$EndComp
Text Label 1550 2900 1    39   ~ 0
GPIO0
$Comp
L GND #PWR?
U 1 1 56C693BB
P 2050 2900
F 0 "#PWR?" H 2050 2650 50  0001 C CNN
F 1 "GND" H 2050 2750 50  0000 C CNN
F 2 "" H 2050 2900 50  0000 C CNN
F 3 "" H 2050 2900 50  0000 C CNN
	1    2050 2900
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 56C693FB
P 2400 2900
F 0 "#PWR?" H 2400 2650 50  0001 C CNN
F 1 "GND" H 2400 2750 50  0000 C CNN
F 2 "" H 2400 2900 50  0000 C CNN
F 3 "" H 2400 2900 50  0000 C CNN
	1    2400 2900
	1    0    0    -1  
$EndComp
$Comp
L SW_PUSH SW?
U 1 1 56C6941A
P 1900 2600
F 0 "SW?" H 2050 2710 50  0000 C CNN
F 1 "SW_PUSH" H 1900 2520 50  0000 C CNN
F 2 "" H 1900 2600 50  0000 C CNN
F 3 "" H 1900 2600 50  0000 C CNN
	1    1900 2600
	0    -1   -1   0   
$EndComp
$Comp
L SW_PUSH SW?
U 1 1 56C69840
P 2250 2600
F 0 "SW?" H 2400 2710 50  0000 C CNN
F 1 "SW_PUSH" H 2250 2520 50  0000 C CNN
F 2 "" H 2250 2600 50  0000 C CNN
F 3 "" H 2250 2600 50  0000 C CNN
	1    2250 2600
	0    -1   -1   0   
$EndComp
$Comp
L R R?
U 1 1 56C69A20
P 2400 1650
F 0 "R?" V 2480 1650 50  0000 C CNN
F 1 "10K" V 2400 1650 50  0000 C CNN
F 2 "" V 2330 1650 50  0000 C CNN
F 3 "" H 2400 1650 50  0000 C CNN
	1    2400 1650
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR?
U 1 1 56C69B44
P 2400 1150
F 0 "#PWR?" H 2400 1000 50  0001 C CNN
F 1 "+3.3V" H 2400 1290 50  0000 C CNN
F 2 "" H 2400 1150 50  0000 C CNN
F 3 "" H 2400 1150 50  0000 C CNN
	1    2400 1150
	1    0    0    -1  
$EndComp
$Comp
L R R?
U 1 1 56C6A2EA
P 2800 2200
F 0 "R?" V 2880 2200 50  0000 C CNN
F 1 "10K" V 2800 2200 50  0000 C CNN
F 2 "" V 2730 2200 50  0000 C CNN
F 3 "" H 2800 2200 50  0000 C CNN
	1    2800 2200
	1    0    0    -1  
$EndComp
$Comp
L R R?
U 1 1 56C6A31B
P 3050 2200
F 0 "R?" V 3130 2200 50  0000 C CNN
F 1 "10K" V 3050 2200 50  0000 C CNN
F 2 "" V 2980 2200 50  0000 C CNN
F 3 "" H 3050 2200 50  0000 C CNN
	1    3050 2200
	1    0    0    -1  
$EndComp
$Comp
L R R?
U 1 1 56C6A347
P 3300 2200
F 0 "R?" V 3380 2200 50  0000 C CNN
F 1 "10K" V 3300 2200 50  0000 C CNN
F 2 "" V 3230 2200 50  0000 C CNN
F 3 "" H 3300 2200 50  0000 C CNN
	1    3300 2200
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR?
U 1 1 56C6A676
P 2800 1300
F 0 "#PWR?" H 2800 1150 50  0001 C CNN
F 1 "+3.3V" H 2800 1440 50  0000 C CNN
F 2 "" H 2800 1300 50  0000 C CNN
F 3 "" H 2800 1300 50  0000 C CNN
	1    2800 1300
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR?
U 1 1 56C6A699
P 3050 1250
F 0 "#PWR?" H 3050 1100 50  0001 C CNN
F 1 "+3.3V" H 3050 1390 50  0000 C CNN
F 2 "" H 3050 1250 50  0000 C CNN
F 3 "" H 3050 1250 50  0000 C CNN
	1    3050 1250
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 56C6A6F6
P 3300 2750
F 0 "#PWR?" H 3300 2500 50  0001 C CNN
F 1 "GND" H 3300 2600 50  0000 C CNN
F 2 "" H 3300 2750 50  0000 C CNN
F 3 "" H 3300 2750 50  0000 C CNN
	1    3300 2750
	1    0    0    -1  
$EndComp
Text Label 2800 2750 1    39   ~ 0
GPIO2
Text Label 3050 2750 1    39   ~ 0
CH_PD
Text Label 3300 1800 1    39   ~ 0
GPIO15
Text Label 2400 2050 1    39   ~ 0
RESET
Text Label 2050 2150 1    39   ~ 0
GPIO0
$Comp
L C C?
U 1 1 56C65752
P 8250 2800
F 0 "C?" H 8275 2900 50  0000 L CNN
F 1 "C" H 8275 2700 50  0000 L CNN
F 2 "" H 8288 2650 50  0000 C CNN
F 3 "" H 8250 2800 50  0000 C CNN
	1    8250 2800
	1    0    0    -1  
$EndComp
$Comp
L C C?
U 1 1 56C658E9
P 7300 1350
F 0 "C?" H 7325 1450 50  0000 L CNN
F 1 "C" H 7325 1250 50  0000 L CNN
F 2 "" H 7338 1200 50  0000 C CNN
F 3 "" H 7300 1350 50  0000 C CNN
	1    7300 1350
	0    -1   -1   0   
$EndComp
$Comp
L C C?
U 1 1 56C65A5B
P 8550 2350
F 0 "C?" H 8575 2450 50  0000 L CNN
F 1 "C" H 8575 2250 50  0000 L CNN
F 2 "" H 8588 2200 50  0000 C CNN
F 3 "" H 8550 2350 50  0000 C CNN
	1    8550 2350
	0    -1   -1   0   
$EndComp
$Comp
L R R?
U 1 1 56C65B57
P 7300 1550
F 0 "R?" V 7380 1550 50  0000 C CNN
F 1 "R" V 7300 1550 50  0000 C CNN
F 2 "" V 7230 1550 50  0000 C CNN
F 3 "" H 7300 1550 50  0000 C CNN
	1    7300 1550
	0    1    1    0   
$EndComp
$Comp
L R R?
U 1 1 56C65C10
P 7900 2800
F 0 "R?" V 7980 2800 50  0000 C CNN
F 1 "R" V 7900 2800 50  0000 C CNN
F 2 "" V 7830 2800 50  0000 C CNN
F 3 "" H 7900 2800 50  0000 C CNN
	1    7900 2800
	1    0    0    -1  
$EndComp
$Comp
L R R?
U 1 1 56C65CC4
P 7700 2050
F 0 "R?" V 7780 2050 50  0000 C CNN
F 1 "R" V 7700 2050 50  0000 C CNN
F 2 "" V 7630 2050 50  0000 C CNN
F 3 "" H 7700 2050 50  0000 C CNN
	1    7700 2050
	1    0    0    -1  
$EndComp
$Comp
L R R?
U 1 1 56C65CCA
P 8150 2350
F 0 "R?" V 8230 2350 50  0000 C CNN
F 1 "R" V 8150 2350 50  0000 C CNN
F 2 "" V 8080 2350 50  0000 C CNN
F 3 "" H 8150 2350 50  0000 C CNN
	1    8150 2350
	0    1    1    0   
$EndComp
$Comp
L OP275 U?
U 1 1 56C668CA
P 7300 2450
F 0 "U?" H 7300 2600 50  0000 L CNN
F 1 "OP275" H 7300 2300 50  0000 L CNN
F 2 "" H 7200 2500 50  0000 C CNN
F 3 "" H 7300 2600 50  0000 C CNN
	1    7300 2450
	-1   0    0    1   
$EndComp
$Comp
L VCC #PWR?
U 1 1 56C6700D
P 7400 1900
F 0 "#PWR?" H 7400 1750 50  0001 C CNN
F 1 "VCC" H 7400 2050 50  0000 C CNN
F 2 "" H 7400 1900 50  0000 C CNN
F 3 "" H 7400 1900 50  0000 C CNN
	1    7400 1900
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR?
U 1 1 56C67055
P 7900 2050
F 0 "#PWR?" H 7900 1900 50  0001 C CNN
F 1 "VCC" H 7900 2200 50  0000 C CNN
F 2 "" H 7900 2050 50  0000 C CNN
F 3 "" H 7900 2050 50  0000 C CNN
	1    7900 2050
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 56C67093
P 7400 3000
F 0 "#PWR?" H 7400 2750 50  0001 C CNN
F 1 "GND" H 7400 2850 50  0000 C CNN
F 2 "" H 7400 3000 50  0000 C CNN
F 3 "" H 7400 3000 50  0000 C CNN
	1    7400 3000
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 56C670DB
P 10000 2950
F 0 "#PWR?" H 10000 2700 50  0001 C CNN
F 1 "GND" H 10000 2800 50  0000 C CNN
F 2 "" H 10000 2950 50  0000 C CNN
F 3 "" H 10000 2950 50  0000 C CNN
	1    10000 2950
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 56C670FC
P 7900 3400
F 0 "#PWR?" H 7900 3150 50  0001 C CNN
F 1 "GND" H 7900 3250 50  0000 C CNN
F 2 "" H 7900 3400 50  0000 C CNN
F 3 "" H 7900 3400 50  0000 C CNN
	1    7900 3400
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR?
U 1 1 56C67153
P 10000 1800
F 0 "#PWR?" H 10000 1650 50  0001 C CNN
F 1 "VCC" H 10000 1950 50  0000 C CNN
F 2 "" H 10000 1800 50  0000 C CNN
F 3 "" H 10000 1800 50  0000 C CNN
	1    10000 1800
	1    0    0    -1  
$EndComp
$Comp
L admp401 U?
U 1 1 56C658A5
P 9250 2300
F 0 "U?" H 9000 2800 60  0000 C CNN
F 1 "admp401" H 9150 1700 60  0000 C CNN
F 2 "" H 9000 2800 60  0000 C CNN
F 3 "" H 9000 2800 60  0000 C CNN
	1    9250 2300
	1    0    0    -1  
$EndComp
$Comp
L USB_OTG P?
U 1 1 56C75F6C
P 5650 3950
F 0 "P?" H 5975 3825 50  0000 C CNN
F 1 "USB_OTG" H 5650 4150 50  0000 C CNN
F 2 "" V 5600 3850 50  0000 C CNN
F 3 "" V 5600 3850 50  0000 C CNN
	1    5650 3950
	1    0    0    -1  
$EndComp
Wire Wire Line
	8750 6000 8750 6400
Wire Wire Line
	8850 6000 8850 6400
Wire Wire Line
	8950 6000 8950 6100
Wire Wire Line
	9150 6000 9150 6100
Wire Wire Line
	8300 4550 7900 4550
Wire Wire Line
	8300 4650 7900 4650
Wire Wire Line
	8300 4750 7900 4750
Wire Wire Line
	8300 4850 7900 4850
Wire Wire Line
	8300 4950 7900 4950
Wire Wire Line
	8300 5050 7900 5050
Wire Wire Line
	8300 5150 7900 5150
Wire Wire Line
	8300 5250 7900 5250
Wire Wire Line
	8300 5350 7900 5350
Wire Wire Line
	8300 5450 7900 5450
Wire Wire Line
	9450 4550 9850 4550
Wire Wire Line
	9450 4650 9850 4650
Wire Wire Line
	9450 4750 9850 4750
Wire Wire Line
	9450 4850 9850 4850
Wire Wire Line
	9450 4950 9850 4950
Wire Wire Line
	9450 5050 9850 5050
Wire Wire Line
	9450 5150 9850 5150
Wire Wire Line
	9450 5250 9850 5250
Wire Wire Line
	9450 5350 9850 5350
Wire Wire Line
	9450 5450 9850 5450
Wire Wire Line
	3900 6600 4150 6600
Wire Wire Line
	4150 6600 4150 6450
Wire Wire Line
	3100 7000 2750 7000
Wire Wire Line
	2750 7000 2750 7150
Wire Wire Line
	3100 6800 2550 6800
Wire Wire Line
	2550 6800 2550 7300
Wire Wire Line
	2550 7300 2200 7300
Wire Wire Line
	2200 7300 2200 7200
Wire Wire Line
	2200 6450 2200 6900
Wire Wire Line
	1850 6600 3100 6600
Connection ~ 2200 6600
Wire Wire Line
	1850 6450 1850 6900
Connection ~ 1850 6600
Wire Wire Line
	1850 6050 1850 6000
Wire Wire Line
	2200 6050 2200 5900
Wire Wire Line
	4150 5400 4750 5400
Wire Wire Line
	4150 5850 4750 5850
Wire Wire Line
	3850 5400 3450 5400
Wire Wire Line
	3850 5850 3450 5850
Wire Wire Line
	1550 1900 1550 1450
Wire Wire Line
	2050 2900 1900 2900
Wire Wire Line
	2050 2300 1900 2300
Wire Wire Line
	2250 2900 2400 2900
Wire Wire Line
	2250 2300 2400 2300
Wire Wire Line
	2400 2300 2400 1800
Wire Wire Line
	2400 1500 2400 1150
Wire Wire Line
	1550 2500 1550 2950
Wire Wire Line
	2050 1850 2050 2300
Wire Wire Line
	2800 2900 2800 2300
Wire Wire Line
	3050 2350 3050 2900
Wire Wire Line
	3300 2350 3300 2750
Wire Wire Line
	3050 2050 3050 1250
Wire Wire Line
	2800 2050 2800 1300
Wire Wire Line
	3300 1250 3300 2050
Wire Wire Line
	6850 1350 6850 2450
Wire Wire Line
	6850 1550 7150 1550
Wire Wire Line
	6850 1350 7150 1350
Connection ~ 6850 1550
Wire Wire Line
	8300 2350 8400 2350
Wire Wire Line
	7700 1350 7700 1900
Wire Wire Line
	7900 2050 7900 2650
Wire Wire Line
	8000 2350 7600 2350
Wire Wire Line
	7700 1550 7450 1550
Wire Wire Line
	7900 2950 7900 3400
Wire Wire Line
	7900 3050 8250 3050
Wire Wire Line
	8250 3050 8250 2950
Connection ~ 7900 3050
Wire Wire Line
	7600 2550 8250 2550
Wire Wire Line
	8250 2550 8250 2650
Connection ~ 7900 2550
Wire Wire Line
	7450 1350 7700 1350
Connection ~ 7700 1550
Wire Wire Line
	7400 2150 7400 1900
Wire Wire Line
	7700 2200 7700 2350
Connection ~ 7700 2350
Connection ~ 6850 2450
Wire Wire Line
	7400 2750 7400 3000
Wire Wire Line
	10000 1800 10000 2050
Wire Wire Line
	10000 2050 9800 2050
Wire Wire Line
	9800 2550 10000 2550
Wire Wire Line
	10000 2550 10000 2950
Wire Wire Line
	9800 2650 10000 2650
Connection ~ 10000 2650
Wire Wire Line
	9800 2750 10000 2750
Connection ~ 10000 2750
Wire Wire Line
	6300 2450 7000 2450
Wire Wire Line
	5850 4250 5850 4450
Wire Wire Line
	5450 4250 5450 4450
$Comp
L GND #PWR?
U 1 1 56C764D7
P 5850 4450
F 0 "#PWR?" H 5850 4200 50  0001 C CNN
F 1 "GND" H 5850 4300 50  0000 C CNN
F 2 "" H 5850 4450 50  0000 C CNN
F 3 "" H 5850 4450 50  0000 C CNN
	1    5850 4450
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR?
U 1 1 56C76525
P 5450 4450
F 0 "#PWR?" H 5450 4300 50  0001 C CNN
F 1 "VCC" H 5450 4600 50  0000 C CNN
F 2 "" H 5450 4450 50  0000 C CNN
F 3 "" H 5450 4450 50  0000 C CNN
	1    5450 4450
	1    0    0    1   
$EndComp
$EndSCHEMATC
