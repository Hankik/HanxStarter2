class NPC implements Update, Draw, FindObjects, ExecuteCommands, Combat, Kill {
  
  
  ArrayList<Command> commands = new ArrayList();
  ArrayList<Object> components = new ArrayList();
  
  Rect hitbox = new Rect(width*.4, height*.4, 32, 32);
  CombatStats combat = new CombatStats(10, 1);

  NPC(){
  
    components.add(combat);
    components.add(hitbox);
  }
  
  void update(){
  
    execute(commands);
    update(components);
  }
  
  void draw(){
  
    draw(components);
  }
  
  void kill(){
  
    kill(levels[currentLevel], this);
  }
  
  void takeDamageFrom(Object o, float amount) {
  
    if (combat.health <= 0) kill();
  }
  
  
}
