include <../Config.scad>;

use <Ring.scad>;

module CoinBody()
{
	// Coin Body
	cylinder(
		h = coinBodyThickness,
		r = coinRadius
	);
}

module CoinBorder()
{
	// Raised Border - thin wrapper around Ring().
    Ring(
        radius = (usableRadius + (borderWidth / 2)),
        width = borderWidth,
        height = borderHeight
    );
}
