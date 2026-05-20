//wall clip for 9mm OD silicone vacuum hose

$fa = 1;
$fs = 0.5;

//clip
difference() {

  translate(v=[-7, -5, 0]) {
    color("red")
      cube(size=[14, 8.5, 15], center=false);
  }

  cylinder(h=16, d=9.5, center=false);
}

//backplate
translate(v=[-10, -7, -0.5])
  cube(size=[20, 2, 16], center=false);
