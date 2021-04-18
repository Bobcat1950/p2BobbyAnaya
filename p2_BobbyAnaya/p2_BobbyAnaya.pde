//Dashboard States
boolean carOn, turningLeft, turningRight, emergencyOn, testingOn, ccOn, fogLightsOn, leftBlink, rightBlink;

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
color baseColor1, dialBkgColor1, smallGaugeColor1, baseColor2, dialBkgColor2, smallGaugeColor2, baseColor3, dialBkgColor3, smallGaugeColor3, 
sepColor, controlPnlColor, buttonColor, buttonHighlight, textColor, emergencyColor, emergencyHighlight,startColor, startHighlight;
PImage HashMarks, SmallHashMarks, GasHashMarks,BigDial, SmallDial, GasDial;

//Warning Images
PImage WindshieldWipers, Seatbelt, CheckEngine, Abs, Traction, OilTemperature, LowGas, TirePressure, Battery, LowOil,
Airbags, FogLights, CruiseControl, EngineTemp, OilPressure, GasGaugeIcon, LeftSignal, RightSignal;
int warnImgY, CruiseControlY;

//Control Panel Buttons
int brightnessX, brightnessY, onoffX, onoffY, incX, incY, decX, decY, fogX, fogY,leftSignalX1, leftSignalX2, rightSignalX1, rightSignalX2,
signalY1, signalY2, signalY3, testWarningsX, testWarningsY, emergencyX1, emergencyX2, emergencyX3, emergencyY1, emergencyY2, startX, startY;
int startButtonSize = 100;
int squareButtonSize = 100;
int ccButtonSize = 75;

//Mouse Hovers
boolean brightnessOver, leftSignalOver, rightSignalOver, onoffOver, incOver, decOver, fogOver, testWarningsOver, emergencyOver, startOver;

//Separators
int centSep1X1, centSep1Y, centSep1X2, centSep2X1, centSep2Y, centSep2X2, centSep3X, centSep3Y1, centSep3Y2, centSep4X, centSep4Y1, centSep4Y2;

//Various Values
int time, speed, rpm, brightness;
float  speedDial, tachDial, speedFactor, tachFactor;
String speedString, direction, transmission, odometer,temperature;

