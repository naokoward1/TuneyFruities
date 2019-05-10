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
AudioPlayer mii;

PImage mainMenuImage;
PImage optionsImage;
PImage backgroundImage;
PImage playbackImage; 
PImage gameModeEndImage;
PImage pauseFreePlayImage;
PImage pauseGameModeImage;
PImage pauseGeneralImage;
PImage scoreImage;
String page;
int score;
Button freePlayButton;
Button gameModeButton;
Button playbackButton;
Button startButton;
Note[] theNotes = new Note[4];
Note[] theNotesFreePlay = new Note[4];
String[] theColors = new String[4];
float note_w, note_h;
boolean grow = true;
boolean displayNote;

FruitDude strawberry;
FruitDude blueberry;
FruitDude orange;
FruitDude melon;

// Game Mode BG
PImage gameModeBG;
PImage gameBoard;
Board board;

// Game Mode Input
int numNotes;
String[] lines;
String[] keys;
int[] times;

// Game Mode Notes
Music_Note[] notes;
int startTime = 0;

void setup(){
  //frameRate(10);
  surface.setResizable(true);
  size(1200, 900);
  mainMenuImage = loadImage("../assets/Screen_Layout/start.png");
  optionsImage = loadImage("../assets/Screen_Layout/options.png");
  backgroundImage= loadImage("../assets/Screen_Layout/background.png");
  pauseFreePlayImage = loadImage("../assets/Screen_Layout/pauseFreePlay.png");
  pauseGameModeImage = loadImage("../assets/Screen_Layout/pauseGameMode.png");
  pauseGeneralImage = loadImage("../assets/Screen_Layout/pause_general.png");
  playbackImage = loadImage("../assets/Screen_Layout/win.png");
  scoreImage = loadImage("../assets/Screen_Layout/score.png");
  mainMenuImage.resize(width, height);
  optionsImage.resize(width, height);
  backgroundImage.resize(width, height);
  playbackImage.resize(width, height);
  scoreImage.resize(width, height);
  pauseFreePlayImage.resize(width, height);
  pauseGameModeImage.resize(width, height);
  pauseGeneralImage.resize(width, height);
  page = "mainMenuPage";
  startButton = new Button(width/2 -100, height - 150, 300, 100, "Start");
  startButton.fillCol = color(234, 77, 79);
  startButton.textCol = color(255);
  freePlayButton = new Button(125, height/2 - 20, 400, 75, "Free Play");
  gameModeButton = new Button(700, height/2 - 20, 400, 75, "Game Mode");
  playbackButton = new Button(width/ 2 - 200, height - 100, 400, 150, "Playback");
  String[] theColors = {"red", "blue", "orange", "green"};  
  
  //create note array
  for(int i = 0; i < theColors.length; i++){
    theNotes[i] = new Note(i*275, height - 250, theColors[i]);
  }
  for(int i = 0; i < theColors.length; i++){
    theNotesFreePlay[i] = new Note(i*275, 50, theColors[i]);
  }
  // initialize music
  minim = new Minim(this);
  c_key = minim.loadSample("Piano Keys/C.wav");
  d_key = minim.loadSample("Piano Keys/D.wav");
  e_key = minim.loadSample("Piano Keys/E.wav");
  g_key = minim.loadSample("Piano Keys/G.wav");
  
  strawberry = new FruitDude(50, 200, "strawberry");
  blueberry = new FruitDude(350, 200, "blueberry");
  orange = new FruitDude(650, 200, "orange");
  melon = new FruitDude(950, 200, "melon");
  
  // Game Mode
  // Read in data
  mii = minim.loadFile("Song/mii.mp3");
  board = new Board();
  lines = loadStrings("note_data.txt");
  keys = new String[lines.length];
  times = new int[lines.length];
  numNotes = lines.length - 1;
  
  for(int i = 0; i < lines.length; i++) {
   String[] vals = lines[i].split(", ");
   keys[i] = vals[0].trim();
   times[i] = int(vals[1]);
  }
  
  // note creation
  notes = new Music_Note[lines.length];
  for(int j = 0; j < lines.length; j++) {
   notes[j] = new Music_Note(keys[j]); 
  }
}

void draw(){
  if(page != "gameModePage"){
    mii.pause();
  }
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
  else if(page == "endGameModePage"){
    endGameMode();
  }
}

