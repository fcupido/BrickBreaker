class Board
{
  int x;
  int y;
  int Width;

  Board()
  {
    Width = 150;
    y = height - 80;
    x = width / 2 - Width / 2;
  }

  void Draw()
  {
    fill (250);
    rect(x, y, Width, 10);
  }
  void move()
  {

    if (keyPressed && key == CODED)
    {
      if (keyCode == RIGHT && x < width - Width)
        x += 7;
      if (keyCode == LEFT && x > 0)
        x -= 7;
    }
  }
}