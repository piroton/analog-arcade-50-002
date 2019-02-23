// Notes:
// int 0 is represented by 48 from input
// int 9 is represented by 57 from input
/**
README
Nim machine. Currently I/O uses serial monitor to test game logic. Once game is set up 
we'll change accordingly.

States
0 - Start (press ' ' to move to state 2)
1 - left stack
2 - middle stack
3 - right stack
4 - end game

Up button (Remove 2 items) - key 1  yellow
Down button (Remove 1 item) - key 2  green
Left button - key 3  red 
Right button - key 4  blue

Flow:
State 0 - Press any key to continue
State 2 - Selecting middle column
(press key 3)
State 1 - Selecting left column
(press key 1)
(Removes 2 items from left stack, change player pointer to player 2, and change state to state 2)
State 2 - Selecting middle column

-Illegal input will be ignored-
**/

#include <FastLED.h>

// Values used between state machine and button input, arbitrary numbers that are byte values when 1,2,3, or 4 are input into serial input
const int VALUE_UP = 49; // 1
const int VALUE_DOWN = 50;  // 2
const int VALUE_LEFT = 51;  // 3
const int VALUE_RIGHT = 52;  // 4

int currentState = 0;
int leftStack = 0;
int centerStack = 0;
int rightStack = 0;
int playerPointer = 1;  // 1 for left player, 2 for right player

// Pin values for buttons
const int ONE_UP_BUTTON = 2;
const int ONE_DOWN_BUTTON = 3;
const int ONE_LEFT_BUTTON = 4;
const int ONE_RIGHT_BUTTON = 5;
const int TWO_UP_BUTTON = 6;
const int TWO_DOWN_BUTTON = 7;
const int TWO_LEFT_BUTTON = 8;
const int TWO_RIGHT_BUTTON = 9;


// states and values used in capturing button input
int one_up_val = LOW;
int one_down_val = LOW;
int one_left_val = LOW;
int one_right_val = LOW;
int one_up_state = -1;
int one_down_state = -1;
int one_left_state = -1;
int one_right_state = -1;
int two_up_val = LOW;
int two_down_val = LOW;
int two_left_val = LOW;
int two_right_val = LOW;
int two_up_state = -1;
int two_down_state = -1;
int two_left_state = -1;
int two_right_state = -1;
long lastDebounceTime = 0;
long debounceDelay = 50; 

// values used for FastLED
const int NUM_LEDS = 11;
const int NUM_HEADS = 6;
const int LEDLINE_A = 10;  // pin number of first data line
const int LEDLINE_B = 11;  // pin number for second data line
const int LEDLINE_C = 12;  // pin number for third data line
const int LEDLINE_HD = 13;  // pin number for stackpointer

#define COL_RED 0xFF0000
#define COL_GRN 0x17A589
#define COL_BLU 0x5DADE2
#define COL_VIO 0x9B59B6
#define COL_BLACK 0x000000

CRGB leds1[NUM_LEDS];
CRGB leds2[NUM_LEDS];
CRGB leds3[NUM_LEDS];
CRGB ledheads[NUM_HEADS];

void setup() {
  // initialize digital pin LED_BUILTIN as an output.
  Serial.begin(9600);  // Initiating serial communication with connected computer

  pinMode(ONE_UP_BUTTON, INPUT_PULLUP);
  pinMode(ONE_DOWN_BUTTON, INPUT_PULLUP);
  pinMode(ONE_LEFT_BUTTON, INPUT_PULLUP);
  pinMode(ONE_RIGHT_BUTTON, INPUT_PULLUP);

  pinMode(TWO_UP_BUTTON, INPUT_PULLUP);
  pinMode(TWO_DOWN_BUTTON, INPUT_PULLUP);
  pinMode(TWO_LEFT_BUTTON, INPUT_PULLUP);
  pinMode(TWO_RIGHT_BUTTON, INPUT_PULLUP);

  FastLED.addLeds<NEOPIXEL, LEDLINE_A>(leds1, NUM_LEDS);
  FastLED.addLeds<NEOPIXEL, LEDLINE_B>(leds2, NUM_LEDS);
  FastLED.addLeds<NEOPIXEL, LEDLINE_C>(leds3, NUM_LEDS);
  FastLED.addLeds<NEOPIXEL, LEDLINE_HD>(ledheads, NUM_HEADS);
}



