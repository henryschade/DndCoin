include <../Config.scad>
include <../Core/ArcText.scad>

use <../Core/CoinBody.scad>
use <../Faces/AetharriaSigil.scad>;

module AetharriaSigilSide()
{
    topTextSize = 3;
    bottomTextSize = 2;
    sigilPadding = topTextSize + bottomTextSize + 2;

    union()
    {
        // Raised Border
        color("gold")
        CoinBorder();

        // Top Text
        color("orange")
        ArcText("AETHARRIA", 0, 70, 0.5, topTextSize, "Arial", "Bold", false);

        // The Artharia Sigil
        color("gray")
        translate([0, 0, (((coinBodyThickness / 2) - 0.2))])    // The 0.2 is for the 3D printer "layer height" default setting.
        {
            cylinder(
                h = 0.21,                                       // An "extra" 0.01 to make sure it is just above the coin face.
                r = (usableRadius - sigilPadding)
            );
        }

        color("orange")
        AetharriaSigil(sigilPadding);

        // Bottom Text
        color("orange")
        ArcText("A Realm of Fractured Fantasies", 180, 130, 0.5, bottomTextSize, "Arial", "Normal", true);
    }
}
