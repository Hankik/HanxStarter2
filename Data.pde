class CombatStats implements Update, Draw {

  float maxHealth;
  float health;
  float baseDamage;
  float damage;
  Timer takeDamageCooldown = new Timer(1.5);
  
  CombatStats(float startingHealth, float startingDamage){
  
    maxHealth = startingHealth;
    health = maxHealth;
    baseDamage = startingDamage;
    damage = baseDamage;
  }
  
  void update(){
  
    takeDamageCooldown.update();
  }
  
  void draw(){
  }
}

class Ray {
  
  PVector origin;
  PVector direction;

  Ray(PVector origin, PVector direction) {
  
    this.origin = origin;
    this.direction = direction;
  }
}
