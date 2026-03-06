$fn = 100;

//slab dimensions
height = 6;
length = 50;
width = 30;

//magnet dimensions
mag_dia = 10;
mag_height = 2.75;

difference() {
  //extra space for magnet
  mag_height = mag_height*1.05;
  mag_dia = mag_dia*1.05;

  //slab
  cube([width, length, height], center = false);

  translate([width/2,length/3,height/2]){
  cylinder(h = mag_height, d = mag_dia, center = true);
  }

  translate([width/2,2*(length/3),height/2]){
  cylinder(h = mag_height, d = mag_dia, center = true);
  }
}
