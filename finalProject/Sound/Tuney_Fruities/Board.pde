class Board {
 int score = 0;
  
  Board() { 
  }
  
  void display() {
     // draw board for song mode --
     //base
     fill(255);
     rect(200, 0, 400, 800);
     
     //color in
     fill(155, 0, 0);
     rect(200, 0, 100, 700);
     fill(0, 155, 0);
     rect(300, 0, 100, 700);
     fill(0, 0, 155);
     rect(400, 0, 100, 700);
     fill(155, 155, 0);
     rect(500, 0, 100, 700);
     
     //outline
     stroke(255);
     line(300, 0, 300, 800);
     line(400, 0, 400, 800);
     line(500, 0, 500, 800);
     line(200, 700, 600, 700);
     stroke(0);
     // D hit area 
     line(300, 700, 300, 800);
     // F hit area
     line(400, 700, 400, 800);
     // J hit area
     line(500, 700, 500, 800);
     // K hit area up to 600
     
     //text on hit area
     textSize(64);
     fill(0);
     text("D", 225, 775);
     text("F", 325, 775);
     text("J", 445, 775);
     text("K", 525, 775);
     
     //text placeholders for "Tuneys"/ Score
     fill(0);
     stroke(255);
     rect(200, 0, 400, 100);
     
     fill(255);
     textSize(32);
     textAlign(CENTER);
     text(str(this.score), 400, 50); 
  }
  
  void scoreUp(int s) {
   this.score += s; 
  }
  
}
