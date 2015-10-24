/*
TITLE: Paint
NAME: Pavel Shering  
DATE: May 31, 2012
DESCRIPTION:The Card Intuition, the most popular game in Computer Engineering Course taught by Mr. Siconolfi.
The rules to the game are simple, there are two buttons on the screen and a deck of shuffled cards, the buttons 
are high and low, by choosing one of them your are indicating that the next card will be higher or lower than the 
one currently shown. It is an intuition game to guess whether the next card will be higher or lower. The text on 
the bottom will confirm your choice and indicate whether the choice was correct or not, and to the side will be 
running percentage total. Because there is no tie button, card with two of the same number will be wrong no matter
what button you press, you are just out of luck. Trust your intuition and get the most correct.
*/





PImage img;
PFont font;              // font for the whole program
boolean start = false; 

// VARIABLES and OBJECTS
Button ClearButton;                    // clear button obejct is created through the button class
Button RectangleButton;                // rectangle button obejct is created through the button class
Button CircleButton;                   // circle button obejct is created through the button class
Button ScribbleButton;                 // scribble button obejct is created through the button class
Button StraightButton;                 // straight button obejct is created through the button class
Button RchangeButton;                  // red changing button obejct is created through the button class
Button GchangeButton;                  // green changing button obejct is created through the button class
Button BchangeButton;                  // blue changing button obejct is created through the button class
Button RsetButton;                     // pure red set button obejct is created through the button class
Button GsetButton;                     // pure green set button obejct is created through the button class
Button BsetButton;                     // pure blue set button obejct is created through the button class
Button EraseButton;                    // erase button obejct is created through the button class
Button WhiteButton;                    // pure white set button obejct is created through the button class
Button BlackButton;                    // pure black set button obejct is created through the button class
Button AirBrushButton;                 // airbrush button obejct is created through the button class

int InitialX;                    // variable for initial x position of the mouse
int InitialY;                    // variable for initial y position of the mouse
// values for colors, starting color is black
int RValue = 0;                  // variable for the red component in color
int GValue = 0;                  // variable for the green component in color
int BValue = 0;                  // variable for the blue component in color
// function variables, 1 meaning function is on, 0 meaning function is off, all set as zero to start
int ScribbleMode = 0;            // variable for draw function 
int StraightMode = 0;            // variable for line function
int RectangleMode = 0;           // variable for rectangle function
int CircleMode = 0;              // variable for elliplse function
int ClearMode = 0;               // variable for clear function
int EraseMode = 0;               // variable for erase function
int AirBrushMode = 0;            // variable for airbrush function
// variables for changing colors, 1 meaning the color is being changed
int Rchange = 0;                 // variable for changing the red component in color
int Gchange = 0;                 // variable for changing the green component in color
int Bchange = 0;                 // variable for changing the blue component in color

// MAIN PROGRAM
// initial setup of the screen
void setup() {
    font = loadFont("TimesNewRomanPSMT-26.vlw");       // set the font to use for display
    textFont(font); 
    size(550, 650);          // set window size to 400 x 400 pixels
    background(225);         // background color light grey 
    // function buttons
    ClearButton = new Button(3, 87, "Clear.jpg"); // make new button, the clear button
    RectangleButton = new Button(3, 121, "Rectangle.jpg");  // make new button, the rectangle button
    CircleButton = new Button(3, 155, "Ellipse.jpg"); // make new button, the ellipse button
    ScribbleButton = new Button(3, 189, "Draw.jpg"); // make new button, the draw button
    StraightButton = new Button(3, 223, "Line.jpg"); // make new button, the line button
    AirBrushButton = new Button(3, 291, "AirBrush.jpg"); // make new button, the airbrush button
    EraseButton = new Button(3, 257, "Erase.jpg"); // make new button, the erase button
    // color buttons
    RchangeButton = new Button(15, 350, "Red.jpg"); // make new button, the red changing button
    GchangeButton = new Button(15, 407, "Green.jpg"); // make new button, the green changing button
    BchangeButton = new Button(15, 460, "Blue.jpg"); // make new button, the blue changing button
    RsetButton = new Button(10, 585, "Red.jpg"); // make new button, the pure red button
    GsetButton = new Button(40, 585, "Green.jpg"); // make new button, the pure green button
    BsetButton = new Button(70, 585, "Blue.jpg"); // make new button, the pure blue button
    WhiteButton = new Button(55, 615, "White.jpg"); // make new button, the pure white button
    BlackButton = new Button(25, 615, "Black.jpg"); // make new button, the pure black button   
}

