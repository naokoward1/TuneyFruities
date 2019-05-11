class Note{
  PImage theNote, theGlow;
  float x, y, w_note, h_note, origW;
  boolean grow;
  float dx = 0;
  String col;
  String theGlowString;

  Note(float x, float y, String col){
    this.x = x;
    this.y = y;
    theNote = loadImage("assets/Notes/musicNote.png");
    theGlowString = "assets/Notes/"+ col + "_note_glow.png";
    theGlow = loadImage(theGlowString);
    this.origW = theNote.width/4;
    this.w_note = theNote.width/4;
    this.h_note = theNote.height/4;
    this.grow = true;
  }

  void display() {
    pushMatrix();
    translate(this.x,this.y);
    image(theNote, 0, 0, w_note, h_note);
    image(theGlow, 70, -15, theGlow.width/2, theGlow.height/2);
    popMatrix();
  }   
  
  void move(){
    this.x += 5;
    if(this.x < 50 || this.x > width - 190){
      this.x = 100;
    }
  }

  void update(){
    if(this.w_note > this.origW + 20){
      this.grow = false;
    }
    else if(this.w_note < this.origW){
      this.grow = true;
    }
    if(this.grow){
      pulseOut();
    }
    else{
      pulseIn();
    }
  }

  void pulseOut() {
    this.w_note += 1;
    this.h_note += 1;
  }
  void pulseIn() {
    this.w_note -= 1;
    this.h_note -= 1;
  } 
}
