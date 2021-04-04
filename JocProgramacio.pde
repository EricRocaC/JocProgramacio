//Background variable
PImage background;
//Sprite variables
PImage spritePlayer;
PImage spriteBranch;
//Menu and game variables
int screenState;
//Position Variables
float playerX;
float playerY;
float[] branchX;
//Arrays
PImage[] branches;
//General Variables
int punts;
int vel;
int branchSpeed;
int branchY;
float diameter;
boolean alive;
void setup(){
  //Window
  size(1026, 768);
  //Screen state
  screenState = 0;
  //Bringing live to the player
  alive = true;
  //Initial positions
  playerX = 433;
  playerY = 284;
  vel = 4;
  //Bullet and col sounds
  //Limit of branches
  branches = new PImage[10];
  //Base velocity and X/Y position of branches
  branchSpeed = 1;
  branchY = 0;
  branchX = new float[10];
  //Sprite loading
  spritePlayer = loadImage("images/Sprites/front-bat-sprite.png");
  spriteBranch = loadImage("images/Sprites/branch.png");
  //Sprite resize
  spritePlayer.resize(100, 75);
  spriteBranch.resize(180, 80);
}

void draw(){
  if(screenState == 0){
    drawMenu();
  }else if(screenState >= 1){
    drawGame();
  }
  
  limitPantalla();
  //Si el jugador a mort, acabem el joc
  if(alive == false){
    noLoop();
  }
}
//Creem el menú
void drawMenu(){
  background = loadImage("images/Backgrounds/forest_background.png");
  background(background);
  textSize(30);
  text("Start", 60, 360);
}
//Creem el joc
void drawGame(){
  if(punts < 5000){
    background = loadImage("images/Backgrounds/environment_forestbackground.png");
    background(background);
  }else if(punts >= 5000){
    background = loadImage("images/Backgrounds/environment_forest_evening.png");
    background(background);
  }
  
  image(spritePlayer, playerX, playerY);
  funcionamentBranques();
  puntuaJugador();
}
//Limitem el moviment del jugador per a que no surti de la pantalla
void limitPantalla(){
  if (playerY>678){
    playerY = 678-1;
  }
  if (playerX>926){
     playerX = 926-1;
  }if (playerY<0){
    playerY = 0+1;
  }
  if (playerX<0){
     playerX = 0+1;
  }         
}
void display(){
  //Creem la branca
  for(int i = 0; i < branches.length; i++){
    branchX[i] = random(0, 850);
    ellipse(branchX[i], branchY, 0, 0);
    image(spriteBranch, branchX[i], branchY);
    branches[i] = spriteBranch;
  }
  
}
//Creem les branques constantment
void descend(){
  loop();
  //Li posem una velocitat inicial a la caiguda de les branques
  if(branchY > 926){
    branchY = 0;
  }else{
    branchY += branchSpeed;
  }
  
}
void funcionamentBranques(){
  //Fem que caigui la branca
  display();
  descend();
  //Augmentem la dificultat de joc a mesura que el jugador aconsegeix més punts
  if(punts >= 1000 && punts <= 2000){
    branchSpeed *= 2;
  }else if(punts >= 2000 && punts <= 3000){
    branchSpeed *= 2;
  }else if(punts >= 3000 && punts <= 4000){
    branchSpeed *= 2;
  }
  else if(punts >= 4000 && punts <= 5000){
    branchSpeed *= 2;
  }else{
    branchSpeed *= 4;
  }
}

void puntuaJugador(){
  loop();
  punts += 10;
  textSize(30);
  text(punts, 0, 30);
}

//Press actions
void mousePressed(){
  if((mouseX>60) && (mouseY>300) && (mouseX<120) && (mouseY<360)){
    screenState += 1;
  }
}

void keyPressed(){
  if(key == 'a' || key == 'A'){
    playerX -= vel;
  }
  if(key == 's' || key == 'S'){
    playerY += vel;
    spritePlayer = loadImage("images/Sprites/front-bat-sprite.png");
    spritePlayer.resize(100, 75);
    /*if(playerY%2 == 0){
      spritePlayer = loadImage("images/Sprites/front-bat-sprite.png");
    }else{
    }*/
  }
  if(key == 'd' || key == 'D'){
    playerX += vel;
  }
  if(key == 'w' || key == 'W'){
    playerY -= vel;
    /*if(playerY%2 == 0){
    }else{
    }*/
  }
}
