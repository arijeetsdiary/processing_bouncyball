int dia= 20, scoreTotal= 0, gameNo= 1, number= 1;
String playLevel;

//shorted to one function to be called in draw
void ball() {    //call function for all the functions
  for (int i=0; i < ball.length; i++) {

    drawBall(ball[i], i);                    //passes necessary parameters to respective functions
    moveBall(ball[i], speed[i], gravity[i]);
    collision(ball[i], speed[i]);
    scoreCount(ball[i], score[i]);
    endGame(ball[i]);
  }
}

//all the functions related to ball goes here
void drawBall(PVector pos, int x) {              //receives parameters from the call function
  fill(#FF6905 - x*5);
  noStroke();
  ellipse (pos.x, pos.y, dia, dia);          //draws the pudding at coordinates given
}  //drawBall() ends here


void moveBall(PVector pos, PVector s, PVector g) {
  if ( (pos.x >= width-dia/2) || (pos.x <= dia/2) ) {          //restricts ball to exit in x-direction
    s.x= s.x * -1;                                             //changes the direction of the ball
  }

  if (pos.y <= dia/2) {                 //restricts ball to exit in y-direction
    s.y= s.y * -1;
  }

  pos.add(s);                         //adds the speed vector to the position vector to make the ball move
  s.add(g);                           //adds the gravity vector to the speed vector, gravity effect
}  //moveBall() ends here


void collision(PVector pos, PVector s) {
  if ( (pos.x >= hatX - hatW/2 && pos.x <= hatX + hatW/2) && (pos.y + dia/2 >= height - grassH - hatH) ) {          //bounces if pudding hits the hat
    s.y= s.y * -0.9;
  }
}  //collision() ends here


void scoreCount(PVector pos, int sco) {
  if ( (pos.x - dia/2 > width-120) && (pos.y + dia/2 >= height-120)) {            //checks if pudding enters the basket
    sco += 6;                                                                     //increases sco variable for each of the puddings
    scoreTotal += sco;                                                            //updates the overall score
    newGame(pos);                                                                 //calls function newGame()
  }

  textMode(CENTER);
  textSize(20);
  fill(255);
  text("$"+ scoreTotal, width-85, 60);                                    //displays the score

  textMode(CENTER);
  textSize(15);
  fill(255);
  text("Game", width-83, 90);                                            //displays the game number
  text("No. " + gameNo, width-83, 110);
}  //scoreCount() ends here


void newGame(PVector p) {
  p.y= -10000000;                
  if (p.y >= 300) {                //delays the program until all the pudding coordinates have been reset
    p.y= -10000000;                 
  }
}  //newGame() ends here


void mousePressed() {
  for (int i=0; i < ball.length; i++) {
    ball[i]= new PVector (number * random(dia/2, 2*dia), number * random(dia/2, 1.125*dia/2));        //resets the coordinates of puddings and the speed values
    speed[i]= new PVector ( random(1.15, 1.2), random(0.2, 1.2) );
  }
  number += 1;            //updates number variable which is needed to set the balls further apart each time
  gameNo++;               //updates variable to display recent value
}


void endGame(PVector pos) {
  if (pos.y + dia/2 >= height - grassH) {            //checks if pudding touches the grass
    background(255, 0, 0);

    textMode(CENTER);
    textSize(50);
    fill(255);
    text("You Failed!", width/2-125, height/2);
    textSize(15);
    text("After "  + (gameNo-1) + " games, winning $" + scoreTotal, width/3+20, height/2+35);

    noLoop();
  }
}  //endGame() ends here
