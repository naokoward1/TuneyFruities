import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

// Keys that play respective piano sounds
Minim minim;
AudioSample c_key;
AudioSample d_key;
AudioSample e_key;
AudioSample g_key;

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

FruitDude strawberry;
FruitDude blueberry;
FruitDude orange;
FruitDude melon;

void setup(){
  frameRate(10);
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
  // initialize keys
  minim = new Minim(this);
  c_key = minim.loadSample("Piano Keys/C.wav");
  d_key = minim.loadSample("Piano Keys/D.wav");
  e_key = minim.loadSample("Piano Keys/E.wav");
  g_key = minim.loadSample("Piano Keys/G.wav");
  
  
  strawberry = new FruitDude(50, 200, "strawberry");
  blueberry = new FruitDude(350, 200, "blueberry");
  orange = new FruitDude(650, 200, "orange");
  melon = new FruitDude(950, 200, "melon");
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
  background(0);
  strawberry.display();
  blueberry.display();
  orange.display();
  melon.display();
  fill(0, 20, 20);
  playbackButton.display();
  playbackButton.textFill();
}

void gameMode(){
  background(0); 
 // draw board for song mode --
 //base
 fill(255);
 rect(200, 0, 400, 800);
 
 //color in
 fill(155, 0, 0);
 rect(200, 0, 100, 700);
 fill(0, 155, 0);
 rect(300, 0, 100, 700);
 fill(0, 0, 155);
 rect(400, 0, 100, 700);
 fill(155, 155, 0);
 rect(500, 0, 100, 700);
 
 //outline
 stroke(255);
 line(300, 0, 300, 800);
 line(400, 0, 400, 800);
 line(500, 0, 500, 800);
 line(200, 700, 600, 700);
 stroke(0);
 line(300, 700, 300, 800);
 line(400, 700, 400, 800);
 line(500, 700, 500, 800);
 
 //text on hit area
 textSize(64);
 fill(0);
 text("D", 225, 775);
 text("F", 325, 775);
 text("J", 445, 775);
 text("K", 525, 775);
 
 //text placeholders for "Tuneys"/ Score
 fill(0);
 stroke(255);
 rect(200, 0, 400, 100);
 
 fill(255);
 textSize(32);
 text("Score", 360, 50);
 
 text("Tuney A", 25, 250);
 text("Tuney B", 25, 500);
 text("Tuney C", 650, 250);
 text("Tuney D", 650, 500);
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
  if(page=="freePlayPage"){
      if (key == '1'){
        strawberry.state = 1;
        c_key.trigger();
      }
      else if (key == '2'){
        blueberry.state = 1;
        d_key.trigger();
      }
      else if (key == '3'){
        orange.state = 1;
        e_key.trigger();
      }
      else if (key == '4'){
        melon.state = 1;
        g_key.trigger();
      }
  }
  if(page=="gameModePage"){
     if(key == 'd') {
        c_key.trigger(); 
     } 
     if(key == 'f') {
        d_key.trigger(); 
     } 
     if(key == 'j') {
        e_key.trigger(); 
     }
     if(key == 'k') {
       print("hello");
        g_key.trigger(); 
     }
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

void keyReleased() {
  strawberry.state = 0;
  blueberry.state = 0;
  orange.state = 0;
  melon.state = 0;
}