// update the screen every frame
void draw() {
    fill(250);                   // color the menu bar to light grey
    rect( 0, 0, 105, 650);       // constantly redraw the menu bar
    fill(RValue, 0, 0);          // color the text below with the value of red component present
    text(RValue, 50, 367);       // constantly update the value of the red component present in the color
    fill(0, GValue, 0);          // constantly update the value of the green component present in the color
    text(GValue, 50, 423);       // constantly update the value of the green component present in the color
    fill(0, 0, BValue);          // constantly update the value of the blue component present in the color
    text(BValue, 50, 477);       // constantly update the value of the green component present in the color
    fill(RValue, GValue, BValue);  // color the indicator rectangle with the present drawing color
    rect( 15, 500, 75, 75);      // constantly draw that rectangle
    // constantly update the conditions of the buttons
    ClearButton.update();
    RectangleButton.update();
    CircleButton.update();
    ScribbleButton.update();
    StraightButton.update();
    RchangeButton.update();
    GchangeButton.update();
    BchangeButton.update();
    RsetButton.update();
    GsetButton.update();
    BsetButton.update();
    EraseButton.update();
    WhiteButton.update();
    BlackButton.update();
    AirBrushButton.update();
  
  // check if Functions are on here...
    stroke(RValue, GValue, BValue);   // color the outline with the present drawing color
    if(ScribbleMode == 1){            // check if the draw function is on, if true do the following 
    text("DRAW", 15, 55);             // display that the draw function is on in top left corner
      if (mousePressed){              // check if mouse is pressed
        if (mouseX > 105) {           // check if current co-ordinate of the mouse is not on the menu bar
          if (pmouseX >105){          // check if previous frame co-ordinate of the mouse is not on the menu bar
            line(mouseX, mouseY, pmouseX, pmouseY);        // of all of the above is true, draw a line from the previous frame mouse position to thr current mouse position
          }
        }
      }
    }
    if(EraseMode == 1){               // check if the erase function is on, if true do the following
      text("ERASER", 5, 55);          // display that the erase function is on in top left corner
      if (mousePressed){              // check if mouse is pressed
        if (mouseX > 111.5) {         // check if current co-ordinate of the mouse is not on the menu bar
          if (pmouseX >111.5){        // check if previous frame co-ordinate of the mouse is not on the menu bar
          frameRate(200000);          // set frame rate to 200000
          noStroke();                 // draw no outline
          fill(225);                  // fill with backgrounf color
          rect(mouseX-7.5, mouseY-7.5, 15, 15); // constantly draw a rectangle centered on the mouse cursor
          }
        }
      }
    }
    if(RectangleMode == 1){           // check if the rectangle function is on, if true do the following
       text("RECT-", 15, 40);         // display that the rectangle function is on in top left corner
       text("ANGLE", 10, 70);         // display that the rectangle function is on in top left corner
    }
    if(CircleMode == 1){              // check if the ellipse function is on, if true do the following
       text("ELLIPSE", 3, 55);        // display that the ellipse function is on in top left corner
    }
    if(StraightMode == 1){            // check if the line function is on, if true do the following
       text("LINE", 23, 55);          // display that the line function is on in top left corner
    }
    if(ClearMode == 1){               // check if the clear function is on, if true do the following
       text("CLEAR", 12, 55);          // display that the clear function is on in top left corner
    }
    if(AirBrushMode == 1){            // check if the airbrush function is on, if true do the following
      text("AIR", 30, 40);            // display that the airbrush function is on in top left corner
      text("BRUSH", 10, 70);          // display that the airbrush function is on in top left corner
      if (mousePressed){              // check if mouse is pressed
        if (mouseX > 111.5) {         // check if current co-ordinate of the mouse is not on the menu bar
          if (pmouseX >111.5){        // check if previous frame co-ordinate of the mouse is not on the menu bar
          frameRate(200000);          // set frame rate to 200000
          // constantly draw points on and around the mouse position, acting as a spray
          point(mouseX, mouseY);      
          point(mouseX+3.5, mouseY+2.5);
          point(mouseX+1.5, mouseY+3.5);
          point(mouseX+0.5, mouseY+4.5);
          point(mouseX+1.5, mouseY+2.5);
          point(mouseX+3.5, mouseY+1.5);
          point(mouseX+0.5, mouseY+4.5);
          point(mouseX+2.5, mouseY+0.5);
          point(mouseX+1.5, mouseY+0.5);
          point(mouseX+0.5, mouseY+1.5);
          point(mouseX+2.5, mouseY-3.5);
          point(mouseX+1.5, mouseY-1.5);
          point(mouseX+0.5, mouseY-0.5);
          point(mouseX+1.5, mouseY-2.5);
          point(mouseX+4.5, mouseY-1.5);
          point(mouseX+4.5, mouseY-2.5);
          point(mouseX+2.5, mouseY-0.5);
          point(mouseX+1.5, mouseY-0.5);
          point(mouseX+5.5, mouseY-1.5);
          point(mouseX-3.5, mouseY-2.5);
          point(mouseX-1.5, mouseY-1.5);
          point(mouseX-5.5, mouseY-0.5);
          point(mouseX-0.5, mouseY-3.5);
          point(mouseX-2.5, mouseY-0.5);
          point(mouseX-0.5, mouseY-1.5);
          point(mouseX-1.5, mouseY-0.5);
          point(mouseX-2.5, mouseY-1.5);
          point(mouseX-1.5, mouseY-3.5);
          point(mouseX-4.5, mouseY+3.5);
          point(mouseX-3.5, mouseY+4.0);
          point(mouseX-2.5, mouseY+1.0);
          point(mouseX-3.0, mouseY+2.0);
          point(mouseX,     mouseY+2.0);
          point(mouseX-0.5, mouseY+1.0);
          point(mouseX,     mouseY+4.0);
          }
        }
      }
    }
     if ((Rchange == 1) && (RValue !=255)){          // check if increasing red component function is on and the red value is not pure, if true do the following  
       if(RchangeButton.inside(mouseX, mouseY)){     // check if the button is pressed
          RValue ++;                                 // increase the value of the red component in the current color by one each frame
       }
    }  
    if ((Gchange == 1) && (GValue !=255)){          // check if increasing green component function is on and the green value is not pure, if true do the following
      if(GchangeButton.inside(mouseX, mouseY)){     // check if the button is pressed
          GValue ++;                                // increase the value of the green component in the current color by one each frame
      }
    }
    if ((Bchange == 1) && (BValue !=255)){          // check if increasing blue component function is on and the blue value is not pure, if true do the following
      if(BchangeButton.inside(mouseX, mouseY)){     // check if the button is pressed
          BValue ++;                                // increase the value of the blue component in the current color by one each frame
      }
    }    
    if ((Rchange == 2) && (RValue !=0)){            // check if decreasing red component function is on and the red value is not 0, if true do the following
      if(RchangeButton.inside(mouseX, mouseY)){     // check if the button is pressed
          RValue --;                                // decrease the value of the red component in the current color by one each frame
      }
    }  
    if ((Gchange == 2) && (GValue !=0)){            // check if decreasing green component function is on and the green value is not 0, if true do the following
      if(GchangeButton.inside(mouseX, mouseY)){     // check if the button is pressed
          GValue --;                                // decrease the value of the green component in the current color by one each frame
      }
    }
    if ((Bchange == 2) && (BValue !=0)){            // check if decreasing blue component function is on and the blue value is not 0, if true do the following
      if(BchangeButton.inside(mouseX, mouseY)){     // check if the button is pressed
          BValue --;                                // decrease the value of the blue component in the current color by one each frame
      }
    }  
}

