//Roller class was created for the player controlled roller object that crosses the river
class Roller {
  //Data
  float x, y, radius, theNumber, rollerState;
  color rollerColor;

  //Constructor: takes in the state, as it only displays when the state is 1 (the game stage)
  Roller(float _rollerState) {
    x = width/2;
    y = 550;
    radius = 15;
    rollerColor = color(255, 0, 0);
    theNumber = 0;
    rollerState = _rollerState;
  }

  //Behavior
  //Displays the roller 
  void display() {
    fill(rollerColor);
    ellipse(x, y, radius, radius);
  }

  //Roller can only move up, when it's called if the player presses the up key
  void moveUp() {
    y--;
  }
  
  //When the player restarts the game, the roller restarts back to its original position
  void rollerRestart() {
    x = width/2;
    y = 550;
  }
  
  //For log detection, it checks if the roller is between the log's y values and x values
  //If the roller is on the log, the speed of it is changed, and it moves on top of the log
  //If it's outside, the state changes, and the player has lost the game
  //Once it's reached a certain y value (the other side of the riverbank), the player has won!
  void detectLog(Logs someLog) {
    if (rollerState == 1) {
      if ((60 <= y) && (y <= 540)) {
        if (((someLog.y + someLog.lengthLog) >= y) && (someLog.y <= y))
          if ((someLog.x <= x) && ((someLog.x + someLog.widthLog) >= x)) {
            if ((x > 0) && ( x < width)) {
              x = x - someLog.xSpeed;
            }
          } else {
            rollerState = 2;
          }
      }
      if (y < 60) {
        rollerState = 3;
      }
    }
  }
}