int screenSize = 400;
Snowflake [] flakes = new Snowflake[screenSize/15];
void setup()
{
  size(screenSize, screenSize);
  for(int f = 0; f < flakes.length; f++)
    flakes[f] = new Snowflake();
}
void draw()
{
  background(0);
  frameRate(10);
  for(int i = 0; i < flakes.length; i++)
  {
    flakes[i].erase();
    flakes[i].lookDown();
    flakes[i].move();
    flakes[i].wrap();
    flakes[i].show();
  }
}
void mouseClicked()
{
  fill(197);
  rect(mouseX, mouseY, 5, 1);
}

class Snowflake
{
  float flakeX, flakeY, flakeSize;
  boolean isMoving;
  Snowflake()
  {
    flakeX = ((int)(Math.random()*screenSize));
    flakeY = ((int)(Math.random()*screenSize));
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
    if(flakeY < screenSize && flakeY > 0 && get((int)flakeX,(int)flakeY) != color(0, 0, 0))
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
    if(flakeY > screenSize + 1)
      flakeY = 0;
      flakeX = (int)(Math.random()*screenSize);
  }
}
