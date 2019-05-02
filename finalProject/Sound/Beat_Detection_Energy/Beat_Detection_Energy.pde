import ddf.minim.*;
import ddf.minim.analysis.*;

Minim minim;
AudioPlayer song;
BeatDetect beat;

float eRadius;

void setup()
{
  size(200, 200, P3D);
  minim = new Minim(this);
  song = minim.loadFile("marcus_kellis_theme.mp3", 2048);
  song.play();
  // a beat detection object song SOUND_ENERGY mode with a sensitivity of 10 milliseconds
  beat = new BeatDetect();
  
  ellipseMode(RADIUS);
  eRadius = 20;
}

void draw()
{
  background(0);
  beat.detect(song.mix);
  float a = map(eRadius, 20, 80, 60, 255);
  fill(60, 255, 0, a);
  if ( beat.isOnset() ) eRadius = 80;
  ellipse(width/2, height/2, eRadius, eRadius);
  eRadius *= 0.95;
  if ( eRadius < 20 ) eRadius = 20;
}
