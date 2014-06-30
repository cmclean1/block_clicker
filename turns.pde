int enemyPick;
boolean pick;
int miss;
String reward;
boolean Retreat = false;
boolean victory = false;
boolean attacked;
boolean multiHeal = false;
float healinc;
int multiheal;
int healTime;
int tothealTime;
boolean multiPoison;
int multipoison;
float pendamage;
boolean nevermiss;
int blockdamage;
boolean Orange;
boolean escape = false;
void checkPlayerStatus()
{
  if (circle.amitrue)
  {
    circleChoose();
  }
  pentagon.godown();
  triangle.godown();
  polygon.godown();
  circle.godown();
  angle.godown();
  heart.godown();
  square.godown();
  line.godown();
  if (square.sumTime <= 1 && square.amitrue)
  {
    escape = true;
  }
  if (Amethyst)
  {
    amethystTime--;
    amethystAmount = .5;
    if (amethystTime <= 0)
    {
      Amethyst = false;
      amethystAmount = 1;
    }
  }

  if (multiHeal)
  {
    if (!enRuby)
    {
      if (damage - multiheal < 0) {
        damage = 0;
      }
      else {
        damage = damage - multiheal;
        messageLog = "Heal over time!";
      }
    }
    healTime-=1;
    if (healTime == 0) {
      messageLog = "Healing ran out!";
      multiHeal = false;
    }
  }
  if (playerPoison)
  {
    if (!triangle.amitrue)
    {
      damage = damage + playerPoisonNum;
    }
    else
    {
      triangle.sumAmount-=playerPoisonNum;
      if (triangle.sumAmount <= 0)
      {
        triangle.amitrue = false;
      }
    }
    playerPoisonTime--;
    if (playerPoisonTime == 0)
    {
      playerPoison = false;
    }
  }
  if (enRuby)
  {
    enrubyTime--;
    if (enrubyTime <= 0)
    {
      enRuby = false;
    }
  }
}
void yourturn() {
  amethystAmount = 1;
  if (!victory) {
    startBattle = false;
    if (!enOrange)
    {
      red.ifPressed(5, 430, 2, "", int(healinc), 21);
      green.ifPressed(5, 445, 3, "Green dot heals over time!", tothealTime, 21);
      purple.ifPressed(5, 460, 4, "Purple dot poisons enemy!", totenpoisonTime, 15);
      gold.ifPressed(5, 475, 0, "Gold Dots", 0, 0);
      orange.ifPressed(115, 415, 5, "Orange Dots", 1, 12);
      white.ifPressed(115, 430, 10, "", 10, 18);
      black.ifPressed(115, 445, 6, "Black Dot!", 20, 8);
      blue.ifPressed(115, 460, 0, "Blue Dots", 0, 0);
      if (alchInv)
      {
        ruby.ifPressed(180, 170, 8, "Ruby Dots", 5, 15);
        emerald.ifPressed(180, 185, 7, "Emerald Dot", tothealTime, 15);
        amethyst.ifPressed(180, 200, 9, "Amethyst Dot", 5, 15);
        diamond.ifPressed(180, 215, 1, "Diamond Dot!", 3, 21);
        garnet.ifPressed(180, 230, 5, "Garnet Dot!", 4, 20);
        rainbow.ifPressed(180, 245, 2, "Rainbow Dot!", 20, 26);
        obsidian.ifPressed(180, 260, 1, "Obsidian Dot!", int(enhealth/12.5), 21);
      }
      triangle.ifPressed("Triangle", 5, 15);
      square.ifPressed("Square", 4, 0);
      circle.ifPressed("Circle", 100, 1);
      angle.ifPressed("Acute Angle", 5, .5);
      heart.ifPressed("Heart", 5, 0);
      line.ifPressed("Lines", 3, 5);
      pentagon.ifPressed("Pentagon", 1, 0);
      polygon.ifPressed("Polygons", 5, 0);
      if (arrowy == 415 && arrowx == 5) {
        if (blockAd == 0) {
          missing("Blocks!");
        }
        else {
          blockAd-=1;
          box-=1;
          playerAttack("Blocks!", blockdamage, 21);
        }
        checkPlayerStatus();
        yourTurn = !yourTurn;
      }
      if (arrowy == 490 && arrowx == 5 && unlockGeneral >= 9) {
        alchInv = true;
        arrowx = 180;
        arrowy = 170;
        yourTurn = true;
      }
      else if (arrowy == 275 && arrowx == 180 && alchInv) {
        unstabledot();
        checkPlayerStatus();
        alchInv = false;
        yourTurn = !yourTurn;
      }
      else if (arrowx == 180 && arrowy == 290) {
        alchInv = false;
        sumInv = false;
        arrowx = 5;
        arrowy = 415;
      }
      else if (arrowy == 475 && arrowx == 115 && unlockGeneral >= 9)
      {
        sumInv = true;
        arrowx = 180;
        arrowy = 170;
      }
    }
    else if (enOrange)
    {
      if (arrowy == 490 && arrowx == 5&& unlockGeneral >=9) {
        alchInv = true;
        arrowx = 180;
        arrowy = 170;
        yourTurn = true;
      }
      else if (arrowy == 275 && arrowx == 180 && alchInv) {
        unstabledot();
        checkPlayerStatus();
        alchInv = false;
        yourTurn = !yourTurn;
      }
      else if (arrowx == 180 && arrowy == 290) {
        alchInv = false;
        sumInv = false;
        arrowx = 5;
        arrowy = 415;
      }
      else if (arrowy == 475 && arrowx == 115 && unlockGeneral >= 9)
      {
        sumInv = true;
        arrowx = 180;
        arrowy = 170;
      }
      else if (arrowy == 490 && arrowx == 115) {
        retreat();
      }
      else if (arrowy == 185 && sumInv)
      {
        polygon.ifPressed("Polygons", 5, 0);
      }
      else
      {
        alchInv = false;
        sumInv = false;
        messageLog = "You can't attack!";
        checkPlayerStatus();
        yourTurn = !yourTurn;
        enOrangeTime--;
        if (enOrangeTime == 0)
        {
          enOrangeTime = 0;
          enOrange = false;
        }
      }
    }
  }

  if (arrowy == 490 && arrowx == 115) {
    retreat();
  }
  if (endamage >= totenhealth) {
    Victory();
  }
  if (damage >= tothealth) {
    if (heart.amitrue)
    {
      damage = tothealth-1;
    }
    else
      Defeat();
  }
  if (escape)
  {
    Victory();
  }
}


