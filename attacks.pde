boolean whichSummon;
int summonTime;
int heartTime;
int tankSummonLife;
String SummonName;
void missing(String name)
{
  messageLog = "No more " + name;
}
void playerAttack(String message, float damNum, int Miss)
{
  attacked = true;
  miss = int(random(1, Miss));
  if (miss == 1) {
    attacked = false;
    messageLog = "Miss!";
  }
  else {
    attacked = true;
    messageLog = "Attack with " + message + "! Deal " + int(damNum) + " damage!";

    if (line.amitrue)
    {
      messageLog = "Attack with " + message + "! Deal " + int(damNum+(damNum*enAmethystAmount*.5)) + " damage!";
    }
    if (!entankSummon)
    {
      endamage+=damNum*enAmethystAmount;
      if (enSpikeSummon)
      {
        damage+=int((damNum*enAmethystAmount)*enSpikeBack);
      }
      if (line.amitrue)
      {
        endamage+=damNum*enAmethystAmount*.5;
        if (enSpikeSummon)
        {
          damage+=int((damNum*enAmethystAmount*.5)*enSpikeBack);
        }
      }
    }
    else
    {
      entankSummonLife-=damNum*enAmethystAmount;
      damage+=int((damNum*enAmethystAmount)*enSpikeBack);
      if (line.amitrue)
      {
        entankSummonLife-=damNum*enAmethystAmount*.5;
        damage+=int((damNum*enAmethystAmount*.5)*enSpikeBack);
      }
      if (entankSummonLife <=0)
      {
        entankSummon = false;
        ensummonTime = 0;
        enwhichSummon = false;
      }
    }
  }
}
void playerHeal(String message, int healNum, int Miss)
{
  attacked = false;
  miss = int(random(1, Miss));
  if (nevermiss)
  {
    miss = 0;
  }
  if (miss == 1)
  {
    messageLog = "Miss!";
  }
  else
  {
    if (enRuby)
    {
      messageLog = "You are burned and can't heal!";
    }
    else
    {
      messageLog = "Heal! You heal " + healNum + " HP!";
      if (line.amitrue)
      {
        messageLog = "Heal! You heal " + int(healNum+(healNum*.5)) + " HP!";
      }
      if (damage-healNum <= 0)
      {
        damage=0;
      }
      else
      {
        damage-=healNum;
        if (line.amitrue)
        {
          if (damage-healNum*line.sumAmount <= 0)
          {
            damage=0;
          }
          else
            damage-=healNum*.5;
        }
      }
    }
  }
}
void playerHealOver(String message, int time, int Miss)
{
  attacked = false;
  miss = int(random(1, Miss));
  if (nevermiss)
  {
    miss = 0;
  }
  if (miss == 1)
  {
    messageLog = "Miss!";
  }
  else
  {
    if (playerPoison)
    {
      messageLog = "Recovered from poison!";
      attacked = false;
      playerPoison = false;
    }
    else
    {
      attacked = false;
      healTime = tothealTime;
      if (line.amitrue)
      {
        healTime = int(tothealTime+(tothealTime*.5));
      }
      messageLog = message;
      multiHeal = true;
    }
  }
}
void playerPoison(String message, int time, int Miss)
{
  miss = int(random(1, Miss));
  if (nevermiss)
  {
    miss = 0;
  }
  if (miss == 1)
  {
    attacked = false;
    messageLog = "Miss!";
  }
  else
  {
    if (enPolySummon)
    {
      if (enpolyType == 1)
      {
        messageLog = "Enemy can't be poisoned!";
      }
    }
    else if (!enPolySummon)
    {
      if (enmultiHeal)
      {
        enmultiHeal = false;
        messageLog = enemyName + " loses healing status!";
      }
      else
      {
        enpoisonTime = totenpoisonTime;
        if (line.amitrue)
        {
          enpoisonTime = int(totenpoisonTime+(totenpoisonTime*.5));
        }

        messageLog = message;
        enmultiPoison = true;
        attacked = true;
      }
    }
  }
}
void playerNull(String name)
{
  attacked = false;
  messageLog = name + " do nothing (KILL EM)";
}
void playerOrange(String name, int time, int Miss)
{
  miss = int(random(1, Miss));
  if (miss == 1)
  {
    messageLog = "Miss!";
    attacked = false;
  }
  else 
  {
    if (enPolySummon)
    {
      if (enpolyType == 1)
      {
        messageLog = "Enemy can't be disabled!";
      }
    }
    else
    {
      attacked = true;
      Orange = true;
      orangeTime = time;
      if (line.amitrue)
      {
        orangeTime = int(time+(time*.5));
      }
      messageLog = name + " keeps enemy from attacking!";
    }
  }
}
void playerHurt(String name, int damNum, int Miss)
{
  miss = int(random(Miss));
  if (miss == 1)
  {
    attacked = false;
    messageLog = "Damaged yourself!";
    damage+=damNum;
    if (line.amitrue)
    {
      damage-=damNum*.5;
    }
  }
  else
  {
    playerAttack(name, damNum, Miss);
  }
}
void playerHealPoison(String name, int Num, int Miss)
{
  miss = int(random(1, Miss));
  if (nevermiss)
  {
    miss = 0;
  }
  if (miss == 1)
  {
    attacked = false;
    messageLog = "Miss!";
  }
  else
  {
    if (enPolySummon)
    {
      if (enpolyType == 1)
      {
        messageLog = "Enemy can't be poisoned!";
      }
      else
      {
        enpoisonTime = Num;
        enmultiPoison = true;
      }
    }
    else
    {
      healTime = Num;
      if (line.amitrue)
      {
        enpoisonTime = int(Num+(.5*Num));
        healTime = int(Num+(.5*Num));
      }
      messageLog = name + " poisons enemy and" + ENTER + "heals over time!";
      multiHeal = true;
      attacked = true;
    }
  }
}
void playerRuby(String name, int time, int Miss)
{
  miss = int(random(1, Miss));
  if (miss == 1)
  {
    attacked = false;
    messageLog = "Miss!";
  }
  else 
  {
    if (enPolySummon)
    {
      if (enpolyType == 1)
      {
        messageLog = "Enemy can't be burned!";
      }
    }
    else
    {
      attacked = true;
      Ruby = true;
      if (line.amitrue)
      {
        rubyTime = int(time+(.5*time));
      }
      messageLog = name + " keeps enemy from healing!";
    }
  }
}
void playerAmethyst(String name, int time, int Miss)
{
  miss = int(random(1, Miss));
  if (miss == 1)
  {
    attacked = false;
    messageLog = "Miss!";
  }
  else 
  {
    attacked = true;
    Amethyst = true;
    if (line.amitrue)
    {
      amethystTime = int(time+(.5*time));
    }
    else
    {
      amethystTime = time;
    }
    messageLog = name + "raises defense!";
  }
}
void playerAbsorb(String name, int num, int Miss)
{
  miss = int(random(1, Miss));
  if (miss == 1)
  {    

    messageLog = "Miss!";
  }
  else
  {
    attacked = true;
    messageLog = "Absorbed enemy health!";
    if (damage-num <= 0)
    {
      damage=0;
    }
    else
    {
      damage-=num;
    }
    if (!entankSummon)
    {
      endamage+=int(num*enAmethystAmount);
    }
    else
    {
      entankSummonLife-=int(num*enAmethystAmount);
      if (entankSummonLife <=0)
      {
        entankSummon = false;
        ensummonTime = 0;
        enwhichSummon = false;
      }
    }
  }
}
void playerSummonTank(String SummonName, int summonTime, float tankSummonLife, String message)
{
  if (triangle.amitrue)
  {
    messageLog = SummonName + " is already summoned!";
  }
  else
  {
    square.amitrue = false;
    pentagon.amitrue = false;
    circle.amitrue = false;
    polygon.amitrue = false;
    line.amitrue = false;
    angle.amitrue = false;
    whichSummon = true;
    summonTime = summonTime;
    tankSummonLife = tankSummonLife;
    messageLog = message;
  }
}
void playerSummonPoly(String summonName, int summonTime, String message)
{
  if (polygon.amitrue)
  {
    messageLog = summonName + " is already summoned!";
  }
  else
  {
    if (enAmethyst)
    {
      enAmethyst =false;
    }
    if (playerPoison)
    {
      playerPoison = false;
    }
    if (enRuby)
    {
      enRuby = false;
    }
    if (enOrange)
    {
      enOrange = false;
    }
    circle.amitrue = false;
    triangle.amitrue = false;
    square.amitrue = false;
    pentagon.amitrue = false;
    line.amitrue = false;
    angle.amitrue = false;
    whichSummon = true;
    summonTime = summonTime;
    messageLog = message;
  }
}
void playerSummonEscape(String summonName, int _summonTime, String message)
{
  if (square.amitrue)
  {
    messageLog = summonName + " is already summoned!";
  }
  else
  {
    whichSummon = true;
    messageLog = message;
    summonTime = _summonTime;
    circle.amitrue = false;
    angle.amitrue = false;
    polygon.amitrue = false;
    triangle.amitrue = false;
    pentagon.amitrue = false;
    line.amitrue = false;
  }
}
void playerSummonGen(String summonName, int _summonTime, float dotGen, String message)
{
  if (circle.amitrue)
  {
    messageLog = summonName + " is already summoned!";
  }
  else
  {
    pentagon.amitrue = false;
    square.amitrue = false;
    angle.amitrue = false;
    polygon.amitrue = false;
    line.amitrue = false;
    triangle.amitrue = false;
    whichSummon = true;
    summonTime = _summonTime;
    messageLog = message;
    circle.sumAmount = dotGen;
  }
}
void playerSummonReflect(String summonName, String message)
{
  summonTime = 1;
  pentagon.amitrue = true;
  whichSummon = true;
  circle.amitrue = false;
  line.amitrue = false;
  square.amitrue = false;
  angle.amitrue = false;
  polygon.amitrue = false;
  triangle.amitrue = false;
  messageLog = message;
}
void playerSummonBuff(String summonname, int _summonTime, float percent, String message)
{
  if (line.amitrue)
  {
    messageLog = summonname + "is already summoned!";
  }
  else
  {
    angle.amitrue = false;
    square.amitrue = false;
    circle.amitrue = false;
    triangle.amitrue = false;
    polygon.amitrue = false;
    pentagon.amitrue = false;
    whichSummon = true;
    summonTime = _summonTime;
    messageLog = message;
    line.sumAmount = percent;
  }
}
void playerSummonSpike(String summonName, int _summonTime, float percent, String message)
{
  if (angle.amitrue)
  {
    messageLog = summonName + "is already summoned!";
  }
  else
  {
    line.amitrue = false;
    square.amitrue = false;
    circle.amitrue = false;
    triangle.amitrue = false;
    polygon.amitrue = false;
    pentagon.amitrue = false;
    whichSummon = true;
    summonTime = _summonTime;
    messageLog = message;
    pentagon.sumAmount = percent;
  }
}
void playerSummonHeart(String summonName, int _summonTime, String message)
{
  if (heart.amitrue)
  {
    messageLog = summonName + "is already summoned!";
  }
  else
  {
    heart.amitrue = true;
    line.amitrue = false;
    square.amitrue = false;
    circle.amitrue = false;
    triangle.amitrue = false;
    polygon.amitrue = false;
    pentagon.amitrue = false;
    angle.amitrue = false;
    whichSummon = true;
    enBombSummon = false;
    enSpikeSummon = false;
    enPolySummon = false;
    enwhichSummon = false;
    enwhichSummon =false;
    entankSummon = false;
    heartTime = _summonTime;
    messageLog = message;
  }
}

