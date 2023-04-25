class Enemy {
  
  // variables
  int x;
  int y;
  int w;
  int h;
  
  int left;
  int right;
  int top;
  int bottom;
  
  boolean shouldRemove;
  
  float xSpeed;
  float ySpeed;
  
  Animation dementAnimation;
  
  // constructor
  Enemy(int startingX, int startingY, int startingW, int startingH, int startingXSpeed, int startingYSpeed){
    x = startingX;
    y = startingY;
    w = startingW;
    h = startingH;
    xSpeed = startingXSpeed;
    ySpeed = startingYSpeed;
    
    left = x - w/2;
    right = x + w/2;
    top = y - h/2;
    bottom = y + h/2;
    
    shouldRemove = false;
    
    dementAnimation = new Animation(dementImages, .01, .09);
    
  }
  //makes basic enemy
  void render(){
     
  
    dementAnimation.isAnimating = true;
    dementAnimation.display(x,y);
    
    
    dementAnimation.next();
  }
  //basic info on how enemies should move
  void move(){
    x += xSpeed;
    y += ySpeed;
    left = x - w/2;
    right = x + w/2;
    top = y - h/2;
    bottom = y + h/2;
  }
  //setup so that enemies will stay inside a certain area of screen, or "hitbox"
  void wallDetect(){
    if (x-w/2 <= 0){
      xSpeed = abs(xSpeed);
    }
    if (x+w/2 >= width){
      xSpeed = -abs(xSpeed);
    }
    if (y-h/2 <=0){
      ySpeed = abs(ySpeed);
    }
    if (y+h/2 >= height/2){
      ySpeed = -abs(ySpeed);
    }
  }
}
