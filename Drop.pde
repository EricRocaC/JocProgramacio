class Drop{
  float x = random(width);
  float y = random(-100, -50);
  float z = random(0, 20);
  float yspeed = map(z, 0, 20, 10, 20);
  float len = map(z, 0, 20, 7, 15);
  
  void fall(){
    
    if(punts <= 1000){
      y = y + yspeed;
      yspeed = yspeed + 0.50;
    }else if(punts >= 1000){
      y = y + yspeed;
      yspeed = yspeed + 2.50;
    }else if(punts >= 3000){
      y = y + yspeed;
    yspeed = yspeed + 3.00;
    }
    
    if(y > height){
      y = random(-200, -100);
      yspeed = map(z, 0, 20, 7, 15);
    }
  }
  
  void show(){
    float thick = map(z, 0, 20, 1, 3);
    strokeWeight(thick);
    stroke(138, 42, 226);
    line(x,y,x,y+len);
  }
  // Colisió dels dos objectes

  void checkCollisions(){
    float dx = playerX - x;

    float dy = playerY - y;

    float d = sqrt(sq(dx)+sq(dy)); // distància entre els objectes

    if (d < spritePlayer.width/4+spritePlayer.width/4) {
      spriteLives = loadImage("images/Sprites/noLive.png");
      spriteLives.resize(50, 50);
      alive = false;
    }
  }
}
