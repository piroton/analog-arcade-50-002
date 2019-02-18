#include <FastLED.h>

#define NUM_LEDS 11
#define NUM_HEADS 3
#define LEDLINE_A 6
#define LEDLINE_B 7
#define LEDLINE_C 8
#define LEDLINE_HD 9

#define COL_RED 0xFF0000
#define COL_GRN 0x17A589
#define COL_BLU 0x5DADE2
#define COL_VIO 0x9B59B6

CRGB leds1[NUM_LEDS];
CRGB leds2[NUM_LEDS];
CRGB leds3[NUM_LEDS];
CRGB ledheads[NUM_HEADS];

void setup() {
  // put your setup code here, to run once:
  FastLED.addLeds<NEOPIXEL, LEDLINE_A>(leds1, NUM_LEDS);
  FastLED.addLeds<NEOPIXEL, LEDLINE_B>(leds2, NUM_LEDS);
  FastLED.addLeds<NEOPIXEL, LEDLINE_C>(leds3, NUM_LEDS);
  FastLED.addLeds<NEOPIXEL, LEDLINE_HD>(ledheads, NUM_HEADS);
}

void loop() {
  for(int i = 0; i<12; i++){
    leds1[i] = COL_RED;
    leds2[i] = COL_BLU;
    leds3[i] = COL_GRN;
  }
}
