class Farm
{
  int type;
  color c;
  int y;
  boolean initialbuy;
  boolean initialtry = false;
  int initialprice = 2;
  Farm(int _type, color _c, int _y)
  {
    type = _type;
    c = _c;
    y = _y;
    initialbuy = false;
  }
  void initialClicked()
  {
    if (ifMouse(330, 340, y-10, y) && location == -1)
    {
      if (initialprice <= totalBlocks)
      {
        initialbuy = true;
        totalBlocks-=initialprice;
      } else
      {
        initialtry = true;
      }
    }
    else
    {
      initialtry = false;
    }
  }
  void display()
  {
    if (location == -1)
    {
      noStroke();
      if (!initialbuy)
      {
        fill(0);
        noStroke();
        textAlign(LEFT);
        textSize(12);
        if (!initialtry)
        {
          text("Buy farm for " + initialprice + " blocks.", 350, y);
        } else
        {
          text("Not enough blocks!", 350, y);
        }
        fill(c);        
        stroke(0);
        rect(330, y-10, 10, 10);
      }
      noStroke();
      if (initialbuy)
      {
        for (int i = 0; i < 5; i++)
        {
          fill(155, 89, 3);
          rect(400+(i*20)-(5/2), y, 5, 20);
          fill(c);
          if (type == 6)
          {
            stroke(0);
          }
          ellipse(400+(i*20), y, 15, 15);
        }
      }
      fill(0, 255, 0);
      rect(390, y+20, 100, 5);
    }
  }
}

