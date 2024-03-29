class Music_Note {
 String note;
 color c;
 float x;
 float y;
 float r;
 int ind;
 boolean hit;
 PImage[] colors = new PImage[4];
 PImage[] glowColors = new PImage[4];
 String[] keys  = new String[4];
 int[] pos = new int[4];
 PImage red;
 PImage green;
 PImage blue;
 PImage orange;
 PImage redGlow, greenGlow, blueGlow, orangeGlow;
 boolean glow;
 
 
 Music_Note(String note) {
   red = loadImage("assets/Notes/red_note.png");
   green = loadImage("assets/Notes/green_note.png");
   blue = loadImage("assets/Notes/blue_note.png");
   orange = loadImage("assets/Notes/orange_note.png");
   redGlow = loadImage("assets/Notes/red_note_glow.png");
   greenGlow = loadImage("assets/Notes/green_note_glow.png");
   blueGlow = loadImage("assets/Notes/blue_note_glow.png");
   orangeGlow = loadImage("assets/Notes/orange_note_glow.png");
   red.resize(45, 45);
   green.resize(45, 45);
   blue.resize(45, 45);
   orange.resize(45, 45);
   colors[0] = red;
   colors[1] = blue;
   colors[2] = orange;
   colors[3] = green;
   glowColors[0] = redGlow;
   glowColors[1] = blueGlow;
   glowColors[2] = orangeGlow;
   glowColors[3] = greenGlow;
   keys[0] = "d";
   keys[1] = "f";
   keys[2] = "j";
   keys[3] = "k";
   pos[0] = 100;
   pos[1] = 167;
   pos[2] = 234;
   pos[3] = 300;
   
   this.r = random(4);
   this.ind = int(r);
   this.note = keys[ind];
   this.y = pos[ind];
   this.note = note;
   this.x = 100;
   this.hit = false;
 }
 
 
 void display() {
  if(this.x < 1120) {
   imageMode(CENTER);
   if(!hit){
   image(colors[ind], x, y);
   }
   else{
     image(glowColors[ind], x, y);
   }
   imageMode(CORNER);
  }
  this.x += 8;
  
  if(x > 1080 && x < 1120 && keyPressed && key == 'd' && y == 100) {
   this.hit = true;
  }
  
  if(x > 1080 && x < 1120 && keyPressed && key == 'f' && y == 167) {
   this.hit = true;
  }
  
  if(x > 1080 && x < 1120 && keyPressed && key == 'j' && y == 234) {
   this.hit = true;
  }
  
  if(x > 1080 && x < 1120 && keyPressed && key == 'k' && y == 300) {
   this.hit = true;
  }
  
 }
 
 
 boolean getHit() {
  return this.hit;
 }
 
 float getY() {
  return this.y; 
 }
 
 float getX() {
  return this.x; 
 }
 
 void setX(float x) {
  this.x = x; 
 }
 
 void setMiss() {
  this.hit = false; 
 }
 
 String getNote() {
  return this.note; 
 }
 
 int getInd() {
  return this.ind; 
 }
  
}
