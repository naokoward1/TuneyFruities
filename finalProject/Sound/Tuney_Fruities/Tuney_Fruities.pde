import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;


// Keys that play respective piano sounds
Minim minim;
//AudioSample c_key;
//AudioSample d_key;
//AudioSample e_key;
//AudioSample g_key;
AudioPlayer mii;

// Note Testing
Board board;
Music_Note test_note;

// Input
int numNotes;
String[] lines;
String[] keys;
int[] times;

// Notes
Music_Note[] notes;


void setup() {
  size(800, 800);
  minim = new Minim(this);
  
  // initialize sounds
  //c_key = minim.loadSample("Piano Keys/C.wav");
  //d_key = minim.loadSample("Piano Keys/D.wav");
  //e_key = minim.loadSample("Piano Keys/E.wav");
  //g_key = minim.loadSample("Piano Keys/G.wav");
  mii = minim.loadFile("Song/mii.mp3");
  
  // draw board
  board = new Board();
  
  // test notes
  //test_note = new Music_Note("j");
  
  // input 
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

void draw() {
 background(0); 
 board.display();
 
 // Test Note
 if(millis() > 4500){
  mii.play(); 
 }
 
 // All Notes
 for(int k = 0; k < lines.length; k++) {
  if(millis() > times[k] && notes[k].getY() < 800) {
   notes[k].display(); 
   //println(notes[k].getNote());
   }
  }
 }


// keyboard input for music
// trigger function plays sound sample
void keyPressed(){
 /*if(key == 'd') {
  c_key.trigger(); 
 }
 
 if(key == 'f') {
  d_key.trigger(); 
 }
 
 if(key == 'j') {
  e_key.trigger(); 
 }
 
 if(key == 'k') {
  g_key.trigger(); 
 }*/
 
 
}
