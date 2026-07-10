include <Config.scad>

$fn = 360;

// Future debug flags
showGuides = false;
showCenters = false;
showBoundingBoxes = false;
previewMode = false;
showConstructionGuides = false;

use <Core/CoinBody.scad>
use <Sides/BlankSide.scad>
use <Sides/TextTestSide.scad>

union()
{
    // Create the main Coin Body
    translate([0, 0, ((coinBodyThickness / 2) * -1)])
    {
        CoinBody();
    }

    // Add the Front Side
    TextTestSide();

    // Add the Back Side
    mirror([0, 0, 1])
    {
        BlankSide();
    }
}
