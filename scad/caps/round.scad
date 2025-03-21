// centered about center of bottom of key

module RoundCapEnd (
	bevelRadius,
	height,
	depth,
	width,
) {
	translate([0, 0, height - bevelRadius])
		rotate_extrude()
			translate([depth / 2 - bevelRadius, 0, 0])
				circle(r = bevelRadius);
	translate([0, 0, (height - bevelRadius) / 2]) {
		cylinder(r = depth / 2, h = height - bevelRadius, center = true);
	}
	translate([0, 0, height - bevelRadius / 2]) {
		cylinder(r = depth / 2 - bevelRadius, h = bevelRadius, center = true);
	}
}

module RoundCap (
	bevelRadius,
	height,
	sideWallWidth,
	topWallHeight,
	depth,
	width,
	withOrienter = true,
	footprintOnly = true
) {
	orienterHeight = .4;
	orienterWidth = 1;
	orienterDepth = 1;
	endX = depth < width  ? (width - depth) / 2 : 0;
	endY = depth > width  ? (depth - width) / 2 : 0;
	difference() {
		hull() {
			translate([-endX, -endY, 0])
				RoundCapEnd(bevelRadius, height, depth, width);
			if (depth != width) {
				translate([endX, endY, 0])
					RoundCapEnd(bevelRadius, height, depth, width);
			}
		}
		hull() {
			translate([-endX, -endY, height / 2 - topWallHeight])
				cylinder(r = depth / 2 - sideWallWidth, h = height, center = true);
			if (depth != width) {
				translate([endX, endY, height / 2 - topWallHeight])
					cylinder(r = depth / 2 - sideWallWidth, h = height, center = true);
			}
		}
	}
	if (withOrienter) {
		translate([0, depth / 2 - sideWallWidth - orienterDepth / 2, height - topWallHeight - orienterHeight / 2])
			cube([orienterWidth, orienterDepth, orienterHeight], true);
	}
};
