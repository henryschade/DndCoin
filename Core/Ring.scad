include <../Config.scad>;

module Ring(radius, width, height)
{
    // Generic ring/circle helper.
    // radius = center-line radius of the ring.
    // width  = total wall thickness (half extends inward, half outward).
    // height = extrusion height, sits on top of the coin body.

    translate([0, 0, (coinBodyThickness / 2)])
    {
        difference()
        {
            cylinder(
                h = height,
                r = (radius + (width / 2))
            );

            cylinder(
                h = (height + 0.1),     // + 0.1 to make Preview render look correct. Does not hurt to keep for Final render as well.
                r = (radius - (width / 2))
            );
        }
    }
}
