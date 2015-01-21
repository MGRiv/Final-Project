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
float resource = 75;
float spawnTimer=0;
int win = 0;
int pHealth=30;
int eHealth=30;
boolean looping = true;
float reps = 0;
boolean start = true;
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
    textSize(32);
    fill(0);
    text("PLAY",c1X - (cize/2) + 59,c1Y + 10);
    text("HOW TO PLAY",c2X - (cize/2) - 8,c2Y + 10);
    textSize(120);
    fill(255,0,0);
    text("SCHOOLWARS",width/4 - 130,height/4);
  }else if(state==1){
    resource+= pow(2,reps);
    if(start){
     spawnTimer=millis();
    start =false; 
    }
    if (resource % pow(512,reps + 1) == 0){
     reps++; 
    }
    if (millis()-spawnTimer>10000 - (reps*1000)){
     Tadmin admin=new Tadmin();
    spawnTimer=millis(); 
    }
    if(reps > 5){
     reps = 5;
    }
    img = loadImage("southpark.jpg");
    background(img);
    Base pbase=new Base(pHealth,0,-50,700,"MagicSchoolBus.png");
    Base ebase=new Base(eHealth,0,875,650,"Portal.png");
    image(pbase.pic,pbase.x,pbase.y);
    image(ebase.pic,ebase.x,ebase.y);
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
          eHealth -= aliveCreatures.get(i).health;
         }else{
          pHealth -=aliveCreatures.get(i).health; 
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
    text(str(pbase.health),100,625);
    text(str(ebase.health),960,625);
    if (win==2){
     textSize(120);
     text("YOU WIN!",width/3 - 130,height/3+100);
     noLoop();
    
    }
    else if(win==1){
     textSize(120);
    text("YOU LOSE!",width/3 - 130,height*3/5);
     noLoop(); 
    }
  }else if(state == 2){
    background(0);
    textSize(32);
    fill(255);
   text("Welcome to Schoolwars",0,0);
   text("The objective of the game is to defeat the teachers by amass enough",0,32);
   text("units to overwhelm their forces. Your fellow students, which you",0,96);
   text("command, will spawn from the magic schoolbus, marching towards",0,160);
   text("the dark portal. The administration's forces will come out of the dark",0,224);
   text("portal, and once in range, do battle with the students. As their",0,288);
   text("leader, you be able to spawn units using the buttons at the top of",0,352);
   text("the battle screen, or by pressing one of the keys, 1-5. However, you",0,416);
   text("can only spawn units if you have enough resources, displayed in the",0,480);
   text("top left. You can always pause the game by pressing p. You can",0,544);
   text("return to the main menu by pressing m. This will save your progress",0,608);
   text("as long as you keep the window open. Additionally, one can restart",0,672);
   text("by pressing r.",0,736);
  }
}

void update(int x,int y){
  if(state==0){
    if(overCircle(c1X,c1Y)){
      c1Over = true;
      c2Over = false;
    }else if(overCircle(c2X,c2Y)){
      c1Over = false;
      c2Over = true;
    }else{
      c1Over = false;
      c2Over = false;
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
  }
  if(state==1){
     if(s1Over==true){
       if(resource>=75){
         resource-=75;
         Freshie fresh=new Freshie();
       }
     }
     if(s2Over==true){
       if(resource>=125){
         resource-=125;
         Soph soph=new Soph();
       }
     }
     if(s3Over==true){
       if(resource>=180){
         resource-=180;
         Junior jun=new Junior();
       }
     }
     if(s4Over==true){
       if(resource>=225){
         resource-=225;
         Senior sen=new Senior();
       }
     }
     if(s5Over==true){
       if(resource>=320){
         resource-=320;
         SuperSenior sup=new SuperSenior();
       }
     }     
  }  
}
void keyPressed(){
 if (key=='1'){
  if(resource>=75){
   resource -=75;
   Freshie fresh=new Freshie();
  }
 }
 if (key=='2'){
  if(resource>=125){
   resource -=125;
   Soph sop=new Soph();
  }
 }
 if (key=='3'){
  if(resource>=180){
   resource -=180;
   Junior jun=new Junior();
  }
 }
 if (key=='4'){
  if(resource>=225){
   resource -=225;
   Senior sen=new Senior();
  }
 }
 if (key=='5'){
  if(resource>=320){
   resource -=320;
   SuperSenior sup=new SuperSenior();
  }
 }
 if(key=='p'){
   if(looping){
     noLoop();
     looping = false;
   }else{
     loop();
     looping = true;
   }
 }
 if(key=='m'){
  state=0; 
 }
 if(key=='r'){
  state=0;
 resource = 15;
  for(int i=aliveCreatures.size()-1;i>=0; i--){
   aliveCreatures.remove(i);
  }
  reps = 0;
  win = 0;  
  start=true;
  loop();
 }
}

boolean overCircle(float x,float y){
  if(dist(mouseX,mouseY,x,y) <= cize*.5){
    return true;
  }else{
    return false;
  }
}

