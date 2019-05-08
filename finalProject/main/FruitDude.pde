class FruitDude {
  float x, y;
  // animation control
  int animationTimer = 0;
  int animationTimerValue = 150;
  int curFrame = 0;
  int state = 0;                                     // 0 = idle, 1 = sing
  int frame = 0;
  int numFrames = 4;
  
  String fruitName;                                     // for loading in frames
  PImage[] idle_animation = new PImage[numFrames];
  PImage[] sing_animation = new PImage[numFrames];
  
  FruitDude(float x, float y, String fruitName){
    // load sprite images
    for (int i = 0; i < idle_animation.length; i++){
      String imageName = fruitName + "_idle" + nf(i+1) + ".png";
      idle_animation[i] = loadImage(imageName);
    }
    
    for (int i = 0; i < sing_animation.length; i++){
      String imageName = fruitName + "_sing" + nf(i+1) + ".png";
      sing_animation[i] = loadImage(imageName);
    }
    
    // assign position
    this.x = x;
    this.y = y;
    
    // assign frame and state
    this.state = 0;
    this.animationTimer = 0;
    this.animationTimerValue = 150;
    this.curFrame = 0;
  }
  
  void display(){
    //frame = frameCount % numFrames;
    if((millis() - this.animationTimer) >= this.animationTimerValue){
      this.curFrame = this.curFrame + 1;
      this.animationTimer = millis();
      if(this.curFrame>3){
        this.curFrame = 0;
      }
    }    
    if (state == 0){
      image(idle_animation[this.curFrame], x, y);
    }
    else if (state == 1){
      image(sing_animation[this.curFrame], x, y);
    }
  }
  
  void setPos(int x, int y) {
   this.x = x;
   this.y = y;
  }
  
}
