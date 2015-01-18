ArrayList<Creature> aliveCreatures=new ArrayList<Creature>();
float c1X,c1Y,c2X,c2Y,c3X,c3Y;
float cize;
float s1X,sY,s2X,s3X,s4X,s5X;
float csize;
float callnum;
color box,High;
boolean c1Over = false;
boolean c2Over = false;
boolean c3Over = false;
boolean s1Over = false;
boolean s2Over = false;
boolean s3Over = false;
boolean s4Over = false;
boolean s5Over = false;
PImage img;
float state = 0;
float resource = 0;
int win = 0;
//from processing.org/examples/animatedsprite.html
class Animation {
  PImage[] images;
  int imageCount;
  int frame,lag;
  int timer=0;
  
Animation(String imagePrefix, int count,int lag2) {
    imageCount = count;
    images = new PImage[imageCount];
    lag=lag2;

    for (int i = 0; i < imageCount; i++) {
      String filename = imagePrefix + nf(i, 1) + ".png";
      images[i] = loadImage(filename);
    }
  }

  void display(float xpos, float ypos) {
    if (millis()-timer>lag){
      if (frame==imageCount-1){
       frame=0; 
      }
      else{
        frame+=1;
      }
      timer=millis();
    }
    image(images[frame], xpos,ypos);
  }
  
  int getWidth() {
    return images[0].width;
  }
}


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
  sY = 180;
  s1X = width/6;
  s2X = width/3;
  s3X = width/2;
  s4X = width*2/3;
  s5X = width*5/6;
  cize = 200;
  csize = 180;
  callnum = 0;
}

void draw(){
  update(mouseX, mouseY);
  if(state==0){
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
  }else if(state==1){
    resource++;
    img = loadImage("southpark.jpg");
    background(img);
    Base pbase=new Base(-50,650,"MagicSchoolBus.png");
    Base ebase=new Base(875,600,"Portal.png");
    for (int i=0;i<aliveCreatures.size();i++){
      if(aliveCreatures.get(i).health > 0){
        aliveCreatures.get(i).nowAni.display(aliveCreatures.get(i).x,aliveCreatures.get(i).y);
        aliveCreatures.get(i).turn();
        if(aliveCreatures.get(i).status==1 && aliveCreatures.get(i).nowAni.frame==aliveCreatures.get(i).nowAni.imageCount-1 && !aliveCreatures.get(i).done){
          aliveCreatures.get(aliveCreatures.get(i).target).health -= aliveCreatures.get(i).damage;
          aliveCreatures.get(i).done=true;
        }
        if(abs(aliveCreatures.get(i).x - 540) > 440){
         if(aliveCreatures.get(i).friendly == true){
          ebase.health -= aliveCreatures.get(i).health; 
         }else{
          pbase.health -=aliveCreatures.get(i).health; 
         }
         aliveCreatures.remove(i);
        }
      }else{
       aliveCreatures.remove(i); 
      }
      if(pbase.checkdeath()){
        win = 1;
      }
      if(ebase.checkdeath()){
       win = 2; 
      }
    }
    image(pbase.pic,pbase.x,pbase.y);
    image(ebase.pic,ebase.x,ebase.y);
    if(s1Over){
      fill(High);
    }else{
      fill(box);
    }
    stroke(0);
    ellipse(s1X,sY,csize,csize); 
    if(s2Over){
      fill(High);
    }else{
      fill(box);
    }
    stroke(0);
    ellipse(s2X,sY,csize,csize);
    if(s3Over){
      fill(High);
    }else{
      fill(box);
    }
    stroke(0);
    ellipse(s3X,sY,csize,csize);
    if(s4Over){
      fill(High);
    }else{
      fill(box);
    }
    stroke(0);
    ellipse(s4X,sY,csize,csize); 
    if(s5Over){
      fill(High);
    }else{
      fill(box);
    }
    stroke(0);
    ellipse(s5X,sY,csize,csize);
    fill(0);
    textSize(32);
    text("CHILD LABOR SUPPLY:" + str(resource),0,30);
    textSize(16);
    text("FRESHMAN:75", s1X - (csize / 3) + 5,sY);
    text("SOPHOMORE:125", s2X -(csize / 3) - 5,sY);
    text("JUNIOR:180", s3X -(csize / 3) + 17,sY);
    text("SENIOR:225", s4X -(csize / 3) + 14,sY);
    text("SUPER SENIOR:320", s5X -(csize / 3) - 10,sY);
    
    
  }
}

void update(int x,int y){
  if(state==0){
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
  }else if(state==1){
    if(overCircle(s1X,sY)){
      s1Over = true;
      s2Over = false;
      s3Over = false;
      s4Over = false;
      s5Over = false;
    }else if(overCircle(s2X,sY)){
      s1Over = false;
      s2Over = true;
      s3Over = false;
      s4Over = false;
      s5Over = false;
    }else if(overCircle(s3X,sY)){
      s1Over = false;
      s2Over = false;
      s3Over = true;
      s4Over = false;
      s5Over = false;
    }else if(overCircle(s4X,sY)){
      s1Over = false;
      s2Over = false;
      s3Over = false;
      s4Over = true;
      s5Over = false;
    }else if(overCircle(s5X,sY)){
      s1Over = false;
      s2Over = false;
      s3Over = false;
      s4Over = false;
      s5Over = true;
    }else{
      s1Over = false;
      s2Over = false;
      s3Over = false;
      s4Over = false;
      s5Over = false;
    }
  }
}


void mouseClicked(){
  if(state==0){
   if(c1Over==true){
     state = 1;
   }
   if(c2Over==true){
     state = 2;
   }
   if(c3Over==true){
     state = 3;
   }   
  }
  if(state==1){
     if(s1Over==true){
       if(resource>=75){
         resource-=75;
         Freshie fresh=new Freshie();
         Tadmin admin=new Tadmin();
       }
     }
  }  
}


boolean overCircle(float x,float y){
  if(dist(mouseX,mouseY,x,y) <= cize*.5){
    return true;
  }else{
    return false;
  }
}