void setup(){
  size(1600,800);
  time = millis()/1000;
  brightness = 0;
  speedDial = 0;
  tachDial = 0;
  carOn = false;
  turningLeft = false;
  turningRight = false;
  emergencyOn = false;
  testingOn = false;
  ccOn = false;
  fogLightsOn = false;
  warnImgY = 535;
  startX = 800;
  startY = 675;
  speed = 0;
  rpm = speed;
  direction = "NW";
  transmission = "P";
  odometer = "031525";
  temperature = "76° F";
  HashMarks = loadImage("HashMarks.png");
  SmallHashMarks = loadImage("SmallHashMarks.png");
  GasHashMarks = loadImage("GasHashMarks.png");
  BigDial = loadImage("BigDial.png");
  SmallDial = loadImage("SmallDial.png");
  GasDial = loadImage("GasDial.png");
  WindshieldWipers = loadImage("washer-fluid.png");
  Seatbelt = loadImage("seatbelt-reminder-light-300x300.png");
  CheckEngine = loadImage("340244-200.png");
  Abs = loadImage("340238-200.png");
  Traction = loadImage("traction-control-icon-21.png");
  OilTemperature = loadImage("EngineTempIcon.png");
  LowGas = loadImage("gas-pump.png");
  TirePressure = loadImage("TPMS_warning_icon.png");
  Battery = loadImage("battery-light-300x300.png");
  LowOil = loadImage("457521-200.png");
  Airbags = loadImage("367-200.png");
  FogLights = loadImage("1873215-200.png");
  GasGaugeIcon = loadImage("gasGaugeIcon.png");
  LeftSignal = loadImage("LeftSignal.png");
  RightSignal = loadImage("RightSignal.png");
  CruiseControl = loadImage("1353194-200.png");
  EngineTemp = loadImage("1041562-200.png");
  OilPressure = loadImage("457521-200.png");
  brightnessX = 250;
  brightnessY = 625;
  onoffX = 861;
  onoffY = brightnessY+12;
  incX = onoffX + ccButtonSize;
  incY = onoffY;
  decX = incX + ccButtonSize;
  decY = incY;
  fogX = 1250;
  fogY = 625;
  leftSignalX1 = 396;
  leftSignalX2 = leftSignalX1 + 87;
  rightSignalX1 = leftSignalX2 + 25;
  rightSignalX2 = rightSignalX1 + 87;
  signalY1 = fogY+50;
  signalY2 = fogY;
  signalY3 = fogY+100;
  emergencyX1 = 1118;
  emergencyX2 = 1168;
  emergencyX3 = 1218;
  emergencyY1 = 631;
  emergencyY2 = 718;
  testWarningsX = rightSignalX2 + 44;
  testWarningsY = signalY2;
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
  baseColor1 = color(106, 105, 120);
  dialBkgColor1 = color(2, 0, 64);
  smallGaugeColor1 = color(3, 0, 89);
  baseColor2 = color(140, 139, 158);
  dialBkgColor2 = color(3,0,89);
  smallGaugeColor2 = color(4,0,110);
  baseColor3 = color(165, 164, 186);
  dialBkgColor3 = color(4, 0, 120);
  smallGaugeColor3 = color(5, 0, 150);
  sepColor = color(66,132,138);
  controlPnlColor = color(87);
  buttonColor = color(122);
  buttonHighlight = color(150);
  textColor = color(120,236,245);
  emergencyColor = color(168,0,0);
  emergencyHighlight = color(190,0,0);
  startColor = color(8,158,0);
  startHighlight = color(9,186,0);
  CruiseControlY = 340;
}

