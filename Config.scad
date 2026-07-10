// User-configurable values, specific to any given coin.
coinDiameter = 50.0;    // mm
coinThickness = 3.5;    // mm
borderWidth = 2.0;      // mm
borderHeight = 1.0;     // mm
textHeight = 1.0;       // mm
// Thinking of removing these next 3, based on current ArcText() work that has been done.
textSize = 3;           // Font size, in model units (mm)
textFont = "Arial";     // "Arial", "Liberation Sans"
textWeight = "Bold";    // "Normal", "Bold"

// Derived values, using User-configurable values, needed for any given coin.
coinBodyThickness = coinThickness - (borderHeight * 2);
coinRadius = coinDiameter / 2;
usableRadius = coinRadius - borderWidth;

// Validations.
assert(coinThickness > (borderHeight * 2), "coinThickness must be greater than twice borderHeight.");

assert(borderWidth < coinRadius, "borderWidth must be less than coinRadius.");
