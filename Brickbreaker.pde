/*
need
 additional levels
 ball starts motionless
 modifiers
 
 
 */



Game game;

void setup()
{
  size(800, 850);
  game  = new Game ();
  game.timer = 100;
  loadLevels();
  game.level = game.levels[0];
  game.level.brickCount = game.level.countBricks();
  println (game.level.brickCount);
}


void draw ()
{
  if (game.ballIn && game.level.brickCount > 0)
  {
    background(0);
    game.ball.Draw();
    game.ball.move();
    game.ball.bounce(); // from walls
    game.level.Draw();
    game.calculateCollisions();
    game.board.move();
    game.board.Draw();
    game.showLives();
  } else if (keyPressed && key == ' ')
  {
    if (game.lives > 0)
    {
      game.ballIn = true;
      game.board = new Board();
      game.ball = new Ball (width / 2, height * 0.8);
    } else
    {
      game = new Game();
      loadLevels();
      game.level = game.levels[0];
    }
  }
  game.keepScore();
  if (game.level.brickCount == 0)
  {
    game.loadNext();
  }
}