class Level implements Update, Draw {

  Player p = new Player();
  NPC npc = new NPC();
  Fire fire = new Fire(width*.5, height*.5);
  
  HashMap<Class, Collection<Object>> objectListDict = new HashMap();
  final int MAIN_MENU = 0;
  final int GAME = 1;
  final int GAME_OVER = 2;

  Level(int id) {

    switch (id) {

    case MAIN_MENU:
      break;

    case GAME:
    
      this
        .addObject(npc)
        .addObject(p)
        .addObject(fire);
        
      break;

    case GAME_OVER:
      break;
    }
  }

  Level(String JSONFileName) {

    loadLevel(JSONFileName);
  }

  void update() {

    //npc.kill();
    for (HashMap.Entry<Class, Collection<Object>> entry : objectListDict.entrySet()) {

      update( entry.getValue() );
    }
  }

  void draw() {

    for (HashMap.Entry<Class, Collection<Object>> entry : objectListDict.entrySet()) {

      draw( entry.getValue() );
    }
  }

  void loadLevel(String JSONFileName) {
  }


  Level addObject(Object o) {

    if ( objectListDict.containsKey( o.getClass() ) ) {

      objectListDict.get( o.getClass() ).add(o);
      println("GameObject '" + o + "' added to '" + o.getClass() + "' object list");
    } else {

      ArrayList<Object> newList = new ArrayList();
      println("Object list for '" + o.getClass() + " type created successfully");

      newList.add(o);
      objectListDict.put(o.getClass(), newList);
      println("GameObject '" + o + "' added to '" + o.getClass() + "' object list");
    }
    return this;
  }

  void keyPressed() {
  }

  void keyReleased() {
  }
}
