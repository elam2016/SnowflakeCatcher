int screenSize = 300;
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
  int x, y;
  boolean isMoving;
  Snowflake()
  {
    x = (int)(Math.random()*screenSize);
    y = (int)(Math.random()*screenSize);
    isMoving = true;
  }
  void show()
  {
    fill(255);
    ellipse(x, y, 5, 5);
  }
  void lookDown()
  {
    if(y < screenSize && y > 0 && get(x,y) != color(0, 0, 0))
      isMoving = false;
    else
      isMoving = true;
  }
  void erase()
  {
    fill(0);
    ellipse(x, y, 7, 7);
  }
  void move()
  {
    if(isMoving)
      y++;
  }
  void wrap()
  {
    if(y > screenSize + 1)
      y = 0;
      x = (int)(Math.random()*screenSize);
  }
}
