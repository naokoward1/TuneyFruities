import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;


// Keys that play respective piano sounds
Minim minim;
AudioSample c_key;
AudioSample d_key;
AudioSample e_key;
AudioSample g_key;

// Note Testing
Board board;
Music_Note test_note;

// Input
int idx = 0;


void setup() {
  size(800, 800);
  minim = new Minim(this);
  
  // initialize keys
  c_key = minim.loadSample("Piano Keys/C.wav");
  d_key = minim.loadSample("Piano Keys/D.wav");
  e_key = minim.loadSample("Piano Keys/E.wav");
  g_key = minim.loadSample("Piano Keys/G.wav");
  
  // draw board
  board = new Board();
  
  // test notes
  test_note = new Music_Note("f");
  
  // input 
  String[] lines = loadStrings("note_data.txt");
  //String[] keys = 
  
  
}

void draw() {
 background(0); 
 board.display();
 
 // Test Note
 test_note.display();
 }


// keyboard input for music
// trigger function plays sound sample
void keyPressed(){
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
  g_key.trigger(); 
 }
 
 
}
