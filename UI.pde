class UI implements Update, Draw, Mouse {

  ArrayList<Object> uiObjects = new ArrayList();
  final int GAME_LEVEL_ID = 1;

  PVector button1Position = new PVector(width*.5, height*.3);
  PVector button1Size = new PVector(140, 50);
  Button button1 = new Button(button1Position, button1Size, "NEW GAME", new OpenLevelCommand(GAME_LEVEL_ID) );
  final int MAIN_MENU = 0;
  final int GAME = 1;
  final int GAME_OVER = 2;

  UI(int id) {

    switch (id) {

    case MAIN_MENU:
    
      uiObjects.add( button1 );
      
      break;

    case GAME:
      break;

    case GAME_OVER:
      break;
    }
  }

  void update() {

    update( uiObjects );
  }

  void draw() {

    draw( uiObjects );
  }

  void mousePressed() {

    mousePressed( uiObjects );
  }

  void mouseReleased() {

    mouseReleased( uiObjects );
  }
}
