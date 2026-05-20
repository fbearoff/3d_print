
// Length of the tag
length = 30; // [30:1:100]

// Width of tag
width = 20; // [15:1:50]

// Radius of the corners
corner_radius = 4; // [0:0.5:20]

// Diameter of hole
hole_diameter = 4; // [2:1:10]

// Thickness of the main part of tag
thickness = 0.4; //[0.2:0.05:2.0]

// Thickness of edge reinforcements
reinforced_thickness = 0.8; // [0.4:0.05:2.5]

// Width of reinforced edge
reinforced_width = 1.2; // [0.5:0.1:3]

difference() {
  $fn = 64;
  chord_width = 2 * sqrt(hole_diameter * reinforced_width + reinforced_width ^ 2);
  union() {
    RoundRect([length, width, thickness], corner_radius);
    RoundRectTube([length, width, reinforced_thickness], corner_radius, reinforced_width);
    translate([hole_diameter / 2 + reinforced_width * 2, width / 2, 0])
      cylinder(d=hole_diameter + reinforced_width * 2, h=reinforced_thickness);
    translate([reinforced_width, (width - chord_width) / 2, 0])
      cube([reinforced_width, chord_width, reinforced_thickness]);
  }
  translate([hole_diameter / 2 + reinforced_width * 2, width / 2, -1])
    cylinder(d=hole_diameter, h=reinforced_thickness + 2);
}

module RoundRect(size, radius) {
  s = size;
  r = min(radius, s.x / 2, s.y / 2);

  hull()for (x = [r, s.x - r])
    for (y = [r, s.y - r]) {
      translate([x, y, 0]) cylinder(r=r, h=s.z);
    }
}

module RoundRectTube(size, radius, wall_thickness) {
  inner_size = [
    size.x - wall_thickness * 2,
    size.y - wall_thickness * 2,
    size.z + 2,
  ];
  difference() {
    RoundRect(size=size, radius=radius);
    translate([wall_thickness, wall_thickness, -1]) {
      RoundRect(inner_size, radius=radius - wall_thickness);
    }
  }
}
