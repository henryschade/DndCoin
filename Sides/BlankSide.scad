include <../Config.scad>

module BlankSide()
{
    union()
    {
        // Raised Border
        translate([0, 0, (coinBodyMiddle)])
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
    }
}
