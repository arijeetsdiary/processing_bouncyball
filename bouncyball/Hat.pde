int hatH= 90,  hatW= 100, hatX, hatY= height - grassH - hatH;

void hat() {
  int hatWidth= 100, hatHeight= 90, hat_x= mouseX, hat_y= height - grassH - hatHeight/2;      //declaring and initializing necessary variables
  if (hat_x > width - basketW - hatWidth/2) {                        //restricts hat to go beyond the screen size
    hat_x= width - basketW - hatWidth/2;
  }
  else if (hat_x < hatWidth/2) {
    hat_x= hatWidth/2;
  }
  
  //Marshmello hat
  stroke(0);
  strokeWeight(1.5);
  fill(255);
  rectMode(CENTER);
  rect(hat_x, hat_y, hatWidth, hatHeight, 8);            //the main rectangle of the hat
  
  //Marshmello smile
  strokeWeight(4);
  noFill();
  arc(hat_x, hat_y+20, 70, 30, 0, PI);                  //creates the smile
  
  //Marshmello left eyes
  fill(0);
  arc(hat_x-25, hat_y, 10, 10, 0, 1.25*PI, CHORD);
  arc(hat_x-13, hat_y, 10, 10, -0.25*PI, PI, CHORD);
  triangle(hat_x-26, hat_y, hat_x-29, hat_y-15, hat_x-16, hat_y);
  triangle(hat_x-13, hat_y, hat_x-10, hat_y-15, hat_x-23, hat_y);
  
  //Marshmello right eyes
  fill(0);
  arc(hat_x+15, hat_y, 10, 10, 0, 1.25*PI, CHORD);
  arc(hat_x+27, hat_y, 10, 10, -0.25*PI, PI, CHORD);
  triangle(hat_x+14, hat_y, hat_x+11, hat_y-15, hat_x+24, hat_y);
  triangle(hat_x+27, hat_y, hat_x+30, hat_y-15, hat_x+15, hat_y);
  
  hatX= hat_x;        //assigns current value of hat_x to hatX (which is a global var) to be used in other functions
}
