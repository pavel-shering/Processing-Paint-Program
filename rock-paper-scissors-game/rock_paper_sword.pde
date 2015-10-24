PImage img;
final int ROCK = 0; // define a constant for ROCK
final int PAPER = 1; // define a constant for PAPER
final int SWORD = 2; // define a constant for SWORD

  // for font
PFont font;
font = loadFont("ArialNarrow-Bold-16.vlw");       // set the font to use for display
textFont(font);

PImage[] game_object = new PImage[3];
game_object[ROCK] = loadImage("rock.png");
game_object[PAPER] = loadImage("paper.png");
game_object[SWORD] = loadImage("sword.png");
int object1 = int(random(0,3)); // randomly pick 0,1,2
int object2 = int(random(0,3)); // randomly pick 0,1,2

size(200,200);
text("Rock Paper Sword",10,20);
text("Player 1", 30,46);
text("Player 2", 100,46);
image(game_object[object1],50,50);
image(game_object[object2],100,50);
// paper beats rock
// rock beats sword
// sword beats paper

if (object1 == object2){
   // tie 
   text("Tie",10,100);
} else if (object1 == ROCK){
   if (object2 == SWORD){
     // object 1 wins
     text("Player 1 wins",10,100);     
   }
   else {
     // object 2 wins
     text("Player 2 wins",10,100);     
   }
} else if (object1 == PAPER){
   if (object2 == SWORD){
     // object 2 wins
     text("Player 2 wins",10,100);
   }
   else {
     // object 1 wins
     text("Player 1 wins",10,100);
   }
} else {  //object1 == SWORD
   if (object2 == PAPER){
      // object1 wins
     text("Player 1 wins",10,100);
   }
   else {  
      // object2 wins
     text("Player 2 wins",10,100);      
   }
} 
 

