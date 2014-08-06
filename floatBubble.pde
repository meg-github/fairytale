public class floatBubble {
  float bubbleX, bubbleY;
  float bubbleSpeed;

  floatBubble(
  float _bubbleX, float _bubbleY, 
  float _bubbleSpeed
    )
  {
    bubbleX = _bubbleX;
    bubbleY = _bubbleY;
    bubbleSpeed = _bubbleSpeed;
  }



  public void surfaceBubble() {
    bubbleY = bubbleY - bubbleSpeed;
    if (bubbleY <= 0) {
      bubbleY = 600;
    }
  }



  public void drawBubble() {
    noStroke();
    fill(255, random(100, 200));
    ellipse(bubbleX, bubbleY, 20, 20);
  }
}