// check if the method is performed every frame
void mousePressed(){
      if (ScribbleButton.inside(mouseX, mouseY)){     // check if the draw button is pressed
        ScribbleMode = 1;                             // turns the draw function on, and turns off every other function
        CircleMode = 0;
        ClearMode = 0;
        StraightMode = 0;
        RectangleMode = 0;
        EraseMode = 0;
        AirBrushMode = 0;
      }
      if (EraseButton.inside(mouseX, mouseY)){     // check if the erase button is pressed
        EraseMode = 1;                             // turns the erase function on, and turns off every other function
        ScribbleMode = 0;
        CircleMode = 0;
        ClearMode = 0;
        StraightMode = 0;
        RectangleMode = 0;
        AirBrushMode = 0;
      }
      if (RectangleButton.inside(mouseX, mouseY)){     // check if the rectangle button is pressed
        RectangleMode = 1;                             // turns the rectangle function on, and turns off every other function
        CircleMode = 0;
        ClearMode = 0;
        ScribbleMode = 0;
        StraightMode = 0;
        EraseMode = 0;
        AirBrushMode = 0;
      }
      if (AirBrushButton.inside(mouseX, mouseY)){     // check if the airbrush button is pressed
        AirBrushMode = 1;                             // turns the airbrush function on, and turns off every other function
        RectangleMode = 0;
        CircleMode = 0;
        ClearMode = 0;
        ScribbleMode = 0;
        StraightMode = 0;
        EraseMode = 0;
      }
      if (StraightButton.inside(mouseX, mouseY)){     // check if the line button is pressed
        StraightMode = 1;                             // turns the line function on, and turns off every other function
        CircleMode = 0;  
        ClearMode = 0;
        ScribbleMode = 0;
        RectangleMode = 0;
        EraseMode = 0;
        AirBrushMode = 0;
      }
      if (CircleButton.inside(mouseX, mouseY)){     // check if the ellipse button is pressed
        CircleMode = 1;                             // turns the ellipse function on, and turns off every other function
        ClearMode = 0;
        StraightMode = 0;
        ScribbleMode = 0;
        RectangleMode = 0;
        EraseMode = 0;
        AirBrushMode = 0;
      }
      if (ClearButton.inside(mouseX, mouseY)){     // check if the clear button is pressed
        ClearMode = 1;                             // turns the clear function on, and turns off every other function
        CircleMode = 0;
        StraightMode = 0;
        ScribbleMode = 0;
        RectangleMode = 0;
        AirBrushMode = 0;
        EraseMode = 0;
        background(225);                           // clears everything on the painting area  with a background
      }
      if (WhiteButton.inside(mouseX, mouseY)){     // check if the pure white button is pressed
        RValue = 255;                              // set the current color to pure white
        GValue = 255;
        BValue = 255;
      }
      if (BlackButton.inside(mouseX, mouseY)){      // check if the pure black button is pressed
        RValue = 0;                                 // set the current color to pure black
        GValue = 0;
        BValue = 0;
      }
      if (RsetButton.inside(mouseX, mouseY)){        // check if the pure red button is pressed
        RValue = 255;                                // set the current color to pure red
        GValue = 0;
        BValue = 0;
      }
      if (GsetButton.inside(mouseX, mouseY)){         // check if the pure green button is pressed
        GValue = 255;                                 // set the current color to pure green
        RValue = 0;
        BValue = 0;      
      }
      if (BsetButton.inside(mouseX, mouseY)){          // check if the pure blue button is pressed
        BValue = 255;                                  // set the current color to pure blue
        GValue = 0;
        RValue = 0;     
      }
      if ((RchangeButton.inside(mouseX, mouseY)) && (mouseButton == LEFT)){  //check if increasing red component button is pressed with a LEFT mouse button, if true do the following
        Rchange = 1;     // if the conditions above are met, turn on the increasing red component function
      }
      if ((GchangeButton.inside(mouseX, mouseY)) && (mouseButton == LEFT)){  //check if increasing green component button is pressed with a LEFT mouse button, if true do the following
        Gchange = 1;     // if the conditions above are met, turn on the increasing green component function
      }
      if ((BchangeButton.inside(mouseX, mouseY))  && (mouseButton == LEFT)){  //check if increasing red component button is pressed with a LEFT mouse button, if true do the following
        Bchange = 1;     // if the conditions above are met, turn on the increasing blue component function
      }
       if ((RchangeButton.inside(mouseX, mouseY)) && (mouseButton == RIGHT)){  //check if increasing red component button is pressed with a RIGHT mouse button, if true do the following
        Rchange = 2;     // if the conditions above are met, turn on the decreasing red component function
      }
      if ((GchangeButton.inside(mouseX, mouseY)) && (mouseButton == RIGHT)){  //check if increasing green component button is pressed with a RIGHT mouse button, if true do the following
        Gchange = 2;     // if the conditions above are met, turn on the decreasing green component function
      }
      if ((BchangeButton.inside(mouseX, mouseY))  && (mouseButton == RIGHT)){  //check if increasing blue component button is pressed with a RIGHT mouse button, if true do the following
        Bchange = 2;     // if the conditions above are met, turn on the decreasing blue component function
      }
      if(RectangleMode == 1){       // check if the rectangle function is on, if true do the following
            InitialX = mouseX;      // remember the x co-ordinate of the mouse when you first clicked the screen 
            InitialY = mouseY;      // remember the Y co-ordinate of the mouse when you first clicked the screen
      }
      if(StraightMode == 1){        // check if the line function is on, if true do the following
            InitialX = mouseX;      // remember the x co-ordinate of the mouse when you first clicked the screen
            InitialY = mouseY;      // remember the y co-ordinate of the mouse when you first clicked the screen
      }
      if(CircleMode == 1){          // check if the ellipse function is on, if true do the following
            InitialX = mouseX;      // remember the x co-ordinate of the mouse when you first clicked the screen
            InitialY = mouseY;      // remember the y co-ordinate of the mouse when you first clicked the screen
      }
}

