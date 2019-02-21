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

Up button (Remove 2 items) - key 1
Down button (Remove 1 item) - key 2
Left button - key 3
Right button - key 4

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

const int VALUE_UP = 49; // 1
const int VALUE_DOWN = 50;  // 2
const int VALUE_LEFT = 51;  // 3
const int VALUE_RIGHT = 52;  // 4

int currentState = 0;
int leftStack = 5;
int centerStack = 5;
int rightStack = 5;
int playerPointer = 0;  // 1 for left player, 2 for right player

// Pin values for buttons
const int UP_BUTTON = 2;
const int DOWN_BUTTON = 3;
const int LEFT_BUTTON = 4;
const int RIGHT_BUTTON = 5;

// states and values used in capturing button input
int up_val = LOW;
int down_val = LOW;
int left_val = LOW;
int right_val = LOW;
int up_state = -1;
int down_state = -1;
int left_state = -1;
int right_state = -1;
long lastDebounceTime = 0;
long debounceDelay = 50; 


void setup() {
  // initialize digital pin LED_BUILTIN as an output.
  Serial.begin(9600);  // Initiating serial communication with connected computer

  pinMode(UP_BUTTON, INPUT_PULLUP);
  pinMode(DOWN_BUTTON, INPUT_PULLUP);
  pinMode(LEFT_BUTTON, INPUT_PULLUP);
  pinMode(RIGHT_BUTTON, INPUT_PULLUP);
}



void loop() {
  displayOutput(leftStack, centerStack, rightStack, currentState, playerPointer);
  int inpVal = inputValue();

  Serial.print("inpVal:");
  Serial.print(inpVal);

  // respond to user input
  if (currentState == 0){
    // when serial monitor receives input
    if (inpVal == VALUE_DOWN){
      currentState = 2;
      playerPointer = 1;
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

  // check if game has ended
  if (leftStack == 0 && centerStack == 0 && rightStack == 0){
    currentState = 4;
    int winningPlayer;
    if (playerPointer == 1){  // cos i changed the player before already (sorry if it looks confusing LOL)
      winningPlayer = 2;
    }
    else {
      winningPlayer = 1;
    }
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
    up_val = digitalRead(UP_BUTTON);
    down_val = digitalRead(DOWN_BUTTON);
    left_val = digitalRead(LEFT_BUTTON);
    right_val = digitalRead(RIGHT_BUTTON);

    // up button
    if ( (millis() - lastDebounceTime) > debounceDelay) {
      //if the button has been pressed, lets toggle the LED from "off to on" or "on to off"
      if ((digitalRead(UP_BUTTON) == LOW) && (up_state < 0) ) {
        up_state = -up_state; //now the LED is on, we need to change the state
        lastDebounceTime = millis(); //set the current time
      }
      else if ((digitalRead(UP_BUTTON) == HIGH) && (up_state > 0) ) {
        up_state = -up_state; //now the LED is off, we need to change the state
        lastDebounceTime = millis(); //set the current time
        
        output_val = VALUE_UP;
      }
    }

    // down button
    if ( (millis() - lastDebounceTime) > debounceDelay) {
      //if the button has been pressed, lets toggle the LED from "off to on" or "on to off"
      if ((digitalRead(DOWN_BUTTON) == LOW) && (down_state < 0) ) {
        down_state = -down_state; //now the LED is on, we need to change the state
        lastDebounceTime = millis(); //set the current time
      }
      else if ((digitalRead(DOWN_BUTTON) == HIGH) && (down_state > 0) ) {
        down_state = -down_state; //now the LED is off, we need to change the state
        lastDebounceTime = millis(); //set the current time
        
        output_val = VALUE_DOWN;
      }
    }

    // left button
    if ( (millis() - lastDebounceTime) > debounceDelay) {
      //if the button has been pressed, lets toggle the LED from "off to on" or "on to off"
      if ((digitalRead(LEFT_BUTTON) == LOW) && (left_state < 0) ) {
        left_state = -left_state; //now the LED is on, we need to change the state
        lastDebounceTime = millis(); //set the current time
      }
      else if ((digitalRead(LEFT_BUTTON) == HIGH) && (left_state > 0) ) {
        left_state = -left_state; //now the LED is off, we need to change the state
        lastDebounceTime = millis(); //set the current time
        
        output_val = VALUE_LEFT;
      }
    }

    // right button
    if ( (millis() - lastDebounceTime) > debounceDelay) {
      //if the button has been pressed, lets toggle the LED from "off to on" or "on to off"
      if ((digitalRead(RIGHT_BUTTON) == LOW) && (right_state < 0) ) {
        right_state = -right_state; //now the LED is on, we need to change the state
        lastDebounceTime = millis(); //set the current time
      }
      else if ((digitalRead(RIGHT_BUTTON) == HIGH) && (right_state > 0) ) {
        right_state = -right_state; //now the LED is off, we need to change the state
        lastDebounceTime = millis(); //set the current time
        
        output_val = VALUE_RIGHT;
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
  **/
  
  char string[255];
  int printedString = sprintf(string, "leftStack: %i; centerStack: %i; rightStack: %i;\ncurrentState: %i; playerPointer: %i;\n", left, center, right, state, playerTurn);
  Serial.print(string);
}

































//hai