void loop() {
  displayOutput(leftStack, centerStack, rightStack, currentState, playerPointer);
  int inpVal = inputValue();

  Serial.print("inpVal:");
  Serial.print(inpVal);

  // respond to user input
  if (currentState == 0){
    playerPointer = 1;
    
    // when serial monitor receives input
    if (inpVal == VALUE_DOWN){
      currentState = 2;

      // initial stack size
      leftStack = 5;
      centerStack = 5;
      rightStack = 5;
    }
  }

  else if (currentState == 1){  // stack pointer pointing to left
    if (inpVal == VALUE_LEFT){
      currentState = 1;
    }
    else if (inpVal == VALUE_RIGHT){
      currentState = 2;
    }
    else if (inpVal == VALUE_UP){
      if (leftStack >= 2){  // if we dont have enough items to remove in the first place, then pressing has no effect on gameplay
        leftStack -= 2;
        currentState = 2;

        // switch players
        if (playerPointer == 1){
          playerPointer = 2;
        }
        else {
          playerPointer = 1;
        }
      }
      else{
        Serial.print("Error - leftStack < 2\n");
      }
    }
    else if (inpVal == VALUE_DOWN){
      if (leftStack >= 1){  // if we dont have enough items to remove in the first place, then pressing has no effect on gameplay
        leftStack -= 1;
        currentState = 2;

        // switch players
        if (playerPointer == 1){
          playerPointer = 2;
        }
        else {
          playerPointer = 1;
        }
      }
      else{
        Serial.print("Error - leftStack < 1\n");
      }
    }
  }

  else if (currentState == 2){  // stack pointer pointing to center
    if (inpVal == VALUE_LEFT){
      currentState = 1;
    }
    else if (inpVal == VALUE_RIGHT){
      currentState = 3;
    }
    else if (inpVal == VALUE_UP){
      if (centerStack >= 2){  // if we dont have enough items to remove in the first place, then pressing has no effect on gameplay
        centerStack -= 2;
        currentState = 2;

        // switch players
        if (playerPointer == 1){
          playerPointer = 2;
        }
        else {
          playerPointer = 1;
        }
      }
      else{
        Serial.print("Error - centerStack < 2\n");
      }
    }
    else if (inpVal == VALUE_DOWN){
      if (centerStack >= 1){  // if we dont have enough items to remove in the first place, then pressing has no effect on gameplay
        centerStack -= 1;
        currentState = 2;

        // switch players
        if (playerPointer == 1){
          playerPointer = 2;
        }
        else {
          playerPointer = 1;
        }
      }
      else{
        Serial.print("Error - centerStack < 1\n");
      }
    }
  }

  else if (currentState == 3){  // stack pointer pointing to right
    if (inpVal == VALUE_LEFT){
      currentState = 2;
    }
    else if (inpVal == VALUE_RIGHT){
      currentState = 3;
    }
    else if (inpVal == VALUE_UP){
      if (rightStack >= 2){  // if we dont have enough items to remove in the first place, then pressing has no effect on gameplay
        rightStack -= 2;
        currentState = 2;

        // switch players
        if (playerPointer == 1){
          playerPointer = 2;
        }
        else {
          playerPointer = 1;
        }
      }
      else{
        Serial.print("Error - rightStack < 2\n");
      }
    }
    else if (inpVal == VALUE_DOWN){
      if (rightStack >= 1){  // if we dont have enough items to remove in the first place, then pressing has no effect on gameplay
        rightStack -= 1;
        currentState = 2;

        // switch players
        if (playerPointer == 1){
          playerPointer = 2;
        }
        else {
          playerPointer = 1;
        }
      }
      else{
        Serial.print("Error - rightStack < 1\n");
      }
    }
  }
  
  else if (currentState == 4){  // stack pointer pointing to right
    
    if (inpVal == VALUE_DOWN){
      currentState = 0;

      
      // reset left, center right stack zero as when someone wins in previous round, one of the columns will have value 10
      leftStack = 0;
      centerStack = 0;
      rightStack = 0;
    }
  }
  // check if game has ended
  if (leftStack == 0 && centerStack == 0 && rightStack == 0 && currentState != 0){
    currentState = 4;
    int winningPlayer;
    if (playerPointer == 1){  // cos i changed the player before already (sorry if it looks confusing LOL)
      winningPlayer = 2;
      rightStack = 10;
    }
    else {
      winningPlayer = 1;
      leftStack = 10;
    }

    playerPointer = 1;  // after win, player 1 press down button to reset game
  }
}










