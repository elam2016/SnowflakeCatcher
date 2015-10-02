int screenSize = 400;
Snowflake [] flakes = new Snowflake[screenSize/10];
Catcher [] catchFlakes = new Catcher[4000];
color black = color(0, 0, 0);

void setup()
{
  background(0);
  size(screenSize, screenSize*2);
  for(int f = 0; f < flakes.length; f++)
    flakes[f] = new Snowflake();
  for(int cF = 0; cF < catchFlakes.length; cF++)
    catchFlakes[cF] = new Catcher(mouseX, mouseY);
}
void draw()
{
  background(0);
  //frameRate(10);
  for(int i = 0; i < flakes.length; i++)
  {
    if(flakes[i]!=null)
    {
      stroke(0, 0, 0);
      flakes[i].lookDown();
      flakes[i].move();
      flakes[i].wrap();
      flakes[i].show();
    }
  }
  for(int c = 0; c < catchFlakes.length; c++)
  {
    if(catchFlakes[c]!=null)
    {
      stroke(0, 0, 0);
      catchFlakes[c].show();
    }
  }
}
int catchNum = 0;
void mouseDragged()
{
  if(mouseButton == LEFT)
  {
    catchFlakes[catchNum] = new Catcher(mouseX, mouseY);
    catchNum++;
  }
}
class Catcher
{
  int catcherX, catcherY;
  Catcher(int x, int y){
    this.catcherX = x;
    this.catcherY = y;
  }
  void show()
  {
    fill(197);
    noStroke();
    rect(catcherX, catcherY, 20, 5);
  }
}

class Snowflake
{
  int flakeX, flakeY, flakeSize;
  boolean isMoving;
  Snowflake()
  {
    flakeX = ((int)(Math.random()*screenSize));
    flakeY = ((int)(Math.random()*screenSize/2));
    flakeSize = (int)(Math.random()*8 + 5);
    isMoving = true;
  }
  void show()
  {
    noStroke();
    fill(255);
    ellipse(flakeX, flakeY, flakeSize, flakeSize);
  }
  void lookDown()
  {
    int downward = get((int)flakeX, (int)(flakeY + flakeSize));
    int rightSide = get((int)(flakeX + flakeSize), (int)(flakeY + flakeSize));
    int leftSide = get((int)(flakeX - flakeSize), (int)(flakeY + flakeSize));
    if(flakeY < screenSize/2 && flakeY > 0 && downward != black && rightSide != black && leftSide != black)
      isMoving = false;
    else
      isMoving = true;
  }
  void move()
  {
    if(isMoving)
      flakeY++;
    else
      flakeY+=0;
  }
  void wrap()
  {
    if(flakeY > screenSize*2 + 1)
    {
      flakeY = 0;
      flakeX = (int)(Math.random()*screenSize);
    }
  }
}
