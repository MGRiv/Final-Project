class Creature extends Unit{
 float speedtimer,speed,range;
 int target;
 String filename;
 Animation walka,attacka,nowAni;
 int atnumpics,mvnumpics,mvdelay,atdelay,status;
 Creature(int hp,int dmg,float xpos,float ypos,float spd,String filename2,int numpics2,int numpics3,int mvdelay2,int atdelay2,float range2){
  super(hp,dmg,xpos,ypos);
  speed=spd;
  speedtimer=0;
  filename=filename2;
  atnumpics=numpics2;
  mvnumpics=numpics3;
  mvdelay=mvdelay2;
  atdelay=atdelay2;
  range=range2;
  aliveCreatures.add(this);
  status=0;
  walka=new Animation(filename+"walk",mvnumpics,mvdelay);
  attacka=new Animation(filename+"attack",atnumpics,atdelay);
  nowAni=walka;
 }
 void turn(){
  if (!inRadius()){
   status=0;
  }
  else if (inRadius()){
   status=1; 
  }
  if (status==0){
   nowAni=walka;
   if (millis()-speedtimer>mvdelay){
    speedtimer=millis();
    if (friendly){
     x+=speed; 
    }
    else{
     x-=speed; 
    }
   }
  }
  else if(status==1){
   nowAni=attacka; 
  }
 }
 boolean inRadius(){
   for (int i=0;i<aliveCreatures.size();i++){
       if (abs(this.x-aliveCreatures.get(i).x)<this.range && this.friendly != aliveCreatures.get(i).friendly){
         target = i;
         return true;
       }
   }
   return false;
 }
}
