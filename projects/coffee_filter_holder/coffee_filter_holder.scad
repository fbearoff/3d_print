// coffee filter holder
$fa = 0.5;

diameter = 160;
height = 50;

difference() {
  cylinder(d = diameter*1.03, h = height);
  translate([0,0,2]) {
    #cylinder(d = diameter, h = height);
  }
}
