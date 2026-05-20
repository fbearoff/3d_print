// holder for coffee description from HappyMug.com
//print vertically to avoid overhang issues

// insert dimensions
width = 115;
height = 90;

// backplane
difference() {
  cube([width + 4, height + 4, 2]);
  // insert
  translate([2, 1, 1]) {
    color("red")
      cube([width, height + 4, 0.5]);
  }
  //window
  translate([4, 4, 1]) {
    color("blue")
      cube([width - 4, height, 2.5]);
  }
}
