include <Config.scad>

$fn = 360;

// Future debug flags
showGuides = false;
showCenters = false;
showBoundingBoxes = false;
previewMode = false;
showConstructionGuides = false;

use <Core/CoinBase.scad>

CoinBase();
