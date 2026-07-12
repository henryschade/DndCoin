include <../Config.scad>

module DiamondMarker(distance, angle, width, length, wallWidth, height)
{
    // Small kite/rhombus/diamond accent marker.
    //
    // distance = radial distance from coin center to the marker's centroid.
    // angle    = 0 points North (+Y); same convention as RadialArm() and ArcText() (0 = North, 90 = West, 180 = South, 270 = East).
    // width    = horizontal extent (perpendicular to the radial direction).
    // length   = vertical extent, point-to-point along the radial direction.
    // wallWidth = thickness of the outline; the interior is left hollow.
    // height   = extrusion height, sits on top of the coin body.

    translate([0, 0, (coinBodyThickness / 2)])
    {
        rotate([0, 0, angle])
        {
            translate([0, distance])
            {
                linear_extrude(height = height)
                {
                    difference()
                    {
                        polygon(
                            points = [
                                [0, (length / 2)],
                                [(width / 2), 0],
                                [0, ((length / 2) * -1)],
                                [((width / 2) * -1), 0]
                            ]
                        );

                        offset(delta = (wallWidth * -1))
                        {
                            polygon(
                                points = [
                                    [0, (length / 2)],
                                    [(width / 2), 0],
                                    [0, ((length / 2) * -1)],
                                    [((width / 2) * -1), 0]
                                ]
                            );
                        }
                    }
                }
            }
        }
    }
}
