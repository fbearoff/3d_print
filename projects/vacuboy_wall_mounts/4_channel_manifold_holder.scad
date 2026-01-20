$fa = 1;
$fs = 0.5;
difference(){

translate([-2,-7,0]) {
color("red")
cube(size = [6,14,25], center = false);
}
cylinder(h = 26, d = 7, center = false);
}


//back plate
translate([4,-10,0]) {
color("blue")
cube(size = [3,20,27], center = false);
}
