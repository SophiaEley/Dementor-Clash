////GOALS:::
//Harry Potter Themed Space Invaders-esque Game.
//Player moves back and forth using a-b keys on bottom 
//1/4 of screen, can't move past side walls.
//Enemies move back and forth and up and down in a 
//diamond pattern on top half of screen.
//Player uses space button to shoot bullets at enemies (sound plays when this happens,
//and yes, it is Chris himself saying "pew"
Animation titleAnimation;
//Animation dementAnimation;
PImage[] dementImages = new PImage[2];
PImage[] titleImages = new PImage[2];
PImage[] playerImages = new PImage[1];
int state = 0;
PImage frontImg;
PImage levelsImg;
PImage finishImg;

int startTime;
int currentTime;
int interval;
float endTime = 0;
boolean gameEnd = false;

//sound stuff
import processing.sound.*;

SoundFile pewSound;

SoundFile backgroundMusic;

//declaring my vars
Player p1;
Enemy e1;
Enemy e2;
Enemy e3;
Enemy e4;
Enemy e5;
Enemy e6;
Enemy e7;
Enemy e8;
Enemy e9;
Enemy e10;
Enemy e11;
Enemy e12;
Enemy e13;
Enemy e14;
Enemy e15;
Enemy e16;
Enemy e17;
Enemy e18;
Enemy e19;
Enemy e20;
Enemy e21;
Enemy e22;
Enemy e23;
Enemy e24;
Enemy e25;
Enemy e26;
Enemy e27;
Enemy e28;
Enemy e29;
Enemy e30;
Enemy e31;
Enemy e32;
Enemy e33;
Enemy e34;

ArrayList<Bullet> bulletList;
ArrayList<Enemy> enemyList1;
ArrayList<Enemy> enemyList2;
ArrayList<Enemy> enemyList3;

