void displaystuff()
{
  if (location == 0)
  {
    fill(0);
    stroke(0);
    rect(50, 50, 150, 150);
    noFill();
    text("Total Blocks: " + floor(totalBlocks), 50, 250);
    text("Save", 16, 25);
    text("Reset", 69, 25);
    rect(5, 5, 50, 30);
    rect(60, 5, 50, 30);
  }
  if (location == 1)
  {
    noFill();
    rect(150, 25, 10, 10);
    rect(170, 25, 10, 10);
    fill(0);
    text("<", 152, 35);
    text(">", 172, 35);
    text(int(blockAd), 200, 35);
    text("Blocks: " + floor(totalBlocks), 50, 35);
    text("Intventory Size: " + int(box), 350, 100);
    text("Limit: " + boxLimit, 350, 115);
  }
  if (location == 2)
  {
    textAlign(CENTER);
    text("Where to Go?", width/2, 50);
  }
  if (location == 7)
  {
    bg = loadImage("circle.png");
    image(bg, 0, 0, 500, 500);
    fill(255);
    rect(width/2-50, height/2-25, 100, 50);
    fill(0);
    textAlign(CENTER);
    text("COMBINE", width/2, height/2);
    if (!combined)
    {
      alchText = "Combine some elements, fool!";
    }
    text(alchText, width/2, 15);
  }
  if (location == 8)
  {
    text("Intventory Size: " + int(box), 350, 100);
    text("Limit: " + boxLimit, 350, 115);
  }
  if (location == 9)
  {
    alchbook();
  }
  if (location == 10)
  {
    if (!combined)
    {
      summonText = "Combine some elements, fool!";
    }
    textAlign(CENTER);
    text(summonText, width/2, 15);
    image(loadImage("cauldron.png"), 85, 30);
    fill(255);
    rect(width/2-50, height/2-25, 100, 50);
    fill(0);
    textAlign(CENTER);
    text("COMBINE", width/2, height/2);
  }
  if (location == 11)
  {
    text("Intventory Size: " + int(box), 350, 100);
    text("Limit: " + boxLimit, 350, 115);
  }
  if (location == 12)
  {
    sumbook();
  }
}

