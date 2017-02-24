class Game
{
  // game has a ball and and array of levels
  Ball ball;
  Level [] levels; // array of levels
  Level level; // loaded level
  Board board;
  boolean ballIn;
  int lives;
  int timer;
  int time;
  int score;
  int onLevel;
  Game ()
  {
    score = 0;
    timer =0;
    time = 1;
    lives = 3;
    ballIn = true;
    ball = new Ball (width / 2, height * 0.8);
    onLevel = 0;
    levels = new Level [5];
    for (int i = 0; i < levels.length; i++)
    {
      levels [i] = new Level();
    }
    level = new Level();
    board = new Board();
  }
  // add parameter to select which level to access -- concider only ever accesing one level
  // and each new level just replace the loaded array with the new one from memory.
  void ballOut ()
  {
    textSize(28);
    fill(0, 0, 250);
    if (lives > 1)
    {

      text("Press SPACE to re-start", width /3 - 40, height - 200);
      timer = 0;
    } else
    {
      text("GAME OVER", width /3 + 58, height/2);
      text("Press SPACE to re-start", width /3 - 20, height/2 + 100);
    }
    lives -=1;
    game.ballIn = false;
  }
  void endGame()
  {
    fill(255);
    textSize(40);
    text("END", width /2 -25, height /2);
    textSize(30);
    text("Final Score:" + game.score, width /2 -90, height /2 + 50 );
    text("Press SPACE to re-start", width /3 - 40, height - 200);
    game.ballIn = false;
    if (keyPressed && key == ' ') {
      game  = new Game ();
     // game.timer = 0;
      loadLevels();
      game.level = game.levels[0];
      game.level.brickCount = game.level.countBricks();
    }
  }
  void showLives()
  {
    textSize(20);
    fill(255);
    text("lives:" + lives, width - 90, height - 50);
    text("Score:" + score, 40, height - 50);
    float magnitude = sqrt(game.ball.vx* game.ball.vx + game.ball.vy*game.ball.vy);
    text("Ball Speed:" + nf(magnitude,2,2)  , width / 2 - 60, height - 50);
  }
  void keepScore()
  {
    if (timer < 999999999)
    {
      timer +=1;
    }
    if (timer % 60 == 1)
    {
      time +=1;
    }
  }

  void loadNext()
  {
    fill(200, 0, 0);
    textSize(40);
    text("LEVEL COMPLETE", width / 3 -20, height /2);
    textSize(28);
    fill(0, 0, 250);
    ball.vx = 0;
    ball.vy =0;
    text("Press SPACE to start next level", width /3 - 60, height - 200);
    if (keyPressed && key == ' ')
    {
      game.level = game.levels[onLevel];
      game.level.brickCount = game.level.countBricks();
      game.ballIn = true;
      game.board = new Board();
      game.ball = new Ball (width / 2, height * 0.8);
      timer = 0;
      time = 0;
    }
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
        level.brickCount--;
        score += int(40 / sqrt(time));
        if (ball.vy < 0 )  // ball moving up
        {
          ball.vy = abs(ball.vy);
        } else
        {
          ball.vy = - abs(ball.vy);
        }
      }
    }

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
          score += int(40 / sqrt(time));
          game.level.brickCount--;
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
    if (game.level.brickCount == 0)
    {
      game.onLevel += 1;
    }
  }
}