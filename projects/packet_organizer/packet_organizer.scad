// Adjust the Cell number and size
number_of_cells = 2;
cell_width = 150;
cell_depth = 20;
cell_height = 50;

bottom_thickness = 1;
nozzle_width = 0.4;
wall_thickness = 2 * nozzle_width; //for 2 wall perimiter
corner_radius = 2;

// render settings
$fs = 0.1;
$fa = 3;
//the calculated number of cells is 0 if input is 1, cause the loop is executed once even if max is 0 and 2x if input is 1..
calculated_number_of_cells = number_of_cells - 1;

// https://danielupshaw.com/openscad-rounded-corners/
module roundedcube_simple(size = [1, 1, 1], center = false, radius = 0.5) {
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

difference() {
  translate([-wall_thickness, -wall_thickness, -bottom_thickness])
    roundedcube_simple(
      [
        cell_width + 2 * wall_thickness,
        (cell_depth + wall_thickness) * number_of_cells + wall_thickness,
        cell_height + 2 * corner_radius,
      ],
      false,
      corner_radius
    );
  for (i = [0:1:calculated_number_of_cells]) {
    translate([0, i * (cell_depth + wall_thickness), 0])
      #roundedcube_simple(
        [
          cell_width,
          cell_depth,
          cell_height + 4 * corner_radius,
        ],
        false,
        corner_radius
      );
  }
  translate([-wall_thickness, -wall_thickness, cell_height])
    cube(
      [
        cell_width + 2 * wall_thickness,
        (cell_depth + wall_thickness) * number_of_cells + wall_thickness,
        4 * corner_radius,
      ]
    );
}

//supports to prevent warping
for (y = [0:1:number_of_cells], x = [1:4]) {
  translate([cell_width / 5 * x, y * (cell_depth + wall_thickness) - (2 * wall_thickness + nozzle_width), -bottom_thickness])
    roundedcube_simple(size=[5, wall_thickness * 4, cell_height + bottom_thickness], radius=0.5);
}
