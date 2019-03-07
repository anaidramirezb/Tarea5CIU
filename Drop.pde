class Drop{
  float y=random(-height*3, -height);
  float x= random(-width*3, width*3);
  float z= random(0,-300);
  float yspeed =random(10,20);
void fall(){
y= y+yspeed;
yspeed = yspeed+.2;
if(y>height+500){
y= random(-height*3, -height);
yspeed =random(4,10);
z= random(0,-300);
}
}
void show(){
  stroke(255,225,46);
  line(x,y,x,y+5);
}
}
