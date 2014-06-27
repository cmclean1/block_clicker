import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;
Minim minim;
AudioPlayer musicplayer;

PImage player, enemy, bg;
float box;
int boxLimit = 50;
int healthPrice;
boolean battle = false;
int location = 0;
boolean killedWitch;
int unlockGeneral;
int unlockBattle;
float bps;
String bpsString;
Dungeon forest, cave, club, witchhut, hell, bikini, walmart;
Enemy tree, rock;
Enemy moustache, rpg;
Enemy lynn, jason, miley;
Enemy witch;
Enemy devil, fallenangel, espurr;
Enemy squilliam, pitbull;
Enemy blackguy;
Summon triangle, circle, square, angle, polygon, pentagon, heart, line;
/*
 farm = -1
 home = 0
 storage = 1
 adventure = 2
 upgrades = 3
 forest = 4
 cave = 5
 club = 6
 alchemy = 7
 alchemy bag = 8
 alchemy instructions = 9
 summoning = 10
 summoning bag = 11
 summoning instructions  = 12
 witch = 13
 hell = 14
 bikini bottom = 15
 walmart = 16
 */
String saveData;
String loadData;
float data[];

button Storage, Home, Back, Upgrades, Adventure, Forest, Cave, Club, Witch, Hell, Bikini, Walmart, Alchemist, AlchBag, AlchBook, Summon, SummonBag, SummonBook, Farm;

ugButton Health, Click, Inv, SeeHealth, neverMiss, moreDamage, moreHeal, moreDef;

Dot red, green, purple, gold, orange, white, black, blue;
Dot diamond, unstable, garnet, rainbow, obsidian, emerald, ruby, amethyst;
Farm redFarm, greenFarm, purpleFarm, goldFarm, orangeFarm, whiteFarm, blackFarm, blueFarm;

float totalBlocks;
float blockAd;

