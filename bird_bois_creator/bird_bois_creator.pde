//sound
import processing.sound.*;
SoundFile music;
//images
PImage instruct;

PImage[] eyesImg = new PImage[6];
PImage[] plumageImg = new PImage[4];
PImage[] beakImg = new PImage[6];
PImage[] feetImg = new PImage[6];
PImage[] patternImg = new PImage[5];
PImage[] wingsImg = new PImage[5];
PImage[] backgroundImg = new PImage[4];

boolean showTitle = true;
boolean showUI = true;

//contains value of the current selected images
int eyes = 0;
int plumage = 0;
int beak = 0;
int feet = 0;
int pattern = 0;
int wings = 0; 



String[] attributes = {"eyes", "plumage", "beak", "feet", "pattern", "wings"};
int selectedAttribute = 0; 

void setup() 
{ 
  size(1000, 1000);
  //import images and assign them to arraws
  for (int i = 0; i < eyesImg.length; i ++) {
    eyesImg[i] = loadImage("eyes" + i +".png");
  }
  for (int i = 0; i < plumageImg.length; i ++) {
    plumageImg[i] = loadImage("plumage" + i +".png");
  }
  for (int i = 0; i < beakImg.length; i ++) {
    beakImg[i] = loadImage("beak" + i +".png");
  }
  for (int i = 0; i < feetImg.length; i ++) {
    feetImg[i] = loadImage("feet" + i +".png");
  }
  for (int i = 0; i < patternImg.length; i ++) {
    patternImg[i] = loadImage("pattern" + i +".png");
  }
  for (int i = 0; i < wingsImg.length; i ++) {
    wingsImg[i] = loadImage("wings" + i +".png");
  }
  for (int i = 0; i < backgroundImg.length; i ++) {
    backgroundImg[i] = loadImage("bg" + i +".png");
  }
  
  instruct = loadImage("instructions.png");
  
  music = new SoundFile(this, "music.mp3");
  music.amp(0.5);
} 

void display(int eyes, int plumage, int beak, int feet, int pattern, int wings) { //drawing the bird
  image(loadImage("body.png"), 0, 0, 1000, 1000);
  image(eyesImg[eyes], 0, 0, 1000, 1000);
  image(plumageImg[plumage], 0, 0, 1000, 1000);
  image(beakImg[beak], 0, 0, 1000, 1000);
  image(feetImg[feet], 0, 0, 1000, 1000);
  image(patternImg[pattern], 0, 0, 1000, 1000);
  image(wingsImg[wings], 0, 0, 1000, 1000);
}

void draw() {
  if (showTitle == true) {
    image(loadImage("title.png"), 0, 0, 1000, 1000);
    textAlign(CENTER);
    textSize(50);
    fill(0);
    text("Press Any Key To Begin...", 500, 900);
    noFill();
  } else if (showUI == true) {
    image(loadImage("ui.png"), 0, 0, 1000, 1000);
    if (selectedAttribute == 0) {
      image(eyesImg[eyes], -400, -300, 900, 900);
    }
    if (selectedAttribute == 1) {
      image(plumageImg[plumage], -120, -50, 600, 600);
    }
    if (selectedAttribute == 2) {
      image(beakImg[beak], -400, -300, 900, 900);
    }
    if (selectedAttribute == 3) {
      image(feetImg[feet], -400, -400, 900, 900);
    }
    if (selectedAttribute == 4) {
      image(patternImg[pattern], -300, -150, 700, 700);
    }
    if (selectedAttribute == 5) { 
      image(wingsImg[wings], -250, -200, 700, 700);
    }
    textAlign(LEFT);
    textSize(30);
    fill(0);
    text("Choose your "+attributes[selectedAttribute], 20, 420);
    noFill();
    display(eyes, plumage, beak, feet, pattern, wings);
  } else {

    noTint();
    image(backgroundImg[1], 0, 0, 1000, 1000);
    //tint(0,0,0);
    //  display(eyes, plumage, beak, feet, pattern, wings);
  }
  
  if(showTitle == false && musicp == true){
    music.play();
    musicp = false;
  }
}

boolean musicp = true;

void keyPressed() {
  showTitle = false;
  
  if (key == 'i'){
    image(instruct,0,0);
  }
 
  if (key == CODED) {
    
    //up/down to change what attribute is selected
    if (keyCode == UP) {
      selectedAttribute = selectedAttribute+1;
      if (selectedAttribute > 5) { //if it gets to the end cycle back to 0
        selectedAttribute = 0;
      }
    }
    if (keyCode == DOWN) {
      selectedAttribute = selectedAttribute-1;
      if (selectedAttribute < 0) { //if it gets to 0 cycle back to 5
        selectedAttribute = 5;
      }
    }
  }

  //left/right to change the eyes
  if (selectedAttribute == 0) {
    if (keyCode == LEFT) {
      eyes = eyes+1;
      if (eyes > eyesImg.length-1) { //if it gets to the end cycle back to 0
        eyes = 0;
      }
    }
    if (keyCode == RIGHT) {
      eyes = eyes-1;
      if (eyes < 0) { //if it gets to 0 cycle back to 5
        eyes = eyesImg.length - 1;
      }
    }
  }


  //left/right to change the plumage
  if (selectedAttribute == 1) {
    if (keyCode == LEFT) {
      plumage = plumage+1;
      if (plumage > plumageImg.length-1) { //if it gets to the end cycle back to 0
        plumage = 0;
      }
    }
    if (keyCode == RIGHT) {
      plumage = plumage-1;
      if (plumage < 0) { //if it gets to 0 cycle back to 5
        plumage = plumageImg.length-1;
      }
    }
  }

  //left/right to change the beak
  if (selectedAttribute == 2) {
    if (keyCode == LEFT) {
      beak = beak+1;
      if (beak > beakImg.length-1) { //if it gets to the end cycle back to 0
        beak = 0;
      }
    }
    if (keyCode == RIGHT) {
      beak = beak-1;
      if (beak< 0) { //if it gets to 0 cycle back to 5
        beak= beakImg.length-1;
      }
    }
  }


  //left/right to change the feet
  if (selectedAttribute == 3) {
    if (keyCode == LEFT) {
      feet = feet+1;
      if (feet > feetImg.length-1) { //if it gets to the end cycle back to 0
        feet = 0;
      }
    }
    if (keyCode == RIGHT) {
      feet = feet-1;
      if (feet< 0) { //if it gets to 0 cycle back to 5
        feet= feetImg.length-1;
      }
    }
  }


  ////left/right to change the pattern
  if (selectedAttribute == 4) {
    if (keyCode == LEFT) {
      pattern = pattern+1;
      if (pattern > patternImg.length-1) { //if it gets to the end cycle back to 0
        pattern = 0;
      }
    }
    if (keyCode == RIGHT) {
      pattern = pattern-1;
      if (pattern< 0) { //if it gets to 0 cycle back to 5
        pattern= patternImg.length-1;
      }
    }
  }


  //left/right to change the wings
  if (selectedAttribute == 5) {
    if (keyCode == LEFT) {
      wings = wings+1;
      if (wings > wingsImg.length-1) { //if it gets to the end cycle back to 0
        wings = 0;
      }
    }
    if (keyCode == RIGHT) {
      wings = wings-1;
      if (wings< 0) { //if it gets to 0 cycle back to 5
        wings= wingsImg.length-1;
      }
    }
  }
}
