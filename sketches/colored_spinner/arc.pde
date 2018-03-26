/* ***************************************************
 * Copyright (c) 2018 Tarsier-Marianz
 * Author: Marianz
 * Created: 2018-03-26
 * Sketch #5
 *****************************************************/
 
 public class Arc {
  ArrayList<ArcSection> sections = new ArrayList<ArcSection>();

  final float positionX;
  final float positionY;

  final float radius;

  final float marginAngle;
  float offsetAngle;
  final boolean reverseFlag;

  public Arc(float posX, float posY, float r, int sectionNum, float huePrm, boolean revFlag) {
    positionX = posX;
    positionY = posY;
    radius = r;

    marginAngle = -radians(1);
    reverseFlag = revFlag;

    for (int i = 0; i < sectionNum; i++) {
      sections.add(new ArcSection(huePrm));
    }
  }

  void draw() {
    noFill();
    strokeCap(SQUARE);
    strokeWeight(15f);
    ellipseMode(RADIUS);

    for (ArcSection currentSection : sections) {
      offsetAngle += marginAngle / 2;

      float arcAngle = currentSection.getArcAngle(getTotalQuantity());
      stroke(currentSection.getColor());
      arc(positionX, positionY, radius, radius, offsetAngle, offsetAngle + arcAngle - marginAngle);

      offsetAngle += arcAngle;
      offsetAngle -= marginAngle / 2;
    }
  }

  float getTotalQuantity() {
    float totalQuantity = 0f;
    for (ArcSection currentSection : sections) {
      totalQuantity += currentSection.getQuantity();
    }
    return totalQuantity;
  }

  void reflect(float x, float y) {
    if (reverseFlag) {
      float tmp = x;
      x = y;
      y = tmp;
    }
    for (ArcSection currentSection : sections) {
      currentSection.reflect(x, y);
    }
    offsetAngle = atan2(y - positionY, x - positionX);
  }

  void update() {
    for (ArcSection currentSection : sections) {
      currentSection.update();
    }
  }
}