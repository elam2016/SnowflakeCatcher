float screenSize = 300;
void setup()
{
  //your code here
}
void draw()
{
  //your code here
}
void mouseDragged()
{
  //your code here
}

class Snowflake
{
  int x, y;
  boolean isMoving;//class member variable declarations
  Snowflake()
  {
    x = (int)(Math.random()*screenSize);
    y = (int)(Math.random()*screenSize);
    isMoving = true;
  }
  void show()
  {
    //your code here
  }
  void lookDown()
  {
    if(y < screenSize && y > 0)

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
    //your code here
  }
}
