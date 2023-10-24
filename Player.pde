class Player implements Update, Draw, ExecuteCommands, FindObjects, Move, Combat, Kill, Burn {

  PVector location = new PVector();
  ArrayList<Command> commands = new ArrayList();

  Rect hitbox = new Rect(width*.5, height*.5, 32, 32);
  Movement movement = new Movement();
  CombatStats combat = new CombatStats(10, 1);
  ArrayList<Object> components = new ArrayList();



  // ANIMATIONS
  Animation walkAnim = new Animation(location, roboWalk);
  Animation idleAnim = new Animation(location, roboIdles);
  Animation[] animations = {idleAnim, walkAnim}; // order should match animState's constants order
  final int IDLE = 0;
  final int WALK = 1;
  int animState = IDLE;


  Player() {
    components.add(hitbox);
    components.add(movement);
    components.add(combat);


    for (Animation a : animations) {
      a.offset.y += -4.5;
    }
  }

  void update() {

    execute(commands);
    update(components);
    hitbox.setPosition(location);
    move(Keyboard.isDown(Keyboard.UP),
      Keyboard.isDown(Keyboard.DOWN),
      Keyboard.isDown(Keyboard.LEFT),
      Keyboard.isDown(Keyboard.RIGHT) );

    handleAnimState(animState);
    animations[animState].update();
  }

  void draw() {

    draw(components);

    animations[animState].draw();
  }

  void takeDamageFrom(Object dealer, float amount) {
    combat.health -= amount;
    if (combat.health <= 0) kill();
  }

  void kill() {

    kill(levels[currentLevel], this); // this will cull this object from level's player game object list
  }
  
  void burn(){
  
    println("Player burning");
  }

  void move(PVector direction) {
  }
  void move(boolean movingUp, boolean movingDown, boolean movingLeft, boolean movingRight) {

    movement.move(movingUp, movingDown, movingLeft, movingRight, location);
  }

  boolean checkCollision(Rect other) {

    return hitbox.checkCollidingWith(other);
  }

  void handleAnimState(int state) {

    switch (state) {

    case IDLE:
      if (movement.isMoving) animState = WALK;
      break;

    case WALK:
      if (!movement.isMoving) animState = IDLE;

      break;
    }

    walkAnim.flipped = movement.direction.x < 0;
  }

  void mousePressed() {
  }

  void mouseReleased() {
  }
}
