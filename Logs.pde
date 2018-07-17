//Logs class was created for the game screen, which the roller crosses on to get across the river
class Logs {
  //Data 
  float x, y, widthLog, lengthLog, cornerLog;
  float xSpeed;
  color logColor;

  //Constructor: takes in the x and y position, the width and length of the log, and the speed
  Logs (float _x, float _y, float _widthLog, float _lengthLog, float _xSpeed) {
    x = _x; 
    y = _y;
    logColor = color(116, 102, 81);
    widthLog = _widthLog;
    lengthLog = _lengthLog;
    cornerLog = 10;
    xSpeed = _xSpeed;
  }

  //Behaviour
  //Display makes the logs appear
  void display() {
    stroke(0);
    fill(logColor);
    x = x - xSpeed;
    rect(x, y, widthLog, lengthLog, cornerLog);
  }
  
  //Move makes the logs move horizontally from side to side by only changing the x value, bouncing off the edge of the screen
  void move() {
    if ((x < 0) || ( x > width-widthLog)) {
      xSpeed *= -1;
    }
  }

}