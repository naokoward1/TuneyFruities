class Button{
  int x, y;
  int sizeX, sizeY;
  String textString;
  float textStringWidth;
  Button(int x, int y, int sizeX, int sizeY, String textString){
    this.x = x;
    this.y = y;
    this.sizeX = sizeX;
    this.sizeY = sizeY;
    this.textString = textString;
  }
  void display(){
    rect(x , y, sizeX, sizeY);
  }
  
  boolean overShape(){
    if(mouseX >= this.x && mouseX <= this.x + this.sizeX && mouseY >= this.y && mouseY <= this.y + this.sizeY){
      return true;
    }
    return false;
  }
  
  void textFill(){
    textSize(24);
    fill(100);
    textStringWidth = textWidth(textString);
    text(this.textString, (this.x + this.textStringWidth/2), (this.y + this.sizeY/2));
    fill(0);
  }
}
