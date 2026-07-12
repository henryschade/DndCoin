include <../Config.scad>

module RadialArm(angle, length, width, height)
{
    // Straight radial spoke from coin center outward, with rounded ends.
    //
    // angle  = 0 points North (+Y); positive angle rotates the same direction as ArcText()'s centerAngle convention
    // length = distance from coin center to the far tip.
    // width  = stroke width of the arm.
    // height = extrusion height, sits on top of the coin body.

    translate([0, 0, (coinBodyThickness / 2)])
    {
        rotate([0, 0, angle])
        {
            linear_extrude(height = height)
            {
                hull()
                {
                    circle(r = (width / 2));

                    translate([0, length])
                    {
                        circle(r = (width / 2));
                    }
                }
            }
        }
    }
}