void setup(){
  size(1200,800);
  rectMode(CENTER);
  startTime = millis();
  interval = 1;
  //sound stuff
  pewSound = new SoundFile(this, "pew.wav");
  backgroundMusic = new SoundFile(this, "double.wav");
  
  pewSound.rate(2);
  
  backgroundMusic.rate(1);
  
  //initialize my vars
  p1 = new Player(width/2,height-50,50,50);
  e1 = new Enemy(300,200,50,50,5,4);
  e2 = new Enemy(600,300,50,50,5,4);
  e3 = new Enemy(400,200,50,50,5,4);
  e4 = new Enemy(500,200,50,50,5,4);
  e5 = new Enemy(600,200,50,50,5,4);
  e6 = new Enemy(700,200,50,50,5,4);
  e7 = new Enemy(800,200,50,50,5,4);
  e8 = new Enemy(900,200,50,50,5,4);
  e9 = new Enemy(400,300,50,50,5,4);
  e10 = new Enemy(800,300,50,50,5,4);
  e11 = new Enemy(300,400,50,50,5,4);
  e12 = new Enemy(400,400,50,50,5,4);
  e13 = new Enemy(500,400,50,50,5,4);
  e14 = new Enemy(600,400,50,50,5,4);
  e15 = new Enemy(700,400,50,50,5,4);
  e16 = new Enemy(800,400,50,50,5,4);
  e17 = new Enemy(200,400,50,50,5,4);
  e18 = new Enemy(1000,400,50,50,5,4);
  e19 = new Enemy(450,400,50,50,5,4);
  e20 = new Enemy(750,150,50,50,5,4);
  e21 = new Enemy(651,325,50,50,5,4);
  e22 = new Enemy(392,298,50,50,5,4);
  e23 = new Enemy(178,490,50,50,5,4);
  e24 = new Enemy(800,300,50,50,5,4);
  e25 = new Enemy(300,400,50,50,5,4);
  e26 = new Enemy(400,400,50,50,5,4);
  e27 = new Enemy(500,400,50,50,5,4);
  e28 = new Enemy(600,400,50,50,5,4);
  e29 = new Enemy(700,400,50,50,5,4);
  e30 = new Enemy(800,400,50,50,5,4);
  e31 = new Enemy(200,400,50,50,5,4);
  e32 = new Enemy(1000,400,50,50,5,4);
  e33 = new Enemy(450,400,50,50,5,4);
  e34 = new Enemy(750,150,50,50,5,4);
  //making arraylists
  bulletList = new ArrayList<Bullet>();
  enemyList1 = new ArrayList<Enemy>();
  enemyList2 = new ArrayList<Enemy>();
  enemyList3 = new ArrayList<Enemy>();
  
  
  //individual enemies level 3
  
  
    for (int index = 0; index<2; index++){
      titleImages[index] = loadImage("dementorclash" + index + ".png");
        }
  
      titleAnimation = new Animation(titleImages, .1, .5);
  rectMode(CENTER);
  levelsImg = loadImage("hall.jpg");
  imageMode(CENTER);
  levelsImg.resize(width,height);
  
  for (int index = 0; index<2; index++){
      dementImages[index] = loadImage("dement" + index + ".png");
        }
  for (int index = 0; index<1; index++){
      playerImages[index] = loadImage("hand" + index + ".png");
        }
   
}
//defines music, how bullets and enemies interact
void draw(){

  background(levelsImg);
  println("State: " + state);
  
  if (backgroundMusic.isPlaying() == false){
    backgroundMusic.play();
  }
  switch(state){
    case 0:
      
    startScreen();
    gameEnd = false;
    break;
    case 1:
    //LEVEL ONE
    
    textSize(40);
    text("LEVEL ONE", 200, 500);
    fill(255);
    text("DEFEAT THE DEMENTORS", 200, 550);
    fill(255);
    
    p1.render();
    p1.move();
  
    for (Enemy anEnemy : enemyList1){
      anEnemy.render();
      anEnemy.move();
      anEnemy.wallDetect();
    }
  
  // for loop that goes through all bullets
    for (Bullet aBullet : bulletList){
      aBullet.render();
      aBullet.move();
      aBullet.checkRemove();
    
        for(Enemy anEnemy : enemyList1){
         aBullet.shootEnemy(anEnemy); 
        }
    }

      // for loop that removes unwanted bullets
    for (int i = bulletList.size()-1; i >= 0; i=i-1){
      Bullet aBullet = bulletList.get(i);
    
      if (aBullet.shouldRemove == true){
       bulletList.remove(aBullet); 
      } 
    }
   // for loop that removes killed enemies
    for (int i = enemyList1.size()-1; i >= 0; i=i-1){
      Enemy anEnemy = enemyList1.get(i);
    
      if (anEnemy.shouldRemove == true){
        anEnemy.shouldRemove = false;
       enemyList1.remove(anEnemy); 
      } 
    }
    println(enemyList1.size());
    if (enemyList1.size() < 1){
        levelTwo();
        state = 2;
      }
      
     break;
  
    case 2:
    //LEVEL TWO
    //levelTwo();
    textSize(40);
    text("LEVEL TWO", 200, 500);
    fill(255);
    text("KEEP GOING AS FAST AS POSSIBLE", 200, 550);
    fill(255);
    p1.render();
    p1.move();
  
    for (Enemy anEnemy : enemyList2){
      anEnemy.render();
      anEnemy.move();
      anEnemy.wallDetect();
    }
  
  // for loop that goes through all bullets
    for (Bullet aBullet : bulletList){
      aBullet.render();
      aBullet.move();
      aBullet.checkRemove();
    
        for(Enemy anEnemy : enemyList2){
         aBullet.shootEnemy(anEnemy); 
        }
    }
   // for loop that removes unwanted bullets
    for (int i = bulletList.size()-1; i >= 0; i=i-1){
      Bullet aBullet = bulletList.get(i);
    
      if (aBullet.shouldRemove == true){
       bulletList.remove(aBullet); 
      } 
    }
  
  // for loop that removes killed enemies
    for (int i = enemyList2.size()-1; i >= 0; i=i-1){
      Enemy anEnemy = enemyList2.get(i);
    
      if (anEnemy.shouldRemove == true){
        anEnemy.shouldRemove = false;
       enemyList2.remove(anEnemy); 
      } 
    }
        if (enemyList2.size() < 1){
        levelThree();
        state = 3;
      }
 
    break;
    case 3:
    //LEVEL THREE
    textSize(40);
    text("LEVEL THREE", 200, 500);
    fill(255);
    text("ALMOST THERE", 200, 550);
    fill(255);
    p1.render();
    p1.move();
  
    for (Enemy anEnemy : enemyList3){
      anEnemy.render();
      anEnemy.move();
      anEnemy.wallDetect();
    }
  
  // for loop that goes through all bullets
    for (Bullet aBullet : bulletList){
      aBullet.render();
      aBullet.move();
      aBullet.checkRemove();
    
        for(Enemy anEnemy : enemyList3){
         aBullet.shootEnemy(anEnemy); 
        }
    }
   
      // for loop that removes unwanted bullets
    for (int i = bulletList.size()-1; i >= 0; i=i-1){
      Bullet aBullet = bulletList.get(i);
    
      if (aBullet.shouldRemove == true){
       bulletList.remove(aBullet); 
      } 
    }
  
  // for loop that removes killed enemies
    for (int i = enemyList3.size()-1; i >= 0; i=i-1){
      Enemy anEnemy = enemyList3.get(i);
    
      if (anEnemy.shouldRemove == true){
        anEnemy.shouldRemove = false;
       enemyList3.remove(anEnemy); 
      } 
    }
    if (enemyList3.size() < 1){
        playerWinScreen();
        state = 4;
         
      }

    break;
    case 4:
    playerWinScreen();
    
    println(millis());
    if (gameEnd == false){
      endTime = (startTime - millis())/1000;
      gameEnd = true; 
    }
    textSize(50);
    fill(255);
    text("Score:" + endTime, width-750,height-100);
        
  
    break;
    case 5:
    break;
  }
}
//keys to move player and shoot bullets
void keyPressed(){
  if (key == 'a'){
    p1.isMovingLeft = true;
  }
  
  if (key == 'd'){
    p1.isMovingRight = true; 
  }
  
  if (key == ' '){
    bulletList.add(new Bullet(p1.x,p1.y));
    pewSound.play();
  }
  if(key == ' '){
      if (state == 0){
        state = 1;
        levelOne();
        startTime = millis();
      }
    }
  if (key == 'g'){
    if (state == 4){
      state = 0;
      startScreen();
    }
  }
}
//stops player from moving when keys are released
void keyReleased(){
  if (key == 'a'){
    p1.isMovingLeft = false;
  }
  
  if (key == 'd'){
    p1.isMovingRight = false; 
  }
}

