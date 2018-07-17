//Button class was created to display buttons on the start screen, death and win screen to start game, or play again
class Button {
  //Data
  float x, y, buttonLength, buttonWidth;
  String buttonText;

  //Constructor: takes in text to display, the x and y positions, and the length/width of the button
  Button (String _buttonText, float _x, float _y, float _buttonLength, float _buttonWidth) {
    buttonText = _buttonText;
    x = _x;
    y = _y;
    buttonLength = _buttonLength;
    buttonWidth = _buttonWidth;
  }

  //Behaviour: displays button and changes color of button if mouse hovers over it
  void display() {
    if (((175 < mouseX) && (mouseX < 425)) && (height/3*2 < mouseY) && ( mouseY < height/3*2+100)) {
      fill(28, 157, 27);
    } else {
      fill(78, 207, 77);
    }
    rect(x, y, buttonLength, buttonWidth);
    fill(255);
    text(buttonText, x+45, y+55);
  }
}