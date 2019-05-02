class Note{
  PImage theNote;
  float x;
  float y;
  float speed;
  float w_note, h_note;
  float angle;
  float angleChange = 0.015;
  float dx = 10;
  float dy = 10;
  Note(float x, float y, float speed){
    this.x = x;
    this.y = y;
    this. speed = speed;
    theNote = loadImage("../assets/musicNote.png");
    theNote.resize(20, 0);
    w_note = theNote.width;
    h_note = theNote.height;
    this.angle = 0;
  }
  void display(){
    pushMatrix();
    translate(dx, dy);
    dx += 5;
    dy -= 5;
    rotate(this.angle);
    image(theNote, this.x, this.y);
    image(theNote, this.x + 50, this.y);
    popMatrix();
  }
  
  void spin(){
    if(this.angle > PI/4 || this.angle < 0){ 
      angleChange = -angleChange;
    }
    this.angle += angleChange;
  }
  /*
  void pulse(){
    theNote.resize(30, 0);
    image(theNote, this.x, this.y);
    theNote.resize(20, 0);
    image(theNote, this.x, this.y);
  }
  */
}
