class Player {
  
  //variables
  int x;
  int y;
  
  int w;
  int h;
  
  boolean isMovingLeft;
  boolean isMovingRight;
  
  int speed;
  
  Animation playerAnimation;
  
  //constructor
  Player(int startingX, int startingY, int startingW, int startingH){
    x = startingX;
    y = startingY;
    w = startingW;
    h = startingH;
    
    isMovingLeft = false;
    isMovingRight = false;
    
    speed = 10;
    
    playerAnimation = new Animation(playerImages, .01, .2);
  }
  
  //basic player
  void render(){
    playerAnimation.isAnimating = true;
    playerAnimation.display(x,y);
    
    
    playerAnimation.next();
  }
  //basic info on how player should move
  void move(){
    if (isMovingLeft == true && x >= 40){
      x -= speed; //x = x - speed;
    }
    
    if (isMovingRight == true && x <= 1160){
      x += speed; //x = x + speed;
    }
  }
  
}