int inputValue() {
  /** 
  Outputs VALUE_UP/DOWN/LEFT/RIGHT depending on button pressed

  Debouncing capabilities enabled
  **/
  Serial.print("Waiting for input...\n");
  
  int output_val = 0;

  while (output_val == 0){
    if (playerPointer == 1){
      // up button
      if ( (millis() - lastDebounceTime) > debounceDelay) {
        //if the button has been pressed, lets toggle the LED from "off to on" or "on to off"
        if ((digitalRead(ONE_UP_BUTTON) == LOW) && (one_up_state < 0) ) {
          one_up_state = -one_up_state; //now the LED is on, we need to change the state
          lastDebounceTime = millis(); //set the current time
        }
        else if ((digitalRead(ONE_UP_BUTTON) == HIGH) && (one_up_state > 0) ) {
          one_up_state = -one_up_state; //now the LED is off, we need to change the state
          lastDebounceTime = millis(); //set the current time
          
          output_val = VALUE_UP;
        }
      }
  
      // down button
      if ( (millis() - lastDebounceTime) > debounceDelay) {
        //if the button has been pressed, lets toggle the LED from "off to on" or "on to off"
        if ((digitalRead(ONE_DOWN_BUTTON) == LOW) && (one_down_state < 0) ) {
          one_down_state = -one_down_state; //now the LED is on, we need to change the state
          lastDebounceTime = millis(); //set the current time
        }
        else if ((digitalRead(ONE_DOWN_BUTTON) == HIGH) && (one_down_state > 0) ) {
          one_down_state = -one_down_state; //now the LED is off, we need to change the state
          lastDebounceTime = millis(); //set the current time
          
          output_val = VALUE_DOWN;
        }
      }
  
      // left button
      if ( (millis() - lastDebounceTime) > debounceDelay) {
        //if the button has been pressed, lets toggle the LED from "off to on" or "on to off"
        if ((digitalRead(ONE_LEFT_BUTTON) == LOW) && (one_left_state < 0) ) {
          one_left_state = -one_left_state; //now the LED is on, we need to change the state
          lastDebounceTime = millis(); //set the current time
        }
        else if ((digitalRead(ONE_LEFT_BUTTON) == HIGH) && (one_left_state > 0) ) {
          one_left_state = -one_left_state; //now the LED is off, we need to change the state
          lastDebounceTime = millis(); //set the current time
          
          output_val = VALUE_LEFT;
        }
      }
  
      // right button
      if ( (millis() - lastDebounceTime) > debounceDelay) {
        //if the button has been pressed, lets toggle the LED from "off to on" or "on to off"
        if ((digitalRead(ONE_RIGHT_BUTTON) == LOW) && (one_right_state < 0) ) {
          one_right_state = -one_right_state; //now the LED is on, we need to change the state
          lastDebounceTime = millis(); //set the current time
        }
        else if ((digitalRead(ONE_RIGHT_BUTTON) == HIGH) && (one_right_state > 0) ) {
          one_right_state = -one_right_state; //now the LED is off, we need to change the state
          lastDebounceTime = millis(); //set the current time
          
          output_val = VALUE_RIGHT;
        }
      }
    }

    if (playerPointer == 2){
      // up button
      if ( (millis() - lastDebounceTime) > debounceDelay) {
        //if the button has been pressed, lets toggle the LED from "off to on" or "on to off"
        if ((digitalRead(TWO_UP_BUTTON) == LOW) && (two_up_state < 0) ) {
          two_up_state = -two_up_state; //now the LED is on, we need to change the state
          lastDebounceTime = millis(); //set the current time
        }
        else if ((digitalRead(TWO_UP_BUTTON) == HIGH) && (two_up_state > 0) ) {
          two_up_state = -two_up_state; //now the LED is off, we need to change the state
          lastDebounceTime = millis(); //set the current time
          
          output_val = VALUE_UP;
        }
      }
  
      // down button
      if ( (millis() - lastDebounceTime) > debounceDelay) {
        //if the button has been pressed, lets toggle the LED from "off to on" or "on to off"
        if ((digitalRead(TWO_DOWN_BUTTON) == LOW) && (two_down_state < 0) ) {
          two_down_state = -two_down_state; //now the LED is on, we need to change the state
          lastDebounceTime = millis(); //set the current time
        }
        else if ((digitalRead(TWO_DOWN_BUTTON) == HIGH) && (two_down_state > 0) ) {
          two_down_state = -two_down_state; //now the LED is off, we need to change the state
          lastDebounceTime = millis(); //set the current time
          
          output_val = VALUE_DOWN;
        }
      }
  
      // left button
      if ( (millis() - lastDebounceTime) > debounceDelay) {
        //if the button has been pressed, lets toggle the LED from "off to on" or "on to off"
        if ((digitalRead(TWO_LEFT_BUTTON) == LOW) && (two_left_state < 0) ) {
          two_left_state = -two_left_state; //now the LED is on, we need to change the state
          lastDebounceTime = millis(); //set the current time
        }
        else if ((digitalRead(TWO_LEFT_BUTTON) == HIGH) && (two_left_state > 0) ) {
          two_left_state = -two_left_state; //now the LED is off, we need to change the state
          lastDebounceTime = millis(); //set the current time
          
          output_val = VALUE_LEFT;
        }
      }
  
      // right button
      if ( (millis() - lastDebounceTime) > debounceDelay) {
        //if the button has been pressed, lets toggle the LED from "off to on" or "on to off"
        if ((digitalRead(TWO_RIGHT_BUTTON) == LOW) && (two_right_state < 0) ) {
          two_right_state = -two_right_state; //now the LED is on, we need to change the state
          lastDebounceTime = millis(); //set the current time
        }
        else if ((digitalRead(TWO_RIGHT_BUTTON) == HIGH) && (two_right_state > 0) ) {
          two_right_state = -two_right_state; //now the LED is off, we need to change the state
          lastDebounceTime = millis(); //set the current time
          
          output_val = VALUE_RIGHT;
        }
      }
    }
  }
  return output_val;
}

