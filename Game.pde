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
        
        
        if(level.hardness[arrayLayer][brickLocation] != 0) // testing collition calculation for top 
        {
        level.hardness[arrayLayer][brickLocation] -=1 ;
        }
      }
    }

  }
}