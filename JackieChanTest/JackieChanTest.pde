/*PImage img;
int n=0;
int stime=0;
int etime=0;
void setup(){
 size(360,200);
 background(0);
 img=loadImage("JackieChanstill.png");
}
void draw(){
  etime=millis();
 image(img,0,0);
 img=loadImage("JackieChanwalk"+nf(n,1)+".png");
 if (etime-stime>100){
   n++;
   stime=millis();
 }
 if (n>9){
  n=0; 
 }
}*/
Animation animation1,animation2;
void setup() {
  size(640, 360);
  background(0);
  animation1 = new Animation("JackieChanwalk", 10,90);
  animation2=new Animation("JackieChanattack",5,100);
}
void draw(){
  background(0);
 animation1.display(0,0);
 animation2.display(50,0);
}
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
      frame = (frame+1) % imageCount;
      timer=millis();
    }
    image(images[frame], xpos,ypos);
  }
  
  int getWidth() {
    return images[0].width;
  }
}

