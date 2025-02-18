ArrayList<Ball> bList = new ArrayList<Ball>();


class Ball {
  
PVector pos = new PVector(0,0);
PVector vel = new PVector(0,0);

float radius = 40;
float mass = 10;

float opacity = 100;


Ball(float px, float py, float vx, float vy,float r){
  pos.x = px;
  pos.y = py;
  vel.x = vx;
  vel.y = vy;
  radius = r;
  mass =(radius*radius*radius*PI*(4/3));
  
}
  
  //-------------------------------------------------------------
  
  void glide( float ti){
    PVector travelled = PVector.mult(vel,ti);
    pos.add(travelled);
  }
  
  
  
  
  //----------------------------------------------------------------
  
  
  
      
float rewindToTangent  (Ball rA, Ball rB , PVector RdistVect, float RcollisionDist){

      float ticksRewound =0;
      
      while(RdistVect.mag()<=RcollisionDist){
        rA.glide(-0.01);
        rB.glide(-0.01);
        
        ticksRewound -= -0.01;
        RdistVect = PVector.sub(rA.pos,rB.pos);
        //println(RdistVect.mag());
        //println("rewinding");
      }
  return ticksRewound;
}
 
 
 //----------------------------------------------------------------- 


void collisionMath(Ball A, Ball B){
  
  //here begin the big formulas
PVector distVect = PVector.sub(A.pos,B.pos);  //update distvect to match rewound positions
float theta = distVect.heading();


      PVector[] bTemp = {  new PVector(), new PVector()  };
      bTemp[1] = distVect.rotate(-theta);

      // rotate Temporary velocities
      PVector[] vTemp = {  new PVector(), new PVector()  };
      vTemp[0] = A.vel.rotate(-theta);
      vTemp[1] = B.vel.rotate(-theta);

      /* Now that velocities are rotated, you can use 1D
       conservation of momentum equations to calculate 
       the final velocity along the x-axis. */
      PVector[] vFinal = {  new PVector(), new PVector()  };

   // final rotated velocity for b[0]
      vFinal[0].x = ((A.mass - B.mass) * vTemp[0].x + 2 * B.mass * vTemp[1].x) / (A.mass + B.mass);
      vFinal[0].y = vTemp[0].y;
   // final rotated velocity for b[0]
      vFinal[1].x = ((B.mass - A.mass) * vTemp[1].x + 2 * A.mass * vTemp[0].x) / (A.mass + B.mass);
      vFinal[1].y = vTemp[1].y;
  // update velocities
      A.vel = vFinal[0].rotate(theta);
      B.vel = vFinal[1].rotate(theta);


//here end the big formulas
}
  

  
  //-------------------------------------------------------------------
  
  
  
  
  void Collision(Ball B){
    Ball A = this;
    
    PVector distVect = PVector.sub(A.pos,B.pos);
    float collisionDist = A.radius + B.radius ;
    
    //check overlap of bodies
    if (distVect.mag()<=collisionDist){
      
float ticksRewound =     rewindToTangent    (A,B,distVect,collisionDist);

collisionMath(A,B);
      
//give back the ticks rewound, with post-collision velocities
A.glide(ticksRewound);
B.glide(ticksRewound);

    }
  }  //end of collision
  
 
 
 void display(){
   stroke(0,0);
   fill(255,opacity);
   circle(pos.x,pos.y,radius*2);
 }
  
 void checkBoundaryCollision() {
    if (pos.x > width-radius) {
      pos.x = width-radius;
      vel.x *= -1;
    } else if (pos.x < radius) {
      pos.x = radius;
      vel.x *= -1;
    } else if (pos.y > height-radius) {
      pos.y = height-radius;
      vel.y *= -1;
    } else if (pos.y < radius) {
      pos.y = radius;
      vel.y *= -1;
    }
  }
  
  void gravity(float coef){
    this.vel.y += (0.01)*coef;
    
    
  }
  
} //end of class
