$fa = 1;
$fs = 0.5;

difference() {
  //outer rectangle
  translate([-15,-12,0]){
  cube(size = [30,24,25], center = false);
  }

  //lower barrel
  color("red")
  cylinder(h = 13, d = 11, center = false);

  //upper barrel
  translate([0,0,13]){
  color("blue")
  cylinder(h = 19, d = 20, center = false);
  }

  //chamfer
  translate([0,0,22]){
  color("purple")
  cylinder(h = 3, d1 =20, d2=21);
  }
}

translate([-20,-14,0]){
color("green")
cube(size = [40,3,40], center = false);
}
