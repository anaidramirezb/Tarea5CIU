import processing.sound.*;


SoundFile sonido; 
PShape asteroid, cat, rosa;
PImage fondo;
float angulo, anguloY, anguloX;
float eyeX, eyeY, eyeZ;
float angY = 0;
float angX=0;
int distanceZ = 800;
Drop[] drops= new Drop[1000];
String instr= "Controles: \n";
String texto= " \n " + "Para rotar en X: 't' \n Para rotar en Y: 'e' \n Para rotar en Z: 'r'"+
              " \n "+ "Control de la cámara: UP, DOWN, RIGHT, LEFT"+
              " \n " +"La luz se controla al presionar el MOUSE  " +
              " \n ";
String insp= "Inspired on Antoine de Saint-Exupéry's 'Le Petit Prince' " ;

void setup(){
  size(1350,708, P3D);
  asteroid = loadShape("asteroid.obj");
  rosa= loadShape("rose2.obj");
  fondo= loadImage("fondo.png");
  angulo=0; anguloY=0; anguloX=0;
  asteroid.scale(.20);
  rosa.scale(3);
  eyeX = width/10;
  eyeY = height/8;
  eyeZ = distanceZ;
  for(int i=0; i<drops.length; i++ ){
  drops[i]= new Drop();
  }
  //Canción 
sonido = new SoundFile(this,"song.mp3");
sonido.play();

}

void draw(){
    background(fondo);

//lights
   if(mousePressed){
  float val=(float)mouseX/(float)width*(float)255;
ambientLight((int)val,val,val);
directionalLight(250,255,255,0,1,0);
directionalLight(250,255,255,0,1,-1);
}else{
lights();
}
camera(eyeX, eyeY, eyeZ, width/2, height/2, 0, 0, 1, 0);
//text
pushMatrix();
   createFont("Tahoma", 14); 
   text(instr, 30, 100,0);
   text(texto, 30, 100,0);
   textSize(20);
   text(insp,width/2-100, 50);
popMatrix();

//asteroid's movements
   pushMatrix();
     translate(width/2, height/2);
     rotateZ(radians(angulo)); 
     rotateY(radians(anguloY));
     rotateX(radians(anguloX));
     shape(asteroid, 10, 10);
     
// roses are red, violets are blue
    pushMatrix();
     rotateX(90);
     rotateZ(90);
     translate(120,0,-10);
     shape(rosa); 
    popMatrix();
    
//november rain
for(int i=0; i<drops.length; i++ ){
  drops[i].show();
  drops[i].fall();
  }

   popMatrix();
//Move angles
if (keyPressed) {
      if(key== 'r') { 
      angulo=angulo+3;
      } 
       if(key== 'e') { 
      anguloY=anguloY+3;
      } 
      if(key== 't') { 
      anguloX=anguloX+3;
      } 
      
    resetCamera();
    cameras();
}
}

void resetCamera(){
if(key == ' ' ) camera(width/2.0, height/2.0, (height/2.0) / tan(PI*30.0 / 180.0), width/2.0, height/2.0, 0, 0, 1, 0);
}

void cameras() {
if (keyPressed) {
    if (keyCode == UP) {
      angY += 5;
    }
    if (keyCode == DOWN) {
      angY -= 5;
    } 
    if (keyCode == LEFT) {
      angX += 5;
    }
    if (keyCode == RIGHT) {
      angX -= 5;
    } 
  if (angY>=360) angY=0;
  
  eyeY = (height/2)-distanceZ*(sin(radians(angY)));
  eyeX= (width/2)-distanceZ*(sin(radians(angX)));
  eyeZ = distanceZ*cos(radians(angY));
}
}
