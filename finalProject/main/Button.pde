class Button{
  int x, y;
  int sizeX, sizeY;
  String textString;
  float textStringWidth;
  color fillCol, textCol;
  Button(int x, int y, int sizeX, int sizeY, String textString){
    this.x = x;
    this.y = y;
    this.sizeX = sizeX;
    this.sizeY = sizeY;
    this.textString = textString;
    this.fillCol = color(234, 77, 79);
    this.textCol = color(255);
  }
  void display(){
    noStroke();
    fill(this.fillCol);
    rect(x , y, sizeX, sizeY, 10);
  }
  
  boolean overShape(){
    if(mouseX >= this.x && mouseX <= this.x + this.sizeX && mouseY >= this.y && mouseY <= this.y + this.sizeY){
      return true;
    }
    return false;
  }
  
  void textFill(){
    textSize(24);
    textAlign(CENTER, CENTER);
    fill(this.textCol);
    textStringWidth = textWidth(textString);
    text(this.textString, (this.x + this.sizeX/2), (this.y + this.sizeY/2));
    fill(0);
  }
}
