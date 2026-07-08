module CoinBase()
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
                    h = borderHeight,
                    r = usableRadius
                );
            }
        }
    }
}
