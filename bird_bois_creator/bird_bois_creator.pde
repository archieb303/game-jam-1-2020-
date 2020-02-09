//sound
import processing.sound.*;
SoundFile music;
//video
import processing.video.*;
Movie title;

//font setup
PFont font;

//images
PImage instruct;

PImage left;
PImage right;
PImage left1;
PImage right1;
PImage left2;
PImage right2;

PImage dimred;
PImage dimgreen;

PImage[] eyesImg = new PImage[6];
PImage[] plumageImg = new PImage[5];
PImage[] beakImg = new PImage[6];
PImage[] feetImg = new PImage[6];
PImage[] patternImg = new PImage[5];
PImage[] wingsImg = new PImage[5];
PImage[] backgroundImg = new PImage[4];

boolean mouseOverExit = false;
boolean mouseOverfinish = false;
boolean showTitle = true;
boolean showUI = true;
boolean finished = false; //for tracking whether to launch the backgrounds

//contains value of the current selected images
int eyes = 0;
int plumage = 0;
int beak = 0;
int feet = 0;
int pattern = 0;
int wings = 0; 

int randomBG = 0;

String[] attributes = {"eyes", "plumage", "beak", "feet", "pattern", "wings"};
int selectedAttribute = 0; 

void setup() 
{ 
  font = createFont("Pixeled.ttf", 32);
  textFont(font);
  
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
  
  dimred = loadImage("dimred.png");
  dimgreen = loadImage("dimgreen.png");

  left = loadImage("left.png");
  right = loadImage("right.png");
  left1 = loadImage("left1.png");
  right1 = loadImage("right1.png");
  left2 = loadImage("left2.png");
  right2 = loadImage("right2.png");

  title = new Movie(this, "title.MP4");
  title.loop();

  music = new SoundFile(this, "music.mp3");
  music.amp(0.8);
} 

void movieEvent(Movie m) {
  m.read();
}

int x = 0;
int y = 0;

void display(int eyes, int plumage, int beak, int feet, int pattern, int wings) { //drawing the bird
  tint(r,g,b);
  image(loadImage("body.png"), x, y);
  tint(0, 0, 0, 126); 
  image(patternImg[pattern], x, y, 1000, 1000);
  noTint(); 
  image(plumageImg[plumage], x, y, 1000, 1000);
  image(beakImg[beak], x, y);
  image(feetImg[feet], x, y);
  image(eyesImg[eyes], x, y);
  tint(r,g,b);
  image(wingsImg[wings], x, y);
  noTint();
}

int bgX = -170;
int bgY = 100;

int r = 255;
int g = 255;
int b = 255;

void draw() {
  if (showTitle == true) {
    image(title, 0, 0);
    textAlign(CENTER);
    textSize(32);
    fill(0);
    text("Press Any Key To Begin...", 500, 900);
    noFill();
  } else if (showUI == true) {
    x = 0;
    y = 0;
    
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
    
    text("hold 'i' for instructions", 370,200);
    
    text("red", 50,700);
    text("green", 50,800);
    text("blue", 50,900);
    text(r, 300,700);
    text(g, 300,800);
    text(b, 300,900);
    
    image(left,200,620, 150,150);
    image(right,340,620, 150,150);
    
    image(left1,200,720, 150,150);
    image(right1,340,720, 150,150);
    
    image(left2,200,820, 150,150);
    image(right2,340,820, 150,150);
    
    if(mousePressed){
      if(mouseX >= 390 && mouseX <= 420){ // right arrows
          if(mouseY >= 660 && mouseY <= 690){
            r+=1;
            if(r>=255){
              r = 255;
            }
          } 
          if(mouseY >= 760 && mouseY <= 790){
            g+=1;
            if(g >=255){
              g = 255;
            }
          }
          if(mouseY >= 860 && mouseY <= 890){
            b+=1;
            if(b >=255){
              b = 255;
            }
          }
      }
      if(mouseX >= 240 && mouseX <= 270){ // left arrows
          if(mouseY >= 660 && mouseY <= 690){
            r-=1;
            if(r <= 0){
              r = 0;
            }
          } 
          if(mouseY >= 760 && mouseY <= 790){
            g-=1;
            if(g <= 0){
              g = 0;
            }
          }
          if(mouseY >= 860 && mouseY <= 890){
            b-=1;
            if(b <= 0){
              b = 0;
            }
          }
      }
    }
    
    if (mouseY >= 5 && mouseY <= 40) { //eventually add the event to trigger on mouse release, having mousePressed shade the button to show it's pressed
      if (mouseX >= 140 && mouseX <= 170) { //finish
        image(dimgreen,0,0);
        if(mousePressed){
          finished = true;
          showUI = false;
          randomBG = 0;
          image(backgroundImg[randomBG], 0, 0);
          x = bgX;
          y= bgY;
        }
      } 
  
      if (mouseX >= 5 && mouseX <=40) { //exit
        image(dimred,0,0);
        if(mousePressed){
          exit();
        }
      }
  }
}
  if (finished == true) {
    int alpha = 100;
    int alpha2 = 100;
    
    boolean showBack = true;
    
    noTint();
    image(backgroundImg[randomBG], 0, 0, 1000, 1000);
    display(eyes, plumage, beak, feet, pattern, wings);
    
    if(mouseY >= 60 && mouseY <= 110 && mouseX >= 80 && mouseX <= 230){
      alpha = 180;
      if(mousePressed){
        finished = false;
        showUI = true;
      }
    }
    else {alpha = 100;}
    
    if(mouseY >= 60 && mouseY <= 110 && mouseX >= 590 && mouseX <= 930){
      alpha2 = 180;
      if(mousePressed){
        showBack = false;
        saveFrame("bird-##.png"); 
      }
    }
    else {alpha2 = 100;}
    
    if(showBack == true){
      noStroke();
      fill(230,230,230,alpha);
      rect(80,60,150,50);
      
      fill(0,0,0,alpha+60);
      text("back", 100, 100);
    }
    noStroke();
    fill(230,230,230,alpha2);
    rect(590,60,320,50);
    
    fill(0,0,0,alpha2+60);
    text("screenshot", 600, 100);
  }

  if (showTitle == false && musicp == true) {
    music.loop();
    musicp = false;
  }
}


boolean musicp = true;

void keyPressed() {
  showTitle = false;
  
  if(finished == true){
    if (key == CODED) {
      if (keyCode == RIGHT) {
        randomBG = randomBG+1;
        if (randomBG > 2) { //if it gets to the end cycle back to 0
          randomBG = 0;
        }
      if (keyCode == LEFT) {
          randomBG = randomBG -1;
          if (randomBG > 2) { //if it gets to the end cycle back to 0
            randomBG = 0;
          }
        }
      }
    }
  }
  
  if(finished == false){
    if (key == 'i') {
      image(instruct, 0, 0);
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
}
