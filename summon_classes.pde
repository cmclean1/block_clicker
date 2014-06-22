boolean entankSummon = false;
int entankSummonLife;
int ensummonTime;
boolean enwhichSummon;
int totSummon;
class Summon
{
  float adCount;
  float count;
  String name;
  int type;
  int locationn;
  int yBattle;
  boolean amitrue = false;
  int sumTime;
  float sumAmount;
  Summon(int _type, String _name, int _location, int countNum, int adNum)
  {
    type = _type;
    name = _name;
    locationn = _location;
    count = data[countNum];
    adCount = data[adNum];
  }
  void displayCount()
  {
    if (location == 11)
    {
      text(int(adCount), 200, locationn);
      text(name + ": " +  int(count), 35, locationn);
      noFill();
      rect(150, locationn-10, 10, 10);
      rect(170, locationn-10, 10, 10);
      fill(0);
      text("<", 152, locationn);
      text(">", 172, locationn);
    }
  }
  void displayBattle(int y, String namee)
  {
    yBattle = y;
    if (sumInv)
    {
      textAlign(CORNER);
      fill(0);
      text(name + ": " + int(adCount), 190, y);
    }
    if (whichSummon && amitrue)
    {
      image(loadImage(namee), 10, 130);
    }
  }
  void ifPressed(String name, int time, float amount)
  {
    if (arrowy == yBattle && sumInv)
    {
      sumTime = time;
      sumAmount = amount;
      yourTurn = !yourTurn;
      checkPlayerStatus();
      if (adCount > 0)
      {
        box--;
        adCount--;
        sumInv = false;
        if (type == 1)
        {
          playerSummonTank(name, time, amount, "Summon a triangle to protect you!");
        }
        if (type == 2)
        {
          playerSummonPoly(name, time, "Polygon heals all negative statuses!");
        }
        if (type == 3)
        {
          playerSummonEscape(name, time, "Summon a square!");
        }
        if (type == 4)
        {
          playerSummonGen(name, time, amount, "Summon a circle!");
        }
        if (type == 5)
        {
          playerSummonReflect(name, "Summon a pentagon!");
        }
        if (type == 6)
        {
          playerSummonBuff(name, time, amount, "Summon a line!");
        }
        if (type == 7)
        {
          playerSummonSpike(name, time, amount, "Summon an acute angle!");
        }
        if (type == 8)
        {
          if (!killedWitch)
          {
            if (location != 13)
            {
              pick = true;
              location = 13;
              startBattle = true;
              battle = true;
              arrowx = 5;
              arrowy = 415;
            }
            else
            {
              messageLog = "Heart has no effect in the witch's domain!";
            }
          }
          else
          {
            playerSummonHeart(name, time, "Summon a heart!");
          }
        }
        else
        {
          messageLog = "No more " + name + "!";
          sumInv = false;
        }
      }
    }
  }
  void godown()
  {
    if (amitrue)
    {
      sumTime--;
      if (sumTime == 0)
      {
        amitrue = false;
      }
    }
  }
  void ifClicked()
  {
    if (location == 11)
    {
      if (mouseY >= locationn-10 && mouseY <= locationn && mouseX >= 150 && mouseX <= 160)
      {
        if (adCount != 0)
        {
          adCount-=1;
          count+=1;
          box = box - 1;
        }
      }
      else if (mouseY >= locationn-10 && mouseY <= locationn && mouseX >= 170 && mouseX <= 180)
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
  }
}

