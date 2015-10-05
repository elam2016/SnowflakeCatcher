int screenSize = 400;
Snowflake [] flakes = new Snowflake[screenSize + 100];
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
  for(int c = 0; c < catchFlakes.length; c++)
  {
    if(catchFlakes[c]!=null)
    {
      stroke(0, 0, 0);
      catchFlakes[c].show();
    }
  }
  for(int i = 0; i < flakes.length; i++)
  {
    if(flakes[i]!=null)
    {
      flakes[i].show();
    }
  }
  for(int i = 0; i < flakes.length; i++)
  {
    if(flakes[i]!=null)
    {
      flakes[i].move();
    }
  }
  for(int i = 0; i < flakes.length; i++)
  {
    if(flakes[i]!=null)
    {
      flakes[i].wrap();
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
  Snowflake()
  {
    flakeX = ((int)(Math.random()*screenSize - 10) + 10);
    flakeY = ((int)(Math.random()*screenSize/4));
    flakeSize = (int)(Math.random()*5 + 5);
  }
  void show()
  {
    noStroke();
    fill(255);
    ellipse(flakeX, flakeY, flakeSize, flakeSize);
  }
  void move()
  {
    int downward = get(flakeX, (flakeY + 5));
    int rightSide = get((flakeX + 5), (flakeY + 5));
    int leftSide = get((flakeX - 5), (flakeY + 5));
    if(downward == black && rightSide == black && leftSide == black)
      flakeY+= ((int)(Math.random()*3) + 1);
    else
    {
      flakeY+= 0;
    }
  }
  void wrap()
  {
    if(flakeY > screenSize*2 - 10)
    {
      flakeY = 0;
      flakeX = (int)(Math.random()*screenSize);
    }
  }
}
