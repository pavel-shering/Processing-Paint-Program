/* this program loads images from a deck of cards into an array 
   and shuffles the deck.  A button is used to cycle through to the next card
   in the deck. discard jokers
/*
TITLE: Card Intuition
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


// CONSTANTS
// suits - in the order that they appear in the deck image
final int CLUBS = 0;   
final int DIAMONDS = 1;
final int SPADES = 2;
final int HEARTS = 3;


// VARIABLES and OBJECTS
PImage img;
int cardCount=54;           // 54 cards in the image 
int imageWidth;             // wighth of the card image
PImage deck_images[] = new PImage[cardCount];   // images of the cards
Button highButton;          // high button obejct is created through the button class
Button lowButton;           // low button obejct is created through the button class
Button tieButton;

card Deck[];                // the playing deck of cards
int current = 0;            // current position in the deck
int delayCount = 0;          
PFont font;                 // font for the whole program
int command = 0;             
int oldCommand = 0;
int reference;
int temp;                  // variable for the postion of the first card
float percentage;           // variable for the precentage correct guesses 
float correct;              // total correct guesses
float total;                // total guesses
boolean start = false;      


// MAIN PROGRAM
// initial setup of the screen
void setup() {          
  size(400, 400);          // set window size to 400 x 400 pixels
  background(100);         // background color grey 
  frameRate(30);           // set the frame rate to 30

  // for font
  font = loadFont("Arial-Black-32.vlw");       // set the font to use for display
  textFont(font); 

  // for buttons;
  highButton = new Button(10, 200, "HighButton.JPG"); // make new button, the high button
  lowButton = new Button(120, 200, "LowButton.JPG");  // make new button, the lo button
  tieButton = new Button(230, 200, "TieButton.jpg");
  // prepare deck of cards
  loadImages();    // load the card images
  cardCount = 52;  // now only look at the first 52 cards - no jokers 
  loadDeck();      // load the deck of cards
  shuffleDeck();   // suffles the deck of cards
  current = 0;     // sets the postion to equal zero in the start of the game
  correct = 0;     // sets the number of correct guesses to zero at the start fo teh game
  percentage = 0;  // sets the percentage to zero at the start of th game
  total = 0;       // sets the total numebr of guesses to zero at the start of the game
}

// update the screen every frame
void draw() {
  text("Card Intuition", 10, 50);     // display the title of the game at the top of the windom
  image(Deck[current].img, 50, 50);   // show the current card
  highButton.update();                // constantly update the conditions of high button every frame
  lowButton.update();                 // constantly update the conditions of low button every frame
  tieButton.update();
  
  if (current == 51){                 // checks if the game is at the 51st card, if true do the following
    background(100);                  // updates the background, to cover everything up
    text("Your Total Correct ...", 20, 200);  // displays the words "Your Total Correct.."
    text(round(percentage) + "%", 160, 250);  // displays you final percentage of correct guesses
  }
}

// check if the method is performed every frame
void mousePressed() { 
  // check if buttons were pressed here...
  if (highButton.inside(mouseX, mouseY) && (current != 51)) // check if the mouse co-ordinates are on the high button and if the amount of cards shown are less than or equal to 51, if true do the following
    {
    background(100); // refresh the background to avoid the text over text mess
    text("HIGHER!", 10, 285); // displays the choice made by the player, in this case the play chose higher
    temp = current; // remember the card previous to the guess
    current++;       // show the next card
    total++;         // increase the total amount guesses by one
     
  if (Deck[temp].value < Deck[current].value){ // check if the value of the previous card is less than the value of the next card, if true do the following 
    correct ++;     // increase the amount of correct guesses by one
    text("CORRECT!", 10, 315);               // display that the player had made the correct choice
    }
   else {            // if the value of the previous card is greater than the value of the next card, do the following
      text("INCORRECT!", 10, 315);             // display that the player had made the correct choice
    }
  percentage = ((correct/total)*100);      // calculate the percentage so far, by dividing the amount of correct guesses by the amount of total guesses
  text(round(percentage) + "%", 320, 315); // display the rounded percentage to the player, only showing teh integer value without decimals  
  }
  else if (lowButton.inside(mouseX, mouseY)&& (current != 51))   // check if the mouse co-ordinates are on the low button and if the amount of cards shown are less than or equal to 51, if true do the following
  {  
    background(100);  // refresh the background to avoid the text over text mess
    text("LOWER!", 10, 285);  // displays the choice made by the player, in this case the play chose lower
    temp = current;  // remember the card previous to the guess
    current ++;
    total++;         // increase the total amount guesses by one
    
    if (Deck[temp].value > Deck[current].value){ // check if the value of the previous card is greater than the value of the next card, if true do the following
       correct ++;     // increase the amount of correct guesses by one
       text("CORRECT!", 10, 315);               // display that the player had made the correct choice   
    }
    else {           // if the value of the previous card is less than the value of the next card, do the following
      text("INCORRECT!", 10, 315);             // display that the player had made the correct choice
    }
   percentage = ((correct/total)*100);      // calculate the percentage so far, by dividing the amount of correct guesses by the amount of total guesses
   text(round(percentage) + "%", 320, 315); // display the rounded percentage to the player, only showing teh integer value without decimals  
  }
  else if(tieButton.inside(mouseX,mouseY) && (current!= 51))
  {
    background(100);  // refresh the background to avoid the text over text mess
    text("TIE!", 10, 285);  // displays the choice made by the player, in this case the play chose lower
    temp = current;  // remember the card previous to the guess
    current ++;
    total++;    
  if (Deck[temp].value == Deck[current].value){ // check if the value of the previous card is greater than the value of the next card, if true do the following
       correct ++;     // increase the amount of correct guesses by one
       text("CORRECT!", 10, 315);               // display that the player had made the correct choice   
    }
    else {           // if the value of the previous card is less than the value of the next card, do the following
      text("INCORRECT!", 10, 315);             // display that the player had made the correct choice
    }
   percentage = ((correct/total)*100);      // calculate the percentage so far, by dividing the amount of correct guesses by the amount of total guesses
   text(round(percentage) + "%", 320, 315); // display the rounded percentage to the player, only showing teh integer value without decimals  
  }
}// end the method


// Functions

/********************************************************************
 * loadImages() function is used to load all the card images from file
 ********************************************************************/
