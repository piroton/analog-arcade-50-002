// test out if the pins are working
#include <FastLED.h>

#define NUM_LEDS 11
#define NUM_HEADS 3
#define LEDLINE_A 10
#define LEDLINE_B 11
#define LEDLINE_C 12
#define LEDLINE_HD 13

#define COL_RED 0xFF0000
#define COL_GRN 0x17A589
#define COL_BLU 0x5DADE2
#define COL_VIO 0x9B59B6
#define COL_BLK 0x000000

CRGB leds1[NUM_LEDS];
CRGB leds2[NUM_LEDS];
CRGB leds3[NUM_LEDS];
CRGB ledheads[NUM_HEADS];

void setup() {
  Serial.begin(9600);
  
  // put your setup code here, to run once:
  pinMode(2, INPUT_PULLUP);
  pinMode(3, INPUT_PULLUP);
  pinMode(4, INPUT_PULLUP);
  pinMode(5, INPUT_PULLUP);
  pinMode(6, INPUT_PULLUP);
  pinMode(7, INPUT_PULLUP);
  pinMode(8, INPUT_PULLUP);
  pinMode(9, INPUT_PULLUP);

  FastLED.addLeds<NEOPIXEL, LEDLINE_A>(leds1, NUM_LEDS);
  FastLED.addLeds<NEOPIXEL, LEDLINE_B>(leds2, NUM_LEDS);
  FastLED.addLeds<NEOPIXEL, LEDLINE_C>(leds3, NUM_LEDS);
  FastLED.addLeds<NEOPIXEL, LEDLINE_HD>(ledheads, NUM_HEADS);

  pinMode(LED_BUILTIN, OUTPUT);
  
}

void loop() {
  // put your main code here, to run repeatedly:
  if (digitalRead(2) == LOW){
    digitalWrite(LED_BUILTIN, HIGH);
    Serial.print(2);
    Serial.print("\n");
  }
  else if (digitalRead(3) == LOW){
    digitalWrite(LED_BUILTIN, HIGH);
    Serial.print(3);
    Serial.print("\n");
  }
  else if (digitalRead(4) == LOW){
    digitalWrite(LED_BUILTIN, HIGH);
    Serial.print(4);
    Serial.print("\n");
  }
  else if (digitalRead(5) == LOW){
    digitalWrite(LED_BUILTIN, HIGH);
    Serial.print(5);
    Serial.print("\n");
  }
  else if (digitalRead(6) == LOW){
    digitalWrite(LED_BUILTIN, HIGH);
    Serial.print(6);
    Serial.print("\n");
  }
  else if (digitalRead(7) == LOW){
    digitalWrite(LED_BUILTIN, HIGH);
    Serial.print(7);
    Serial.print("\n");
  }
  else if (digitalRead(8) == LOW){
    digitalWrite(LED_BUILTIN, HIGH);
    Serial.print(8);
    Serial.print("\n");
  }
  else if (digitalRead(9) == LOW){
    digitalWrite(LED_BUILTIN, HIGH);
    Serial.print(9);
    Serial.print("\n");
  }
  else {
    digitalWrite(LED_BUILTIN, LOW);
  }

  for(int i = 0; i<5; i++){
    leds1[i] = COL_RED;
    leds2[i] = COL_RED;
    leds3[i] = COL_RED;
  }
  FastLED.show();
}
