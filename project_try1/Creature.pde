class Creature extends Unit{
 float speed;
 String filename;
 int atnumpics,mvnumpics,mvdelay,atdelay,status;
 Creature(int hp,int dmg,float xpos,float ypos,float spd,String filename2,int numpics2,int numpics3,int mvdelay2,int atdelay2){
  super(hp,dmg,xpos,ypos);
  speed=spd;
  filename=filename2;
  atnumpics=numpics2;
  mvnumpics=numpics3;
  mvdelay=mvdelay2;
  atdelay=atdelay2;
  aliveCreatures.add(this);
  status=0;
 }
 void turn(){
  if (!inRadius()){
   status=0;
  } 
 }
 boolean inRadius(){
   for (int i=0;i<aliveCreatures.size();i++){
       if (abs(this.x-aliveCreatures.get(i).x)<this.speed && this.friendly != aliveCreatures.get(i).friendly){
         return true;
       }
   }
   return false;
 }
}
