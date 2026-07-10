include <../Config.scad>

module ArcText(
    text,
    centerAngle,
    arc,
    offsetFromBorder = 0,
    upsideDown = false,
    arcTextSize = 0,
    arcTextFont = "",
    arcTextWeight = ""
)
{
    textSize = (arcTextSize == 0) ? textSize : arcTextSize;
    textFont = (arcTextFont == "") ? textFont : arcTextFont;
    textWeight = (arcTextWeight == "") ? textWeight : arcTextWeight;

    characterCount = len(text);
    anglePerCharacter = (characterCount > 1) ? arc / (characterCount - 1) : 0;
    radius = usableRadius - borderWidth - offsetFromBorder;
    startAngle = (upsideDown == false) ? (centerAngle - (arc / 2)) * -1 : (centerAngle - (arc / 2));

    for (charIndex = [ 0 : characterCount - 1 ])
    {
        currentAngle = (characterCount == 1) ? centerAngle : 
            (upsideDown == false) ? startAngle - (charIndex * anglePerCharacter) : startAngle + (charIndex * anglePerCharacter);
        character = text[charIndex];

        CharacterOnArc(character, currentAngle, radius, upsideDown, textSize, textFont, textWeight);
    }
}

module CharacterOnArc(
    character,
    angle,
    radius,
    upsideDown = false,
    charTextSize = 0,
    charTextFont = "",
    charTextWeight = ""
)
{
    charRotation = (upsideDown == false) ? 0 : 180;
    textSize = (charTextSize == 0) ? textSize : charTextSize;
    textFont = (charTextFont == "") ? textFont : charTextFont;
    textWeight = (charTextWeight == "") ? textWeight : charTextWeight;

    rotate([0, 0, angle])
    {
        translate([0, radius, (coinBodyThickness - 0.75)])
        {
            rotate([0, 0, charRotation])
            {
                linear_extrude(height = textHeight)
                {
                    //color("cyan")
                    //color("red")
                    text(
                        character,
                        size = textSize,
                        //font = textFont,
                        font = str(textFont, ":style=", textWeight),
                        halign = "center",
                        valign = "center"
                    );
                }
            }
        }
    }
}


// From the OpenScad Examples

// Color helpers
module green() color([157/255,203/255,81/255]) children();
module corn() color([249/255,210/255,44/255]) children();
module black() color([0, 0, 0]) children();
