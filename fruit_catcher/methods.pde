void startScreen () {
  background (0);
  textSize(105);
  textAlign(CENTER);
  fill(255, 0, 0);
  text("Catch The Fruits", width/2, 170);

  
  
  
  //Instruction Apples
  textSize(25);

  //Red Apples
  fill (255, 0, 0);
  text("Red Apples,banana and strawberry give 1 point when catched", width/2, 270);
 

  //Green Apples
  fill (130, 255, 0);
  text("Green Apples give 2 point ", width/2, 300);
 

  //Rotten Apples
  fill (61, 80, 0);
  text("Rotten Apples give a negative point when you catch them.", width/2, 330);
 

  //Gameplay instructions
  textSize (20);
  fill (255);
  text ("Gather Fruits using the basket, that is controlled with the mouse.", width/2, 380);
  text ("When gathering fruits or rather points you gain levels.", width/2, 400);
  text ("Each level makes the game faster. Becareful not to go below 0 or it is GAME OVER!", width/2, 420);
  
  textSize(60);
  fill(255);
  text("Press Spacebar ' ' to continue", width/2, 500);
  
  
}


void endScreen () {
   
  background(0);
  textSize(105);
  textAlign(CENTER);
  fill(255, 0, 0);
  text("Game Over", width/2, height/2);
  

    
    textSize(25);
  fill (255, 0, 0);
  text("if you want to play again press 'A' ", width/2, height/2+50);
  if(keyPressed && (key == 'A' || key=='a')){
    setup();
  }
  
    
 
    
  }

void DayOrNight(){
  
  image(day, 0,0, 500,680);
  image(night, 500, 0, 500, 690);
        
  if ((mouseX > 100) && (mouseX < 400) && (mouseY > 40) && (mouseY < 120)) {
      skymode= 2;
  }
  else if ((mouseX > 600) && (mouseX < 950) && (mouseY > 40) && (mouseY < 120)) {
      skymode= 0;
  }
   

  fill(255);
  rect(100,40,300,80);
  rect(600,40,350,80);
  textAlign(LEFT);
  textSize (60);
  fill (0);
  text ("Day mode", 100, 100);
  text ("Night mode", 600, 100);
      
}
