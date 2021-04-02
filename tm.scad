use <Courier New.ttf>

// cube([100,100,0.0001],center=true);
difference() {
	stamp_body();
	stamp_face();
}

module stamp_body() {
	$r=16;
	$h=$r*2*sqrt(2);
	translate([0, 0, $h/4+0.75])
	rotate_extrude($fn=100) {
		union() {
			scale([1, 0.5]) intersection() {
				union() {
					translate([0,$h/2,0]) circle(r=$r, $fn=100);
					translate([0,-$h/2,0]) circle(r=$r, $fn=100);            
					difference() {
						rotate(45) square([$r*2-0.4, $r*2-0.4], center=true);
						translate([$h/2,0,0]) circle(r=$r, $fn=100);
							
					}
				}
				translate([0, -$h/2]) square([$h/2, $h]);
			}

			translate([$r-0.75,-$h/4]) circle(r=0.75, $fn=100);
			translate([0,-$h/4-0.75]) square([$r-0.75, 0.75]);

			translate([$r-0.75,$h/4]) circle(r=0.75, $fn=100);
			translate([0,$h/4]) square([$r-0.75, 0.75]);
		}
	}
}

module stamp_face() {
	rotate_extrude($fn=400) translate([14,0,0]) circle(r=0.5, $fn=50);
	minkowski() {
		linear_extrude(height=0.0001)
			offset(r=-0.3)
			text("TM", font = "Courier New", size=13, halign="center", valign="center");
		sphere(r=0.75, $fn=30);
	}
}
