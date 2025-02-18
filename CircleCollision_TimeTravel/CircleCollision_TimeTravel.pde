//import processing.opengl.*;

void setup(){
  size(900,900);
  frameRate(30);
  
/* for(int i = 0 ; i<=10;i++){
    bList.add(new Ball(60*i+20,100,random(-2,2),random(-2,2),10));
    bList.add(new Ball(60*i+20,120,random(-2,2),random(-2,2),10));
    bList.add(new Ball(60*i+20,140,random(-2,2),random(-2,2),10));
    bList.add(new Ball(60*i+20,160,random(-2,2),random(-2,2),10));
    bList.add(new Ball(60*i+20,180,random(-2,2),random(-2,2),10));
    bList.add(new Ball(60*i+20,200,random(-2,2),random(-2,2),10));
    bList.add(new Ball(60*i+20,220,random(-2,2),random(-2,2),10));
    bList.add(new Ball(60*i+20,240,random(-2,2),random(-2,2),10));
    bList.add(new Ball(60*i+20,260,random(-2,2),random(-2,2),10));
    bList.add(new Ball(60*i+20,280,random(-2,2),random(-2,2),10));
    bList.add(new Ball(60*i+20,300,random(-2,2),random(-2,2),10));
    bList.add(new Ball(60*i+20,320,random(-2,2),random(-2,2),10));
    bList.add(new Ball(60*i+20,340,random(-2,2),random(-2,2),10));
    bList.add(new Ball(60*i+20,360,random(-2,2),random(-2,2),10));
    
  } */
  int spacing = 450;
  for (int i = 0; i<=1000; i++){
     bList.add(new Ball(450+random(-spacing,spacing),450+random(-spacing,spacing),random(-1,1),random(-1,1),5));
     
  }
  //for(Ball A: bList){
  //  A.opacity =255;
  //}
  
  //bList.add(new Ball(300,500,0,-2,30));

  
  /*for (int i = 0; i<=15; i++){
     bList.add(new Ball(50*i+100,450,random(-1,1),random(-1,1),20));
     
     
  }*/
}



int ticksPerFrame = 1;


void draw(){
  background(0);
  

  
  for (int i = bList.size()-1  ;  i>=0  ;  i--){
    Ball A = bList.get(i);
    A.glide(1);
    
    A.checkBoundaryCollision();
    A.gravity(1);
    
    A.display();
    }
  
  
  for (int i = bList.size()-1 ; i>=0 ; i--){
    Ball A = bList.get(i);
    
    for (int j = bList.size()-1 ; j>=0 ; j--){
      Ball B = bList.get(j);
      if (j!=i){
      A.Collision(B);
      }}}
  
  //let's gooooooooooooooooooooooooooooooooooooooo
  
  
  
  println(frameRate);
  
}
