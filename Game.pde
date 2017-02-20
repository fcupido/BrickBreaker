class Game
{
  // game has a ball and and array of levels
  Ball ball;
  Level [] levels; // array of levels
  Level level; // loaded level
  Board board;
  boolean ballIn;

  int onLevel;
  Game ()
  {
    ballIn = true;
    ball = new Ball (width / 2, height * 0.8);
    onLevel = 0;
    levels = new Level [1];
    levels[0] = new Level();
    level = new Level();
    board = new Board();
  }
  // add parameter to select which level to access -- concider only ever accesing one level
  // and each new level just replace the loaded array with the new one from memory.
 void ballOut ()
 {
   
 }
   

  void calculateCollisions()
  {

    float enteringLayer = 0;
    if (ball.vy < 0 )  // ball moving up
    {
      enteringLayer =  ball.top/20;
    } else
    {
      enteringLayer =  ball.bottom/20;
    }
    if (enteringLayer <= level.hardness.length)
    {
      int arrayLayer = int(enteringLayer);
      float brickWidth = width / level.hardness[arrayLayer].length;
      int brickLocation = int (ball.center.x / brickWidth);


      if (level.hardness[arrayLayer][brickLocation] != 0) // testing collition calculation for top 
      {
        level.hardness[arrayLayer][brickLocation] -=1 ;
        if (ball.vy < 0 )  // ball moving up
        {
          ball.vy = abs(ball.vy);
        } else
        {
          ball.vy = - abs(ball.vy);
        }
      }
    }

    // to solve corner problem, if you were one layer ahead (up or down
    // (depending on direction) would you colide?
    // create funciton that decides what side & top/bottom
    // parameters cause collition
    int inLayer = int(ball.center.y/20);
    if (inLayer < level.hardness.length)
    {
      float brickWidth = width / level.hardness[inLayer].length;
      int brickLocation = 0;
      if (ball.vx>0) {
        brickLocation = int (ball.right / brickWidth);
      } else
      {
        brickLocation = int (ball.left / brickWidth);
      }
      if (brickLocation < level.hardness[inLayer].length)
      {
        if (level.hardness[inLayer][brickLocation] != 0) // testing collition calculation for top 
        {
          level.hardness[inLayer][brickLocation] -=1 ;
          if (ball.vx < 0 )  // ball moving up
          {
            ball.vx = abs(ball.vx);
          } else
          {
            ball.vx = - abs(ball.vx);
          }
        }
      }
    }
  }
}