void displayOutput(int left, int center, int right, int state, int playerTurn){
  /**
  Displays output (currently in serial monitor)

  Args
  left - int value; number of items on left stack
  center - int value; number of items on center stack
  right - int value; number of items on right stack
  selectedColumn - 0 to show left column is currently selected, 1 to show center column is currently selected, 2 to show right column is currently selected
  playerTurn - 0 to indicate left player's turn, 1 to indicate right player's turn

  Repeatedly sets leds red/black depending on size of stack.
  **/
  
  char string[255];
  int printedString = sprintf(string, "leftStack: %i; centerStack: %i; rightStack: %i;\ncurrentState: %i; playerPointer: %i;\n", left, center, right, state, playerTurn);
  Serial.print(string);

  if (state == 4){
    // left column
    for (int i = 0; i<NUM_LEDS; i++){
      if (i < left){
        leds1[i] = COL_BLU;
      }
      else {
        leds1[i] = COL_BLACK;
      }
    }
    
    // right column
    for (int i = 0; i<NUM_LEDS; i++){
      if (i < right){
        leds3[i] = COL_GRN;
      }
      else {
        leds3[i] = COL_BLACK;
      }
    }
  }
  else {
    // left column
    for (int i = 0; i<NUM_LEDS; i++){
      if (i < left){
        leds1[i] = COL_RED;
      }
      else {
        leds1[i] = COL_BLACK;
      }
    }
  
    // center column
    for (int i = 0; i<NUM_LEDS; i++){
      if (i < center){
        leds2[i] = COL_RED;
      }
      else {
        leds2[i] = COL_BLACK;
      }
    }
  
    // right column
    for (int i = 0; i<NUM_LEDS; i++){
      if (i < right){
        leds3[i] = COL_RED;
      }
      else {
        leds3[i] = COL_BLACK;
      }
    }
  
    for (int i = 0; i<NUM_HEADS; i++){
      if (state >= 1 && state <= 3){  // if its not beginning/end state of game
        if (i == state*2-1){
          ledheads[i-1] = COL_RED;
          ledheads[i] = COL_RED;
        }
        else {
          ledheads[i] = COL_BLACK;
        }
      }
      else {
        ledheads[i] = COL_BLACK;
      }
    }
  }
  
  
  
  FastLED.show();
}

































//hai
