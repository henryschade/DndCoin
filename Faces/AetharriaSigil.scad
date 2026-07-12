include <../Config.scad>;

use <../Core/Ring.scad>;
use <../Core/RadialArm.scad>;
use <../Core/DiamondMarker.scad>;

module AetharriaSigil(padding = 0)
{
    // ------------------------------------------------------------------
    // All measurements below are taken from Assets/Aetharria Sigil.svg, which uses its own unitless coordinate system (outer ring radius
    // = 100). sigilScale maps that coordinate system onto the coin's actual usableRadius, so the sigil always fits just inside the
    // border regardless of coinDiameter/borderWidth changes.
    //
    // padding shrinks the usable radius before scaling, letting a caller (e.g. AetharriaSigilSide()) reserve clearance for arc text or
    // other content around the border without the sigil itself needing to know why. Defaults to 0 so AetharriaSigil() still previews
    // correctly on its own.
    // ------------------------------------------------------------------

    sigilScale = (usableRadius - padding) / 100;
    lineWidth = 2.0;

    // Rings (outer -> inner). Only the outer ring is a heavier 3.0 stroke; the remaining three are all 2.5.
    outerRingRadius = 100 * sigilScale;
    outerRingWidth = (lineWidth * 2) * sigilScale;

    middleRingRadius = 75 * sigilScale;
    middleRingWidth = lineWidth * sigilScale;

    innerRingRadius = 50 * sigilScale;
    innerRingWidth = lineWidth * sigilScale;

    coreRingRadius = 30 * sigilScale;
    coreRingWidth = lineWidth * sigilScale;

    // Slightly eccentric ring layered near the inner ring.
    offsetRingRadiusX = innerRingRadius;
    offsetRingRadiusY = 56 * sigilScale;
    offsetRingWidth = lineWidth * sigilScale;
    offsetRingShiftY = 6 * sigilScale;

    // Center dot - solid, no ring treatment needed.
    centerDotRadius = 11 * sigilScale;

    // Accent ring - centered where the North spoke crosses the inner ring (the 2nd ring counting outward from the coin's center).
    accentRingRadius = 4 * sigilScale;
    accentRingWidth = lineWidth * sigilScale;
    accentRingDistance = innerRingRadius;

    // Cardinal spokes - North ends at the 2nd ring from the outer edge (the middle ring) by design; East/West/South run further out.
    cardinalSpokeWidth = lineWidth * sigilScale;
    northSpokeLength = middleRingRadius;
    sideSpokeLength = outerRingRadius;

    // Diagonal spokes - all the same length. Southeast is intentionally heavier than the other three.
    diagonalSpokeWidth = lineWidth * sigilScale;
    diagonalSpokeWidthHeavy = (lineWidth * 3) * sigilScale;
    diagonalSpokeLength = outerRingRadius + 2.5;

    // Diamond markers - identical shape at every position, only placement differs.
    diamondWidth = 12 * sigilScale;
    diamondLength = 16 * sigilScale;
    diamondWallWidth = lineWidth * sigilScale;

    // East/West/South: centroid sits on the outer ring's centerline.
    diamondDistanceOuter = outerRingRadius;

    // North: near tip sits exactly on the outer ring's outer edge.
    diamondDistanceNorth = outerRingRadius + (outerRingWidth / 2) + (diamondLength / 2);

    union()
    {
        // Rings
        Ring(radius = outerRingRadius, width = outerRingWidth, height = reliefHeight);
        Ring(radius = middleRingRadius, width = middleRingWidth, height = reliefHeight);
        Ring(radius = innerRingRadius, width = innerRingWidth, height = reliefHeight);
        Ring(radius = coreRingRadius, width = coreRingWidth, height = reliefHeight);

        // Offset "eccentric" ring, built with offset() for a true constant-width wall around the ellipse.
        translate([0, offsetRingShiftY, (coinBodyThickness / 2)])
        {
            linear_extrude(height = reliefHeight)
            {
                difference()
                {
                    offset(delta = (offsetRingWidth / 2))
                    {
                        scale([offsetRingRadiusX, offsetRingRadiusY])
                        {
                            circle(r = 1);
                        }
                    }

                    offset(delta = ((offsetRingWidth / 2) * -1))
                    {
                        scale([offsetRingRadiusX, offsetRingRadiusY])
                        {
                            circle(r = 1);
                        }
                    }
                }
            }
        }

        // Center dot
        translate([0, 0, (coinBodyThickness / 2)])
        {
            cylinder(h = reliefHeight, r = centerDotRadius);
        }

        // Accent ring on the North spoke
        translate([0, accentRingDistance, 0])
        {
            Ring(radius = accentRingRadius, width = accentRingWidth, height = reliefHeight);
        }

        // Cardinal spokes
        RadialArm(angle = 0, length = northSpokeLength, width = cardinalSpokeWidth, height = reliefHeight);
        RadialArm(angle = 90, length = sideSpokeLength, width = cardinalSpokeWidth, height = reliefHeight);
        RadialArm(angle = 180, length = sideSpokeLength, width = cardinalSpokeWidth, height = reliefHeight);
        RadialArm(angle = 270, length = sideSpokeLength, width = cardinalSpokeWidth, height = reliefHeight);

        // Diagonal spokes - Southeast (225) is heavier by design
        RadialArm(angle = 45, length = diagonalSpokeLength, width = diagonalSpokeWidth, height = reliefHeight);
        RadialArm(angle = 135, length = diagonalSpokeLength, width = diagonalSpokeWidth, height = reliefHeight);
        RadialArm(angle = 225, length = diagonalSpokeLength, width = diagonalSpokeWidthHeavy, height = reliefHeight);
        RadialArm(angle = 315, length = diagonalSpokeLength, width = diagonalSpokeWidth, height = reliefHeight);

        // Diamond markers
        DiamondMarker(distance = diamondDistanceNorth, angle = 0, width = diamondWidth, length = diamondLength, wallWidth = diamondWallWidth, height = reliefHeight);
        DiamondMarker(distance = diamondDistanceOuter, angle = 90, width = diamondWidth, length = diamondLength, wallWidth = diamondWallWidth, height = reliefHeight);
        DiamondMarker(distance = diamondDistanceOuter, angle = 180, width = diamondWidth, length = diamondLength, wallWidth = diamondWallWidth, height = reliefHeight);
        DiamondMarker(distance = diamondDistanceOuter, angle = 270, width = diamondWidth, length = diamondLength, wallWidth = diamondWallWidth, height = reliefHeight);
    }
}
