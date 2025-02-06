// centered about center of top of switch

module LowProfileMinimalCap(
	bevelRadius,
	height,
	sideWallWidth,
	topWallHeight,
	depth,
	width,
) {
	cornerX = width / 2 - bevelRadius;
	cornerY = depth / 2 - bevelRadius;
	innerBevel = bevelRadius; // TODO: make this proportional
	innerCornerX = width / 2 - sideWallWidth - innerBevel;
	innerCornerY = depth / 2 - sideWallWidth - innerBevel;

	translate([0, 0, height / 2]) {
		difference() {
			// TODO: refactor using utils repo
			hull() {
				translate([cornerX, cornerY, 0])
					cylinder(r = bevelRadius, h = height, center = true);
				translate([-cornerX, cornerY, 0])
					cylinder(r = bevelRadius, h = height, center = true);
				translate([-cornerX, -cornerY, 0])
					cylinder(r = bevelRadius, h = height, center = true);
				translate([cornerX, -cornerY, 0])
					cylinder(r = bevelRadius, h = height, center = true);
			}
			hull() {
				translate([innerCornerX, innerCornerY, -topWallHeight])
					cylinder(r = bevelRadius, h = height, center = true);
				translate([-innerCornerX, innerCornerY, -topWallHeight])
					cylinder(r = bevelRadius, h = height, center = true);
				translate([-innerCornerX, -innerCornerY, -topWallHeight])
					cylinder(r = bevelRadius, h = height, center = true);
				translate([innerCornerX, -innerCornerY, -topWallHeight])
					cylinder(r = bevelRadius, h = height, center = true);
			}
		}
	}
};
