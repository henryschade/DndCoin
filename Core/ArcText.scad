include <../Config.scad>

module ArcText(
    text,
    centerAngle,
    arc,
    offsetFromBorder = 0.5,
    size,
    font = "Arial",
    weight = "Normal",
    upsideDown = false
)
{
    characterCount = len(text);
    anglePerCharacter = (characterCount > 1) ? arc / (characterCount - 1) : 0;
    radius = usableRadius - (size / 2) - offsetFromBorder;
    startAngle = (upsideDown == false) ? (centerAngle - (arc / 2)) * -1 : (centerAngle - (arc / 2));

    for (charIndex = [ 0 : characterCount - 1 ])
    {
        currentAngle = (characterCount == 1) ? centerAngle : 
            (upsideDown == false) ? startAngle - (charIndex * anglePerCharacter) : startAngle + (charIndex * anglePerCharacter);
        character = text[charIndex];

        CharacterOnArc(character, currentAngle, radius, size, font, weight, upsideDown);
    }
}


// Internal helpers.

module CharacterOnArc(
    character,
    angle,
    radius,
    size,
    font = "",
    weight = "",
    upsideDown = false
)
{
    charRotation = (upsideDown == false) ? 0 : 180;

    rotate([0, 0, angle])
    {
        translate([0, radius, (coinBodyThickness / 2)])
        {
            rotate([0, 0, charRotation])
            {
                linear_extrude(height = reliefHeight)
                {
                    //color("cyan")
                    //color("red")
                        text(
                            character,
                            size = size,
                            //font = font,
                            font = str(font, ":style=", weight),
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
