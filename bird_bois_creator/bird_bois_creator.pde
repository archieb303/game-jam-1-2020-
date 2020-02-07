PImage[] eyesImg = new PImage[1];
PImage[] plumageImg = new PImage[1];
PImage[] beakImg = new PImage[1];
PImage[] feetImg = new PImage[1];
PImage[] patternImg = new PImage[1];
PImage[] wingsImg = new PImage[1];

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



class Bird { 
  int eyes, plumage, beak, feet, pattern, wings; //bird attributes

  Bird(int a, int b, int c, int d, int e, int f) { //contstructor method
    eyes = a;
    plumage = b;
    beak = c;
    feet = d;
    pattern = e;
    wings = f;
  }

  void display() { //drawing the bird
    image(eyesImg[eyes], 0, 0);
    image(plumageImg[plumage], 0, 0);
    image(beakImg[beak], 0, 0);
    image(feetImg[feet], 0, 0);
    image(patternImg[pattern], 0, 0);
    image(wingsImg[wings], 0, 0);
  }
}

void draw()
{
  image(eyesImg[0], 0, 0);
}
