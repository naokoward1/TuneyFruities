import processing.sound.*;

PrintWriter output;
int startTime = 5000;
SoundFile music;
boolean timerStart;
int start;

void setup() {
  // Create a new file in the sketch directory
  output = createWriter("positions.txt"); 
  music = new SoundFile(this, "mii.mp3");
  size(400, 400);
  background(0);
  start = millis();
}

void draw() {
  if(keyPressed && music.isPlaying()) {
   output.println(str(key) + ", " + str(millis())); 
  }
  if(millis() - start > 5000 && !(music.isPlaying())) {
   output.println("start time: " + str(millis()));
   music.play(); 
  }
  
  if(millis() - start > 0 && millis() - start < 1000) {
   println("5"); 
  }
  
  if(millis() - start > 1000 && millis() - start < 2000) {
   println("4"); 
  }
  
  if(millis() - start > 2000 && millis() - start < 3000) {
   println("3"); 
  }
  
  if(millis() - start > 3000 && millis() - start < 4000) {
   println("2"); 
  }
  
  if(millis() - start > 4000 && millis() - start < 5000) {
   println("1"); 
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
