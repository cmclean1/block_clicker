class Dot {
  int yCorner;
  int price;
  float count;
  float auto;
  float increment;
  float alchCount;
  color textFill;
  float adCount;
  int storageLocation;
  int alchLocation;
  String name;
  boolean alch;
  int whichUp;
  Dot(float incrementt, float autoo, int yCornerr, color textfill, String namee, int x, int y, int _whichUp)
  {
    name = namee;
    yCorner = yCornerr;
    increment = incrementt;
    auto = autoo;
    whichUp = _whichUp;
    textFill = textfill;
    count = data[x];
    adCount = data[y];
    alch = false;
  }
  Dot(float autoo, int yCornerr, String namee, int x, int y)
  {
    name = namee;
    yCorner = yCornerr;
    auto = autoo;
    count = data[x];
    adCount = data[y];
    alch = true;
  }
  void displayCount(int locationn, String def)
  {
    storageLocation = locationn;
    if (!alch && unlockGeneral >= whichUp)
    {
      if (location == 0)
      {
        if (mouseX > 350 && mouseX < 475 && mouseY > yCorner && mouseY < yCorner + 50)
        {
          noFill();
          stroke(0);
          rect(50, 260, 150, 100);
          fill(0);
          text(def, 55, 280);
        }
        if (price <= totalBlocks)
        {
          stroke(textFill);
          fill(255);
          rect(350, yCorner, 125, 50);
          fill(textFill);
          text("Buy " + name + " Dot: " + price, 355, yCorner+25);
        }
        else if (price > totalBlocks)
        {
          fill(0, 75);
          stroke(0);
          rect(350, yCorner, 125, 50);
          fill(0);
          text("Buy " + name + " Dot: " + price, 355, yCorner+25);
        }
      }
      else if (location == 1)
      {
        text(int(adCount), 200, locationn);
        text(name + " Dots: " + int(count), 50, locationn);
        noFill();
        rect(150, locationn-10, 10, 10);
        rect(170, locationn-10, 10, 10);
        fill(0);
        text("<", 152, locationn);
        text(">", 172, locationn);
      }
    }
    if (alch)
    {
      if (location == 8)
      {
        text(int(adCount), 200, locationn);
        text(name + " Dots: " + int(count), 35, locationn);
        noFill();
        rect(150, locationn-10, 10, 10);
        rect(170, locationn-10, 10, 10);
        fill(0);
        text("<", 152, locationn);
        text(">", 172, locationn);
      }
    }
    totalBlocks = totalBlocks + (count*auto);
    price = int(pow(round(((count+adCount+alchCount)+1)*increment), 1.02));
  }
  void displayBattle(int x, int y)
  {
    if (!alch)
    {
      textAlign(LEFT);
      fill(0);
      text(name + " Dots: " + int(adCount), x, y);
    }
    else if (alch)
    {
      textAlign(CORNER);
      fill(0);
      text(name + " Dots: " + int(adCount), 190, y);
    }
  }
  void ifPressed(int x, int y, int whichAttack, String _name, int num, int miss)
  {
    if (arrowx == x && arrowy == y)
    {
      alchInv = false;
      sumInv = false;
      checkPlayerStatus();
      yourTurn = !yourTurn;
      if (adCount == 0)
      {
        missing(name + " Dots!");
      }
      else
      {
        box--;
        adCount--;
        alchInv = false;
        if (whichAttack == 0)
        {
          playerNull(name + " Dots!");
        }
        else if (whichAttack == 1)
        {
          playerAttack(_name, num, miss);
        }
        else if (whichAttack == 2)
        {
          playerHeal(_name, num, miss);
        }
        else if (whichAttack == 3)
        {
          playerHealOver(_name, num, miss);
        }
        else if (whichAttack == 4)
        {
          playerPoison(_name, num, miss);
        }
        else if (whichAttack == 5)
        {
          playerOrange(_name, num, miss);
        }
        else if (whichAttack == 6)
        {
          playerHurt(_name, num, miss);
        }
        else if (whichAttack == 7)
        {
          playerHealPoison(_name, num, miss);
        }
        else if (whichAttack == 8)
        {
          playerRuby(_name, num, miss);
        }
        else if (whichAttack == 9)
        {
          playerAmethyst(_name, num, miss);
        }
        else if (whichAttack == 10)
        {
          playerAbsorb(_name, num, miss);
        }
      }
    }
  }
  void displayAlchemy(int locationn, color circle)
  {
    alchLocation = locationn;
    if (!alch && location == 7)
    {
      fill(circle);
      ellipse(50, locationn, 20, 20);
      fill(255);
      rect(75, locationn-5, 10, 10);
      fill(0);
      text(">", 83, locationn+5);
      text(int(count), 20, locationn+5);
      text(int(alchCount), 95, locationn+5);
    }
    if (alch && location == 10)
    {
      int wut = int(random(3));
      fill(circle);
      if (wut == 0)
      {
        fill(255);
      }
      ellipse(50, locationn, 20, 20);
      colorMode(RGB, 255, 255, 255);
      fill(255);
      rect(75, locationn-5, 10, 10);
      fill(0);
      textAlign(CENTER);
      text(">", 83, locationn+5);
      textAlign(LEFT);
      text(int(count), 20, locationn+5);
      text(int(alchCount), 95, locationn+5);
    }
  }
  void ifClicked()
  {
    if (!alch)
    {
      if (location == 0 && unlockGeneral >= whichUp)
      {
        if (mouseX > 350 && mouseX < 475 && mouseY > yCorner && mouseY < yCorner + 50)
        {
          if (price <= totalBlocks)
          {
            totalBlocks = totalBlocks - price;
            count++;
            if(unlockGeneral == whichUp)
            {
              unlockGeneral++;
            }
          }
        }
      }
      else if (location == 1)
      {
        if (mouseY >= storageLocation-10 && mouseY <= storageLocation && mouseX >= 150 && mouseX <= 160)
        {
          if (adCount != 0)
          {
            adCount-=1;
            count+=1;
            box = box - 1;
          }
        }
        else if (mouseY >= storageLocation-10 && mouseY <= storageLocation && mouseX >= 170 && mouseX <= 180)
        {
          if (count != 0)
          {
            if (box < boxLimit)
            {
              adCount+=1;
              count-=1;
              box = box + 1;
            }
          }
        }
      }
      else if (location == 7)
      {
        if (mouseY >= alchLocation && mouseY <= alchLocation+10 && mouseX >= 75 && mouseX <= 95)
        {
          if (count != 0)
          {
            count--;
            alchCount++;
          }
        }
      }
    }
    else if (alch)
    {
      if (location == 8)
      {
        if (mouseY >= storageLocation-10 && mouseY <= storageLocation && mouseX >= 150 && mouseX <= 160)
        {
          if (adCount != 0)
          {
            adCount-=1;
            count+=1;
            box = box - 1;
          }
        }
        else if (mouseY >= storageLocation-10 && mouseY <= storageLocation && mouseX >= 170 && mouseX <= 180)
        {
          if (count != 0)
          {
            if (box < boxLimit)
            {
              adCount+=1;
              count-=1;
              box = box + 1;
            }
          }
        }
      }
      else if (location == 10)
      {
        if (mouseY >= alchLocation && mouseY <= alchLocation+10 && mouseX >= 75 && mouseX <= 95)
        {
          if (count != 0)
          {
            count--;
            alchCount++;
          }
        }
      }
    }
  }
}

