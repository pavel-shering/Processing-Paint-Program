/* 
TITLE: Asteroid Game
NAME: Pavel Shering  
DATE: May 18, 2012
DESCRIPTION: The Asteriod Game, the most popular game in Computer Engineering Course taught by Mr. Siconolfi.
The rules to the game are simple, brake the rocks by mouse clicking, each rock broken will grant one point to 
the score. To win earn a score of ten, the score is constantly updated after each rock is broken. Do not click
on the bomb, if the bomb is clicked the GAME IS OVER. There are constantly 3 rocks and 5 bombs on the screen, 
at the start they appear at random positions and travel with random speeds, when rocks are broken another rock
appears. 
*/

// declare new objects or global variables
AnimateSprite explosion;      // gives an explosion animation once the rocks and bombs are clicked
Rock r1, r2, r3;              // three rock global objects are created through the rock class
Rock b1, b2, b3, b4, b5;      // five bomb global objects are created through the rock class
PImage space,newspace;        // background image is created 
int score;                    // global variable is created for score

// initial setup of the screen
void setup(){
   score =  0; // set initial score to zero
   println("Score = " + score); // display the initial score
   space = loadImage("starry.jpg"); // set space variable to be the starry image 
   newspace = loadImage("starry.jpg"); // set the newspace variable to be the starry image
   size(400, 400);   // set window size to 400 x 400 pixels
   frameRate(30);   // set the frame rate to 30
   r1 = new Rock(100f, 100f,"boulder.png");  // Make new rocks (3 of them)
   r2 = new Rock(200f, 200f,"boulder.png"); 
   r3 = new Rock(10f,   10f,"boulder.png"); 
   b1 = new Rock(50f,   50f,"bomb.png");  // Make new bombs (5 of them)
   b2 = new Rock(150f, 150f,"bomb.png"); 
   b3 = new Rock(300f, 300f,"bomb.png");
   b4 = new Rock(350f, 350f,"bomb.png"); 
   b5 = new Rock(250f, 250f,"bomb.png");   
     // set initial conditions for rocks
   r1.setPosXY (random(360), random(360)); // set the position of the 3 rocks to random
   r2.setPosXY (random(360), random(360));
   r3.setPosXY (random(360), random(360));
   r1.setVelXY (random(10f), random(-10f)); // set the velocities of the 3 rocks to a range from 0-10 pixels 
   r2.setVelXY (random(10f), random(-10f)); // per frame in all directions.
   r3.setVelXY (random(10f), random(-10f));
   r1.setBounce (true); // set bounce boolean to true
   r2.setBounce (true);
   r3.setBounce (true);
     //set initial conditions for bombs
   b1.setPosXY (random(360), random(360)); // set the position of the 5 bombs to random
   b2.setPosXY (random(360), random(360));
   b3.setPosXY (random(360), random(360));
   b4.setPosXY (random(360), random(360));
   b5.setPosXY (random(360), random(360));
   b1.setVelXY (random(10f), random(-10f)); // set the velocities of the 5 bombs to a range from 0-10 pixels
   b2.setVelXY (random(10f), random(-10f)); // per frame in all directions.
   b3.setVelXY (random(10f), random(-10f));
   b4.setVelXY (random(10f), random(-10f));
   b5.setVelXY (random(10f), random(-10f));
   b1.setBounce (true); // set bounce boolean to true
   b2.setBounce (true);
   b3.setBounce (true);
   b4.setBounce (true);
   b5.setBounce (true);
     // create a new explosion sprite
   explosion = new AnimateSprite(100f,100f,"explosion_strip7.png",7);
   explosion.hide(); // explosion does not display at the start, but it's there unseen
}
  // update the screen every frame
void draw(){
  
  space.copy(newspace,0,0,400,400,0,0,400,400);  // renew background with original image
    //randomly draw 50 dots on the background every frame
  for (int i=0;i<50;i++){
     space.set((int)random(400),(int)random(400),color(255,255,255));
  }
  // show the background image
  image(space,0,0);
    //set r1 to have brownian motion
  //r1.setVelXY((random(20f)-10),(random(20f)-10));
    // constantly update rocks every frame
  r1.update();
  r2.update();
  r3.update();
   // constantly update bombs every frame
  b1.update();
  b2.update();
  b3.update();
  b4.update();
  b5.update();
    // update the explosion every frame
  explosion.update();
}

