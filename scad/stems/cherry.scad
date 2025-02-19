// origin about center of top of stem

module CherryStem (
	height,
	radius,
	armXWidth, // arm parallel to x axis
	armYWidth, // arm parallel to y axis
	armLength,
	openingTolerance = 0,
	openingHeight = .4
) {
	translate([0, 0, -height / 2])
		difference() {
			cylinder(r = radius, h = height, center = true);
			cube([armLength, armXWidth, height + 1], true);
			cube([armYWidth, armLength, height + 1], true);
			translate([0, 0, -height / 2]) {
				cube([armLength + openingTolerance, armXWidth + openingTolerance, openingHeight * 2], true);
				cube([armYWidth + openingTolerance, armLength + openingTolerance, openingHeight * 2], true);
			}
		}
};