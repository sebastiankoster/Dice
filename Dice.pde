void setup(){
size(1920,1080);
noLoop();

}
int screenCount = 0;
int lifetimeCount = 0;
int numSixes = 0;
int ik = 1;
int counter = 0;
boolean aRod_On_Roids;
int diceOnScreen = 1;
int cowGoMoo = 0;
boolean winner;
boolean loser;

class Die {
  int dieNum;
  int dieX;
  int dieY;
  int i;
  int j;
  float r;
  float g; 
  float b;
  float s;
  
  Die(int dieX, int dieY, float c, float q){
    i = dieX;
    j = dieY;
    r = 12.8*c;
    g = 12.8*abs(c*sin(0.5*c*(float)Math.random()));
    b = 256-pow(1.315,c);
    s = q;
  }
  
  void show(){
  int dieNum =(int)(Math.random()*6+1);
  screenCount+=dieNum;
  lifetimeCount+=dieNum;
    fill(r,g,b);
    rect(i-80*s,j-80*s,160*s,160*s, 35*s);
    fill(r,g,b);
    if (dieNum==1)
      ellipse(i,j,25*s,25*s);
      
    if (dieNum==2){
      ellipse(i+33*s,j+33*s,25*s,25*s);
      ellipse(i-33*s,j-33*s,25*s,25*s);
     }
     
    if (dieNum==3){
      ellipse(i+33*s,j+33*s,25*s,25*s);
      ellipse(i-33*s,j-33*s,25*s,25*s);
      ellipse(i,j,25*s,25*s);
     } 
     
    if (dieNum==4){
      ellipse(i+33*s,j+33*s,25*s,25*s);
      ellipse(i-33*s,j-33*s,25*s,25*s);
      ellipse(i+33*s,j-33*s,25*s,25*s);
      ellipse(i-33*s,j+33*s,25*s,25*s);
     }    
     
    if (dieNum==5){
      ellipse(i+33*s,j+33*s,25*s,25*s);
      ellipse(i-33*s,j-33*s,25*s,25*s);
      ellipse(i+33*s,j-33*s,25*s,25*s);
      ellipse(i-33*s,j+33*s,25*s,25*s);
      ellipse(i,j,25*s,25*s);
     }
     
    if (dieNum==6){
      ellipse(i+33*s,j+43*s,25*s,25*s);
      ellipse(i-33*s,j-43*s,25*s,25*s);
      ellipse(i+33*s,j-43*s,25*s,25*s);
      ellipse(i-33*s,j+43*s,25*s,25*s);
      ellipse(i+33*s,j,25*s,25*s);
      ellipse(i-33*s,j,25*s,25*s);
     }
  }
}


int dieSum = 0;
int dieCount =0;
void draw(){
  screenCount = 0;
  for(int y = 4; y<1080;y+=8){
    for (int x = 4; x<1920;x+=8){
    Die bob= new Die(x,y,0.00005*x*y,0.05);
    bob.show();
    dieCount ++;
    }
  }
  fill(232,220,84);
  rect(700,900,500,65);
  textSize(60);
  fill(203,94,31);
  text("Sum of Dice: " + screenCount,700,950); 
  
}

void mousePressed(){
redraw();
}
