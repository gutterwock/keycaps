use <../caps/lowProfileMinimal.scad>
use <../stems/cherry.scad>

$fn = $preview ? 8 : 16;

height = 4.6;
topWallHeight = .8;

LowProfileMinimalCap (
	bevelRadius = 1,
	height = height,
	sideWallWidth = 1,
	topWallHeight = topWallHeight,
	depth = 18.1,
	width = 18.1
);


translate([0, 0, height - topWallHeight]) CherryStem(
	height = height - topWallHeight,
	radius = 3, 
	armLength = 4, 
	armXWidth = 1.2, 
	armYWidth = 1.1, 
	openingTolerance = .2
);
