class Game
{
  // game has a ball and and array of levels
  Ball ball;
  Level [] levels; // array of levels
  Level level; // loaded level

  int onLevel;














  // GAME CONTRUCTOR 

  // ball -- construcs and sets initial location


  Game ()
  {

    ball = new Ball (width / 2, height * 0.8);
    onLevel = 0;
    levels = new Level [1];
    levels[0] = new Level();
    level = new Level();
  }
  // add parameter to select which level to access -- concider only ever accesing one level
  // and each new level just replace the loaded array with the new one from memory.




  void calculateCollisions()
  {
    if (ball.vy < 0 )  // ball moving up
    {
      float enteringLayer =  ball.top/20;
      if (enteringLayer <= level.hardness.length)
      {
        int arrayLayer = int(enteringLayer);
        float brickWidth = width / level.hardness[arrayLayer].length;
        int brickLocation = int (ball.center.x / brickWidth);


        if (level.hardness[arrayLayer][brickLocation] != 0) // testing collition calculation for top 
        {
          level.hardness[arrayLayer][brickLocation] -=1 ;
        }
      }
    }
    if (ball.vy > 0 )  // ball moving down
    {
      int arrayLayer =  int(ball.bottom/20);
      if (arrayLayer < level.hardness.length)
      {
        float brickWidth = width / level.hardness[arrayLayer].length;
        int brickLocation = int (ball.center.x / brickWidth);


        if (level.hardness[arrayLayer][brickLocation] != 0) // testing collition calculation for top 
        {
          level.hardness[arrayLayer][brickLocation] -=1 ;
        }
      }
    }
    if (ball.vx>0)                    // to solve corner problem, if you were one layer ahead (up or down
    {                                // (depending on direction) would you colide?
      // create funciton that decides what side & top/bottom
      // parameters cause collition
      int inLayer = int(ball.center.y/20);
      if (inLayer < level.hardness.length)
      {
        float brickWidth = width / level.hardness[inLayer].length;
        int brickLocation = int (ball.right / brickWidth);
        if (brickLocation < level.hardness[inLayer].length)
        {
          if (level.hardness[inLayer][brickLocation] != 0) // testing collition calculation for top 
          {
            level.hardness[inLayer][brickLocation] -=1 ;
          }
        }
      }
    }
    if (ball.vx<0)                   
    {               
      int inLayer = int(ball.center.y/20);
      if (inLayer < level.hardness.length)
      {
        float brickWidth = width / level.hardness[inLayer].length;
        int brickLocation = int (ball.left / brickWidth);
        if (brickLocation < level.hardness[inLayer].length)
        {
          if (level.hardness[inLayer][brickLocation] != 0) // testing collition calculation for top 
          {
            level.hardness[inLayer][brickLocation] -=1 ;
          }
        }
      }
    }
  }
}