/*
class ball
 
 */

class Ball
{
  float diameter;

  Point center;
  float top;
  float bottom;
  float right;
  float left; 

  float vx;
  float vy;

  // x and y arguments are the center of the ball
  // all other parameters are set based on the diameter
  Ball (float x, float y)
  {
    diameter = 35;

    center = new Point (x, y);

    //top = y - diameter / 2;
    //bottom =  y + diameter / 2;
    //right = x + diameter / 2;
    //left = x - diameter / 2;

    vx =7;
    vy =7;
  }

  void Draw ()
  {
    fill(255);
    ellipse (center.x, center.y, diameter, diameter);
  }


  // move adjuts all the parameters of the ball
  void move()
  {
    center.x += vx;
    center.y += vy;
    top = center.y - diameter / 2;
    bottom =  center.y + diameter / 2;
    right = center.x + diameter / 2;
    left = center.x - diameter / 2;
  }
  void bounce()
  {
    if (right >= width) {
      vx = - abs(vx);
    }
    if (left <= 0) {
      vx = abs(vx);
    }
    if (top <= 0) {
      vy = abs(vy);
    }
    if (bottom >= height) {
    game.ballOut();
    }
    if (bottom >= game.board.y - vy /2 && bottom <= game.board.y + vy / 2)
    {
      if (center.x >= game.board.x && center.x <= game.board.x + game.board.Width)
      {
        vy = - abs(vy);
      }
    }
  }
}