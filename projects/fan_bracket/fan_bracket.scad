$fn = 100;

// L bracket
difference() {
  cube(size=[50, 50, 30], center=false);
  translate([-1, 5, 5])
    cube(size=[52, 50, 50], center=false);
}

// back support
translate([0, -5, 25]) {
  cube(size=[50, 5, 5], center=false);
}

module prism(l, w, h) {
  polyhedron(
    // pt      0        1        2        3        4        5
    points=[[0, 0, 0], [0, w, h], [l, w, h], [l, 0, 0], [0, w, 0], [l, w, 0]],
    // top sloping face (A)
    faces=[
      [0, 1, 2, 3],
      // vertical rectangular face (B)
      [2, 1, 4, 5],
      // bottom face (C)
      [0, 3, 5, 4],
      // rear triangular face (D)
      [0, 4, 1],
      // front triangular face (E)
      [3, 2, 5],
    ]
  );
}

// buttress
translate([50, 15, 5]) {
  rotate([0, 0, 180])
    color("red")
      prism(50, 10, 15);
}

// screw guide 
translate([25, 0, 10]) {
  rotate([90, 0, 0]) {
    color("blue")
      translate([0, 0, -14])
        difference() {
          cylinder(h=13, d=12, center=false);
          translate([0, 0, -1.5])
            cylinder(h=13, d=10, center=false);
        }
  }
}