// check if the method is performed every frame
void mousePressed(){
   if (r1.collision(mouseX,mouseY)){  // check if the mouse co-ordinates is on rock one, meaning the mouse collides with rock one
      r1.setPosXY (random(360), random(360)); // if the above condition is true reset the position of rock one
      r1.setVelXY (random(10f), random(-10f)); // if the collition happens, reset the velocity of the previously reappeared rock one
      explosion.setXY(mouseX,mouseY); // if the collition is true place an explosion on the spot of rock one, which is also the current mouse co-ordinates
      explosion.show(); // show the explostion 
      score ++;  // increase the score by one
      println ("Score = " + score); // display the current score
      if(score == 10){ // check if the score is exactly equal 10 
       r1.hide(); // if the above condition is true hide the 3 rocks on the screen
       r2.hide();
       r3.hide();
       b1.hide(); // if the score eqauls 10 hide all 5 bombs on the screen
       b2.hide();
       b3.hide(); 
       b4.hide();
       b5.hide(); 
       println("YOU WIN"); // if score is 10 display "YOU WIN"
     }
   }
   if (r2.collision(mouseX,mouseY)){ // SAME AS ABOVE BUT FOR ROCK 2
      r2.setPosXY (random(360), random(360));
      r2.setVelXY (random(10f), random(-10f));
      explosion.setXY(mouseX,mouseY);
      explosion.show();
      score ++;
      println ("Score = " + score); 
      if(score == 10){
       r1.hide(); 
       r2.hide();
       r3.hide();
       b1.hide();
       b2.hide();
       b3.hide(); 
       b4.hide();
       b5.hide(); 
       println("YOU WIN");
     }      
   } 
   if (r3.collision(mouseX,mouseY)){ // SAME AS ABOVE BUT FOR ROCK 3
      r3.setPosXY (random(360), random(360));
      r3.setVelXY (random(10f), random(-10f));
      explosion.setXY(mouseX,mouseY);
      explosion.show();   
      score ++;
      println ("Score = " + score); 
      if(score == 10){
       r1.hide(); 
       r2.hide();
       r3.hide();
       b1.hide();
       b2.hide();
       b3.hide(); 
       b4.hide();
       b5.hide(); 
       println("YOU WIN");
     }    
   } 
    if (b1.collision(mouseX,mouseY)){ // check if the mouse co-ordinates is on bomb one, meaning the mouse collides with bomb one 
      explosion.setXY(mouseX,mouseY); // if the collision is true place an explosion on the spot of bomb one, which is also the current mouse co-ordinates
      explosion.show(); // show the explosion
      r1.hide(); // if the above condition is true hide the 3 rocks on the screen
      r2.hide();
      r3.hide();
      b1.hide(); // if the above condition is true hide the 5 bombs on the screen
      b2.hide();
      b3.hide(); 
      b4.hide();
      b5.hide(); 
      println("YOU LOSE"); // when the mouse collides with bomb one display "YOU LOSE", the game is over
   } 
   if (b2.collision(mouseX,mouseY)){ // SAME AS ABOVE BUT FOR BOMB TWO
      explosion.setXY(mouseX,mouseY);
      explosion.show(); 
      r1.hide(); 
      r2.hide();
      r3.hide();
      b1.hide();
      b2.hide();
      b3.hide(); 
      b4.hide();
      b5.hide(); 
      println("YOU LOSE");
   } 
   if (b3.collision(mouseX,mouseY)){ // SAME AS ABOVE BUT FOR BOMB THREE
      explosion.setXY(mouseX,mouseY);
      explosion.show(); 
      r1.hide(); 
      r2.hide();
      r3.hide();
      b1.hide();
      b2.hide();
      b3.hide(); 
      b4.hide();
      b5.hide(); 
      println("YOU LOSE");
   }
   if (b4.collision(mouseX,mouseY)){ // SAME AS ABOVE BUT FOR BOMB FOUR
      explosion.setXY(mouseX,mouseY);
      explosion.show(); 
      r1.hide(); 
      r2.hide();
      r3.hide();
      b1.hide();
      b2.hide();
      b3.hide(); 
      b4.hide();
      b5.hide(); 
      println("YOU LOSE");
   }
   if (b5.collision(mouseX,mouseY)){ // SAME AS ABOVE BUT FOR BOMB FIVE
      explosion.setXY(mouseX,mouseY);
      explosion.show(); 
      r1.hide(); 
      r2.hide();
      r3.hide();
      b1.hide();
      b2.hide();
      b3.hide(); 
      b4.hide();
      b5.hide(); 
      println("YOU LOSE");
   } 
}


