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
L electret_microphone U?
U 1 1 56808D06
P 7400 2750
F 0 "U?" H 7050 2700 60  0000 C CNN
F 1 "electret_microphone" H 7400 3050 60  0000 C CNN
F 2 "" H 7300 2900 60  0000 C CNN
F 3 "" H 7300 2900 60  0000 C CNN
	1    7400 2750
	-1   0    0    1   
$EndComp
$Comp
L R R?
U 1 1 568094A4
P 6850 3150
F 0 "R?" V 6930 3150 50  0000 C CNN
F 1 "2.2k" V 6850 3150 50  0000 C CNN
F 2 "" V 6780 3150 50  0000 C CNN
F 3 "" H 6850 3150 50  0000 C CNN
	1    6850 3150
	-1   0    0    1   
$EndComp
$Comp
L VCC #PWR?
U 1 1 56809590
P 6850 3450
F 0 "#PWR?" H 6850 3300 50  0001 C CNN
F 1 "VCC" H 6850 3600 50  0000 C CNN
F 2 "" H 6850 3450 50  0000 C CNN
F 3 "" H 6850 3450 50  0000 C CNN
	1    6850 3450
	-1   0    0    1   
$EndComp
$Comp
L ATMEGA328-P IC?
U 1 1 5680AC88
P 5050 3200
F 0 "IC?" H 4300 4450 50  0000 L BNN
F 1 "ATMEGA328-P" H 5450 1800 50  0000 L BNN
F 2 "DIL28" H 5050 3200 50  0000 C CIN
F 3 "" H 5050 3200 50  0000 C CNN
	1    5050 3200
	1    0    0    -1  
$EndComp
Wire Wire Line
	4150 4300 4150 4550
$Comp
L GND #PWR?
U 1 1 5680B0F5
P 4150 4550
F 0 "#PWR?" H 4150 4300 50  0001 C CNN
F 1 "GND" H 4150 4400 50  0000 C CNN
F 2 "" H 4150 4550 50  0000 C CNN
F 3 "" H 4150 4550 50  0000 C CNN
	1    4150 4550
	1    0    0    -1  
$EndComp
Connection ~ 4150 4400
$Comp
L VCC #PWR?
U 1 1 5680B1F1
P 4000 2000
F 0 "#PWR?" H 4000 1850 50  0001 C CNN
F 1 "VCC" H 4000 2150 50  0000 C CNN
F 2 "" H 4000 2000 50  0000 C CNN
F 3 "" H 4000 2000 50  0000 C CNN
	1    4000 2000
	1    0    0    -1  
$EndComp
Wire Wire Line
	4150 2100 4000 2100
Wire Wire Line
	4000 2100 4000 2000
Wire Wire Line
	4150 2100 4150 2700
Connection ~ 4150 2400
$Comp
L GND #PWR?
U 1 1 5680B54B
P 7100 2650
F 0 "#PWR?" H 7100 2400 50  0001 C CNN
F 1 "GND" H 7100 2500 50  0000 C CNN
F 2 "" H 7100 2650 50  0000 C CNN
F 3 "" H 7100 2650 50  0000 C CNN
	1    7100 2650
	0    1    1    0   
$EndComp
Wire Wire Line
	7200 2650 7100 2650
Wire Wire Line
	6850 3450 6850 3300
Wire Wire Line
	6850 3000 6850 2950
Wire Wire Line
	6700 2950 7200 2950
$Comp
L C C?
U 1 1 5680B651
P 6550 2950
F 0 "C?" V 6600 3050 50  0000 L CNN
F 1 "1u" V 6600 2800 50  0000 L CNN
F 2 "" H 6588 2800 50  0000 C CNN
F 3 "" H 6550 2950 50  0000 C CNN
	1    6550 2950
	0    -1   -1   0   
$EndComp
Connection ~ 6850 2950
Wire Wire Line
	6050 2950 6400 2950
$EndSCHEMATC
