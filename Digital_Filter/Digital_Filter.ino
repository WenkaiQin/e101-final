/*
  Digital FIR Filter
 
 Reads analog input pin (range 0-1023) and
 prints the filtered output to the serial monitor
 
 The circuit:
 * analog signal connected to analog pin A1

The filter used in this template is a three point averaging filter.
 You will need to adapt the program for a modified comb filter

*/
const int inputPin = A1;  // Analog input pin  

// filter coefficients
const float b0=1/26.1803;
const float b1=2.61803/26.1803;
const float b2=4.23607/26.1803;
const float b3=5.23607/26.1803;
const float b4=5.23607/26.1803;
const float b5=4.23607/26.1803;
const float b6=2.61803/26.1803;
const float b7=1/26.1803;

// initial values for internal signals
int xstore1 = 0;
int xstore2 = 0;
int xstore3 = 0;
int xstore4 = 0;
int xstore5 = 0;
int xstore6 = 0;
int xstore7 = 0;

int yn = 0;

void setup() {
  Serial.begin(9600);
}

void loop() {
  
  // analogRead value from pin A1 (0-1023)
  int xn = analogRead(inputPin);
  
  
  // difference equation for filter                    
   yn= b0*xn  + b1*xstore1 + b2*xstore2 + b3*xstore3 + 
       b4*xstore4 + b5*xstore5 + b6*xstore6 + b7*xstore7;
   
  // print to output
  Serial.print(xn);
  Serial.print("  ");
  Serial.println(yn); 
  
  // update stored values
  xstore7 = xstore6;
  xstore6 = xstore5;
  xstore5 = xstore4;
  xstore4 = xstore3;
  xstore3 = xstore2;
  xstore2 = xstore1;
  xstore1 = xn;
  
  delay(10);  // sample time ms               
}





