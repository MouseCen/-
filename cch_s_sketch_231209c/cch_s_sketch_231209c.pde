import processing.core.PFont;
import processing.core.PImage;

PImage p1;
PFont chineseFont;

ArrayList<movingtext> MT = new ArrayList<movingtext>();
 String t1 = "晴れた";
String t2 ="笑顔";
String t3 ="幸せ";


void setup() {
  //size(1242, 1500, P3D);
  //size(1080,2400,P3D);
    size(1080,1418,P3D);
    // 加载支持中文字符的字体文件
  chineseFont = createFont("SimHei", 16);
  textFont(chineseFont);
  background(20);
  frameRate(12);
  p1 = loadImage("d2.jpg");
  p1.loadPixels();
   for (int i = 0; i < width; i=i+int(random(10))) {
      for (int j = 0; j < height; j=j+int(random(1,2)) ) {
        float z = random(500,5000);  
        float speed = random(10,50);
        String t;
        int t_num = int(random(3));
        switch(t_num){
        case 0: 
        t=t1;
        break;
        
        case 1: 
        t=t2;
        break;
        
        default:
        t=t3;
        }
       
        color c = p1.pixels[i + j * p1.width];
          
          MT.add(new movingtext(i,j,z,c,speed,t));
   }
 }
}

void draw() {
  background(0);
    camera(width/2.0, height/2.0, ((height/2.0) / tan(PI*30.0 / 180.0))+1000 , width/2.0, height/2.0, 0, 0, 1, 0);
    for (movingtext r : MT) {
      r.update();
      r.display();
    }
    saveFrame();
}

class movingtext{
color c;
int x,y;
float z;
float speed;
String t;

movingtext(int x,int y,float z,color c,float speed,String t){
 this.x = x;
 this.y = y;
 this.z = z;
 this.c = c;
 this.speed = speed;
 this.t =  t ;
}

void update(){
   if (z >speed) {
      z = z-speed;
    }
    else{
    z=random(0,0.012);
    //z=random(0.01);
    }
}

void display(){
 fill(c);
 text(t,x,y,z);
}
}
