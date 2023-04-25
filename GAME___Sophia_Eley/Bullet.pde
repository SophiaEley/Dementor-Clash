class Bullet {
  
  // variables
  int x;
  int y;
  int d;
  int speed;
  
  boolean shouldRemove;
  
  int left;
  int right;
  int top;
  int bottom;
  
  // constructor
  Bullet(int startingX, int startingY){
    x = startingX;
    y = startingY;
    
    d = 10;
    
    speed = 15;
    
    shouldRemove = false;
    
    left = x - d/2;
    right = x + d/2;
    top = y - d/2;
    bottom = y + d/2;
  }
  //render basic bullet
  void render(){
    circle(x,y,d);
  }
  //gives basic movement info for bullets
  void move(){
    y -= speed; // y = y - speed
    
    left = x - d/2;
    right = x + d/2;
    top = y - d/2;
    bottom = y + d/2;
  }
  //checks to see if bullets should be removed when they reach top of screen
  void checkRemove(){
    if (y < 0){
     shouldRemove = true; 
    }
  }
  //what happens when an enemy is shot by a bullet
  void shootEnemy(Enemy anEnemy){
    // if the bullet collides with enemy
    // then flag the enemy to be removed
    if (top <= anEnemy.bottom &&
        bottom >= anEnemy.top &&
        left <= anEnemy.right &&
        right >= anEnemy.left){
          anEnemy.shouldRemove = true;
          shouldRemove = true;
        }
  }
  
}
