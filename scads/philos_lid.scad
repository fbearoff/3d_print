//lid for Mazzer Philos with opening for Levercraft funnel/bellows
$fa = 1;
$fs = 0.5;

//core ring
difference() {
//outer edge
cylinder(h = 9, d = 117, center = false);

//inner edge
cylinder(h = 9, d = 108.5, center = false);
}

//inner lip
translate([0,0,9])
  difference() {
  color("red")

  //outer edge
  cylinder(h = 3, d = 111, center = false);

  //inner edge
  cylinder(h = 3, d = 108.5, center = false);
  }

//opening for bellows funnel
translate([0,0,-3])
  difference() {
  color("blue")

  //outer edge
  cylinder(h = 3, d = 117, center = false);

  //inner hole
  cylinder(h = 3, d = 60, center = false);
  }
