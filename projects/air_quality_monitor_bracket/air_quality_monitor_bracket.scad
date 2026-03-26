$fn=100;
hole_diameter=8;
hole_distance=68;
hole_depth=4.5;
height=30;
plane_height=2;

//backplate
translate([-hole_diameter,-hole_diameter,0]){
  cube([hole_distance+hole_diameter*2,height,plane_height]);
}

//peg #1
translate([hole_distance,0,plane_height]){
  color("red")
  translate([0,0,hole_depth/2]){
    cylinder(d=hole_diameter*.95, h=hole_depth/2);
  }
  cylinder(d=hole_diameter/2, h=hole_depth);
}

//peg #2
translate([0,0,plane_height]){
  color("red")
  translate([0,0,hole_depth/2]){
    cylinder(d=hole_diameter*.95, h=hole_depth/2);
  }
  cylinder(d=hole_diameter/2, h=hole_depth);
}
