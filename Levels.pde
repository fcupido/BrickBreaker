void loadLevels()
{
  int [][] level1 =  
    {{0}, {0}, {0}, 
    //  {3, 3, 3, 3, 3, 3}, 
    //  {1, 1, 1, 1, 1, 1}, 
    //   {1, 1, 3, 3, 1, 1}, 
    //   {1, 1, 1, 1, 1, 1}, 
    {1}};

  int [][] level2 =  
    {{0}, {0}, {0}, 
    { 2}};

  game.levels[0].hardness = level1;
  game.levels[1].hardness = level2;
}