interface Burn {

  abstract void burn();
}

interface Kill {

  abstract void kill();
  
  // must not be called inside of level.update() CONCURRENTMODIFICATIONEXCEPTION
  default void kill(Level level, Object o) {
    
    ArrayList<Object> list;
    
    /*
      Get a reference to a certain object list inside of level
      then reverse iterate through it checking if one of the objects is
      equal to this one. if so, remove it from the list
    */
    
    if (!level.objectListDict.containsKey(o.getClass())) list = new ArrayList();
    else list = (ArrayList<Object>) level.objectListDict.get(o.getClass());
  
    
    for (int i = list.size() - 1; i >= 0; i--) {
      
      if (list.get(i).equals(this)) list.remove(i);
    }
  }
}

interface Combat {
  
  // might get rid of dealDamageTo() (kind of redundant)
  
  abstract void takeDamageFrom(Object object, float amount);

  default void dealDamageTo(Combat object, float amount) {
    object.takeDamageFrom(this, amount);
  }
  
}

interface Mouse {

  // Might want to rename this to Input or something
  
  abstract void mousePressed();
  abstract void mouseReleased();

  // propagates mousePressed() calls to object lists
  default void mousePressed(Collection<?> list) {

    for (Object o : list) ((Mouse) o).mousePressed();
  }

  default void mouseReleased(Collection<?> list) {
    for (Object o : list) ((Mouse) o).mouseReleased();
  }
}

interface Update {

  abstract void update();

  // propagates update() calls to object lists
  default void update(Collection<?> list) {

    for (Object o : list) ((Update) o).update();
  }
}

interface Draw {

  abstract void draw();

  default void draw(Collection<?> list) {

    for (Object o : list) {
      ((Draw) o).draw();
    }
  }
}

interface ExecuteCommands {

  default void execute(Collection<Command> list) {

    for (Command c : list) c.execute();
    list.clear();
  }
}


interface FindObjects {

  default Collection<Object> findObjectsOf(Level level, Class type) {

    if (!level.objectListDict.containsKey(type)) return new ArrayList();
    return level.objectListDict.get(type);
  }
}

interface Move {

  abstract void move(PVector direction);

  abstract void move(boolean movingUp, boolean movingDown, boolean movingLeft, boolean movingRight);
}

interface Command {

  abstract void execute();
}
