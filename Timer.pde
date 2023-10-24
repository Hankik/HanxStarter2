class Timer implements Update{

  float duration;
  float timeLeft;
  boolean isDone = true;
  boolean autoRestart = false;
  boolean paused = false;
  
  Timer(float duration) {
  
    this.duration = duration;
    this.timeLeft = duration;
    isDone = false;
  }
  
  void update(){
  
    if (this.paused) return;
    
    if (timeLeft <= 0) {
    
      timeLeft = 0;
      isDone = true;
      if (autoRestart) reset();
      
    } else {
    
      if (!isDone) {
      
        timeLeft -= dt;
      }
    }
  }
  
  void reset(){
    
    timeLeft = duration;
    isDone = false;
  }
  
  void togglePause(){
  
    paused = !paused;
  }
}