// creates the rock class, in order to create the rock/ bomb objects 
class Rock {
  float xpos,ypos;
  boolean bounceMode = false;  // if true, bounces on edge of window.
  boolean visible = true;
  PImage img;
  float xvel = 0.0;  // x velocity starts as zero
  float yvel = 0.0;  // y velocity starts as zero
  
   Rock(float x, float y,String fileName){
      img = loadImage(fileName);
      xpos = x;
      ypos = y;
   } 
   
   Rock(float x, float y, float width, float height, String fileName){
      img = loadImage(fileName);
      xpos = x;
      ypos = y;
   } 
   
   void setBounce(boolean bounce){
     bounceMode = bounce;  
   }
   
   void setVelXY(float vx, float vy){
     xvel = vx;
     yvel = vy;
   }
   
    void setPosXY(float x, float y){
     xpos = x;
     ypos = y;
   }
   
   void hide(){
      visible = false; 
   }

   void show(){
      visible = true; 
   }

   // cheap collision detection.  check if (x,y) is within radius to centre of sprite
    boolean collision(float x, float y){
      if (dist(x,y,xpos+img.width/2,ypos+img.height/2) < max(img.width,img.height)/2){
        return true;
      }
      return false;
    }
  
  void update(){
    if (visible){
     float maxX = g.width;   // get the window width from the graphics context "g"
     float maxY = g.height;  // get the window height from the graphics context "g"

      /* this next if( ) determines what to do with the sprite if it encounters the edge
         of the window.     */
     if (bounceMode) {  // if bounceMode is true, we should bounce on the edge
       if (xpos +xvel > maxX-img.width){
         xvel = -xvel;
       }
       else if (xpos +xvel < 0.0){
         xvel = -xvel;
       }
       if (ypos +yvel > maxY-img.height){
         yvel = -yvel;
       }
       else if (ypos +yvel < 0.0){
         yvel = -yvel;
       }
       xpos = xpos + xvel;
       ypos = ypos + yvel;
     }
     else {  // otherwise, just clamp the xpos and ypos at the edges.
       xpos = xpos + xvel;
       xpos = constrain(xpos,0.0,maxX-img.width);
       ypos = ypos + yvel;
       ypos = constrain(ypos,0.0,maxY-img.height);
     }  
       
       // finally, draw the image using the current x and y position.
     image(img,xpos,ypos);    
    }
  }
}

/* animates a strip of images that are stored in a filename
a strip is a sequential progression of frames in an animation.
for example, if an animation of an image has 3 different frames
the file would store the three frames sequentially in a row 
so that the height of the strip is the height of the each image
and the width of the strip is 3 x the width of each image.
assuming that each image is the same size!!! */
class AnimateSprite {
  float xpos,ypos;  // top left corner co-ordinates of image
  int animageWidth;
  PImage img;
  PImage [] animage;  // the strip of images is placed in an array
  int animageCount;   // the number of frames in the image
  boolean visible = true;
  int current;
  boolean repeat = false; // if true, repeatedly cycles through strip of images
                          // if false, cycles through strip once and then hides
  
   AnimateSprite(float x, float y,String fileName,int count){
      img = loadImage(fileName);
      xpos = x;
      ypos = y;
      animageCount = count;
      current = 0;    // when animating, this will set the current image to display
      
      animage = new PImage[count];
      animageWidth = img.width/count;  // width of each frame in the image
      for (int i=0; i<count;i++){
        animage[i] = createImage(animageWidth,img.height,ARGB);
        animage[i].copy(img,i*animageWidth,0,animageWidth,img.height,0,0,animageWidth,img.height);
      }
   } 
   
   void setRepeat(boolean val){
     repeat = val;
   }

   void setXY(float x, float y){
     xpos = x-animageWidth/2;
     ypos = y-img.height/2;
   }   

   void hide(){
      visible = false; 
   }

   void show(){
      current = 0;  // assume that image is to be shown from the start of the strip
      visible = true; 
   }
   
  
  void update(){
    if (visible){
       if (current < animageCount){
          img = animage[current];
          current++;
       }
       else {  // this should never happen, but in case it does, just set a default image
          img = animage[0];
       }
       
       image(img,xpos,ypos);    

       // reset the current image to display for next time if strip is at the end
       if (current >= animageCount){
          current = 0;
       }
       if (!repeat && current == 0){    // if image is not supposed to repeat continuously 
          visible = false;
       }
    }
  }
}
