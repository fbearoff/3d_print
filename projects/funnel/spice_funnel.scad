OVERALL_HEIGHT = 45;
EXIT_DIAMETER = 28;
EXIT_LENGTH = 10;
ENTRANCE_DIAMETER = 60;
WALL_THICKNESS = 2;

$fa = 1;
$fs = 0.5;

difference() {
  union() {
    cylinder(r=EXIT_DIAMETER / 2, h=OVERALL_HEIGHT);

    translate([0, 0, EXIT_LENGTH]) {
      cylinder(r1=EXIT_DIAMETER / 2, r2=ENTRANCE_DIAMETER / 2, h=OVERALL_HEIGHT - EXIT_LENGTH);
    }

    translate([0, 0, OVERALL_HEIGHT - WALL_THICKNESS]) {
      cylinder(r=(ENTRANCE_DIAMETER + (WALL_THICKNESS * 2)) / 2, h=WALL_THICKNESS);
    }
  }

  cylinder(r=(EXIT_DIAMETER / 2) - (WALL_THICKNESS / 2), h=OVERALL_HEIGHT);

  translate([0, 0, EXIT_LENGTH]) {
    cylinder(r1=(EXIT_DIAMETER / 2) - (WALL_THICKNESS / 2), r2=(ENTRANCE_DIAMETER / 2) - (WALL_THICKNESS / 2), h=OVERALL_HEIGHT - EXIT_LENGTH);
  }
}
