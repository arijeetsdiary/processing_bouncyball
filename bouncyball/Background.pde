int grassH=10, basketW= 120;

//all functions shortened to one function to be called in draw()
void screenBackground() {
  background(img);
  //gradient();
  //drawGrass();
  basket();
  mobile(); 
  streetSigns();
}


//all the functions related to background
void gradient() {
  int r=0;
  int g=0;
  int b=255;

  for (int i=0; i < height; i+= 50) {
    noStroke();
    fill (r, g, b);
    rect (width/2, i, width, 50);            //draws the rectangles with different shades of blue
    r += 10;                                 //changes the values for red, blue and green
    g += 17;
    b -= b/80;
  }
}  //gradient() ends here


void drawGrass() {
  noStroke();
  fill(#15981D);                                            //green color
  rectMode(CENTER);
  rect(width/2, height - grassH/2, width, grassH);          //draws the green rectangle
}  //drawGrass() ends here


void basket() {
  int basket_X= width-120, basket_Y= height-120, basketWidth= 120;      //declaring and initializing all variables

  noStroke();
  fill(47.1, 48.2, 37.6);
  rect (basket_X+basketWidth/2, height-basketWidth/2, 80, 120);          //fills the center basket with brown color
  //rect (basketX+2, basketY, 115, 4);

  noStroke();
  triangle (basket_X, basket_Y, basket_X+20, height, basket_X+20, basket_Y);      //two triangles fills the remaining portion of the basket with brown color
  triangle (width-20, basket_Y, width-20, height, width, basket_Y);

  noFill();
  strokeWeight(3);
  stroke(30.2, 37.3, 32.5);
  curve (basket_X, basket_Y, basket_X, basket_Y, basket_X+20, height, basket_X+40, height);      //the left curve, that is the left border of the basket
  curve (width-40, height, width-20, height, width-2, basket_Y, width-2, basket_Y);              //the right border
  line (basket_X+20, height-1, width-20, height-1);                                              //the bottom line of the border
}  //basket() ends here


void mobile() {
  noFill();
  stroke(0);
  rect (width-60, 80, 60, 100, 8);      //draws the mobile
  fill(0);
  rect (width-60, 33, 20, 5, 5);        //draws the notch of the mobile
}


void streetSigns() {
  //STOP sign
  line(40, height-height/3, 40, height-grassH);        //the stand for the sign
  fill(255, 0, 0);
  strokeWeight(1);
  ellipse (40, height-height/3, 60, 60);               //red circle for the STOP sign

  textSize(20);
  fill(255);
  text("STOP", 16, height-height/3+7);
  

  //St Name
  strokeWeight(3);
  line(80, height-height/4, 80, height-grassH);        //stand for the street name
  fill(#325A2D);
  noStroke();
  rect (100, height-height/4, 60, 20);                                                     //green rectangle for the St name to be written on
  triangle (120, height-height/4-20, 120, height-height/4+20, 150, height-height/4);       //arrow

  textSize(10);
  fill(255);
  text("Ghost Street", 76, height-height/4+3);
}
