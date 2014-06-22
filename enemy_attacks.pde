int enhealTime;
int entothealTime;
boolean enmultiHeal;
boolean enRuby;
int enrubyTime;
boolean playerPoison;
int playerPoisonTime;
float playerPoisonNum;
boolean enAmethyst = false;
int enAmethystTime;
float enAmethystNum;
float enAmethystAmount = 1;
boolean enOrange = false;
int enOrangeTime;
boolean enBombSummon = false;
boolean enSpikeSummon = false;
boolean enPolySummon = false;
float enSpikeBack;
int enpolyType;
void enemyNull(String message)
{
  messageLog = message;
}

void enemyAttack(String message, float damNum)
{
  messageLog = message;
  if (angle.amitrue)
  {
    endamage+=(damNum*amethystAmount)/2;
  }
  if (!triangle.amitrue)
  {
    damage = damage + (damNum*amethystAmount);
  }
  else
  {
    triangle.sumAmount-=(damNum*amethystAmount);
    if (triangle.sumAmount < 0)
    {
      triangle.amitrue = false;
    }
  }
}
void ifAttackedAttack(String message, float damNum)
{
  if (attacked)
  {
    enemyAttack("Attacking " +  enemyName + " injures you!", damNum);
  }
  else if (!attacked)
  {
    enemyNull(enemyName + " does nothing!");
  }
}
void enemyHeal(String message, int healNum)
{
  if (Ruby)
  {
    messageLog = enemyName + " can't heal!";
  }
  else
  {
    if (enhealth + healNum > totenhealth)
    {
      enhealth = totenhealth;
    }
    else
    {
      endamage = endamage-healNum;
    }
    messageLog = message;
  }
}
void enemyHealOver(String message, int healTime)
{
  if (enpoisonTime > 0)
  {
    enpoisonTime = 0;
    enmultiPoison = false;
    messageLog = enemyName + " ends poison!";
  }
  else
  {
    enhealTime = healTime;
    messageLog = message;
    enmultiHeal = true;
  }
}
void enemyAttackifHealTrue(String message, float damage, int healOver)
{
  if (enmultiHeal)
  {
    enemyAttack(enemyName + "attacks!", damage);
  }
  else
  {
    enemyHealOver(message, healOver);
  }
}
void enemyRuby(String message, int time)
{
  if (polygon.amitrue)
  {
    messageLog = "Polygon keeps player from being burned!";
  }
  else if (pentagon.amitrue)
  {
    messageLog = "Pentagon burns the enemy!";
    Ruby = true;
    rubyTime = time;
  }
  else
  {
    if (enRuby)
    {
      messageLog = "Player is already burned!";
    }
    else
    {
      enRuby = true;
      enrubyTime = time;
      messageLog = message;
    }
  }
}
void enemyPoison(String message, int time)
{
  if (polygon.amitrue)
  {
    messageLog = "Polygon keeps player from being poisoned!";
  }
  else if (pentagon.amitrue)
  {
    messageLog = "Pentagon poisons the enemy!";
    enmultiPoison = true;
    enpoisonTime = time;
  }
  else
  {
    playerPoison = true;
    playerPoisonTime = time;
    messageLog = message;
  }
}
void enemyAmethyst(String message, int time, float num)
{
  if (enAmethyst == true)
  {
    messageLog = "Defense is already raised!";
  }
  else
  {
    enAmethyst = true;
    enAmethystTime = time;
    enAmethystAmount = num;
    messageLog = message;
  }
}
void enemyOrange(String message, int time)
{
  if (polygon.amitrue)
  {
    messageLog = "Polygon keeps player from being disabled!";
  }
  else if (pentagon.amitrue)
  {
    messageLog = "Pentagon disables the enemy!";
    Orange = true;
    orangeTime = time;
  }
  else
  {
    if (enOrange == true)
    {
      messageLog = "Player is already disabled!";
    }
    else
    {
      messageLog = message;
      enOrange = true;
      enOrangeTime = time;
    }
  }
}
void enemySummonTank(String message, int time, int tankLife, String name)
{
  if (heart.amitrue)
  {
    messageLog = "Heart keeps enemy from summoning!";
  }
  else
  {
    if (entankSummon)
    {
      messageLog = name + " is already summoned!";
    }
    else
    {
      messageLog = message;
      entankSummon = true;
      enwhichSummon = true;
      ensummonTime = time;
      entankSummonLife = tankLife;
    }
  }
}
void enemySummonBomb(String message, int time, String name)
{
  if (heart.amitrue)
  {
    messageLog = "Heart keeps enemy from summoning!";
  }
  else
  {
    if (enBombSummon)
    {
      if (ensummonTime <= 0)
      {
        messageLog = "Bomb Explodes!";
      }
      else
        messageLog = name + " is already summoned!";
    }
    else
    {
      messageLog = message;
      enBombSummon = true;
      enwhichSummon = true;
      ensummonTime = time;
    }
  }
}
void enemySummonSpike(String message, int time, float amount, String name)
{
  if (heart.amitrue)
  {
    messageLog = "Heart keeps enemy from summoning!";
  }
  else
  {
    if (enSpikeSummon)
    {
      messageLog = name + " is already summoned!";
    }
    else
    {
      messageLog = message;
      enSpikeSummon = true;
      enwhichSummon = true;
      ensummonTime = time;
      enSpikeBack = amount;
    }
  }
}
void enemySummonPoly(String message, int time, float _polytype, String name)
{
  enpolyType = int(_polytype);
  if (heart.amitrue)
  {
    messageLog = "Heart keeps enemy from summoning!";
  }
  else
  {
    if (enPolySummon)
    {
      messageLog = name + " is already summoned!";
    }
    else
    {
      if (enmultiPoison)
      {
        enmultiPoison = false;
      }
      if (Ruby)
      {
        Ruby = false;
      }
      if (Orange)
      {
        Orange = false;
      }
      messageLog = message;
      enPolySummon = true;
      enwhichSummon = true;
      ensummonTime = time;
    }
  }
}
void enemyAbsorb(String message, float damNum)
{
  messageLog = message;
  if (angle.amitrue)
  {
    endamage+=(damNum*amethystAmount)/2;
  }
  if (!triangle.amitrue)
  {
    damage = damage + (damNum*amethystAmount);
  }
  else
  {
    triangle.sumAmount-=(damNum*amethystAmount);
    if (triangle.sumAmount < 0)
    {
      triangle.amitrue = false;
    }
  }
  if (Ruby)
  {
  }
  else
  {
    if (enhealth + damNum > totenhealth)
    {
      enhealth = totenhealth;
    }
    else
    {
      endamage = endamage-damNum;
    }
  }
}