void mainMenu(){
  image(mainMenuImage, 0, 0);
  startButton.display();
  startButton.textFill();
  for(int i = 0; i < notes.length; i++) {
   notes[i].setX(100);
   notes[i].setMiss();
  }
  startTime = 0;
  mii.pause();
  mii.rewind();
  board.resetScore();
}

void options(){
  image(optionsImage, 0, 0);
  freePlayButton.display();
  freePlayButton.textFill();
  gameModeButton.display();
  gameModeButton.textFill();
}

void freePlay(){
  image(backgroundImage, 0, 0);
  strawberry.setPos(50, 200);
  strawberry.display();
  blueberry.setPos(350, 200);
  blueberry.display();
  orange.setPos(650, 200);
  orange.display();
  melon.setPos(950, 200);
  melon.display();
  fill(0, 20, 20);
    for(int j = 0; j < 4; j++){
    theNotesFreePlay[j].update();
    theNotesFreePlay[j].move();
    theNotesFreePlay[j].display();
  }
}

void gameMode(){
  background(0);
  if (startTime == 0) {
   startTime = int(millis());
   println(startTime);
  }
  board.display();
  
  strawberry.setPos(60, 400);
  strawberry.display();
  blueberry.setPos(340, 400);
  blueberry.display();
  orange.setPos(620, 400);
  orange.display();
  melon.setPos(900, 400);
  melon.display();
  
  //frameRate(60);
  
  if(millis() - startTime > 4400) {
   mii.play();
  }
  int notesLen = notes.length -1;
  if(notes[notesLen].getX() > 1120){
    delay(3000);
    page = "endGameModePage";
  }
  for(int k = 0; k < lines.length; k++) {
   if(millis() - startTime > times[k] && notes[k].getX() < 1120 && page == "gameModePage") {
    notes[k].display();
    if(notes[k].getHit() == true) {
     notes[k].glow = true;
     board.scoreUp(100);
    }
   }
  }
}

void pauseFreePlay(){
  image(pauseGeneralImage, 0, 0);
  for(int j = 0; j < 4; j++){
    theNotes[j].update();
    theNotes[j].move();
    theNotes[j].display();
  }
}

void pauseGameMode(){
  image(pauseGeneralImage, 0, 0);
  //for(int j = 0; j < 4; j++){
    //theNotes[j].update();
    //theNotes[j].move();
    //theNotes[j].display();
  //}
}

void endGameMode(){
  image(scoreImage, 0, 0);
  fill(0);
  textSize(32);
  text(board.score, width/2, height/2);
  for(int i = 0; i < notes.length; i++) {
   notes[i].setX(100);
   notes[i].setMiss();
  }
  startTime = 0;
  mii.pause();
  mii.rewind();
}

void keyPressed(){
  //if spacebar is pressed
  if(page=="gameModePage"){
    if(key=='a'){
      page="endGameModePage";
    }
  }
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
      if (key == 'd'){
        strawberry.state = 1;
        strokeWeight(20);
        stroke(200, 100, 100);
        displayNote = true;
        c_key.trigger();
      }
      else if (key == 'f'){
        blueberry.state = 1;
        d_key.trigger();
      }
      else if (key == 'j'){
        orange.state = 1;
        e_key.trigger();
      }
      else if (key == 'k'){
        melon.state = 1;
        g_key.trigger();
      }
  }
  if(page=="gameModePage"){
     if(key == 'd') {
        strawberry.state = 1;
        //c_key.trigger(); 
     } 
     if(key == 'f') {
        blueberry.state = 1;
        //d_key.trigger(); 
     } 
     if(key == 'j') {
        orange.state = 1;
        //e_key.trigger(); 
     }
     if(key == 'k') {
        melon.state = 1;
        //g_key.trigger(); 
     }
   }
}   

void mousePressed(){
  if(page=="mainMenuPage"){
    if(startButton.overShape()){
      page="optionsPage";
    }
  }
  if(page=="optionsPage"){
    if(freePlayButton.overShape()){
      page = "freePlayPage";
    }
    else if(gameModeButton.overShape()){
      page = "gameModePage";
    }
  }
}

void keyReleased() {
  strawberry.state = 0;
  blueberry.state = 0;
  orange.state = 0;
  melon.state = 0;
}
