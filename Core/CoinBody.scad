include <../Config.scad>

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
}
