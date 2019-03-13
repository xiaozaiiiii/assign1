PImage bgImg;
PImage soilImg;
PImage firstLifeImg;
PImage secondLifeImg;
PImage thirdLifeImg;
PImage groundhogImg;
PImage soldierImg;
PImage robotImg;

float soldierX;
float soldierY;
float robotX;
float robotY;
float laserLength = 10;
float laserMaxLength = 40;
float laserX;
float laserY;
float laserMinX;

void setup() {
  
  soldierX = -40;
  soldierY = floor(random(2,5))*80;
  robotX = floor(random(3,8))*80;
  robotY = floor(random(2,5))*80;
  laserX = robotX+25;
  laserY = robotY+37;
  laserMinX = laserX-160;
  
  size(640, 480);
  
	bgImg = loadImage("img/bg.jpg");
  soilImg = loadImage("img/soil.png");
  firstLifeImg = loadImage("img/life.png");
  secondLifeImg = loadImage("img/life.png");
  thirdLifeImg = loadImage("img/life.png");
  groundhogImg = loadImage("img/groundhog.png");
  soldierImg = loadImage("img/soldier.png");
  robotImg = loadImage("img/robot.png");
  
  image(bgImg,0,0);
  image(firstLifeImg,10,10);
  image(secondLifeImg,80,10);
  image(thirdLifeImg,150,10);
  
  //grass
  noStroke();
  colorMode(RGB);
  fill(124,204,25);//green
  rect(0,145,640,15);
  
  //sun
  stroke(255,255,0);//yellow
  strokeWeight(5);
  fill(253,184,19);//orange
  ellipse(590,50,120,120);
  
  image(groundhogImg,280,80);
  
}

void draw() {
  
  image(soilImg,0,160);
  
  image(robotImg,robotX,robotY);
  
  //soldier
	image(soldierImg,soldierX,soldierY);
  
  soldierX += 3;
  
  if(soldierX >= 680){
    soldierX = -40;
  }
  
  //laser
  noStroke();
  fill(255,0,0);//red
  rect(laserX,laserY,-laserLength,10,5);
  
  laserLength = min(laserLength+2,laserMaxLength);
  laserX = max(laserX-2,laserMinX);
  
  if(laserX <= robotX+25-160){
    laserX = robotX+25;
    laserLength = 10;
  }
  
}
