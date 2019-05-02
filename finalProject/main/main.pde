PImage mainMenuImage;
PImage optionsImage;
PImage backgroundImage;
PImage playbackImage; 
PImage gameModeEndImage;
PImage pauseFreePlayImage;
PImage pauseGameModeImage;
String page;
int score;
Button freePlayButton;
Button gameModeButton;
Button playbackButton;
Note theNote;

void setup(){
  surface.setResizable(true);
  size(1200, 900);
  mainMenuImage = loadImage("../assets/Screen_Layout/start.png");
  optionsImage = loadImage("../assets/Screen_Layout/options.png");
  backgroundImage= loadImage("../assets/Screen_Layout/background.png");
  pauseFreePlayImage = loadImage("../assets/Screen_Layout/pauseFreePlay.png");
  pauseGameModeImage = loadImage("../assets/Screen_Layout/pauseGameMode.png");
  playbackImage = loadImage("../assets/Screen_Layout/win.png");
  gameModeEndImage = loadImage("../assets/Screen_Layout/gameover.png");
  mainMenuImage.resize(width, height);
  optionsImage.resize(width, height);
  backgroundImage.resize(width, height);
  playbackImage.resize(width, height);
  gameModeEndImage.resize(width, height);
  pauseFreePlayImage.resize(width, height);
  pauseGameModeImage.resize(width, height);
  page = "mainMenuPage";
  freePlayButton = new Button(125, 75, 400, 150, "Free Play");
  gameModeButton = new Button(650, 75, 400, 150, "Game Mode");
  playbackButton = new Button(width/ 2 - 200, height - 100, 400, 150, "Playback");
  theNote = new Note(100, 100, 10);
}

void draw(){
  if(page == "mainMenuPage"){
    mainMenu();
  }
  else if(page =="optionsPage"){
    options();
  }
  else if(page=="freePlayPage"){
    freePlay();
  }
  else if(page=="gameModePage"){
    gameMode();
  }
  else if(page == "pauseFreePlayPage"){
    pauseFreePlay();
  }
  else if(page == "pauseGameModePage"){
    pauseGameMode();
  }
  else if(page == "playbackPage"){
    endFreePlay();
  }
}

void mainMenu(){
  image(mainMenuImage, 0, 0);
  theNote.spin();
  theNote.display();
}

void options(){
  image(optionsImage, 0, 0);
  freePlayButton.display();
  freePlayButton.textFill();
  gameModeButton.display();
  gameModeButton.textFill();
}

void freePlay(){
  background(100, 100, 20);
  playbackButton.display();
  playbackButton.textFill();
}

void gameMode(){
  background(10, 10, 200);
}

void pauseFreePlay(){
  image(pauseFreePlayImage, 0, 0);
}

void pauseGameMode(){
  image(pauseGameModeImage, 0, 0);
}

void endFreePlay(){
  image(playbackImage, 0, 0);
  playbackButton.display(); 
}

void endGameModegame(){
  image(gameModeEndImage, 0, 0);
}


//this function plays back the recording
void playbackMusic(){
  print("hello");
}

void keyPressed(){
  //if spacebar is pressed
  if(key==32){
    if(page=="mainMenuPage"){
      page = "optionsPage";
    }
    else if(page=="freePlayPage"){
      page = "pauseFreePlayPage";
    }
    else if(page=="gameModePage"){
      page = "pauseGameModePage";
    } 
    else if(page=="pauseFreePlayPage"){
      page = "freePlayPage";
    }
    else if(page=="pauseGameModePage"){
      page = "gameModePage";
    }
  }
  if(key==113){
    page = "mainMenuPage";
  }
}

void mousePressed(){
  if(page=="optionsPage"){
    if(freePlayButton.overShape()){
      page = "freePlayPage";
    }
    else if(gameModeButton.overShape()){
      page = "gameModePage";
    }
  }
  else if(page=="freePlayPage"){
    if(playbackButton.overShape()){
      page = "playbackPage";
    }
  }
  else if(page=="playbackPage"){
    if(playbackButton.overShape()){
      playbackMusic();
    }
  }
}
