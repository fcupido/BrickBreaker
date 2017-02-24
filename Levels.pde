//The levels can be eddited using numbers 0 to 3, where 0 is an empty
//space and 3 requires 3 hits to be erased. No further adjustmests are needed
//to modify a level

// to add more levels, the length of the levels array needs to bbe increased in the
// game constructor

void loadLevels()
{
  int [][] level2 =  
    {{0}, {0}, 
    {2, 0, 0, 0, 0, 2}, 
    {1, 1, 1, 1, 1, 1}, 
    {3, 3, 0, 0, 3, 3}, 
    {1, 2, 0, 0, 2, 1}, 
    {1, 1, 3, 3, 1, 1}, 
    {1, 0, 1, 1, 0, 1}, 
    {1, 3, 1, 1, 3, 1}
  };

  int [][] level1 =  
    {
    {0}, {0}, {0}, {0}, {0}, {0}, 
    { 0, 2, 1, 2, 1, 2, 1, 2, 0}, 
    { 0, 2, 1, 2, 1, 2, 0}, 
    { 0, 2, 1, 2, 1, 2, 1, 2, 0}, 
    { 0, 2, 1, 2, 1, 2, 0}, 
    { 0, 2, 1, 2, 1, 2, 1, 2, 0}, 
  };



  int [][] level3 =  
    {
    {0}, {0}, {2, 3, 2}, {0}, {0}, 
    { 0, 2, 1, 2, 1, 2, 0}, 
    { 1, 1, 3, 1, 2, 3, 1}, 
    {0}, {0}, {0}, {0}, 
    { 0, 2, 3, 3, 4, 3, 3, 2, 0}, 
    { 1, 1, 2, 3, 3, 3, 2, 1, 1}, 
    { 0, 2, 1, 2, 1, 2, 0}, 
    { 3, 3, 3, 3, 3, 3, 3}, 
  };
  int [][] level4 =  
    {
    {0}, {0}, {0}, {0}, {0}, 
    { 3, 3, 3, 0, 3, 3, 3}, 
    { 0, 0, 0, 0, 0, 0, 0}, 
    { 0, 0, 0, 0, 0, 0, 0}, 
    { 0, 4, 0, 4, 0, 4, 0}, 
    { 3, 2, 0, 0, 0, 2, 3}, 
    { 3, 3, 2, 2, 2, 3, 3}, 
    { 3, 3, 3, 3, 3, 3, 3}, 
  };
  int [][] level5 =  
    {{1,4,1}, {1,1}, {1,1,1}, 
    { 2, 3, 2, 0, 2, 3, 2}, 
    {2, 4, 2}, 
    { 2, 4, 1, 4, 2, 2, 4, 1, 4, 2}, 
    { 1, 1, 0, 0, 0, 1, 1}, 
    { 2, 4, 0, 5, 0, 4, 2}, 
    { 1, 2, 1, 2, 3, 3, 2, 1, 2, 1}, 
    { 2, 3, 1, 2, 3, 3, 2, 1, 3, 2}, 
    {1, 4, 1}, 
    { 1, 1, 0, 5, 0, 1, 1}, 
    { 2, 2, 0, 0, 0, 2, 2}, 
    { 1, 2, 1, 2, 0, 0, 2, 1, 2, 1}, 
    { 1, 2, 3, 4, 3, 2, 1}, 
    {4, 5, 4}, 
  };
  int [][] test =
    {
    {1, 2, 1}
  };

  game.levels[0].hardness = level1;
  game.levels[1].hardness = level2;
  game.levels[2].hardness = level3;
  game.levels[3].hardness = level4;
  game.levels[4].hardness = level5;
}