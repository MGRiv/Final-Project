ArrayList<Creature> aliveCreatures=new ArrayList<Creature>;
float c1X,c1Y,c2X,c2Y,c3X,c3Y;
float cize;
color box,High;
boolean c1Over = false;
boolean c2Over = false;
boolean c3Over = false;
PImage img;

void setup(){
  frameRate(30);
  size(1080,900);
  img = loadImage("Bridge2.jpg");
  background(img);
  box = color(255,0,0);
  High = color(220,0,0);
  c1Y = height*.5;
  c2Y = height*.5;
  c3Y = height*.875;
  c1X = width*.25;
  c2X = width*.75;
  c3X = width*.5;
  cize = 200;
}

void draw(){
  update(mouseX, mouseY);
  img = loadImage("Bridge2.jpg");
  background(img);
  if(c1Over){
    fill(High);
  }else{
    fill(box);
  }
  stroke(0);
  ellipse(c1X,c1Y,cize,cize);
  
  if(c2Over){
    fill(High);
  }else{
    fill(box);
  }
  stroke(0);
  ellipse(c2X,c2Y,cize,cize);
  
  if(c3Over){
    fill(High);
  }else{
    fill(box);
  }
  stroke(0);
  ellipse(c3X,c3Y,cize,cize);
  textSize(32);
  fill(0);
  text("CAMPAIGN",c1X - (cize/2) + 18,c1Y + 10);
  text("UPGRADES",c2X - (cize/2) + 18,c2Y + 10);
  text("OPTIONS",c3X - (cize/2) + 30,c3Y + 10);
}

void update(int x,int y){
  if(overCircle(c1X,c1Y)){
    c1Over = true;
    c2Over = false;
    c3Over = false;
  }else if(overCircle(c2X,c2Y)){
    c1Over = false;
    c2Over = true;
    c3Over = false;
  }else if(overCircle(c3X,c3Y)){
    c1Over = false;
    c2Over = false;
    c3Over = true;
  }else{
    c1Over = false;
    c2Over = false;
    c3Over = false;
  }
}

boolean overCircle(float x,float y){
  if(dist(mouseX,mouseY,x,y) <= cize*.5){
    return true;
  }else{
    return false;
  }
}

