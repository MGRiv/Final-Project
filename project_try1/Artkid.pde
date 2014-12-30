class Artkid extends Creature{
 Artkid(){
  super(5,1,100,100,5);
  friendly=true;
 }
 Artkid(int hp,int dmg,int xpos,int ypos,int spd){
  super(hp,dmg,xpos,ypos,spd); 
 }
 void display(){
  strokeWeight(1);
  stroke(0);
   
 }
}
