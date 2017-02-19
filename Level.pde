class Level {


  int [][] hardness;


  Level () {
    hardness = new int [1][1];
  }

  void Draw()
  {

    for (int y = 0; y < hardness.length; y++)
    {
      for (int x = 0; x / hardness[y].length < 1; x++)
      {
        if (hardness[y][x] == 1)
          fill(0, 200, 0);
        if (hardness[y][x] == 3)
          fill(200, 0, 0);
        if (hardness[y][x] == 2)
          fill(0, 0, 200);
        if(hardness [y][x] != 0)
        {
          rect(width / hardness [y].length * x, 20 *y, width/ hardness [y].length, 20);
        
        } 
      }
    }
  }
   
   void calculateParameters()
   {
     
     
     
   }

  
}