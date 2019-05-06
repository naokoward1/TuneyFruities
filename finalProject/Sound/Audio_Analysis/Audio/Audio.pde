import processing.sound.*;

PrintWriter output;
int startTime = 5000;
SoundFile music;

void setup() {
  // Create a new file in the sketch directory
  output = createWriter("positions.txt"); 
  music = new SoundFile(this, "mii.mp3");
}

void draw() {
  if(music.isPlaying()) {
    println("its playing");
  }
  if(keyPressed && key == 'p' && !(music.isPlaying())) {
    music.play();
    output.println("start time: " + str(millis()));
  }
  if(keyPressed && music.isPlaying()) {
   output.println(str(key) + ", " + str(millis())); 
  }
  //output.println(mouseX + "t" + mouseY); // Write the coordinate to the file
}

void keyPressed() {
  if(key == 'q') {
   output.flush();
   output.close();
   exit();
  }
}
