class Creature extends Unit{
 float speed;
 Creature(int hp,int dmg,float xpos,float ypos,float spd){
  super(hp,dmg,xpos,ypos);
  speed=spd;
  Creatures.add(this);
 }
 boolean inRadius(){
   for (int i=0;i<Creatures.length;i++){
       if (abs(this.x-Creatures.get(i).x)<this.speed && this.friendly != Creatures.get(i).friendly){
         return true;
       }
   }
   return false;
 }
}
