class Fire implements Draw, Update, FindObjects {

  PVector position = new PVector(200, 200);
  Rect hitbox;
  Animation fireAnim;


  Fire(float x, float y) {

    position = new PVector(x, y);
    hitbox = new Rect(x, y, 32, 32);
    hitbox.setPosition(new PVector(x, y));
    hitbox.update();
    fireAnim = new Animation(position, fire);
  }

  void update() {

    hitbox.update();
    fireAnim.update();

    ArrayList<Object> playerList = (ArrayList<Object>) findObjectsOf(levels[currentLevel], Player.class);
    if (playerList.size() > 0) {
      
      Player player = (Player) playerList.get(0);
      
      if (player.checkCollision(hitbox)) {
        Burn burnablePlayer = (Burn) player;
        burnObject(burnablePlayer);
      }
    }
  }

  void draw() {

    hitbox.draw();
    fireAnim.draw();
  }

  void burnObject(Burn burnableObject) {

    burnableObject.burn();
  }
}
