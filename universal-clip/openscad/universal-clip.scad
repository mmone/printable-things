// by Martin Muehlhaeuser Twitter: @mmone

/* [main parameters] */
// Inner diameter of the clamp bracket
rodDiameter = 8;
// Outer diameter of the spring ring in units
springDiameter = 27;
// Spring width. As x times extrusion width.
springWidth = 8;
// Spring height in units
springHeight = 5;
// Rim height
rimHeight = 2;
// Width of the brackets front opening in degrees.
frontOpeningAngle = 60; //[1:90]
// Width of the brackets back opening in degrees.
backOpeningAngle = 50; //[1:90]
// Pretension in percentage of rod diameter. Reduces the distance between the two bracket halfs. 
pretension = 30; //[-50:50]
// Radius of the fillet connecting spring and bracket.
filletRadius=3;
// Offset of the contact point between bracket and spring along the y-Axis in percent of rod-diameter. Zero means centered. 
yOffset = 22; //[-50:50]


/* [printer Parameters] */
// Extrusion width in units.
extrusionWidth = 0.4;
// The targeted layer height for this model.
layerHeight = 0.3;
// circular resolution in segments per 360 Degrees.
resolution = 360;

/* [Hidden] */
_springWidth = extrusionWidth * springWidth;
_yOffset = rodDiameter * yOffset/100;
_pretension = rodDiameter*(pretension/100)/ 2;

module mirrorCopy(vec=[0,1,0])
{
    children();
    mirror(vec) children();
}


// calculate a point on a circle
function pointOnCircle(radius=1, center=[0,0], angle) = (
     [(sin(angle) * radius) + center[0], (cos(angle) * radius) + center[1]]
);

function springProfile(
    springRadius=1,
    rodRadius=1,
    width=2,
    frontOpeningAngle = 20,
    backOpeningAngle = 20,
    yOffset = 0,
    filletRadius = 1,
    pretension = 1,
    step=1) = (
    
    let(halfFrontOpening = frontOpeningAngle/2) // frontal opening of the bracket in degrees
    let(halfBackOpening = backOpeningAngle/2)  // back opening of the bracket in degrees
    let(offsetY = sqrt(pow(springRadius,2) - pow((rodRadius + width - pretension),2)) - yOffset)  // offset of the spring circle (rod center is at world[0,0] )
    let(a = sqrt(pow(pretension,2) + pow(offsetY,2)))
    let(b = rodRadius + width + filletRadius)
    let(c1 = springRadius + width/2 + filletRadius)
    let(c2 = springRadius - width/2 - filletRadius)
    let(angleUp = acos( (pow(a,2) + pow(b,2) - pow(c1,2)) / (2*a*b)) + atan(pretension/offsetY) - 90)
    let(angleDown = 90 - (acos( (pow(a,2) + pow(b,2) - pow(c2,2)) / (2*a*b)) + atan(pretension/offsetY)))
    let(yUp = sin(angleUp) * b)
    let(xUp = cos(angleUp) * b)
    let(yDown = sin(angleDown) * b)
    let(xDown = cos(angleDown) * b)    
    let(halfOpeningAngleInner = acos( (offsetY - yDown) / c2) )
    let(halfOpeningAngleOuter = acos( (offsetY + yUp) / c1))

    concat(
        [concat( //  main body
            [for (a=[180+halfBackOpening:step:360-halfFrontOpening]) pointOnCircle(rodRadius, [pretension,0], a) ], // rod inner
            [for (a=[360-halfFrontOpening:-step:270+angleUp]) pointOnCircle(rodRadius+width, [pretension,0], a) ], // rod outer top
                
            [for (a=[90+angleUp:step:180-halfOpeningAngleOuter]) pointOnCircle(filletRadius, [-(xUp-pretension),yUp], a) ], //fillet upper left
    
            [for (a=[360-halfOpeningAngleOuter:-step:170]) pointOnCircle(springRadius+(width/2), [0,-offsetY], a) ],
            [pointOnCircle(springRadius+(width/2), [0,-offsetY], 170)], // outer ring
            
            [for (a=[170:step:360-halfOpeningAngleInner]) pointOnCircle(springRadius-(width/2), [0,-offsetY], a) ], //inner ring
    
            [for (a=[-halfOpeningAngleInner:step:90-angleDown]) pointOnCircle(filletRadius, [-(xDown-pretension),-yDown], a) ],//fillet lower left
            
            [for (a=[270-angleDown:-step:180+halfBackOpening]) pointOnCircle(rodRadius+width, [pretension,0], a) ],
            [pointOnCircle(rodRadius, [pretension,0], 180+halfBackOpening)] // rod outer bottom
        )],
        [concat( // cutout
            [for (a=[360-halfOpeningAngleInner:step:360-halfOpeningAngleOuter]) pointOnCircle(springRadius, [0,-offsetY], a) ], // ring segment
            [for (a=[180-halfOpeningAngleOuter:-step:90+angleUp]) pointOnCircle(filletRadius + width/2, [-(xUp-pretension),yUp], a) ], //fillet upper left
            [for (a=[270+angleUp:-step:270-angleDown]) pointOnCircle(rodRadius+width/2, [pretension,0], a) ],// rod outer top
                
            [for (a=[90-angleDown:-step:-halfOpeningAngleInner]) pointOnCircle(filletRadius+width/2, [-(xDown-pretension),-yDown], a) ],
            [ pointOnCircle(springRadius, [0,-offsetY], 360-halfOpeningAngleInner) ] // fillet lower left
        )],
        [concat( // rim
            [for (a=[180+halfBackOpening:step:360-halfFrontOpening]) pointOnCircle(rodRadius, [pretension,0], a) ], // rim inner
            [for (a=[360-halfFrontOpening:-step:180+halfBackOpening]) pointOnCircle(rodRadius + width/2, [pretension,0], a) ] // rod outer
        )]
    )
);
        
           
module clamp() {
    roundoverRadius = _springWidth * 0.24;
    coutoutFilletRadius = _springWidth * 0.15;
    convexity = 10;
    
    points = springProfile(
                 springRadius=(springDiameter-_springWidth)/2,
                 rodRadius = rodDiameter/2,
                 width=_springWidth,
                 frontOpeningAngle=frontOpeningAngle,
                 backOpeningAngle=backOpeningAngle,
                 yOffset = _yOffset,
                 filletRadius=filletRadius,
                 pretension=_pretension,
                 step=360/resolution
            );
    
    union() {
        mirrorCopy([1,0,0]) {
            difference() {
            linear_extrude(height=springHeight, center=false, $fn = resolution, convexity = convexity)
                offset(r=roundoverRadius) offset(delta=-roundoverRadius) 
                    polygon(points = points[0]);
                
            linear_extrude(height=springHeight*4, center=true, $fn = resolution, convexity = convexity)
                offset(r=coutoutFilletRadius) offset(delta=-coutoutFilletRadius) 
                    polygon(points = points[1]);
                
            }
            translate([0,0,springHeight])
                linear_extrude(height=rimHeight, center=false, $fn = resolution, convexity = convexity)
                    offset(r=roundoverRadius) offset(delta=-roundoverRadius) 
                        polygon(points = points[2]);
        }
    }
}


clamp();
