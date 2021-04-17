//Dashboard States

//Dashboard Initial Setup
int baseX, baseY, speedX, speedY, tachX, tachY, centX, centY, gasGaugeX, gasGaugeY, mileageX, mileageY, controlPnlX, controlPnlY,oilPressX, oilPressY, engTempX, engTempY;
int oilEngXSize = 150;
int oilEngYSize = 100;
int controlPnlXSize = 1200;
int controlPnlYSize = 120;
int mileageXSize = 200;
int mileageYSize = 30;
int gasGaugeXSize = 200;
int gasGaugeYSize = 175;
int baseXSize = 1400;
int baseYSize = 1400;
int spdtchSize = 350;
int centXSize = 200;
int centYSize = 325;

//Separators
int centSep1X1, centSep1Y, centSep1X2, centSep2X1, centSep2Y, centSep2X2, centSep3X, centSep3Y1, centSep3Y2, centSep4X, centSep4Y1, centSep4Y2;

int time;

void setup(){
  size(1600,800);
  time = millis();
  controlPnlX = 200;
  controlPnlY = 615;
  mileageX = 700;
  mileageY = 575;
  gasGaugeX = 800;
  gasGaugeY = 575;
  centX = 700;
  centY = 155;
  speedX = 512;
  speedY = 330;
  tachX = 1088;
  tachY = 330;
  baseX = 800;
  baseY = 750;
  centSep1X1 = centX;
  centSep1Y = centY + 50;
  centSep1X2 = centX + centXSize;
  centSep2X1 = centX;
  centSep2Y = centY + centYSize - 75;
  centSep2X2 = centX + centXSize;
  centSep3X = centX + 50;
  centSep3Y1 = centSep2Y;
  centSep3Y2 = centY+centYSize;
  centSep4X = centSep3X + 100;
  centSep4Y1 = centSep3Y1;
  centSep4Y2 = centSep3Y2;
  oilPressX = tachX;
  oilPressY = 455;
  engTempX = speedX;
  engTempY = 455;
}

void draw(){
  strokeWeight(3);
  update();
  arc(baseX,baseY,baseXSize,baseYSize,PI,2*PI,CHORD);
  ellipse(speedX,speedY,spdtchSize,spdtchSize);
  ellipse(tachX,tachY,spdtchSize,spdtchSize);
  rect(centX,centY,centXSize,centYSize, 25);
  arc(gasGaugeX, gasGaugeY, gasGaugeXSize, gasGaugeYSize, PI, 2*PI,CHORD);
  rect(mileageX, mileageY, mileageXSize, mileageYSize);
  line(centSep1X1,centSep1Y,centSep1X2,centSep1Y);
  line(centSep2X1,centSep2Y,centSep2X2,centSep2Y);
  line(centSep3X,centSep3Y1,centSep3X,centSep3Y2);
  line(centSep4X,centSep4Y1,centSep4X,centSep4Y2);
  rect(controlPnlX,controlPnlY,controlPnlXSize,controlPnlYSize);
  ellipse(oilPressX,oilPressY,oilEngXSize,oilEngYSize);
  ellipse(engTempX,engTempY,oilEngXSize,oilEngYSize);
}

void update(){
  
}

boolean secondcheck(){
  if(((millis()/1000) - time) >= 1){
    time = millis()/1000;
    return true;
  }
  else{
    return false;
  }
}
