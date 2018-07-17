//Jingfei Tan
//Object Oriented Programming Assignment: River Crossing
//April 10, 2017

//Description:
// - Welcome to River Crossing!
// - There are 3 object classes: the buttons for the start/end screens, the logs which you cross on, and the roller that crosses the river
// - The objective of the game is to try to cross the river by rolling across the logs

//Extra for Experts:
// - There are multiple classes (buttons, logs, and roller)
// - Used arrays to mulyiply the logs
// - There is detection between the logs and the roller. Once the roller is on the log, the x-speed changes as it moves as if it were on the log


//Stating the variables and classes
Roller rembrandt;
Button basil, bathsheba;
Logs startScreenLog;
Logs[] theLogs;
float rand, randSpeed, textSpeed, textX, state;

//Setup: assign values to the variables, load classes
void setup() {
  size(600, 600);
  background(255);
  state = 0;
  textX = width/4+10;
  rembrandt = new Roller(0);
  basil = new Button("Play Game", 175, height/3*2, 250, 100);
  bathsheba = new Button("Play Again", 175, height/3*2, 250, 100);
  startScreenLog = new Logs(width/4, height/3-100, 400, 100, 1);

  //Using arrays to efficiently display the logs. They have a random x position where they appear, and a random speed between 0.5 and 4
  theLogs = new Logs[12];
  for (int i = 0; i < 12; i++) {
    rand = random(0, 480);
    rand = constrain(rand, 150-(i*3), width-(150-(i*3)));
    randSpeed = random(0.5, 4);
    theLogs[i] = new Logs(rand, 500-(i*40), 150-(i*3), 40, randSpeed);
  }
}

//Draw: by using states for different screens
//  -State 0: Start screen
//  -State 1: Game screen
//  -State 2: Lose screen
//  -State 3: Win screen
void draw() {
  state = rembrandt.rollerState;
  println(state);
  if (state == 0) {
    startScreen();
  }
  if (state == 1) {
    playGame();
    rembrandt.display();
    if (keyPressed) {
      if ((key == CODED) && (keyCode == UP)) {
        rembrandt.moveUp();
      }
    }
  }
  if (state == 2) {
    deathScreen();
  }
  if (state == 3) {
    winScreen();
  }
}

//Game screen, where player plays actual game
void playGame() {
  noStroke();
  background(153, 221, 245);
  fill(28, 157, 27);
  rect(0, 0, width, 60);
  rect(0, 540, width, 60);

  for (int i = 0; i < 12; i++) {
    theLogs[i].move();
    theLogs[i].display();
    rembrandt.detectLog(theLogs[i]);
  }
  state = rembrandt.rollerState;
}

//Start screen with instructions
void startScreen() {
  background(0);
  startScreenLog.move();
  startScreenLog.display();
  fill(255);
  textSize(30);
  textX = textX - startScreenLog.xSpeed;
  text("Welcome to River Crossing", textX, height/3-40);
  text("How To Play:", 100, 250);
  basil.display();
  textSize(20);
  text("Press the up key to move the roller on to the", 100, 300);
  text("logs to cross the river. If you miss, you die!", 100, 340);
  text("You can only move up.", 100, 380);
}

//Death screen, appears if you lose
void deathScreen() {
  background(0);
  fill(255);
  textSize(50);
  text("You died!", 100, 200);
  text("Wanna try again?", 100, 300);
  textSize(30);
  bathsheba.display();
}

//Win screen, appears if you successfully cross the river
void winScreen() {
  background(0);
  fill(255);
  textSize(50);
  text("Good job!", 100, 200);
  text("You win!", 100, 300);
  textSize(30);
  bathsheba.display();
}

//Checks if button (rembrandt) is clicked 
void mouseClicked() {
  if (state == 0) {
    if (((175 < mouseX) && (mouseX < 425)) && (height/3*2 < mouseY) && ( mouseY < height/3*2+100)) {
      rembrandt.rollerRestart();
      rembrandt.rollerState = 1;
    }
  }
  if ((state == 2) || (state == 3)) {
    if (((175 < mouseX) && (mouseX < 425)) && (height/3*2 < mouseY) && ( mouseY < height/3*2+100)) {
      rembrandt.rollerState = 0;
    }
  }
}