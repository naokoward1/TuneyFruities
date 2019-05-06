// 4000ms to reach hit area

class Music_Note {
 String note;
 color c;
 float x;
 float y;
 boolean hit;
 color[] colors = new color[4];
 String[] keys  = new String[4];
 int[] pos = new int[4];
 
 
 
 Music_Note(String note) {
   colors[0] = color(255, 0, 0);
   colors[1] = color(0, 255, 0);
   colors[2] = color(0, 0, 255);
   colors[3] = color(255, 255, 0);
   keys[0] = "d";
   keys[1] = "f";
   keys[2] = "j";
   keys[3] = "k";
   pos[0] = 200;
   pos[1] = 300;
   pos[2] = 400;
   pos[3] = 500;
   
   float r = random(4);
   int ind = int(r);
   this.c = colors[ind];
   this.note = keys[ind];
   this.x = pos[ind];
   
   this.note = note;
   this.y = 100;
   this.hit = false;
 }
 
 
 void display() {
  if(this.y < 850) {
   fill(c);
   rect(x, y, 100, 100);  
  }
  this.y += 5;
  if(y > 680 && y < 820 && keyPressed && key == 'd') {
   this.hit = true;
  }
 }
 
 
 boolean getHit() {
  return this.hit;
 }
 
 float getY() {
  return this.y; 
 }
 
 String getNote() {
  return this.note; 
 }
  
}