void loadImages() {
  // load images of cards
  img = loadImage("playingcards_strip54.png");
  imageWidth = img.width/cardCount;  // width of each frame in the image
  for (int i=0; i<cardCount;i++) {
    deck_images[i] = createImage(imageWidth, img.height, ARGB);
    deck_images[i].copy(img, i*imageWidth, 0, imageWidth, img.height, 0, 0, imageWidth, img.height);
  }
}

/********************************************************************
 * loadDeck() - this function will load the deck with cards - no shuffling here
 ********************************************************************/
void loadDeck() {
  // this Deck will be our playing deck
  Deck = new card[cardCount];   // make an array of 52 cards
  // load the Deck one card at a time (unshuffled at first)
  current = 0;
  // load the suit: CLUBS
  for (int i=0;i<13;i++) {
    PImage c = deck_images[current];
    Deck[current] = new card(i, CLUBS, c);
    current++;  // move to the next card in the deck
  }
  // load the suit: DIAMONDS
  for (int i=0;i<13;i++) {
    PImage c = deck_images[current];
    Deck[current] = new card(i, DIAMONDS, c);
    current++;  // move to the next card in the deck
  }
  // load the suit: SPADES
  for (int i=0;i<13;i++) {
    PImage c = deck_images[current];
    Deck[current] = new card(i, SPADES, c);
    current++;  // move to the next card in the deck
  }
  // load the suit: HEARTS
  for (int i=0;i<13;i++) {
    PImage c = deck_images[current];
    Deck[current] = new card(i, HEARTS, c);
    current++;  // move to the next card in the deck
  }
}

/********************************************************************
 * shuffleDeck() - this function shuffles a loaded deck by swapping 
 *                 the position of cards 200 times
 ********************************************************************/
void shuffleDeck() {
  // now shuffle the deck
  for (int i=0; i<200; i++) {  // swap cards 200 times
    int ran1 = int(random(0, cardCount));
    int ran2 = int(random(0, cardCount));
    card temp = Deck[ran1];  // remember what card is at ran1
    Deck[ran1] = Deck[ran2]; // now swap those cards
    Deck[ran2] = temp;
  }
}


// classes
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

class card {
  int value;
  int suit;
  PImage img;

  card(int v, int s, PImage cardImage) { 
    value = v;  // gives each card a value 
    suit = s;
    img = cardImage;
 
  }
} // end card class