void startScreen(){
  frontImg = loadImage("frontpage.jpeg");
  imageMode(CENTER);
  frontImg.resize(width,height);
  background(frontImg);
  titleAnimation.isAnimating = true;
  titleAnimation.display(width/2, height/3);
  textSize(40);
  text("use 'a' and 'd' to move player", 360, 380);
  text("press 'space' bar to shoot", 400, 420);
  text("press 'space'", 500, 500);
  fill(255);
  text("to begin", 530, 540);
  fill(255);

}

void levelOne(){
  
  //individual enemies level 1
  enemyList1.add(e1);
  enemyList1.add(e2);
  enemyList1.add(e3);
  enemyList1.add(e4);
  enemyList1.add(e5);
  enemyList1.add(e6);
  enemyList1.add(e7);
  enemyList1.add(e8);
  enemyList1.add(e9);
  enemyList1.add(e10);
  enemyList1.add(e11);
  enemyList1.add(e12);
  enemyList1.add(e13);
  enemyList1.add(e14);
  enemyList1.add(e15);
  enemyList1.add(e16);
  enemyList1.add(e17);
}

void levelTwo(){
  //individual enemies level 2
  enemyList2.add(e1);
  enemyList2.add(e2);
  enemyList2.add(e3);
  enemyList2.add(e4);
  enemyList2.add(e5);
  enemyList2.add(e6);
  enemyList2.add(e7);
  enemyList2.add(e8);
  enemyList2.add(e9);
  enemyList2.add(e10);
  enemyList2.add(e11);
  enemyList2.add(e12);
  enemyList2.add(e13);
  enemyList2.add(e14);
  enemyList2.add(e15);
  enemyList2.add(e16);
  enemyList2.add(e17);
  enemyList2.add(e18);
  enemyList2.add(e19);
  enemyList2.add(e20);
  enemyList2.add(e21);
  enemyList2.add(e22);
  enemyList2.add(e23);
  scramble(enemyList2);
}

void levelThree(){
  //individual enemies level 3
  enemyList3.add(e1);
  enemyList3.add(e2);
  enemyList3.add(e3);
  enemyList3.add(e4);
  enemyList3.add(e5);
  enemyList3.add(e6);
  enemyList3.add(e7);
  enemyList3.add(e8);
  enemyList3.add(e9);
  enemyList3.add(e10);
  enemyList3.add(e11);
  enemyList3.add(e12);
  enemyList3.add(e13);
  enemyList3.add(e14);
  enemyList3.add(e15);
  enemyList3.add(e16);
  enemyList3.add(e17);
  enemyList3.add(e18);
  enemyList3.add(e19);
  enemyList3.add(e20);
  enemyList3.add(e21);
  enemyList3.add(e22);
  enemyList3.add(e23);
  enemyList2.add(e24);
  enemyList2.add(e25);
  enemyList2.add(e26);
  enemyList2.add(e27);
  enemyList2.add(e28);
  enemyList2.add(e29);
  enemyList2.add(e30);
  enemyList2.add(e31);
  enemyList2.add(e32);
  enemyList2.add(e33);
  enemyList2.add(e34);
  scramble(enemyList3);
}

void playerWinScreen(){
  finishImg = loadImage("finish.jpeg");
  imageMode(CENTER);
  finishImg.resize(width,height);
  background(finishImg);
  textSize(40);
  text("press g", 530, 500);
  fill(255);
  text("to restart", 530, 540);
  fill(255);
}

void scramble(ArrayList<Enemy> el) {
  for(Enemy enemy : el) {
    enemy.x = int(random(0, width));
  }
}