// check if the method is performed every frame
void mouseReleased(){
  Rchange = 0;       
  Gchange = 0;
  Bchange = 0;
   if(RectangleMode == 1){
      if (InitialX > 105) {
          if (pmouseX >105){
     rect(InitialX, InitialY, (mouseX - InitialX), (mouseY - InitialY));
   }
      }
         }
   if(CircleMode == 1){
      if (InitialX > 105) {
          if (pmouseX >105){
     ellipseMode(CENTER);
     ellipse(InitialX, InitialY, (mouseX - InitialX)*2.828, (mouseY - InitialY)*2.828);
     fill(250);
     rect( 0, 0, 105, 650);
     fill(RValue, 0, 0);
     text(RValue, 50, 367);
     fill(0, GValue, 0);
     text(GValue, 50, 423);
     fill(0, 0, BValue);
     text(BValue, 50, 477);
     fill(RValue, GValue, BValue);
     rect( 15, 500, 75, 75);
     text("CIRCLE", 5, 55);
     ClearButton.update();
     RectangleButton.update();
     CircleButton.update();
     ScribbleButton.update();
     StraightButton.update();
     RchangeButton.update();
     GchangeButton.update();
     BchangeButton.update();
     RsetButton.update();
     GsetButton.update();
     BsetButton.update();
     EraseButton.update();
     WhiteButton.update();
     BlackButton.update();  
     AirBrushButton.update();
   }
      }
         }     
    if(StraightMode == 1){
      if (mouseX > 105) {
          if (pmouseX >105){
            stroke(RValue, GValue, BValue);
     line(InitialX, InitialY, mouseX, mouseY);
          }
       }
    }
}



// BUTTON CLASS 
class Button {
  int xpos;
  int ypos;
  PImage img;

  Button(int x, int y, String filename) {
    xpos = x;
    ypos = y;
    img = loadImage(filename);
  }

  boolean inside(int x, int y) {
    if (x > xpos) {
      if (x <xpos+img.width) {
        if (y >ypos) {
          if (y <ypos+img.height) {
            return true;
          }
        }
      }
    }
    return false;
  }

  void update() {
    image(img, xpos, ypos);
  }
} // end Button class

