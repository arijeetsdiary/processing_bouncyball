/*
COMP 115 Assignment 2 - Session 1, 2019
Done by Arijeet Roy, St ID - 45521166

NOTES:
Press mouse button to throw new puddings once the previous ones have been collected
 
CHEAT CODE:
When you think you'll lose, just press the mouse immediately ;)
 
References:
https://py.processing.org/reference/
*/

PVector ball[]= new PVector[5];        //declaring an allocating memory for ball, speed and score arrays
float ballMass[]= {1, 1.1, 1.2, 1.15, 0.95};      //declaring, allocating memory and setting different mass values to the puddings
PVector speed[]= new PVector[5];
int score[]= new int[5];
PVector gravity[]= new PVector [5];
boolean startGame= false;
PImage img;


void setup() {
  size(640, 480);
  img= loadImage("U.png");

  for (int i=0; i < ball.length; i++) {
    ball[i]= new PVector (random(dia/2, 2.5*dia), random(dia/2+1, 1.125*dia/2));     //assigning random initial coordinates to the puddings
    speed[i]= new PVector ( random(1.15, 1.2), random(0.2, 1.2) );                   //assigning random x and y values within given range to speed vector
    gravity[i]= new PVector (0, 0.1 * ballMass[i]);                                  //gravitational pull will now be different for puddings with different masses
    score[i]= 0;
  }
}

void draw() {
  background(255);
  
  //The welcome note at the start of the execution of the program
  textSize(40);
  fill(0);
  text("Welcome", width/3 + 30, height/2);
  textSize(20);
  text("Press any key to begin!", width/3, height/2 + 40);
  text("And press mouse to throw balls everytime!", 120, height/2 + 70);

  if (startGame == true) {          //if key is pressed, the main game starts
    screenBackground();
    hat();
    playLevel(gameNo);
    ball();
  }
}

void keyPressed() {
  startGame= true;                  //flags true to start the game
}
