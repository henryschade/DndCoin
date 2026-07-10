include <Config.scad>

$fn = 360;

// Future debug flags
showGuides = false;
showCenters = false;
showBoundingBoxes = false;
previewMode = false;
showConstructionGuides = false;

use <Core/CoinBody.scad>
use <Sides/Blank.scad>

union()
{
    translate([0, 0, -(coinBodyMiddle)])
    {
        CoinBody();
    }
    SideBlank();
    mirror([0, 0, -1])
        SideBlank();
}
