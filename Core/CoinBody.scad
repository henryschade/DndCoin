include <../Config.scad>

module CoinBody()
{
	// Coin Body

	cylinder(
		h = coinBodyThickness,
		r = coinRadius
	);
}