void setup() {
  minim = new Minim(this);
  musicplayer = minim.loadFile("song1.mp3");
  player = loadImage("player.png");
  String loadData[] = loadStrings("data.txt");
  data = float(loadData);
  totalBlocks = int(data[0]);
  blockAd = data[1];
  box = data[18];
  killedWitch = boolean(int(data[59]));
  killedWitch = false;
  unlockGeneral = int(data[60]);
  size(500, 500);
  background(255);
  fill(0);
  red = new Dot(10, .01, 25, color(255, 0, 0), "Red", 2, 3, 0);
  green = new Dot(20, .02, 80, color(0, 255, 0), "Green", 4, 5, 1);
  purple = new Dot(30, .03, 135, color(255, 0, 255), "Purple", 6, 7, 2);
  gold = new Dot(55, .1, 190, color(216, 194, 22), "Gold", 8, 9, 3);
  orange = new Dot(50, .04, 245, color(255, 129, 3), "Orange", 19, 20, 4);
  white = new Dot(60, .04, 300, color(100), "White", 21, 22, 5);
  black = new Dot (100, -.01, 355, color(0), "Black", 23, 24, 6);
  blue = new Dot(200, 0, 410, color(0, 0, 255), "Blue", 25, 26, 7);

  ruby = new Dot(.05, 1, "Ruby", 39, 40);
  emerald = new Dot( .04, 1, "Emerald", 37, 38);
  amethyst = new Dot(.05, 1, "Amethyst", 41, 42);
  diamond = new Dot(.5, 1, "Diamond", 27, 28);
  garnet = new Dot(.05, 1, "Garnet", 31, 32);
  rainbow = new Dot( .06, 1, "Rainbow", 33, 34);
  obsidian = new Dot(-.1, 1, "Obsidian", 35, 36); 
  unstable = new Dot( random(-.001, .001), 1, "Unstable", 29, 30);

  redFarm = new Farm(1, color(255, 0, 0), 50);
  greenFarm = new Farm(2, color(0, 255, 0), 100);
  purpleFarm = new Farm(3, color(255, 0, 255), 150);
  goldFarm = new Farm(4, color(216, 194, 22), 200);
  orangeFarm = new Farm(5, color(255, 129, 3), 250);
  whiteFarm = new Farm(6, color(255), 300);
  blackFarm = new Farm(7, color(0), 350);
  blueFarm = new Farm(8, color(0, 0, 255), 400);

  Storage = new button(50, 425);
  Home = new button(50, 425);
  Adventure = new button(350, 425);
  Upgrades = new button(225, 25);
  Back = new button(50, 425);
  Forest = new button(100, 75);
  Cave = new button(100, 150);
  Bikini = new button(100, 225);
  Walmart = new button(100, 300);
  Club = new button(300, 75);
  Witch = new button(100, 250);
  Hell = new button(300, 150);
  Alchemist = new button(225, 100);
  AlchBag = new button(380, 50);
  AlchBook = new button(380, 425);
  Summon = new button(225, 175);
  SummonBag = new button(380, 50);
  SummonBook = new button(380, 425);
  Farm = new button(225, 250);

  Health = new ugButton(50, 50, "More Health:", 10);
  Click = new ugButton(50, 105, "Better Clicks:", 11);
  Inv = new ugButton(50, 160, "Bigger Inventory:", 12);
  SeeHealth = new ugButton(350, 50, "See Health:", 13);
  neverMiss = new ugButton(350, 105, "Never Miss:", 14);
  moreDamage = new ugButton(50, 215, "More Damage:", 15);
  moreHeal = new ugButton(50, 270, "Better Healing:", 16);
  moreDef = new ugButton(50, 325, "More Defense:", 17);

  forest = new Dungeon("forest.png");
  cave = new Dungeon("cave.png");
  club = new Dungeon("club.png");
  witchhut = new Dungeon("witchhut.png");
  bikini = new Dungeon("bikini.png");
  hell = new Dungeon("hell.png");
  walmart = new Dungeon("walmart.png");

  triangle = new Summon(1, "Triangles", 50, 43, 44);
  polygon = new Summon(2, "Polygons", 65, 45, 46);
  square = new Summon(3, "Squares", 80, 47, 48);
  circle = new Summon(4, "Circles", 95, 49, 50);
  pentagon = new Summon(5, "Pentagons", 110, 51, 52);
  line = new Summon(6, "Lines", 125, 53, 54);
  angle = new Summon(7, "Acute Angles", 140, 55, 56);
  heart = new Summon(8, "Hearts", 155, 57, 58);

  tree = new Enemy(1, 0, 0, 0, 0, 4, 0);
  tree.stringAssign("Tree does nothing!", "", "", "");
  tree.statAssign(20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

  rock = new Enemy(1, 3, 0, 0, 0, 4, 1);
  rock.stringAssign("", "", "", "");
  rock.statAssign(50, int(random(4, 6)), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

  moustache = new Enemy(4, 2, 1, 1, 1, 5, 0);
  moustache.stringAssign("Moustache heals itself!", "Moustache attacks!", "Moustache attacks!", "Moustache attacks!");
  moustache.statAssign(70, 8, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0);

  rpg = new Enemy(4, 1, 9, 1, 1, 5, 1);
  rpg.stringAssign("OH NO HE'S HOT!!1", "OH NO HE'S HOT!!!", "OH NO HE'S HOT!!1", "OH NO HE'S HOT!!1");
  rpg.statAssign(175, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2);

  lynn = new Enemy(4, 1, 1, 1, 2, 6, 0);
  lynn.statAssign(100, 10, 12, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0);
  lynn.stringAssign("Lynn Allen gives a AutoCAD tip!", "Lynn Allen gives a AutoCAD tip!", "Lynn Allen's son's pupppy attacks!", "Lynn Allen tells a corny joke!");

  jason = new Enemy(4, 5, 6, 7, 8, 6, 1);
  jason.statAssign(100, 8, 0, 8, 0, 10, 100, 100, 10, 100, .75, 100, 0);
  jason.stringAssign("Mr. Sanservino loves seeing the tears of his \nstudents!", "Your last test grade ruins your average!", "Sanservino's pop quizzes slowly kill you!", "Your tears make him stronger!");

  miley = new Enemy(4, 1, 2, 10, 0, 6, 2);
  miley.statAssign(40, 10, 0, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0);
  miley.stringAssign("Miley comes in like a wrecking ball!", "Miley twerks and heals herself!", "Miley summons Robin Thicke to protect her!", "Miley carefully thinks about her current \nlifestyle,  compares it to her past as \nHannah Montana and contemplates on \nwhether her life choices are ethical or not!");
  miley.summonAssign(15, 5, "thicke.png", "Robin Thicke");

  witch = new Enemy(1, 11, 0, 0, 0, 13, 0);
  witch.statAssign(120, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
  witch.stringAssign("Witch summons a bomb! Kill her in 8 turns \nor you're dead!", "", "", "");
  witch.summonAssign(15, 8, "witchbomb.png", "Bomb");

  devil = new Enemy(2, 12, 1, 0, 0, 14, 0);
  devil.statAssign(100, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
  devil.stringAssign("Devil summons a demon!", "Devil attacks!", "", "");
  devil.summonAssign(1, 100, "devil.png", "Demon");

  fallenangel = new Enemy(3, 13, 2, 14, 0, 14, 1);
  fallenangel.statAssign(100, 5, 0, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0);
  fallenangel.stringAssign("Fallen Angel uses its remaining angelic \npower to create a halo! All negative statuses \nare healed!", "Fallen Angel is healed by the fire \nsurrounding it!", "Fallen Angel feeds on your soul!", "");
  fallenangel.summonAssign(1, 100, "halo.png", "Halo");

  espurr = new Enemy(2, 1, 4, 0, 0, 14, 2);
  espurr.statAssign(100, 25, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
  espurr.stringAssign("Espurr uses psychic!", "Espurr looks with its special eyes!", "", "");

  squilliam = new Enemy(4, 1, 9, 1, 1, 15, 0); 
  squilliam.statAssign(205, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3);
  squilliam.stringAssign("OH NO HE'S HOT!!1", "OH NO HE'S HOT!!!", "OH NO HE'S HOT!!1", "OH NO HE'S HOT!!1");

  pitbull = new Enemy(4, 8, 1, 2, 4, 15, 1);
  pitbull.stringAssign("Pitbull's Goatee grows!", "Pitbull's Goatee attacks!", "Pitbull trims his goatee!", "DALE!");
  pitbull.statAssign(75, 5, 10, 5, 5, 5, 5, 5, 5, 5, .2, 5, 5);
  blackguy = new Enemy(4, 1, 4, 6, 7, 16, 0);
  blackguy.stringAssign("Black guy attacks!", "Black guy attacks!", "Black guy stabs you for taking his Kool-Aid!", "Black guy ain't got time fo yo mess!");
  blackguy.statAssign(200, 0, 0, 0, 0, 0, 0, 5, 5, 5, 0, 0, 0);
  // musicplayer.loop();
}

void testStuff()
{
  unlockGeneral = 10;
}
void draw() {
  testStuff();  
  frameRate = 60;
  bps = (red.autoCount+green.autoCount+purple.autoCount+gold.autoCount+orange.autoCount+white.autoCount+black.autoCount+blue.autoCount)*frameRate;
  bpsString = nf(bps, 2, 2);
  strokeJoin(MITER);
  textAlign(LEFT);
  background(255);
  displaystuff();
  red.displayCount(50, "Heals damage in battle");
  green.displayCount(65, "Heals small amounts of \ndamage over multiple \nturns or gets rid of \npoisoned status.");
  purple.displayCount(80, "Gets rid of the enemy's \nhealing status or poisons \nenemy for a few turns.");
  gold.displayCount(95, "Does nothing in battle, but" + ENTER + "brings in a lot of blocks.");
  orange.displayCount(110, "Keeps enemy from" + ENTER + "attacking next turn. Useful" + ENTER + "for letting green/purple" + ENTER + "dots take their course");
  white.displayCount(125, "Absorb enemy HP and" + ENTER + "heal yourself.");
  black.displayCount(140, "Deal a lot of damage, but " + ENTER + "has a chance to damage" + ENTER + "you instead. Slowly " + ENTER + "deletes blocks instead of " + ENTER + "autoclicking them");
  blue.displayCount(155, "Does absolutely nothing," + ENTER + "but is frequently used in" + ENTER + "alchemy");
  ruby.displayCount(50, "");
  emerald.displayCount(65, "");
  amethyst.displayCount(80, "");
  diamond.displayCount(95, "");
  garnet.displayCount(110, "");
  rainbow.displayCount(125, "");
  obsidian.displayCount(140, "");
  unstable.displayCount(155, "");
  red.displayAlchemy(30, color(255, 0, 0));
  green.displayAlchemy(60, color(0, 255, 0));
  purple.displayAlchemy(90, color(255, 0, 255));
  gold.displayAlchemy(120, color(216, 194, 22));
  orange.displayAlchemy(150, color(255, 129, 3));
  white.displayAlchemy(180, color(255));
  black.displayAlchemy(210, color(0));
  blue.displayAlchemy(240, color(0, 0, 255));
  ruby.displayAlchemy(30, color(255, 0, 0));
  emerald.displayAlchemy(60, color(0, 255, 0));
  amethyst.displayAlchemy(90, color(255, 0, 255));
  diamond.displayAlchemy(120, color(3, 180, 255));
  garnet.displayAlchemy(150, color(255, 129, 3));
  redFarm.display();
  greenFarm.display();
  purpleFarm.display();
  goldFarm.display();
  orangeFarm.display();
  whiteFarm.display();
  blackFarm.display();
  blueFarm.display();
  colorMode(HSB, 360, 100, 100);
  rainbow.displayAlchemy(180, color(random(360), 100, 100));
  colorMode(RGB, 255, 255, 255);
  obsidian.displayAlchemy(210, color(0));
  unstable.displayAlchemy(240, color(random(255), random(255), random(255)));
  if (location == 0) {
    if (unlockGeneral >= 8)
    {
      Storage.display("Go to Storage");
      Upgrades.display("Upgrades");
    }
    if (unlockGeneral >=9)
    {
      Alchemist.display("Alchemist Circle");
      Summon.display("Magic Cauldron");
      Farm.display("Farm");
    }
  } else if (location == -1)
  {
    Home.display("Home");
  } else if (location == 1) {
    Home.display("Home");
    Adventure.display("Adventure!");
  } else if (location == 3) {
    Home.display("Home");
    Health.display(3, 50000, 100000, 1000000, 0);
    Click.display(4, 10000, 100000, 198760, 500000);
    Inv.display(4, 20000, 50000, 100000, 500000);
    SeeHealth.display(1, 9999, 0, 0, 0);
    //  neverMiss.display(1, 1, 0, 0, 0);
    moreDamage.display(4, 90000, 500000, 1000000, 1234560);
    moreHeal.display(4, 85555, 45555, 955555, 1000001);
    // moreDef.display(4, 100000, 999999, 9072834, 10000000);
  } else if (location == 2) {
    Back.display("Back");
    Forest.display("Friendly Forest");
    Cave.display("Shallow Cave");
    Bikini.display("Bikini Bottom");
    Club.display("Da Club");
    Hell.display("Hell");
    Walmart.display("Wally Walmart");
  } else if (location == 7) {
    Home.display("Back");
    AlchBag.display("Alchemist Bag");
    AlchBook.display("Alchemist Book");
  } else if (location == 8) {
    Adventure.display("Adventure!");
    Back.display("Back");
  } else if (location == 10)
  {
    Back.display("Back");
    SummonBag.display("Summoning Bag");
    SummonBook.display("Summon Tome");
  } else if (location == 11)
  {
    triangle.displayCount();
    polygon.displayCount();
    circle.displayCount();
    angle.displayCount();
    heart.displayCount();
    square.displayCount();
    pentagon.displayCount();
    line.displayCount();
    Back.display("Back");
  }
  if (battle) {
    Battle();
  }
  ifup();
}

void mouseClicked() {
  if (mouseButton == LEFT) {
    red.ifClicked();
    green.ifClicked();
    purple.ifClicked();
    gold.ifClicked();
    orange.ifClicked();
    white.ifClicked();
    black.ifClicked();
    blue.ifClicked();
    diamond.ifClicked();
    unstable.ifClicked();
    garnet.ifClicked();
    ruby.ifClicked();
    emerald.ifClicked();
    amethyst.ifClicked();
    rainbow.ifClicked();
    obsidian.ifClicked();
    triangle.ifClicked();
    polygon.ifClicked();
    circle.ifClicked();
    angle.ifClicked();
    heart.ifClicked();
    line.ifClicked();
    square.ifClicked();
    pentagon.ifClicked();
    redFarm.initialClicked();
    greenFarm.initialClicked();
    purpleFarm.initialClicked();
    goldFarm.initialClicked();
    orangeFarm.initialClicked();
    whiteFarm.initialClicked();
    blackFarm.initialClicked();
    blueFarm.initialClicked();
    Health.ifClicked();
    Click.ifClicked();
    Inv.ifClicked();
    SeeHealth.ifClicked();
    //neverMiss.ifClicked();
    moreDamage.ifClicked();
    moreHeal.ifClicked();
    //moreDef.ifClicked();
    if (location == 0) {
      if (ifMouse(5, 55, 5, 35))
      {
        Save();
      }
      if (ifMouse(60, 110, 5, 35)) {
        reset();
      }
      if (ifMouse(50, 200, 50, 200)) {
        totalBlocks+=blockIn;
      }
      if (unlockGeneral >=8)
      {
        Upgrades.ifClicked(3, false);
        Storage.ifClicked(1, false);
      }
      if (unlockGeneral >=9)
      {
        Alchemist.ifClicked(7, false);
        Summon.ifClicked(10, false);
        Farm.ifClicked(-1, false);
      }
    } else if (location == -1)
    {
      Home.ifClicked(0, false);
    } else if (location == 1) {
      Home.ifClicked(0, false);
      Adventure.ifClicked(2, false);
      if (ifMouse(150, 160, 25, 35) && blockAd > 0) {
        blockAd-=1;
        totalBlocks+=1;
        box-=1;
      } else if (ifMouse(170, 180, 25, 35) && int(totalBlocks) > 0 && box < boxLimit) {
        blockAd+=1;
        totalBlocks-=1;
        box+=1;
      }
    } else if (location == 3) {
      Home.ifClicked(0, false);
    } else if (location == 2) {
      Back.ifClicked(1, false);
      Forest.ifClicked(4, true);
      Cave.ifClicked(5, true);
      Club.ifClicked(6, true);
      Hell.ifClicked(14, true);
      Bikini.ifClicked(15, true);
      Walmart.ifClicked(16, true);
    } else if (location == 7) {
      combined = false;
      Back.ifClicked(0, false);
      AlchBag.ifClicked(8, false);
      AlchBook.ifClicked(9, false);
      if (ifMouse(width/2-50, width/2+50, height/2-25, height/2+25)) {
        combine();
      }
    }
    if (location == 8) {
      Back.ifClicked(7, false);
      Adventure.ifClicked(2, false);
    }
    if (location == 9) {
      if (ifMouse(20, 45, height/2, height/2+25)) {
        alchBookNum--;
        if (alchBookNum == 0) {
          alchBookNum = 1;
          location = 7;
        }
      }
      if (ifMouse(450, 465, height/2, height/2+25)) {
        alchBookNum++;
        if (alchBookNum > 17) {
          alchBookNum = 17;
        }
      }
    }
    if (location == 10)
    {
      combined = false;
      Back.ifClicked(0, false);
      SummonBook.ifClicked(12, false);
      SummonBag.ifClicked(11, false);
      if (ifMouse(width/2-50, width/2+50, height/2-25, height/2+25)) {
        sumCombine();
      }
    }
    if (location == 11)
    {
      Back.ifClicked(10, false);
    }
    if (location == 12)
    {
      if (ifMouse(20, 45, height/2, height/2+25)) {
        summonBookNum--;
        if (summonBookNum == 0) {
          summonBookNum = 1;
          location = 10;
        }
      }
      if (ifMouse(450, 465, height/2, height/2+25)) {
        summonBookNum++;
        if (summonBookNum > 16) {
          summonBookNum = 16;
        }
      }
    }
  }
}

boolean ifMouse(int mousex1, int mousex2, int mousey1, int mousey2) {
  if (mouseX >= mousex1 && mouseX <= mousex2 && mouseY > mousey1 && mouseY < mousey2) {
    return true;
  } else {
    return false;
  }
}

String notation(float x, int decimal)
{
  String baseten;
  String what;
  int basetentimes = 0;
  float xx = x;
  if (xx <= 99)
  {
    what = "" + nf(x, 0, decimal);
    return what;
  } else
  {
    while (xx >=99)
    {
      xx = xx/10;
      basetentimes++;
    }
    baseten = " x 10^" + basetentimes;
    what = nf(xx, 2, decimal) + baseten;
    return what;
  }
}

/* add new variables to save onto String saveData and starting value into resetData
 run program and press save button.
 initialize variable outside the functions and declare them in void setup. assign int data [] array # to variable 
 use int() wherever necessary (where a float variable will be displayed on screen)
 dont forget the first # in an array is 0
 */

void Save()
{ //             0                 1                 2                 3                     4                5                     6                      7                8                         9                  10                         11                 12                 13                        14                       15                             16                   17                 18             19                20                        21                  22                 23                  24                    25                 26                  27                      28                    29                     30                      31               32                        33                     34                     35                     36                     37                    38                  39                 40                41                        42                         43                      44                     45                     46                       47                 48              49                      50                      51                    52                     53                    54                   55                  56             57                   58                     59                       60
  saveData = totalBlocks + "," + blockAd + "," + red.count + "," + red.adCount + "," + green.count + "," + green.adCount+ "," + purple.count + "," + purple.adCount + "," + gold.count + "," + gold.adCount + "," + Health.upgrade + "," + Click.upgrade + "," + Inv.upgrade + "," + SeeHealth.upgrade + "," + neverMiss.upgrade + "," + moreDamage.upgrade + "," + moreHeal.upgrade + "," + moreDef.upgrade+ "," + box+ "," + orange.count + "," + orange.adCount+ "," + white.count + "," + white.adCount+ "," + black.count + "," + black.adCount+ "," + blue.count + "," + blue.adCount+ "," + diamond.count + "," + diamond.adCount+ "," + unstable.count + "," + unstable.adCount+ "," + garnet.count + "," + garnet.adCount+ "," + rainbow.count + "," + rainbow.adCount+ "," + obsidian.count + "," + obsidian.adCount+ "," + emerald.count + "," + emerald.adCount+ "," + ruby.count + "," + ruby.adCount+ "," + amethyst.count + "," + amethyst.adCount + "," + triangle.count + "," + triangle.adCount+ "," + polygon.count + "," + polygon.adCount+ "," + square.count + "," + square.adCount+ "," + circle.count + "," + circle.adCount+ "," + pentagon.count + "," + pentagon.adCount+ "," + line.count + "," + line.adCount+ "," + angle.count + "," + angle.adCount+ "," + heart.count + "," + heart.adCount + "," +  int(killedWitch)+ "," +  unlockGeneral;
  String[] save = split(saveData, ",");
  saveStrings("data.txt", save);
}
void reset()
{
  saveData = 0 + "," + 0 + "," + 0 + "," + 0 + "," + 0 + "," + 0 + "," + 0 + ","+ 0 + "," + 0 + "," + 0 + "," + 1 + ","+ 1 + "," + 1 + "," + 1 + "," + 1+ "," + 1+ "," + 1+ "," + 1+ "," + 0+ "," + 0+ "," + 0+ "," + 0+ "," + 0+ "," + 0+ "," + 0+ "," + 0+ "," + 0+ "," + 0+ "," + 0+ "," + 0+ "," + 0 + "," + 0 + "," + 0 + "," + 0 + "," + 0 + "," + 0 + "," + 0 + "," + 0+ "," + 0+ "," + 0+ "," + 0+ "," + 0+ "," + 0+ "," + 0+ "," + 0+ "," + 0+ "," + 0+ "," + 0+ "," + 0+ "," + 0+ "," + 0+ "," + 0+ "," + 0+ "," + 0+ "," + 0+ "," + 0+ "," + 0+ "," + 0+ "," + 0 + "," + 0+ "," + 0;
  String[] save = split(saveData, ",");
  saveStrings("data.txt", save);
  exit();
}

