String dataDir    = "../../data/";

int canvasWidth   = 3840;
int canvasHeight  = 2160;

Turtle turtle = new Turtle();

void settings(){
  size(canvasWidth, canvasHeight);
}

void setup(){
  background(0);
}


void draw(){
    surface.setTitle(str(frameCount));
    if (frameCount % 8192 == 0){
      noLoop();
      save(str(frameCount) + ".png");
    }


  for (int i = 0; i < 256; i++){
    String hexNum = hex(round(random(0, 255)), 2);
    String binString = binary(unhex(hexNum), 8);


    for (int j = 7; j > 0; j-=2){
      int x = (binString.charAt(j-1) == '0') ? -1 : 1;
      int y = (binString.charAt(j)   == '0') ? -1 : 1;
      PVector pos = turtle.position;
      if ( pos.x + x < 0)               { x = 0; }
      if ( pos.x + x > canvasWidth-1)   { x = 0; }
      if ( pos.y + y < 0)               { y = 0; }
      if ( pos.y + y > canvasHeight-1)  { y = 0; }

      turtle.move(new PVector(x,  y));
      turtle.show();

    }
  }
}

void mouseClicked(){
  save(str(frameCount) + ".png");
}


class Turtle{
  PVector position = new PVector(canvasWidth/2, canvasHeight/2);
  void move(PVector direction){
    position.add(direction);

  }

  void show(){
    stroke(255, 16);
    point(position.x, position.y);
  }
}