void unstabledot()
{
  if (unstable.adCount > 0&& victory == false)
  {
    int random = int(random(12));
    if (random == 0)
    {
      attacked = true;
      messageLog = "Unstable dot does nothing!";
    }
    if (random == 1)
    {
      messageLog = "Damaged yourself!";
      damage+=int(random(26));
    }
    if (random == 2)
    {
      attacked = true;
      messageLog = "Attack with unstable dot!";
      endamage+=int(random(1, 21))*enAmethystAmount;
    }
    if (random == 3)
    {
      attacked = true;
      messageLog = "Attack with unstable dot!";
      endamage+=int(random(1, 11))*enAmethystAmount;
    }
    if (random == 4)
    {
      messageLog = "Damaged yourself!";
      damage+=int(random(1, 6));
    }
    if (random == 5)
    {
      Orange = true;
      orangeTime = int(random(1, 2));
      messageLog = "Unstable dot keeps enemy from attacking!";
    }
    if (random == 6)
    {
      messageLog = "Miss!";
    }
    if (random == 7)
    {
      messageLog = "Heal! You heal yourself!";
      if (damage-healinc <= 0)
      {
        damage=0;
      }
      else
      {
        damage-=random(5, 11);
      }
    }
    if (random == 8)
    {
      attacked = true;
      messageLog = "Absorbed enemy health!";
      if (damage-10 <= 0)
      {
        damage=0;
      }
      else
      {
        damage-=random(10);
      }
      endamage+=random(10)*enAmethystAmount;
    }
    if (random == 9)
    {
      enpoisonTime = totenpoisonTime;
      messageLog = "Unstable dot poisons over time!";
      enmultiPoison = true;
      attacked = true;
    }
    if (random == 10)
    {
      attacked = false;
      healTime = tothealTime;
      messageLog = "Unstable dot heals over time!";
      multiHeal = true;
    }
    if (random == 11)
    {
      messageLog = "Health equals 1!";
      damage = tothealth-1;
    }
    box = box - 1;
    unstable.adCount--;
  }
  else if (unstable.adCount == 0 && victory == false)
  {
    attacked = false;
    unstable.adCount = 0;
    messageLog = "No Unstable Dots! Choose another item!";
  }
}
void retreat()
{
  if (victory)
  {
    Victory();
  }
  else {
    player = loadImage("killem.png");
    image(player, 50, 275);
    messageLog = "Retreat! You lose all items!";
    text(messageLog, 130, 40);
    red.adCount = 0;
    green.adCount = 0;
    purple.adCount = 0;
    gold.adCount = 0;
    orange.adCount = 0;
    white.adCount = 0;
    black.adCount = 0;
    blue.adCount = 0;
    diamond.adCount = 0;
    blockAd = 0;
    box = 0;
    if (Retreat)
    {
      resetBattle();
    }
  }
  Retreat = true;
}
void Victory()
{
  if (!escape)
  {
    messageLog = "Victory! You win " + reward;
  }
  if (escape)
  {
    messageLog = "Successfully escaped!";
  }
  if (victory && !escape)
  {
    if (location == 4)
    {
      if (enemyPick == 2)
      {
        green.count = green.count + 2;
      }
      else if (enemyPick == 1)
      {
        totalBlocks+=100;
      }
    }
    else if (location == 5)
    {
      if (enemyPick == 0)
      {
        totalBlocks+=200;
      }
      else if (enemyPick == 1)
      {
        purple.count +=3;
      }
    }
    else if (location == 6)
    {
      gold.count+=1;
    }
    else if (location == 13)
    {
      killedWitch = true;
    }
    else if (location == 15)
    {
      blue.count+=1;
    }
  }
  if (victory)
  {      
    resetBattle();
  }
  victory = true;
}

