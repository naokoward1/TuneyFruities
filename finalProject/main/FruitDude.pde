class FruitDude {
  float x, y;
  
  // animation control
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
    this.frame = 0;
  }
  
  void display(){
    frame = frameCount % numFrames;
    
    if (state == 0){
      image(idle_animation[frame], x, y);
    }
    else if (state == 1){
      image(sing_animation[frame], x, y);
    }
  }
  
}
