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

union()
{
    // Create the main Coin Body
    translate([0, 0, -(coinBodyMiddle)])
    {
        CoinBody();
    }

    // Add the Front Side
    BlankSide();

    // Add the Back Side
    mirror([0, 0, 1])
    {
        BlankSide();
    }
}