void draw(){
  update();
  if(carOn == false){
    turningLeft = false;
    turningRight = false;
    emergencyOn = false;
    testingOn = false;
    ccOn = false;
    fogLightsOn = false;
  }
  imageMode(CORNER);
  speedString = ""+speed;
  if(speed <= 20 && speed > 0)
    rpm = 1;
  else if(speed <=40 && speed > 20)
    rpm = 2;
  else if(speed <=60 && speed > 40)
    rpm = 3;
  else if(speed <=80 && speed > 60)
    rpm = 4;
  else if(speed <=100 && speed > 80)
    rpm = 5;
  else if(speed <=120 && speed > 100)
    rpm = 6;
  else if(speed <=140 && speed > 120)
    rpm = 7;
  else if(speed <=160 && speed > 140)
    rpm = 8;  
  strokeWeight(3);
  stroke(0);
  if(brightness == 0){
    fill(baseColor1);
  }
  else if(brightness == 1){
    fill(baseColor2);
  }
  else if(brightness == 2){
    fill(baseColor3);
  }
  arc(baseX,baseY,baseXSize,baseYSize,PI,2*PI,CHORD);
  if(brightness == 0){
    fill(dialBkgColor1);
  }
  else if(brightness == 1){
    fill(dialBkgColor2);
  }
  else if(brightness == 2){
    fill(dialBkgColor3);
  }
  ellipse(speedX,speedY,spdtchSize,spdtchSize);
  ellipse(tachX,tachY,spdtchSize,spdtchSize);
  image(HashMarks,speedX-175,speedY-175);
  image(HashMarks,tachX-175,tachY-175);
  WindshieldWipers.resize(0,50);
  Seatbelt.resize(0,50);
  CheckEngine.resize(0,50);
  Abs.resize(0,50);
  Traction.resize(0,50);
  OilTemperature.resize(0,50);
  LowGas.resize(0,50);
  TirePressure.resize(0,50);
  Battery.resize(0,50);
  LowOil.resize(0,50);
  Airbags.resize(0,50);
  FogLights.resize(0,50);
  CruiseControl.resize(0,50);
  EngineTemp.resize(0,30);
  OilPressure.resize(0,40);
  LeftSignal.resize(0,50);
  RightSignal.resize(0,50);
  GasGaugeIcon.resize(0,25);
  rect(centX,centY,centXSize,centYSize, 25);
  if(brightness == 0){
    fill(smallGaugeColor1);
  }
  else if(brightness == 1){
    fill(smallGaugeColor2);
  }
  else if(brightness == 2){
    fill(smallGaugeColor3);
  }
  arc(gasGaugeX, gasGaugeY, gasGaugeXSize, gasGaugeYSize, PI, 2*PI,CHORD);
  image(GasHashMarks,gasGaugeX-100,gasGaugeY-87.5);
  image(GasGaugeIcon,gasGaugeX-12,gasGaugeY-25);
  rect(mileageX, mileageY, mileageXSize, mileageYSize);
  stroke(sepColor);
  line(centSep1X1,centSep1Y,centSep1X2,centSep1Y);
  line(centSep2X1,centSep2Y,centSep2X2,centSep2Y);
  line(centSep3X,centSep3Y1,centSep3X,centSep3Y2);
  line(centSep4X,centSep4Y1,centSep4X,centSep4Y2);
  if(ccOn || testingOn){
    image(CruiseControl,772,CruiseControlY);
  }
  stroke(0);
  fill(controlPnlColor);
  rect(controlPnlX,controlPnlY,controlPnlXSize,controlPnlYSize);
  if(brightness == 0){
    fill(smallGaugeColor1);
  }
  else if(brightness == 1){
    fill(smallGaugeColor2);
  }
  else if(brightness == 2){
    fill(smallGaugeColor3);
  }
  ellipse(oilPressX,oilPressY,oilEngXSize,oilEngYSize);
  ellipse(engTempX,engTempY,oilEngXSize,oilEngYSize);
  image(SmallHashMarks,oilPressX-75,oilPressY-50);
  image(SmallHashMarks,engTempX-75,engTempY-50);
  image(EngineTemp,engTempX-15,engTempY+15);
  image(OilPressure,oilPressX-20,oilPressY+10);
  fill(brightnessOver ? buttonHighlight : buttonColor);
  rect(brightnessX,brightnessY,squareButtonSize,squareButtonSize);
  fill(onoffOver ? buttonHighlight : buttonColor);
  rect(onoffX,onoffY,ccButtonSize,ccButtonSize);
  fill(incOver ? buttonHighlight : buttonColor);
  rect(incX,incY,ccButtonSize,ccButtonSize);
  fill(decOver ? buttonHighlight : buttonColor);
  rect(decX,decY,ccButtonSize,ccButtonSize);
  fill(fogOver ? buttonHighlight : buttonColor);
  rect(fogX,fogY,squareButtonSize,squareButtonSize);
  fill(leftSignalOver ? buttonHighlight : buttonColor);
  triangle(leftSignalX1,signalY1,leftSignalX2,signalY2,leftSignalX2,signalY3);
  fill(rightSignalOver ? buttonHighlight : buttonColor);
  triangle(rightSignalX1,signalY2,rightSignalX1,signalY3,rightSignalX2,signalY1);
  fill(emergencyOver ? emergencyHighlight : emergencyColor);
  triangle(emergencyX1,emergencyY2,emergencyX2,emergencyY1,emergencyX3,emergencyY2);
  fill(testWarningsOver ? buttonHighlight : buttonColor);
  rect(testWarningsX,testWarningsY,squareButtonSize,squareButtonSize);
  fill(startOver ? startHighlight : startColor);
  ellipse(startX,startY,startButtonSize,startButtonSize);
  fill(0);
  textSize(18);
  textAlign(CENTER, CENTER);
  text("Display\nBrightness",brightnessX+50,brightnessY+50);
  textSize(15);
  text("Cruise\nControl",onoffX+37,onoffY+37);
  text("Increase",incX+37,incY+37);
  text("Decrease",decX+37,decY+37);
  textSize(18);
  text("Fog\nLights",fogX+50,fogY+50);
  text("Left\nTurn",leftSignalX2-25,signalY2+50);
  text("Right\nTurn",rightSignalX1+27,signalY2+50);
  text("Test\nWarnings",testWarningsX+50,testWarningsY+50);
  text("On/\nOff",startX,startY);
  fill(textColor);
  textSize(25);
  text("0",405,392);
  text("20",385,330);
  text("40",405,260);
  text("60",452,215);
  text("80",512,195);
  text("100",565,215);
  text("120",610,260);
  text("140",625,330);
  text("160",610,392);
  text("0",978,392);
  text("1",960,330);
  text("2",975,260);
  text("3",1026,213);
  text("4",1088,200);
  text("5",1152,213);
  text("6",1200,260);
  text("7",1220,330);
  text("8",1200,392);
  text("MPH",speedX, speedY+50);
  text("x1000 rpm",tachX, tachY+50);
  text(direction,centX+((centSep3X-centX)/2),centSep2Y+((480-centSep2Y)/2));
  text(temperature,centSep3X+((centSep4X-centSep3X)/2),centSep2Y+((480-centSep2Y)/2));
  text(transmission,centSep4X+((900-centSep4X)/2),centSep2Y+((480-centSep2Y)/2));
  text(odometer,centSep3X+((centSep4X-centSep3X)/2),centY+((centSep1Y-centY)/2));
  textSize(100);
  text(speedString,centX+100,centSep1Y+((centSep2Y-centSep1Y)/2)-30);
  textSize(15);
  text("C",465,445);
  text("H",559,445);
  text("0",1041,445);
  text("100",1130,445);
  if(leftBlink || testingOn){
    image(LeftSignal,centX-75,centY);
  }
  if(rightBlink || testingOn){
    image(RightSignal,centX+centXSize+15,centY);
  }
  if(testingOn){
    image(WindshieldWipers,200,warnImgY);
    image(Seatbelt,280,warnImgY);
    image(CheckEngine,360,warnImgY);
    image(Abs,440,warnImgY);
    image(Traction,520,warnImgY);
    image(OilTemperature,600,warnImgY);
    image(LowGas,950,warnImgY);
    image(TirePressure,1030,warnImgY);
    image(Battery,1110,warnImgY);
    image(LowOil,1190,warnImgY);
    image(Airbags,1270,warnImgY);
  }
  if(fogLightsOn || testingOn){
    image(FogLights,1350,warnImgY);
  }
  imageMode(CENTER);
  image(SmallDial,engTempX, engTempY);
  image(SmallDial,oilPressX, oilPressY);
  image(GasDial,gasGaugeX, gasGaugeY);
  pushMatrix();
  translate(speedX, speedY);
  rotate(radians(speedDial));
  image(BigDial,0, 0);
  popMatrix();
  pushMatrix();
  translate(tachX, tachY);
  rotate(radians(tachDial));
  image(BigDial,0,0);
  popMatrix();
}

