class Movement implements Update, Draw {
  
  PVector direction = new PVector();
  boolean isMoving = false;
  boolean enabled = true;

  Movement(){}
  
  void update(){}
  
  void draw(){}
  
  void move(boolean movingUp, boolean movingDown, boolean movingLeft, boolean movingRight, PVector parentPosition) {
    
    if (!enabled) return;
    isMoving = movingUp || movingDown || movingLeft || movingRight;
    if (!isMoving) return;
    
    direction.mult(0);
    
    if (movingLeft && !movingRight) direction.x -= 1;
    if (!movingLeft && movingRight) direction.x += 1;
    if (movingUp && !movingDown) direction.y -= 1;
    if (!movingUp && movingDown) direction.y += 1;
    
    direction.normalize();
    
    parentPosition.x += direction.x * dt * 100;
    parentPosition.y += direction.y * dt * 100;
    
  }
  
  
}
