/* //<>//
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

  boolean magnetized;

  // x and y arguments are the center of the ball
  // all other parameters are set based on the diameter
  Ball (float x, float y)
  {
    diameter = 35;
    magnetized = true;
    center = new Point (x, y);

    //top = y - diameter / 2;
    //bottom =  y + diameter / 2;
    //right = x + diameter / 2;
    //left = x - diameter / 2;

    vx =7;
    vy =-7;
  }

  void Draw ()
  {
    fill(255);
    ellipse (center.x, center.y, diameter, diameter);
  }


  // move adjuts all the parameters of the ball
  void move()
  {
    if (magnetized)
    {
      center.x = game.board.x + game.board.Width / 2 + 15;
      center.y = game.board.y - diameter / 2 - 3;

      if ((keyPressed && key == ' ')&& game.timer > 50 )
      {
        magnetized = false;
      }
    } else 
    {
      center.x += vx;
      center.y += vy;
    }
    top = center.y - diameter / 2;
    bottom =  center.y + diameter / 2;
    right = center.x + diameter / 2;
    left = center.x - diameter / 2;
  }

  void boardBounce()
  {

    float boardCenter = game.board.x + game.board.Width / 2;
    float magnitude = sqrt (vx * vx + vy * vy);
    vx = magnitude * sin((center.x - boardCenter)/ game.board.Width * 2);
    vy = - magnitude * abs(cos((center.x - boardCenter)/ game.board.Width * 2));
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
        boardBounce();
      }
    }
  }
}