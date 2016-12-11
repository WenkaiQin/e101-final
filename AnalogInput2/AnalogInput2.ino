/*
Reads 2 analog input pins (range 0-1023) and
 prints the results to the serial monitor.
 
 The circuit:
 * analog signal connected to analog pin A0.
 * analog signal connected to analog pin A1.
 
*/

// These constants won't change.  They're used to give names
// to the pins used:
const int inputPin0 = A0;  // Analog input pin 0 
const int inputPin1 = A1;  // Analog input pin 1 

void setup() {
    Serial.begin(9600); 
}

void loop() {
  
  // analogRead values from 0 to 1023 (10 bit ADC)
  int sensorVal0 = analogRead(inputPin0);
  int sensorVal1 = analogRead(inputPin1);
 
  
  // print the results to the serial monitor:                    
  Serial.print(sensorVal0);
  Serial.print("  ");
  Serial.println(sensorVal1);  
  
  delay(10);  // sample time ms                 
}


