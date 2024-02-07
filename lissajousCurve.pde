float[] angleTop = new float[10];
float[] angleLeft = new float[10];
float[] rotationSpeedTop = new float[10];
float[] rotationSpeedLeft = new float[10];
float circleRadius = 25;
int numOfCircles = 10;
PVector[] circleCentersTop = new PVector[numOfCircles];
PVector[] circleCentersLeft = new PVector[numOfCircles];
float distanceFromEdge = 30;
float paddingTop = 20;
float paddingLeft = 20;

ArrayList<ArrayList<PVector>> paths = new ArrayList<ArrayList<PVector>>();

void setup() {
  size(900, 900);
  strokeWeight(2);
  for (int i = 0; i < numOfCircles; i++) {
    circleCentersTop[i] = new PVector(distanceFromEdge + (i+1) * (width - 2 * distanceFromEdge) / (numOfCircles + 1), paddingTop + circleRadius);
    float speed = random(0.015, 0.05);
    rotationSpeedTop[i] = speed;
    rotationSpeedLeft[i] = speed;
  }
  for (int i = 0; i < numOfCircles; i++) {
    circleCentersLeft[i] = new PVector(paddingLeft + circleRadius, distanceFromEdge + (i+1) * (height - 2 * distanceFromEdge) / (numOfCircles + 1));
  }
}

void draw() {
  background(0);
  translate(width/2, height/2);
  
  for (int i = 0; i < numOfCircles; i++) {
    noFill();
    ellipse(circleCentersTop[i].x - width/2, circleCentersTop[i].y - height/2, circleRadius*2, circleRadius*2);
  }
  
  for (int i = 0; i < numOfCircles; i++) {
    noFill();
    ellipse(circleCentersLeft[i].x - width/2, circleCentersLeft[i].y - height/2, circleRadius*2, circleRadius*2);
  }
  
  for (int i = 0; i < numOfCircles; i++) {
    float x = circleCentersTop[i].x + circleRadius * cos(angleTop[i]);
    float y = circleCentersTop[i].y + circleRadius * sin(angleTop[i]);
    fill(255);
    ellipse(x - width/2, y - height/2, 10, 10);
    angleTop[i] += rotationSpeedTop[i];
  }
  
  for (int i = 0; i < numOfCircles; i++) {
    float x = circleCentersLeft[i].x + circleRadius * cos(angleLeft[i]);
    float y = circleCentersLeft[i].y + circleRadius * sin(angleLeft[i]);
    fill( 255);
    ellipse(x - width/2, y - height/2, 10, 10);
    angleLeft[i] += rotationSpeedLeft[i];
  }
  
  noFill();
  stroke(255);
  for (ArrayList<PVector> path : paths) {
    beginShape();
    for (PVector point : path) {
      point(point.x, point.y);
    }
    endShape();
  }
  
  for (int i = 0; i < numOfCircles; i++) {
    for (int j = 0; j < numOfCircles; j++) {
      ArrayList<PVector> path = new ArrayList<PVector>();
      
      float x = circleCentersTop[j].x + circleRadius * cos(angleTop[j]);
      float y = circleCentersLeft[i].y + circleRadius * sin(angleLeft[i]);
      
      path.add(new PVector(x - width/2, y - height/2));
      paths.add(path);
      
      fill(255); 
      circle(x - width/2, y - height/2, 10); 
    }
  }
}

//void keyPressed(){
//  if(key == 'r'){
//  for (int i = 0; i < numOfCircles; i++) {
//    circleCentersTop[i] = new PVector(distanceFromEdge + (i+1) * (width - 2 * distanceFromEdge) / (numOfCircles + 1), paddingTop + circleRadius);
//    float speed = random(0.015, 0.05);
//    rotationSpeedTop[i] = speed;
//    rotationSpeedLeft[i] = speed;
//  }
//  for (int i = 0; i < numOfCircles; i++) {
//    circleCentersLeft[i] = new PVector(paddingLeft + circleRadius, distanceFromEdge + (i+1) * (height - 2 * distanceFromEdge) / (numOfCircles + 1));
//  }
//  }
//  paths.clear();
  
//}
