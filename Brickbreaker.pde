Game game;

void setup()
{
  size(800, 850);
  game  = new Game ();
  loadLevels();
  game.level = game.levels[0];
}


void draw ()
{
  background(0);
  game.ball.Draw();
  game.ball.move();
  game.ball.bounce(); // from walls
  game.level.Draw();
  game.calculateCollisions();
  game.board.move();
  game.board.Draw();
}