class Base extends Unit{
  PImage pic;
 Base(int hp,int dmg,float xpos,float ypos,String picture){
   super(hp,dmg,xpos,ypos);
   pic=loadImage(picture);
 }
 Base(float xpos,float ypos,String picture){
  this(200,20,xpos,ypos,picture);
 }

}
