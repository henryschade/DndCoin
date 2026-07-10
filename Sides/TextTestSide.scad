include <../Config.scad>
include <../Core/ArcText.scad>

use <../Core/CoinBody.scad>

module TextTestSide()
{
    union()
    {
        // Raised Border
        CoinBorder();

        // Top Text
        ArcText("AETHARRIA", 0, 70, 0.5, 3, "Arial", "Bold", false);

        // Bottom Text
        ArcText("A Realm of Fractured Fantasies", 180, 130, 0.5, 2, "Arial", "Normal", true);
    }
}
