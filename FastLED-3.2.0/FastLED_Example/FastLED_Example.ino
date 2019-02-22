#include <FastLED.h>

#define NUM_LEDS 10
#define NUM_HEADS 3
#define LEDLINE_A 11

#define COL_RED 0xFF0000
#define COL_GRN 0x17A589
#define COL_BLU 0x5DADE2
#define COL_VIO 0x9B59B6

CRGB leds1[NUM_LEDS];

void setup() {
  // put your setup code here, to run once:
  FastLED.addLeds<NEOPIXEL, LEDLINE_A>(leds1, NUM_LEDS);
}

void loop() {
  for(int i = 0; i<10; i++){
    leds1[i] = COL_RED;
  }
  FastLED.show();
}
