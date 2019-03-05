PShape asteroid, cat, alien;
float angulo, eyeX, eyeY, eyeZ, centerX, centerY, centerZ, upX, upY, upZ=0;

void setup(){
  size(1080,720, P3D);
  asteroid = loadShape("asteroid.obj");
  cat = loadShape("cat.obj");
  alien= loadShape("alien.obj");
  angulo=0;
  asteroid.scale(.20);
  alien.scale(3);

}

void draw(){
    background(0);

    
      //Propiedades del asteroide & alien
   pushMatrix();
     translate(width/2, height/2);
     rotateZ(radians(angulo)); 
     shape(asteroid, 10, 10);
    // shape(alien);
      //Presionar R para rotar el asteroide en la pantalla
      if(key== 'r') { 
      angulo=angulo+3;
      } 
     
   popMatrix();
    
    //Press SPACE para detener movimiento de la cámara
    resetCamera();
}

void mousePressed() {
    camera(eyeX, eyeY, eyeZ, centerX, centerY, centerZ, upX, upY, upZ);
}

void resetCamera(){
if(key == ' ' ) camera();
}
