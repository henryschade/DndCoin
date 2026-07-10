include <../Config.scad>

use <../Core/CoinBody.scad>

module BlankSide()
{
    union()
    {
        // Raised Border
        CoinBorder();
    }
}
