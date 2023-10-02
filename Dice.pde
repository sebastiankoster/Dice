void setup(){
size(1000,1000);
noLoop();

}
Die Bob = new Die(500,500,1);
PFont font1;
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
  
  Die(int dieX, int dieY, int c){
    i = dieX;
    j = dieY;
    r = 12.8*c;
    g = 12.8*abs(c*sin(0.5*c*(float)Math.random()));
    b = 256-pow(1.315,c);
  }
  
  void show(){
  int dieNum =(int)(Math.random()*6+1);
  screenCount+=dieNum;
  lifetimeCount+=dieNum;
    fill(256,256,256);
    rect(i-80,j-80,160,160, 35);
    fill(r,g,b);
    if (dieNum==1)
      ellipse(i,j,25,25);
      
    if (dieNum==2){
      ellipse(i+33,j+33,25,25);
      ellipse(i-33,j-33,25,25);
     }
     
    if (dieNum==3){
      ellipse(i+33,j+33,25,25);
      ellipse(i-33,j-33,25,25);
      ellipse(i,j,25,25);
     } 
     
    if (dieNum==4){
      ellipse(i+33,j+33,25,25);
      ellipse(i-33,j-33,25,25);
      ellipse(i+33,j-33,25,25);
      ellipse(i-33,j+33,25,25);
     }    
     
    if (dieNum==5){
      ellipse(i+33,j+33,25,25);
      ellipse(i-33,j-33,25,25);
      ellipse(i+33,j-33,25,25);
      ellipse(i-33,j+33,25,25);
      ellipse(i,j,25,25);
     }
     
    if (dieNum==6){
      ellipse(i+33,j+43,25,25);
      ellipse(i-33,j-43,25,25);
      ellipse(i+33,j-43,25,25);
      ellipse(i-33,j+43,25,25);
      ellipse(i+33,j,25,25);
      ellipse(i-33,j,25,25);
     }
  }
}

void draw(){
  if(!winner && !loser){
    if(cowGoMoo==1){
      background(200,200,200);
      textAlign(CENTER);
      text("The rules are as follows", 500,300);
    }
    if (cowGoMoo==2){
      textAlign(CENTER);
      text("Click to roll dice", 500,400);
    }
    if (cowGoMoo==3){
      textAlign(CENTER);
      text("die total of 68 wins", 500,500);
    }
    if (cowGoMoo==4){
      textAlign(CENTER);
      text("good luck partner", 500,600);
    }
    textAlign(LEFT);
    
    if(cowGoMoo>4 && !winner && !loser)
      background(151*1.2,87*1.2,43*1.2);
      
    if (aRod_On_Roids && (cowGoMoo>4) && !winner && !loser){
      for(int j =100; j<801; j +=200) 
       for (int i = 100; i<1000; i+=200)
       {
        Bob = new Die(i,j,diceOnScreen);
        Bob.show();
        diceOnScreen++;
       }
     }
     
    font1 = createFont("westy.ttf", 48);
    fill(150,150,150);
    rect(300,900,400,75);
    textFont(font1);
    fill(10,10,10);
    if(aRod_On_Roids){
        if (screenCount == 68){
            text("You Win " + screenCount, 325,965);
            winner = true;
        }
        else if(lifetimeCount>1000){
            text("game over", 365,965);
            loser = true;
          }
        else
            text("Total is " + screenCount, 350,965);
     }
     else{
      text("CLick To Play" , 320,965);   
     }
  }
  else if (winner){
   textSize(100);
   background(200,200,200);
   fill(20, 217, 36);
   textAlign(CENTER);
   text("You Won", 500,400);
  }
  
  else if (loser){
   textSize(100);
   background(200,200,200);
   fill(217, 20, 36);
   textAlign(CENTER);
   text("You lose", 500,400);
  }
}


void mousePressed(){
  cowGoMoo++;
  if (cowGoMoo==4)
    aRod_On_Roids = true;
  if(!winner && !loser){
  redraw();
  screenCount = 0;
  diceOnScreen=0;
  }
  
  else{
   redraw();
   counter++;
   if(counter==2){
    background(200,200,200);
    screenCount = 0;
    lifetimeCount = 0;
    numSixes = 0;
    ik = 1;
    counter = 0;
    aRod_On_Roids = false;
    diceOnScreen = 1;
    cowGoMoo = 0;
    winner = false;
    loser = false;
    redraw();
   }
  }

}
