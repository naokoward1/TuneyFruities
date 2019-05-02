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

// Audio input testing


void setup() {
  size(800, 800);
  minim = new Minim(this);
  
  // initialize keys
  c_key = minim.loadSample("Piano Keys/C.wav");
  d_key = minim.loadSample("Piano Keys/D.wav");
  e_key = minim.loadSample("Piano Keys/E.wav");
  g_key = minim.loadSample("Piano Keys/G.wav");
  
}

void draw() {
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
