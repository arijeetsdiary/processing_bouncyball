String level;

void playLevel(int x) {
  if (x < 5) {                                //receives parameter gameNo and displays respective player levels
    level= "Beginner";
  } else if (x >= 5 && x < 10) {
    level= "Professional";
  } else if (x >= 10 && x < 15) {
    level= "World-Class";
  } else if (x >= 15) {
    level= "Legendary";
  }

  textSize(15);
  fill(255);
  text("Player level: "+ level, width/2+40, 60);

  if (x==5 || x==10 || x==15) {              //displays text Level Up when gameNo is 5, 10 and 15
    textSize(20);
    fill(255);
    text ("Level up!", width/2+70, 80);
  }
}
