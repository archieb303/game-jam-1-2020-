PImage[] eyesImg = new PImage[1];
PImage[] plumageImg = new PImage[1];
PImage[] beakImg = new PImage[1];
PImage[] feetImg = new PImage[1];
PImage[] patternImg = new PImage[1];
PImage[] wingsImg = new PImage[1];

//contains value of the current selected images
int eyes = 0;
int plumage = 0;
int beak = 0;
int feet = 0;
int pattern = 0;
int wings = 0; 

int selectedAttribute =0; 

void setup() 
{
  size(1280, 1280);
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
} 

void display(int eyes, int plumage, int beak, int feet, int pattern, int wings) { //drawing the bird
  image(eyesImg[eyes], 0, 0);
  image(plumageImg[plumage], 0, 0);
  image(beakImg[beak], 0, 0);
  image(feetImg[feet], 0, 0);
  image(patternImg[pattern], 0, 0);
  image(wingsImg[wings], 0, 0);
}

void draw()
{
  display(eyes, plumage, beak, feet, pattern, wings);
}

void keyPressed() {
  if (keyCode == CODED) {

    //up/down to change what attribute is selected
    if (keyCode == UP) {
      selectedAttribute = selectedAttribute+1;
      if (selectedAttribute > 5) { //if it gets to the end cycle back to 0
        selectedAttribute = 0;
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
        if (eyes > eyesImg.length) { //if it gets to the end cycle back to 0
          eyes = 0;
        }
        if (keyCode == RIGHT) {
          eyes = eyes-1;
          if (eyes < 0) { //if it gets to 0 cycle back to 5
            eyes = eyesImg.length;
          }
        }
      }
    }

    //left/right to change the plumage
    if (selectedAttribute == 1) {
      if (keyCode == LEFT) {
        plumage = plumage+1;
        if (plumage > plumageImg.length) { //if it gets to the end cycle back to 0
          plumage = 0;
        }
        if (keyCode == RIGHT) {
          plumage = plumage-1;
          if (plumage < 0) { //if it gets to 0 cycle back to 5
            plumage = plumageImg.length;
          }
        }
      }
    }

    //left/right to change the beak
    if (selectedAttribute == 2) {
      if (keyCode == LEFT) {
        beak = beak+1;
        if (beak > beakImg.length) { //if it gets to the end cycle back to 0
          beak = 0;
        }
        if (keyCode == RIGHT) {
          beak = beak-1;
          if (beak< 0) { //if it gets to 0 cycle back to 5
            beak= beakImg.length;
          }
        }
      }
    }

    //left/right to change the feet
    if (selectedAttribute == 3) {
      if (keyCode == LEFT) {
        feet = feet+1;
        if (feet > feetImg.length) { //if it gets to the end cycle back to 0
          feet = 0;
        }
        if (keyCode == RIGHT) {
          feet = feet-1;
          if (feet< 0) { //if it gets to 0 cycle back to 5
            feet= feetImg.length;
          }
        }
      }
    }

    //left/right to change the pattern
    if (selectedAttribute == 4) {
      if (keyCode == LEFT) {
        pattern = pattern+1;
        if (pattern > patternImg.length) { //if it gets to the end cycle back to 0
          pattern = 0;
        }
        if (keyCode == RIGHT) {
          pattern = pattern-1;
          if (pattern< 0) { //if it gets to 0 cycle back to 5
            pattern= patternImg.length;
          }
        }
      }
    }

    //left/right to change the wings
    if (selectedAttribute == 5) {
      if (keyCode == LEFT) {
        wings = wings+1;
        if (wings > wingsImg.length) { //if it gets to the end cycle back to 0
          wings = 0;
        }
        if (keyCode == RIGHT) {
          wings = wings-1;
          if (wings< 0) { //if it gets to 0 cycle back to 5
            wings= wingsImg.length;
          }
        }
      }
    }
  }
}
