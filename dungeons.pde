int arrowx = 5;
int arrowy = 415;
int arrowxinc = 110;
int arrowyinc = 15;
String messageLog = "What will you use?";
float health;
float tothealth;
float enhealth;
float totenhealth;
float heal = 0;
float endamage = 0;
float endamageinc = 5;
float damage = 0;
boolean startBattle = true;
boolean yourTurn = true;
boolean defeat = false;
boolean status;
boolean alchInv;
boolean sumInv;
class Dungeon {
  PImage bg;
  Dungeon(String image)
  {
    bg = loadImage(image);
  }
  void display(int whichloc, int maxEn)
  {
    if (location == whichloc)
    {
      if (pick)
      {
        enemyPick = int(random(maxEn));
      }
      pick = false;
      image(bg, 0, 0, 500, 375);
    }
  }
}

void Battle()
{
  rectMode(CORNER);
  if (battle)
  {
    if (startBattle)
    {
      damage = 0;
      defeat = false;
      yourTurn = true;
      Retreat = false;
      victory = false;
      messageLog = "What will you use?";
      if (!killedWitch && location == 13)
      {
        messageLog = "Heart has tranpsorted you to the witch's hut!";
      }
      player = loadImage("player.png");
    }
    fill(0);
    textAlign(CENTER);
    forest.display(4, 2);
    rock.display("rock.png", "Rock", 360, 230, 120, 120, "100 Blocks!");
    tree.display("tree.png", "Tree", 360, 230, 120, 120, "2 Green Dots!");    
    cave.display(5, 2);
    moustache.display("moustache.png", "Moustache", 340, 230, 120, 120, "200 Blocks!");
    rpg.display("rpg.png", "Ridiculusly Photogenic Guy", 340, 210, 130, 158, "3 Purple Dots!");
    club.display(6, 3);
    lynn.display("lynn.png", "Lynn Allen", 350, 200, 120, 166, "1 Gold Dot!");
    jason.display("jason.png", "Mr. Sanservino", 350, 250, 120, 120, "1 Gold Dot!");
    miley.display("miley.png", "Miley Cyrus", 330, 250, 150, 99, "1 Gold Dot!");
    miley.summonDisplay(250, 100, 120, 159);
    witchhut.display(13, 1);
    witch.display("witch.png", "Witch", 330, 200, 150, 150, "Nothing!");
    witch.summonDisplay(250, 150, 50, 50);
    hell.display(14, 3);
    devil.display("devil.png", "Devil", 350, 250, 120, 120, "Nothing!");
    devil.summonDisplay(250, 150, 50, 50);
    fallenangel.display("fallenangel.png", "Fallen Angel", 330, 250, 150, 112, "Nothing!");
    fallenangel.summonDisplay(375, 150, 50, 50);
    espurr.display("espurr.png", "Espurr", 350, 250, 120, 120, "Nothing!");
    bikini.display(15, 2);
    squilliam.display("squilliam.png", "Squilliam", 350, 250, 120, 120, "1 Blue Dot!");
    pitbull.display("pitbull.png", "Pitbull's Goatee", 250, 150, 220, 220, "1 Blue Dot!");
    walmart.display(16, 1);
    blackguy.display("blackguy.png", "Black Guy", 350, 200, 120, 168, "Nothing!");
    if (victory)
    {
      fill(255);
      noStroke();
      rect(300, 380, 100, 10);
      stroke(0);
      rect(300, 380, 1, 10);
    }
    else
    {
      fill(255, 0, 0);
      stroke(0);
      rect(300, 380, 100*(enhealth/totenhealth), 10);
    }
    if (defeat || Retreat)
    {
      fill(255);
      noStroke();
      rect(50, 380, 100, 10);
      stroke(0);
      rect(50, 380, 1, 10);
    }
    else
    {
      fill(255, 0, 0);
      rect(50, 380, 100*(health/tothealth), 10);
    }
    textAlign(LEFT);
    stroke(0);
    strokeJoin(ROUND);
    noFill();
    rect(0, 400, width-1, 99);
    rect(0, 375, width-1, 25);
    rectMode(CENTER);
    fill(255);
    rect(width/2, 60, 250, 75);
    rectMode(CORNER);
    fill(0);
    textAlign(LEFT);
    image(player, 50, 275);
    text("Message Log:", 125, 20);
    text(messageLog, 130, 40);
    text("Health: ", 5, 390);
    text("Enemy: ", (width/2)+5, 390);
    if (alchInv)
    {
      fill(255);
      rectMode(CENTER);
      rect(width/2, height/2, 150, 200);
      fill(0);
      text("Back", 190, 290);
      ruby.displayBattle(190, 170);
      emerald.displayBattle(190, 185);
      amethyst.displayBattle(190, 200);
      diamond.displayBattle(190, 215);
      garnet.displayBattle(190, 230);
      rainbow.displayBattle(190, 245);
      obsidian.displayBattle(190, 260);
      unstable.displayBattle(190, 275);
    }
    if (sumInv)
    {
      fill(255);
      rectMode(CENTER);
      rect(width/2, height/2, 150, 200);
      fill(0);
      text("Back", 190, 290);
    }
    triangle.displayBattle(170, "triangle.png");
    polygon.displayBattle(185, "polygon.png");
    square.displayBattle(200, "square.png");
    circle.displayBattle(215, "sumcircle.png");
    pentagon.displayBattle(230, "pentagon.png");
    line.displayBattle(245, "line.png");
    angle.displayBattle(260, "angle.png");
    heart.displayBattle(275, "heart.png");
    status();
    textAlign(LEFT);
    if (yourTurn && !Retreat)
    {
      red.displayBattle(15, 430);
      green.displayBattle(15, 445);
      purple.displayBattle(15, 460);
      gold.displayBattle(15, 475);
      orange.displayBattle(125, 415);
      white.displayBattle(125, 430);
      black.displayBattle(125, 445);
      blue.displayBattle(125, 460);
      text("Blocks: " + int(blockAd), 15, 415);
      text("Retreat", 125, 490);
      text(">", arrowx, arrowy);
      if (unlockGeneral >=9)
      {
        text("Alchemy Bag", 15, 490);
        text("Summon Bag", 125, 475);
      }
    }
    if (seehealth)
    {
      text(int(health) + "/" + int(tothealth), 160, 390);
      text(int(enhealth) + "/" + int(totenhealth), 410, 390);
    }

    tothealth = healthup;
    health = tothealth-damage;
  }
}
void status()
{
  textAlign(CENTER);
  text("Player Status", 275, 415);
  text("Enemy Status", 400, 415);
  if (multiHeal)
  {
    text("Healing", 275, 430);
  }
  if (playerPoison)
  {
    text("Poisoned", 275, 430);
  }
  if (enmultiPoison)
  {
    text("Poisoned", 400, 430);
  }
  if (Orange)
  {
    text("Disabled", 400, 445);
  }
  if (Ruby)
  {
    text("Burned", 400, 460);
  }
  if (enmultiHeal)
  {
    text("Healing", 400, 430);
  }
  if (Amethyst)
  {
    text("Defense+", 275, 445);
  }
  if (enRuby)
  {
    text("Burned", 275, 460);
  }
  if (enOrange)
  {
    text("Disabled", 275, 475);
  }
  if (enAmethyst)
  {
    text("Defense+", 400, 475);
  }
}

