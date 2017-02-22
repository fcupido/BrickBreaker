
Game game;

void setup()
{
  size(800, 850);
  noCursor();
  game  = new Game ();
  game.timer = 100;
  loadLevels();
  game.level = game.levels[0];
  game.level.brickCount = game.level.countBricks();
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
      game.level.brickCount = game.level.countBricks();
    }
  }
  game.keepScore();
  if (game.level.brickCount == 0 && game.onLevel != game.levels.length)
  {
    game.loadNext();
  }
  if (game.onLevel == game.levels.length)
  {
    game.endGame();
  }
}