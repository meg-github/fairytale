public class moveFish {
  float fishX, fishY; 
  float fishsX, fishsY;
  float speedRate;
  float FfishBehave;
  int fishBehave;

  moveFish(
  float _fishX, float _fishY, 
  float _fishsX, float _fishsY, 
  float _speedRate, 
  float _FfishBehave, 
  int _fishBehave
    ) {
    fishX = _fishX;
    fishY =_fishY;
    fishsX = _fishsX;
    fishsY = _fishsY;
    speedRate = _speedRate;
    FfishBehave = _FfishBehave;
    fishBehave = _fishBehave;
  }


  //coodinates of fishes and to follow mousepoint
  public void moveFish() {
    fishsX = (mouseX - fishX)* speedRate; 
    fishsY = (mouseY - fishY)* speedRate;
    if (abs(fishX - mouseX) < 10 || abs(fishY - mouseY) < 10) {
      FfishBehave = random(4);
      fishBehave = int(FfishBehave);
    }
    switch(fishBehave) {
    case 0:
      fishX += fishsX;
      fishY += fishsY;
    case 1:
      fishX += fishsX;
      fishY += fishsY;
    case 2:
      fishX += fishsX;
      fishY += fishsY; 
    case 3:
      fishX -= fishsX;
      fishY += fishsY;
    }
    if (fishX <= 0 || fishY <= 0 || fishX >= 900 ||fishY >= 600) {
      fishBehave = 0;
    }
    this.drawFish();
  }

  //illustlations of fishes
  public void drawFish() {
    pushMatrix();
    translate(fishX, fishY);
    rotate(atan2(mouseY - fishY, mouseX - fishX));

    imageMode(CENTER);
    if (stateColor == 0) {
      image(fish1, 0, 0);
    }
    else {
      image(fish2, 0, 0);
    }
    popMatrix();
  }
}

