//Background variabled
PImage background;
//Sprite variables
PImage spritePlayer;
PImage spriteBranch;
PImage spriteLives;
//Menu and game variables
int screenState;
//Position Variables
float playerX;
float playerY;
//Arrays
//General Variables
int punts;
int vel;
boolean alive;
Drop[] drops = new Drop[10];
void setup(){
  //Window
  size(1026, 768);
  //Screen state
  screenState = 0;
  //Bringing live to the player
  alive = true;
  //Initial positions
  playerX = 433;
  playerY = 484;
  vel = 4;
  //Bullet and col sounds
  //Creation of rain
  for(int i = 0; i < drops.length; i++){
    drops[i] = new Drop();
  }
  //Sprite loading
  spriteLives = loadImage("images/Sprites/livesFull.png");
  spritePlayer = loadImage("images/Sprites/front-bat-sprite.png");
  //Sprite resize
  spritePlayer.resize(110, 80);
  spriteLives.resize(50, 50);
  imageMode(CENTER);
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
    exit();
  }
  
  if(punts == 5000){
    text("Has acabat!", 300, 300);
    textSize(500);
    exit();
  }
  
  if(alive == false){
    text("Has perdut!", 300, 300);
    textSize(500);
    exit();
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
  if(punts < 3000){
    background = loadImage("images/Backgrounds/environment_forestbackground.png");
    background(background);
  }else if(punts >= 3000){
    background = loadImage("images/Backgrounds/environment_forest_evening.png");
    background(background);
  }
  
  image(spritePlayer, playerX, playerY);
  image(spriteLives, 995, 30);
  for(int i = 0; i < drops.length; i++){
    drops[i].fall();
    drops[i].show();
    drops[i].checkCollisions();
  }
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
//Creació del puntatje
void puntuaJugador(){
  loop();
  punts += 10;
  textSize(30);
  text(punts, 0, 30);
}

//Mouse press actions
void mousePressed(){
  if((mouseX>60) && (mouseY>300) && (mouseX<120) && (mouseY<360)){
    screenState += 1;
  }
}
//Key press action
void keyPressed(){
  if(key == 'a' || key == 'A'){
    playerX -= vel;
  }
  if(key == 's' || key == 'S'){
    playerY += vel;
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
