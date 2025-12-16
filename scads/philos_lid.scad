// lid for Mazzer Philos with opening for Levercraft funnel/bellows
// measurements from original lid reference with caliper in mm
$fa = 1;
$fs = 0.5;

//core ring
difference() {
//outer edge
cylinder(h = 9, d = 122.65, center = false);

//inner edge
cylinder(h = 9, d = 109.06, center = false);
}

//inner lip
translate([0,0,9])
  difference() {
  color("red")

  //outer edge
  cylinder(h = 3, d = 117.64, center = false);

  //inner edge
  cylinder(h = 3, d = 109.06, center = false);
  }

//opening for bellows funnel
translate([0,0,-3])
  difference() {
  color("blue")

  //outer edge
  cylinder(h = 3, d = 122.65, center = false);

  //inner hole
  cylinder(h = 3, d = 60, center = false);
  }
