class Animation implements Update, Draw {

  PVector position;
  PVector offset = new PVector();
  Timer nextFrameDelay = new Timer(.025);
  PImage[] frames;
  boolean flipped = false;
  int currentFrame = 0;
  
  Animation(PVector position, PImage[] frames) {
  
    this.position = position;
    this.frames = frames;
  }
  
  void update() {
  
    nextFrameDelay.update();
    
    if (nextFrameDelay.isDone) {
    
      nextFrameDelay.reset();
      currentFrame++;
    }
    
    if (currentFrame >= frames.length) currentFrame = 0;
  }
  
  void draw(){
  
    pushMatrix();
    translate(position.x, position.y);
    if (flipped) scale(-1, 1);
    imageMode(CENTER);
    image(frames[currentFrame], offset.x, offset.y);
    popMatrix();
  }
}