void update(){
  brightnessOver = overButton(brightnessX, brightnessY, squareButtonSize, squareButtonSize);
  onoffOver = overButton(onoffX, onoffY, ccButtonSize, ccButtonSize);
  incOver = overButton(incX, incY, ccButtonSize, ccButtonSize);
  decOver = overButton(decX, decY, ccButtonSize, ccButtonSize);
  fogOver = overButton(fogX, fogY, squareButtonSize, squareButtonSize);
  leftSignalOver = overTriButton(leftSignalX1,signalY1,leftSignalX2,signalY2,leftSignalX2,signalY3);
  rightSignalOver = overTriButton(rightSignalX1,signalY2,rightSignalX1,signalY3,rightSignalX2,signalY1);
  testWarningsOver = overButton(testWarningsX, testWarningsY, squareButtonSize, squareButtonSize);
  emergencyOver = overTriButton(emergencyX1,emergencyY2,emergencyX2,emergencyY1,emergencyX3,emergencyY2);
  startOver = overStart(startX, startY, startButtonSize);
  if(turningLeft && !emergencyOn){
     if(halfsecondcheck())
       leftBlink = !leftBlink;
  }
  if(turningRight && !emergencyOn){
     if(halfsecondcheck())
       rightBlink = !rightBlink;
  }
  if(emergencyOn){
    leftBlink = rightBlink;
    if(halfsecondcheck()){
      rightBlink = !rightBlink;
      leftBlink = !leftBlink;
    }
  }
  speedFactor = speed/160.0;
  tachFactor = rpm/8.0;
  speedDial = 240 * speedFactor;
  tachDial = 240 * tachFactor;
}