void keyPressed()
{
  if (battle)
  {
    if (!alchInv && !sumInv)
    {
      if (keyCode == UP)
      {
        if (arrowy == 415 && arrowx == 115)
        {
          arrowy = 505;
        }
        else if (arrowy == 415 && arrowx == 5)
        {
          arrowy = 505;
        }
        arrowy-=arrowyinc;
      }
      if (keyCode == DOWN)
      {
        if (arrowy > 475 && arrowx == 5)
        {
          arrowy = 400;
        }
        else if (arrowy > 475 && arrowx == 115)
        {
          arrowy = 400;
        }
        arrowy+=arrowyinc;
      }
      if (keyCode == RIGHT)
      {
        if (arrowx > 110)
        {
          arrowx = -105;
        }
        arrowx+=arrowxinc;
      }
      if (keyCode == LEFT)
      {
        if (arrowx == 5)
        {
          arrowx = 225;
        }
        arrowx-=arrowxinc;
      }
    }
    else if (alchInv || sumInv)
    {
      if (keyCode == UP)
      {
        if (arrowy <= 170)
        {
          arrowy = 305;
        }
        arrowy-=arrowyinc;
      }
      if (keyCode == DOWN)
      {
        if (arrowy >= 290)
        {
          arrowy = 155;
        }
        arrowy+=arrowyinc;
      }
    }
    if (keyCode == ENTER)
    {
      if (Retreat)
      {
        retreat();
      }
      if (victory)
      {
        Victory();
      }
      if (yourTurn)
      {
        yourturn();
      }
      else if (!yourTurn)
      {
        arrowx = 5;
        arrowy = 415;
        enemyTurn();
      }
    }
  }
}

