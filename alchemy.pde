String alchText;
boolean combined;
int alchBookNum = 1;
int totalAlch;
String summonText;
int summonBookNum = 1;
int totalSummon;
boolean sumCombined;
void combine() {
  totalAlch = int(red.alchCount+green.alchCount+purple.alchCount+gold.alchCount+orange.alchCount+white.alchCount+black.alchCount+blue.alchCount);
  combined = true;
  if (alchCheck(8, 1, 1, 0, 0, 1, 0, 8)) {
    ruby.count++;
    alchText = "Successfully made a ruby dot!";
  }
  else if (alchCheck(2, 6, 1, 0, 1, 1, 0, 8)) {
    emerald.count++;
    alchText = "Successfully made an emerald dot!";
  }
  else if (alchCheck(2, 1, 5, 1, 4, 0, 1, 8)) {
    amethyst.count++;
    alchText = "Successfully made an amethyst dot!";
  }
  else if (alchCheck(0, 0, 0, 10, 0, 0, 0, 8)) {
    diamond.count++;
    alchText = "Successfully made a diamond dot!";
  }
  else if (alchCheck(1, 1, 1, 0, 7, 1, 1, 7)) {
    garnet.count++;
    alchText ="Successfully made a garnet dot!";
  }
  else if (alchCheck(3, 3, 3, 3, 3, 3, 3, 3))
  {
    rainbow.count++;
    alchText = "Successfully made a rainbow dot!";
  }
  else if (alchCheck(0, 0, 0, 0, 0, 0, 10, 10)) {
    obsidian.count++;
    alchText = "Successfully made an obsidian dot!";
  }
  else if (alchCheck(0, 0, 0, 0, 0, 0, 0, 0)) {
    alchText = "Nothing is in the circle!";
  }
  else if (totalAlch == 1)
  {
    alchText = "Made nothing! Waste of a dot!";
  }
  else {
    if (totalAlch >= 5) {
      int random = int(random(0));
      if (random == 0) {
        alchText = "Made an unstable dot! Who knows what it does?";
        unstable.count++;
      }
      else {
        alchText = "Made nothing! Waste of dots!";
      }
    }
    else {
      alchText = "Made nothing! Waste of dots!";
    }
  }
  red.alchCount = 0;
  green.alchCount = 0;
  purple.alchCount = 0;
  gold.alchCount = 0;
  orange.alchCount = 0;
  white.alchCount = 0;
  black.alchCount = 0;
  blue.alchCount = 0;
}
void sumCombine()
{
  if (sumCheck(1, 0, 0, 0, 0, 0, 0, 0))
  {
    triangle.count++;
    summonText = "Made a triangle!";
  }
  else if (sumCheck(0, 1, 0, 0, 0, 0, 0, 0))
  {
    polygon.count++;
    summonText = "Made a polygon!";
  }
  else if (sumCheck(0, 0, 1, 0, 0, 0, 0, 0))
  {
    square.count++;
    summonText = "Made a square!";
  }
  else if (sumCheck(0, 0, 0, 1, 0, 0, 0, 0))
  {
    circle.count++;
    summonText = "Made a circle!";
  }
  else if (sumCheck(0, 0, 0, 0, 1, 0, 0, 0))
  {
    pentagon.count++;
    summonText = "Made a pentagon!";
  }
  else if (sumCheck(0, 0, 0, 0, 0, 1, 0, 0))
  {
    line.count++;
    summonText = "Made a line!";
  }
  else if (sumCheck(0, 0, 0, 0, 0, 0, 1, 0))
  {
    angle.count++;
    summonText = "Made an acute angle!";
  }
  else if (sumCheck(0, 0, 0, 0, 0, 0, 0, 1))
  {
    heart.count++;
    summonText = "Made a heart!";
  }
  else
  {
    summonText = "Made nothing!";
  }
  combined = true;
  ruby.alchCount = 0;
  emerald.alchCount = 0;
  amethyst.alchCount = 0;
  diamond.alchCount = 0;
  garnet.alchCount = 0;
  rainbow.alchCount = 0;
  obsidian.alchCount = 0;
  unstable.alchCount = 0;
}
boolean alchCheck(float red_, float green_, float purple_, float gold_, float orange_, float white_, float black_, float blue_) {
  if (red_ == red.alchCount && green_ == green.alchCount && purple_ == purple.alchCount && gold_ == gold.alchCount && orange_ == orange.alchCount && white_ == white.alchCount && black_ == black.alchCount && blue_ == blue.alchCount) {
    return true;
  }
  else {
    return false;
  }
}
boolean sumCheck(float red_, float green_, float purple_, float gold_, float orange_, float white_, float black_, float blue_) {
  if (red_ == ruby.alchCount && green_ == emerald.alchCount && purple_ == amethyst.alchCount && gold_ == diamond.alchCount && orange_ == garnet.alchCount && white_ == rainbow.alchCount && black_ == obsidian.alchCount && blue_ == unstable.alchCount) {
    return true;
  }
  else {
    return false;
  }
}
void alchbook() {
  image(loadImage("book" + alchBookNum + ".png"), 75, 0);
  fill(255);
  rect(20, height/2, 25, 25);
  rect(450, height/2, 25, 25);
  fill(0);
  text("<", 28, 268);
  text(">", 458, 268);
}
void sumbook()
{
  image(loadImage("sbook" + summonBookNum + ".png"), 75, 0);
  fill(255);
  rect(20, height/2, 25, 25);
  rect(450, height/2, 25, 25);
  fill(0);
  text("<", 28, 268);
  text(">", 458, 268);
}

