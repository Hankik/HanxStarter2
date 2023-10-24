class TestCommand implements Command {

  void execute(){}
}

class OpenLevelCommand implements Command {
  
  int levelID;
  
  OpenLevelCommand(int levelID){
  
    this.levelID = levelID;
  }

  void execute(){
    currentLevel = levelID;
  }
}
