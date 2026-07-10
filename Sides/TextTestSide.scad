include <../Config.scad>
include <../Core/ArcText.scad>

module TextTestSide()
{
    union()
    {
        // Raised Border
        translate([0, 0, (coinBodyThickness / 2)])
        {
            difference()
            {
                cylinder(
                    h = borderHeight,
                    r = coinRadius
                );

                cylinder(
                    h = (borderHeight + 0.1),     // + 0.1 to make Preview render look correct. Does not hurt to keep for Final render as well.
                    r = usableRadius
                );
            }
        }

        // Top Text
        ArcText("AETHARRIA", 0, 70);

        // Bottom Text
        ArcText("A Realm of Fractured Fantasies", 180, 130, -0.5, true, 2, "Arial", "Normal");
    }
}
