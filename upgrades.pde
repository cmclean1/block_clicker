int healthup;
int blockIn;
boolean seehealth;

void ifup()
{
  if (Health.upgrade == 1)
  {
    healthup = 100;
  }
  else if (Health.upgrade == 2)
  {
    healthup = 150;
  }
  else if (Health.upgrade == 3)
  {
    healthup = 200;
  }
  else if (Health.upgrade == 4)
  {
    healthup = 250;
  }
  if (Click.upgrade == 1)
  {
    blockIn = 1;
  }
  else if (Click.upgrade == 2)
  {
    blockIn = 3;
  }
  else if (Click.upgrade == 3)
  {
    blockIn = 5;
  }
  else if (Click.upgrade == 4)
  {
    blockIn = 8;
  }
  else if (Click.upgrade == 5)
  {
    blockIn = 10;
  }
  if (Inv.upgrade == 1)
  {
    boxLimit = 50;
  }
  else if (Inv.upgrade == 2)
  {
    boxLimit = 100;
  }
  else  if (Inv.upgrade == 3)
  {
    boxLimit = 200;
  }
  else if (Inv.upgrade == 4)
  {
    boxLimit = 400;
  }
  else if (Inv.upgrade == 5)
  {
    boxLimit = 500;
  }
  if (SeeHealth.upgrade == 1)
  {
    seehealth = false;
  }
  else if (SeeHealth.upgrade == 2)
  {
    seehealth = true;
  }
  if (neverMiss.upgrade == 2)
  {
    nevermiss = true;
  }
  else if (neverMiss.upgrade == 1)
  {
    nevermiss = false;
  }
  if (moreDamage.upgrade == 1)
  {
    blockdamage = 5;
    totenpoisonTime = 5;
    enmultipoison = 2;
  }
  else if (moreDamage.upgrade == 2)
  {
    blockdamage = 10;
    totenpoisonTime = 6;
    enmultipoison = 4;
  }
  else if (moreDamage.upgrade == 3)
  {
    blockdamage = 15;
    totenpoisonTime = 7;
    enmultipoison = 6;
  }
  else if (moreDamage.upgrade == 4)
  {
    blockdamage = 20;
    totenpoisonTime = 8;
    enmultipoison = 8;
  }
  else if (moreDamage.upgrade == 5)
  {
    blockdamage = 25;
    totenpoisonTime = 8;
    enmultipoison = 10;
  }
  if (moreHeal.upgrade == 1)
  {
    healinc = 10;
    tothealTime = 5;
    multiheal = 4;
  }
  else if (moreHeal.upgrade == 2)
  {
    healinc = 15;
    tothealTime = 6;
    multiheal = 5;
  }
  else if (moreHeal.upgrade == 3)
  {
    healinc = 20;
    tothealTime = 7;
    multiheal = 6;
  }
  else if (moreHeal.upgrade == 4)
  {
    healinc = 25;
    tothealTime = 8;
    multiheal = 7;
  }
  else if (moreHeal.upgrade == 5)
  {
    healinc = 30;
    tothealTime = 8;
    multiheal = 8;
  }
  if (moreDef.upgrade == 1)
  {
    defense = 0;
  }
  else if (moreDef.upgrade == 2)
  {
    defense = 5;
  }
  else if (moreDef.upgrade == 2)
  {
    defense = 10;
  }
  else if (moreDef.upgrade == 2)
  {
    defense = 15;
  }
  else if (moreDef.upgrade == 2)
  {
    defense = 20;
  }
}

