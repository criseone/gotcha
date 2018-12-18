//graphic myGraphic;
float x, y, angle, radius;
void setup() {
  fullScreen();
  setupScreen(); // important for scaling the screen for the correct size
  setupTracking();// important for getting the face tracking information in dinFormat
  //myGraphic = new graphic();
};

void draw() {
  
  background(240);
  PVector facePos = faceLocation(); // the facelocation returns the position of the face in the camera view as a pvector
  float targetX = facePos.x-.5; 
  float targetY = facePos.y-.5;
  targetX *= width;
  targetY *= height;
  float targetZ = facePos.z*5;

  stroke(50);
  translate(width/2, height/2);
  for (int i = 1; i <= 100; i++) {
    strokeWeight(5);
    float scale = width*.65-(i*5);
    float X = targetX*(i*.04);
    float Y = targetY*(i*.04);
    pushMatrix();
    translate(X, Y);
    rotate(PI/4);
    rotate(radians(targetZ*i*4));
    rectMode(CENTER);
    rect(0, 0, scale, scale);
    popMatrix();
  };
  // uncomment for extra information on face orientation
  //PVector orientation = orient(); // the orientation returns the orientation of the face  as a pvector
  //orientation.mult(100);
  //stroke(255, 0, 0);
  //line(width/2, height/2, width/2+orientation.y, height/2+orientation.x);
};
