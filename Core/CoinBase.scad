module CoinBase(coinThickness, coinRadius, borderHeight, usableRadius)
{
    union()
    {
        //
        // Coin Body
        //
        coinBodyThickness = coinThickness - borderHeight;

        cylinder(
            h = coinBodyThickness,
            r = coinRadius
        );

        //
        // Raised Border
        //
        translate([0, 0, coinBodyThickness])
        {
            difference()
            {
                cylinder(
                    h = borderHeight,
                    r = coinRadius
                );

                cylinder(
                    h = (borderHeight * 2),     // * 2 to make Preview render look correct. Does not hurt to keep for Final render as well.
                    r = usableRadius
                );
            }
        }
    }
}
