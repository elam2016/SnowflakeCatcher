int screenSize = 400;
Snowflake [] flakes = new Snowflake[screenSize/10];
boolean catchFlakes = false;
color black = color(0, 0, 0);
void setup()
{
  background(0);
  size(screenSize, screenSize*2);
  for(int f = 0; f < flakes.length; f++)
    flakes[f] = new Snowflake();
}
void draw()
{
  //frameRate(10);
  for(int i = 0; i < flakes.length; i++)
  {
    stroke(0, 0, 0);
    flakes[i].erase();
    flakes[i].lookDown();
    flakes[i].move();
    flakes[i].wrap();
    flakes[i].show();
  }
  if(catchFlakes)
  {
    fill(197);
    noStroke();
    rect(mouseX, mouseY, 20, 5);
  }
}
void mousePressed()
{
  catchFlakes = true;
}
void mouseReleased()
{
  catchFlakes = false;
}

class Snowflake
{
  float flakeX, flakeY, flakeSize;
  boolean isMoving;
  Snowflake()
  {
    flakeX = ((int)(Math.random()*screenSize));
    flakeY = ((int)(Math.random()*screenSize/2));
    flakeSize = (int)(Math.random()*3 + 3);
    isMoving = true;
  }
  void show()
  {
    fill(255);
    ellipse(flakeX, flakeY, flakeSize, flakeSize);
  }
  void lookDown()
  {
    int downward = get((int)flakeX, (int)flakeY + 1);
    if(flakeY < screenSize/2 && flakeY > 0 &&  downward != black)
      isMoving = false;
    else
      isMoving = true;
  }
  void erase()
  {
    fill(0);
    ellipse(flakeX, flakeY, flakeSize, flakeSize);
  }
  void move()
  {
    if(isMoving)
      flakeY++;
  }
  void wrap()
  {
    if(flakeY > screenSize*2 + 1)
      flakeY = 0;
      flakeX = (int)(Math.random()*screenSize);
  }
}
