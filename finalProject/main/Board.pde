class Board {
 int score = 0;
 PImage gameModeBG;
 PImage gameBoard;
  
  Board() { 
    gameModeBG = loadImage("assets/play_BG.png");
    gameBoard = loadImage("assets/note_board.png");
    gameModeBG.resize(1200, 900);
    gameBoard.resize(1000, 200);
  }
  
  void display() {
     
     image(gameModeBG, 0, 0);
     image(gameBoard, 100, 100);
    
     
     fill(255);
     textSize(32);
     textAlign(CENTER);
     text(str(this.score), 600, 50); 
  }
  
  void scoreUp(int s) {
   this.score += s; 
  }
  
  void resetScore(){
   this.score = 0; 
  }
  
}
