// 4000ms to reach hit area

class Music_Note {
 String note;
 color c;
 float x;
 float y;
 boolean hit;
 
 
 
 Music_Note(String note) {
   this.note = note;
   if(note == "d") {
    this.c = color(255, 0, 0); 
    this.x = 200;
   }
   if(note == "f") {
    this.c = color(0, 255, 0); 
    this.x = 300;
   }
   if(note == "j") {
    this.c = color(0, 0, 255); 
    this.x = 400;
   }
   if(note == "k") {
    this.c = color(255, 255, 0); 
    this.x = 500;
   }
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
  
}
