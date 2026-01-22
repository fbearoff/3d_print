// Modification of Wahl Peanut trimmer guard for 1/16" length, S1/2 equivalent
// https://www.printables.com/model/577476-wahl-peanut-trimmer-guard

$fn=100;

module guard() {
import(file = "ParametricPlate_2mm.stl", center = true);
}

difference(){
  difference() {
    guard();
    translate([24.5,-5,0]){
      color("blue")
      cube(size = [13.5, 10,36], center = true);
    }
  }

  difference() {
    translate([16,-6.1,0]){
      color("green")
      cube(size = [5, 6,36], center = true);
    }
    translate([14.5,-6.1,0]){
      color("red")
      cylinder(h = 36, d = 7, center = true);
    }
  }
}
