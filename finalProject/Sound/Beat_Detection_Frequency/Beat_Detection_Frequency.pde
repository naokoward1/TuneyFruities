import ddf.minim.*;
import ddf.minim.analysis.*;

Minim minim;
AudioPlayer song;
BeatDetect beat;
BeatListener bl;

float kickSize, snareSize, hatSize;

class BeatListener implements AudioListener
{
  private BeatDetect beat;
  private AudioPlayer source;
  
  BeatListener(BeatDetect beat, AudioPlayer source)
  {
    this.source = source;
    this.source.addListener(this);
    this.beat = beat;
  }
  
  void samples(float[] samps)
  {
    beat.detect(source.mix);
  }
  
  void samples(float[] sampsL, float[] sampsR)
  {
    beat.detect(source.mix);
  }
}

void setup()
{
  size(512, 200, P3D);
  
  minim = new Minim(this);
  
  song = minim.loadFile("marcus_kellis_theme.mp3", 1024);
  song.play();
  beat = new BeatDetect(song.bufferSize(), song.sampleRate());

  beat.setSensitivity(100);  
  kickSize = snareSize = hatSize = 16;

  bl = new BeatListener(beat, song);  
  textFont(createFont("Helvetica", 16));
  textAlign(CENTER);
}

void draw()
{
  background(0);
  
  // draw a green rectangle for every detect band
  // that had an onset this frame
  float rectW = width / beat.detectSize();
  for(int i = 0; i < beat.detectSize(); ++i)
  {
    // test one frequency band for an onset
    if ( beat.isOnset(i) )
    {
      fill(0,200,0);
      rect( i*rectW, 0, rectW, height);
    }
  }
  
  // draw an orange rectangle over the bands in 
  // the range we are querying
  int lowBand = 5;
  int highBand = 15;
  // at least this many bands must have an onset 
  // for isRange to return true
  int numberOfOnsetsThreshold = 4;
  if ( beat.isRange(lowBand, highBand, numberOfOnsetsThreshold) )
  {
    fill(232,179,2,200);
    rect(rectW*lowBand, 0, (highBand-lowBand)*rectW, height);
  }
  
  if ( beat.isKick() ) kickSize = 32;
  if ( beat.isSnare() ) snareSize = 32;
  if ( beat.isHat() ) hatSize = 32;
  
  fill(255);
    
  textSize(kickSize);
  text("KICK", width/4, height/2);
  
  textSize(snareSize);
  text("SNARE", width/2, height/2);
  
  textSize(hatSize);
  text("HAT", 3*width/4, height/2);
  
  kickSize = constrain(kickSize * 0.95, 16, 32);
  snareSize = constrain(snareSize * 0.95, 16, 32);
  hatSize = constrain(hatSize * 0.95, 16, 32);
}
