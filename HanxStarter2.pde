import java.util.Collection;

final int LEVEL_AMOUNT = 3;
Level[] levels = new Level[LEVEL_AMOUNT];
int currentLevel = 0;
UI[] menus = new UI[LEVEL_AMOUNT];
PFont georgia, vrinda;

float dt, prevTime, elapsed = 0;
boolean paused = false;
String[] nameFire = {"fire/fire1.png", "fire/fire2.png", "fire/fire3.png", "fire/fire4.png", "fire/fire5.png"};
String[] nameRoboWalk = {"robot/walk0.png", "robot/walk1.png", "robot/walk2.png", "robot/walk3.png",
  "robot/walk4.png", "robot/walk5.png", "robot/walk6.png", "robot/walk7.png"};
PImage[] fire = new PImage[nameFire.length];
PImage[] roboWalk = new PImage[nameRoboWalk.length];
PImage[] roboIdles = new PImage[1];
PImage roboIdle;

void setup() {
  size(600, 600);
  
  // load fonts
  georgia = createFont("GeorgiaPro-Bold-48.vlw", 48);
  vrinda = createFont("Vrinda-48.vlw", 48);
  textFont(vrinda);
  
  // load sprites
  roboIdle = loadImage("robot/idle.png");
  roboIdle.resize(32, 40);
  for (int i = 0; i < roboIdles.length; i++) roboIdles[i] = roboIdle;
  for (int i = 0; i < fire.length; i++) fire[i] = loadImage(nameFire[i]);
  for (int i = 0; i < roboWalk.length; i++) {
    roboWalk[i] = loadImage(nameRoboWalk[i]);
    roboWalk[i].resize(32, 40);
  }

  for (int i = 0; i < LEVEL_AMOUNT; i++) {
  
    levels[i] = new Level(i);
    menus[i] = new UI(i);
  }
}

void draw() {

  // calculate delta time
  float currTime = millis();
  dt = (currTime - prevTime) / 1000;
  prevTime = currTime;

  background(BLACK);
  if (!paused) {
    levels[currentLevel].update();
    elapsed += dt;
  }
  levels[currentLevel].draw();
  menus[currentLevel].update();
  menus[currentLevel].draw();
}

void keyPressed() {

  Keyboard.handleKeyDown(keyCode);
  levels[currentLevel].keyPressed();
}

void keyReleased() {

  Keyboard.handleKeyUp(keyCode);
  levels[currentLevel].keyReleased();
}

void mousePressed() {

  menus[currentLevel].mousePressed();
}

void mouseReleased() {

  menus[currentLevel].mouseReleased();
}



// color constants
final color RED = #bf616a;
final color ORANGE = #d08770;
final color YELLOW = #ebcb8b;
final color GREEN = #a3be8c;
final color PURPLE = #b48ead;
final color BLUE = #5e81ac;
final color WHITE = #eceff4;
final color BLACK = #3b4252;
final color BROWN = #9e6257;
final color LIGHTGREEN = #d9e68f;
final color PINK = #db96ad;
final color LIGHTBLUE = #92cade;
final color LIGHTRED = #FF8C8C;
