
PImage basket,day,night ;
PShape tree , sun , cloud , grass;
int i;
int x=800;
int x1=1000;
int x2=900;
int x3=850;
float angle=0.0;

color daysky = color(135,206,235) , nightsky = color(20, 24, 82) , game ;

int basketX =width/2, basketY=570;;
int score,level,gameState;
int skymode;

int distance = 9;
int new_fruit = 1 ;
String[] fruits = {"greenApple.svg","RedApple.svg", "Banana.svg","strawberry.svg", "rotten_apple.svg"};
PShape[] fruit = new PShape[fruits.length] ;
int max_level = 10;


int[] fruitY = {0,0,0,0,0,0,0,0,0,0} ;
float[] fruitX = {0,0,0,0,0,0,0,0,0,0} ;
int[] fruit_idx ={0,0,0,0,0,0,0,0,0,0} ;
float[] fdistance = new float[10];


void setup() {
  size(1000, 680);
  smooth();
  score=0;
  level=1;
  gameState=0;
  skymode = 1 ;
  tree = loadShape("tree.svg");
  sun = loadShape("sun.svg");
  grass = loadShape("Grass.svg");
  cloud = loadShape("cloud.svg");
  basket = loadImage("basket.png");
  day = loadImage("Daymode.PNG");
  night = loadImage("night3.jpg");
  for(int i = 0 ; i < fruits.length ; i++){
    fruit[i] = loadShape(fruits[i]);
  }
  
}
/* gameState keys 
0 :
*/
void draw() {
          
    if (gameState != 0){
      if (score < 0){
        gameState = 2 ;
        endScreen ();
      }
      if (score >= 10 && score < 20 ){
        distance = 10 ;
        level = 2 ;
      }
      else if (score >= 20 && score < 30 ){
        distance = 12 ;
        level = 3;
      }
      else if (score >= 30 && score < 40 ){
        distance = 13 ;
        level = 4;
      }
      else if (score >= 40 && score < 50 ){
        distance = 14 ;
        level = 5;
      }
      else if (score >= 50 && score < 60 ){
        distance = 15 ;
        level = 6;
      }
      else if (score >= 40 && score < 50 ){
        distance = 16 ;
        level = 5;
      }
      else if (score >= 50 && score < 60 ){
        distance = 17 ;
        level = 6;
      }
      else if (score >= 60 && score < 70 ){
        distance = 18 ;
        level = 7;
      }
      else if (score >= 70 && score < 80 ){
        distance = 18 ;
        level = 8;
      }
      else if (score >= 80 && score < 90 ){
        distance = 18 ;
        level = 9;
      }
      else if (score >= 90 && score < 99 ){
        distance = 18 ;
        level = 10;
      }
      
      
        
        
    }
    else{
      startScreen ();
      if (keyPressed && key == ' ') {//set start button
          gameState=3;
    }
  }
  
  if (gameState==3){
    DayOrNight();
    
    if(skymode != 1 ){
      
      if(skymode == 0){
        game = nightsky ;
      }
      else if (skymode == 2) {
        game = daysky ;
      }
      gameState = 1;
    }
  }
     
  else if (gameState==1){
    
    
    background(game);
    if(skymode == 2){
      pushMatrix();
      translate(75,75);
      rotate(angle);
      shape(sun,-75,-75,150,150);
      angle +=0.02;
      popMatrix();
      
      shape(cloud, x, 150, 100, 70);
      shape(cloud, x1, 80, 100, 70);    
      shape(cloud, x2, 90, 100, 70);
      shape(cloud, x3, 100, 100, 70);
      
      x -= 2;
      x1 -=4;
      x2 -=1;
      x3 -=3;
      
      if (x==0){x=800;}
      if (x1<=20){x1=1000;}
      if (x2<=30){x2=900;}
      if (x3<=10){x3=850;}
    }
    
    

    
    shape(grass, 50 ,500, width*2 , height/4);    
    shape(tree, 170, 220, 250, 450);
    shape(tree, 550, 220, 250, 450);
    
    shape(tree, -80, 100, 250, 550);
    shape(tree, 800, 100, 250, 550);
    shape(grass, 0 ,550, width*2 , height/4);
    shape(grass, 0 ,520, width*2 , height/4);
    
    
    
    /////// game score
    fill(255, 0, 0);
    textSize (30);
    textAlign (CENTER);
    text("Score: " +score, width/2, 30);
    
      //text level
    if (level == 11) {
      text("Level:10(MAX)", width/2, 60); //level 10 is the max level that can be reached.
    } 
    else {
      text("Level: " +level, width/2, 60);
    }
    /////// end of game score
    
    /////// game logic 
    if(new_fruit == 1){
      for (int i= 0 ; i < level ; i++){
        fruit_idx[i] = int(random(fruits.length));
        fruitX[i] = int(random(30,width-60)) ;
      }
      println("gen fr");
      new_fruit = 0;
    }
    
    
    for (int i = 0 ; i < level; i++){
      fruitY[i] += distance;
      shape(fruit[fruit_idx[i]], fruitX[i] , fruitY[i] , width / 11 , height / 9 );
      
      if(abs(fruitY[i]-basketY) < 7 ){
        
        if (fruitY[level-1] <= basketY){
          println("working");
          new_fruit = 1 ;
        } 
        
        if(abs(fruitX[i] - mouseX)< 70){
          if(fruit_idx[i] == 0){
            score +=2;
          }
          else if(fruit_idx[i] == fruits.length-1){
            score -=1;
          }
          else{
            score +=1;
          }
        }
        fruitY[i] = 0 ;
        println(fruitX[i], fruitY[i] , i);
        
      }
    }
    image(basket, mouseX-70 ,basketY, width/5 , height/5);
    
    }
}
