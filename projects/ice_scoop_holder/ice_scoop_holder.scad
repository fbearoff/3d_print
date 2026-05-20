// an ice scoop holder with drainage holes

scoop_width = 63;
scoop_height = 37;
scoop_length = 91;

nozzle_width = 0.4;
wall_width = nozzle_width * 2; // for 2 perimeters

bottom_thickness = 1;
holes = 5; // number of drainage holes
radius = 5; // curviness of cubes

// render settings
$fs = 0.1;
$fa = 3;

// https://danielupshaw.com/openscad-rounded-corners/
module roundedcube_simple(size = [1, 1, 1], center = false, radius = radius) {
  // If single value, convert to [x, y, z] vector
  size = (size[0] == undef) ? [size, size, size] : size;

  translate =
    (center == false) ?
      [radius, radius, radius]
    : [
      radius - (size[0] / 2),
      radius - (size[1] / 2),
      radius - (size[2] / 2),
    ];

  translate(v=translate)
    minkowski() {
      cube(
        size=[
          size[0] - (radius * 2),
          size[1] - (radius * 2),
          size[2] - (radius * 2),
        ]
      );
      sphere(r=radius);
    }
}

// main
difference() {
  // outer
  roundedcube_simple(size=[scoop_width + 2 * wall_width, scoop_height + 2 * wall_width, scoop_length / 2]);
  // inner
  translate([wall_width, wall_width, bottom_thickness]) {
    roundedcube_simple(size=[scoop_width, scoop_height, scoop_length / 2]);
  }
  // flat top
  translate([0, 0, scoop_length / 2 - radius]) {
    cube([scoop_width + 2 * wall_width, scoop_height + 2 * wall_width, radius]);
  }
  // drainage holes
  for (i = [radius + wall_width:(scoop_height - 2 * wall_width) / holes - 1:scoop_height - radius]) {
    translate([radius + wall_width, i + nozzle_width, 0]) {
      cube(size=[scoop_width - 2 * radius, wall_width * 2, bottom_thickness * 2]);
    }
  }
}
