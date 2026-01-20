module guard() {
import(file = "ParametricPlate_2mm.stl", center = true);
}

// length of extension
extension = 4;
trans = (extension-1)/2+9;

{
guard();
translate([trans, -6.95, 0]) {
  color("red")
  cube(size = [extension, 1.2,30], center = true);
  }
}

module edge() {
  points = [
    [0,0],
    [1.2,0],
    [0, -1.2]
  ];

  translate([extension/2+trans,-6.35,0]){
    color("blue")
    linear_extrude(30, center = true)
    polygon(points);
    }
}

edge();
