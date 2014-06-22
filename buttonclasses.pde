class button {
  int x, y, Height, Width;
  button(int xx, int yy)
  {
    x = xx;
    y = yy;
    Height = 50;
    Width = 100;
  }
  void display(String Text)
  {
    stroke(0);
    fill(255);
    rect(x, y, Width, Height);
    textAlign(LEFT);
    fill(0);
    text(Text, x+5, y+25);
  }
  void ifClicked(int change, boolean ifBattle)
  {
    if (mouseX > x && mouseX < x+100 && mouseY > y && mouseY < y+50)
    {
      location = change;
      if (ifBattle)
      {
        pick = true;
        battle = true;
        startBattle = true;
      }
      else
      {
        pick = false;
        battle = false;
        startBattle = false;
      }
    }
  }
}
class ugButton {
  int x;
  int y;
  int Height;
  int Width;
  int price;
  String text;
  float upgrade;
  ugButton(int xx, int yy, String Text, int loc)
  {
    text= Text;
    x = xx;
    y = yy;
    Height = 50;
    Width = 100;
    upgrade = data[loc];
  }
  void display(int num, int up1, int up2, int up3, int up4)
  {
    stroke(0);
    noFill();
    rect(x, y, Width, Height);
    textAlign(LEFT);
    fill(0);
    text(text + ENTER + price, x+5, y+25);
    if (price > totalBlocks)
    {
      fill(0, 75);
      stroke(0);
      rect(x, y, Width, Height);
    }
    if (upgrade < num+1)
    {
      if (upgrade == 1)
        price = up1; 
      else if (upgrade == 2)
        price = up2;
      else if (upgrade == 3)
        price = up3;
      else if (upgrade == 4)
        price = up4;
    }
    else if (upgrade == num+1)
    {
      fill(255);
      stroke(0);
      rect(x, y, Width, Height);
      fill(0, 75);
      stroke(0);
      rect(x, y, Width, Height);
      fill(0);
      text("All Bought", x+5, y+25);
    }
  }
  void ifClicked()
  {
    if (price <= totalBlocks && location == 3 && mouseX > x && mouseX < x+100 && mouseY > y && mouseY < y+50)
    {
      totalBlocks = totalBlocks - price;
      upgrade+=1;
    }
  }
}

