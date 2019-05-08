class Music_Note {
 String note;
 color c;
 float x;
 float y;
 float r;
 int ind;
 boolean hit;
 PImage[] colors = new PImage[4];
 String[] keys  = new String[4];
 int[] pos = new int[4];
 PImage red;
 PImage green;
 PImage blue;
 PImage orange;
 
 
 Music_Note(String note) {
   red = loadImage("assets/red_note.png");
   green = loadImage("assets/green_note.png");
   blue = loadImage("assets/blue_note.png");
   orange = loadImage("assets/orange_note.png");
   red.resize(45, 45);
   green.resize(45, 45);
   blue.resize(45, 45);
   orange.resize(45, 45);
   colors[0] = red;
   colors[1] = green;
   colors[2] = blue;
   colors[3] = orange;
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
   image(colors[ind], x, y);
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
  
  if(hit == true) {
   this.c = color(255, 255, 255); 
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
 
 String getNote() {
  return this.note; 
 }
 
 int getInd() {
  return this.ind; 
 }
  
}
