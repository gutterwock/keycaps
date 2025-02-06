// centered about center of top of switch

module LowProfileMinimalCap(
	bevelRadius,
	height,
	sideWallWidth,
	topWallHeight,
	depth,
	width,
	withOrienter = true,
	withHole = true
) {
	cornerX = width / 2 - bevelRadius;
	cornerY = depth / 2 - bevelRadius;
	innerBevel = bevelRadius; // TODO: make this proportional
	innerCornerX = width / 2 - sideWallWidth - innerBevel;
	innerCornerY = depth / 2 - sideWallWidth - innerBevel;

	orienterHeight = .4;
	orienterWidth = 2;
	orienterDepth = 1;

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
			if (withHole) {
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
		if (withOrienter) {
			translate([0, depth / 2 - sideWallWidth - orienterDepth / 2, height / 2 -topWallHeight - orienterHeight / 2])
				cube([orienterWidth, orienterDepth, orienterHeight], true);
		}
	}
};