void mousePressed(){
  if(startOver){
    carOn = !carOn;
  }
  if(carOn){
    if(onoffOver)
    {
      ccOn = !ccOn; 
    }
    else if(incOver && ccOn){
      if(speed < 160)
        speed++;
      else
        speed = 160;
    }
    else if(decOver && ccOn){
      if(speed > 0)
        speed--;
      else
        speed = 0;
    }
    else if(fogOver){
      fogLightsOn = !fogLightsOn;
    }
    else if(emergencyOver){
      emergencyOn = !emergencyOn;
      time = millis()/1000;
      if(leftBlink && !turningLeft)
        leftBlink = false;
      if(rightBlink && !turningRight)
        rightBlink = false;
    }
    else if(leftSignalOver){
      turningLeft = !turningLeft;
      turningRight = false;
      time = millis()/1000;
      if(leftBlink && !emergencyOn)
        leftBlink = false;
    }
    else if(rightSignalOver){
      turningRight = !turningRight;
      turningLeft = false;
      time = millis()/1000;
      if(rightBlink && !emergencyOn)
        rightBlink = false;
    }
    else if(testWarningsOver){
      testingOn = !testingOn;
    }
    else if(brightnessOver){
      if(brightness == 0)
        brightness = 1;
      else if(brightness == 1)
        brightness = 2;
      else if(brightness == 2)
        brightness = 0;
    }
  }
}

boolean halfsecondcheck(){
  if(((millis()/1000) - time) >= 0.25){
    time = millis()/1000;
    return true;
  }
  else{
    return false;
  }
}

boolean overButton(int x, int y, int w, int h){
  if(mouseX >= x && mouseX <= x+w && mouseY >= y && mouseY <= y+h){
    return true;
  }else{
    return false;
  }
}

boolean overStart(int x, int y, int diameter){
  float disX = x - mouseX;
  float disY = y - mouseY;
  if(sqrt(sq(disX) + sq(disY)) < diameter/2){
    return true;
  }else{
    return false;
  }
}

boolean overTriButton(float x1, float y1, float x2, float y2, float x3, float y3) {
  float px = mouseX;
  float py = mouseY;
  // get the area of the triangle
  float areaOrig = abs( (x2-x1)*(y3-y1) - (x3-x1)*(y2-y1) );

  // get the area of 3 triangles made between the point
  // and the corners of the triangle
  float area1 =    abs( (x1-px)*(y2-py) - (x2-px)*(y1-py) );
  float area2 =    abs( (x2-px)*(y3-py) - (x3-px)*(y2-py) );
  float area3 =    abs( (x3-px)*(y1-py) - (x1-px)*(y3-py) );

  // if the sum of the three areas equals the original,
  // we're inside the triangle!
  if (area1 + area2 + area3 == areaOrig) {
    return true;
  }
  return false;
}
