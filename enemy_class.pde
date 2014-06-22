class Enemy {
  int[] attackSet = new int[4];
  String[] messageSet = new String[4];
  int attackMax;
  float damage1;
  float damage2;
  int heal;
  int heal2;
  int healOver;
  int healOverTime;
  int healOverAmount;
  int rubyTime;
  int poisonTime;
  float poisonAmount;
  int enemyamethystTime;
  float enemyamethystAmount;
  int enorangeTime;
  int summonTime;
  float summonAmount;
  int Attack;
  int whichEnemy;
  int whichDungeon;
  int totenemyhealth;
  PImage enSummon;
  String enSummonName;
  Enemy(int attackmax, int a1, int a2, int a3, int a4, int dungeon, int enemy)
  {
    attackMax = attackmax;
    attackSet[0] = a1;
    attackSet[1] = a2;
    attackSet[2] = a3;
    attackSet[3] = a4;
    whichEnemy = enemy;
    whichDungeon = dungeon;
  }
  void display(String image, String enemyname, float x, float y, float w, float h, String _reward)
  {
    if (location == whichDungeon && enemyPick == whichEnemy)
    {
      reward = _reward;
      enhealth = totenemyhealth-endamage;
      totenhealth = totenemyhealth;
      enemyName = enemyname;
      enemy = loadImage(image);
      image(enemy, x, y, w, h);
      fill(0);
      text(enemyname, x+(w/2), y-10);
    }
  }
  void stringAssign(String s1, String s2, String s3, String s4)
  {
    messageSet[0] = s1;
    messageSet[1] = s2;
    messageSet[2] = s3;
    messageSet[3] = s4;
  }
  void statAssign(int health, float _damage, float _damage2, int _heal, int _heal2, int _healOver, int _healOverTime, int _rubyTime, float _poisonNum, int _poisonTime, float _amethystAmount, int _amethystTime, int _orangeTime)
  {
    totenemyhealth = health;
    enhealth = totenemyhealth-endamage;
    totenhealth = totenemyhealth;
    damage1 = _damage;
    heal = _heal;
    damage2 = _damage2;
    heal2 = _heal2;
    healOverAmount = _healOver;
    healOverTime = _healOverTime;
    rubyTime = _rubyTime;
    poisonTime = _poisonTime;
    poisonAmount = _poisonNum;
    enemyamethystAmount = _amethystAmount;
    enemyamethystTime = _amethystTime;
    enorangeTime = _orangeTime;
  }
  void summonAssign(float amount, int time, String type, String name)
  {
    summonTime = time;
    summonAmount = amount;
    enSummon = loadImage(type);
    enSummonName = name;
  }
  void summonDisplay(int x, int y, int w, int h)
  {
    if (enwhichSummon && location == whichDungeon && enemyPick == whichEnemy)
    {
      image(enSummon, x, y, w, h);
    }
  }
  void attack()
  {
    if (location == whichDungeon && enemyPick == whichEnemy)
    {
      yourTurn = !yourTurn;
      if (enBombSummon)
      {
        ensummonTime--;
        if (ensummonTime <= 0)
        {
          damage = tothealth;
          defeat = true;
        }
      }
      if (enSpikeSummon)
      {
        ensummonTime--;
        if (ensummonTime == 0)
        {
          enwhichSummon = false;
          enSpikeSummon = false;
        }
      }
      if (entankSummon)
      {
        ensummonTime--;
        if (ensummonTime == 0)
        {
          enwhichSummon = false;
          entankSummon = false;
        }
      }
      if (enPolySummon)
      {
        ensummonTime--;
        if (ensummonTime == 0)
        {
          enwhichSummon = false;
          entankSummon = false;
        }
      }
      if (enAmethyst)
      {
        enAmethystTime--;
        enAmethystAmount = enemyamethystAmount;
        if (enAmethystTime <= 0)
        {
          enAmethyst =false;
          enAmethystTime = 0;
        }
      }
      else
      {
        enAmethystAmount = 1;
      }
      if (enmultiPoison)
      {
        if (!entankSummon)
        {
          endamage = endamage + enmultipoison;
        }
        else
        {
          entankSummonLife-=enmultipoison;
          if (entankSummonLife <=0)
          {
            entankSummon = false;
            summonTime = 0;
            enwhichSummon = false;
          }
        }      
        enpoisonTime-=1;
        if (enpoisonTime == 0)
        {
          enmultiPoison = false;
        }
      }
      if (enmultiHeal)
      {
        if (!enRuby)
        {
          if (endamage - healOver < 0) {
            endamage = 0;
          }
          else
          {
            endamage = endamage - healOver;
          }
        }
        healOverTime-=1;
        if (healOverTime == 0)
        {
          enmultiHeal = false;
        }
      }
      if (Ruby)
      {
        rubyTime--;
        if (rubyTime == 0)
        {
          Ruby = false;
        }
      }
      int random = int(random(attackMax));
      Attack = random;
      int attack = attackSet[random];
      String whichString = messageSet[random];
      if (!Orange)
      {
        if (attack == 0)
        {
          enemyNull(whichString);
        }
        if (attack == 1)
        {
          enemyAttack(whichString, damage1);
        }
        if (attack == 2)
        {
          enemyHeal(whichString, heal);
        }
        if (attack == 3)
        {
          ifAttackedAttack(whichString, damage1);
        }
        if (attack == 4)
        {
          enemyAttack(whichString, damage2);
        }
        if (attack == 5)
        {
          healOver = healOverAmount;
          enemyHealOver(whichString, healOverTime);
        }
        if (attack == 6)
        {
          enemyRuby(whichString, rubyTime);
        }
        if (attack == 7)
        {
          playerPoisonNum = poisonAmount;
          enemyPoison(whichString, poisonTime);
        }
        if (attack == 8)
        {
          enemyAmethyst(whichString, enemyamethystTime, amethystAmount);
        }
        if (attack == 9)
        {
          enemyOrange(whichString, enorangeTime);
        }
        if (attack == 10)
        {
          enemySummonTank(whichString, summonTime, int(summonAmount), enSummonName);
        }
        if (attack == 11)
        {
          enemySummonBomb(whichString, summonTime, enSummonName);
        }
        if (attack == 12)
        {
          enemySummonSpike(whichString, summonTime, summonAmount, enSummonName);
        }
        if (attack == 13)
        {
          enemySummonPoly(whichString, summonTime, summonAmount, enSummonName);
        }
        if (attack == 14)
        {
          enemyAbsorb(whichString, damage1);
        }
      }
      else
      {
        if (attack == 13)
        {
          enemySummonPoly(whichString, summonTime, summonAmount, enSummonName);
        }
        else
        {
          messageLog = "Enemy can't attack!";
          orangeTime-=1;
          if (orangeTime < 0)
          {
            Orange = false;
            orangeTime = 0;
          }
        }
      }
    }
  }
}