boolean enmultiPoison;
int enmultipoison;
int enpoisonTime;
int totenpoisonTime;
int orangeTime;
int defense;
String constrainText;
String enemyName;
boolean constrain;
int rubyTime;
boolean Ruby;
int amethystTime;
float amethystAmount;
boolean Amethyst;
void enemyTurn()
{
  if (!victory)
  {
    rock.attack();
    tree.attack();
    moustache.attack();
    rpg.attack();
    lynn.attack();
    jason.attack();
    miley.attack();
    witch.attack();
    devil.attack();
    fallenangel.attack();
    espurr.attack();
    squilliam.attack();
    pitbull.attack();
    blackguy.attack();
  }
  if (endamage >= totenhealth)
  {
    Victory();
  }
  if (damage >= tothealth)
  {
    if (heart.amitrue)
    {
      damage = tothealth-1;
    }
    else
      Defeat();
  }
}
void circleChoose()
{
  int which = int(random(9));
  if (which == 0)
  {
    red.adCount++;
  }
  else if (which == 1)
  {
    green.adCount++;
  }
  else if (which == 2)
  {
    purple.adCount++;
  }
  else if (which == 4)
  {
    gold.adCount++;
  }
  else if (which == 5)
  {
    orange.adCount++;
  }
  else if (which == 6)
  {
    white.adCount++;
  }
  else if (which == 7)
  {
    black.adCount++;
  }
  else if (which == 8)
  {
    blue.adCount++;
  }
}
void Defeat()
{ 
  player = loadImage("killem.png");
  image(player, 50, 275);
  messageLog = "Defeated! You lose all items!";
  text(messageLog, 130, 40);
  red.adCount = 0;
  green.adCount = 0;
  purple.adCount = 0;
  gold.adCount = 0;
  orange.adCount = 0;
  white.adCount = 0;
  black.adCount = 0;
  blue.adCount = 0;
  diamond.adCount = 0;
  blockAd = 0;
  if (Retreat)
  {
    resetBattle();
  }
  Retreat = true;
}
void resetBattle()
{
  entankSummon = false;
  enSpikeSummon = false;
  enAmethyst = false;
  enmultiHeal = false;
  enRuby = false;
  playerPoison = false;
  neverMiss.upgrade = 0;
  circle.amitrue = false;
  triangle.amitrue = false;
  polygon.amitrue = false;
  angle.amitrue = false;
  line.amitrue = false;
  pentagon.amitrue = false;
  square.amitrue = false;
  enBombSummon = false;
  Orange = false;
  enOrange = false;
  box = 0;
  location = 2;    
  battle = false;
  startBattle = true;
  heal = 0;
  endamage = 0;
  arrowy = 415;
  arrowx = 5;
  Retreat = false;
  enwhichSummon = false;
}

