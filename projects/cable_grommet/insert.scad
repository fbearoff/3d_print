$fn = 100;
outer = 19.1; // 3/4"
inner = outer * .9;
length = 15;

cable_dia = 6;

difference(){
  union() {
  //main tube
    difference() {
      //outer tube
      cylinder(d = inner * .95, h = length);
      //inner tube
      cylinder(d = cable_dia * 1.1, h = length);
    }
  //collar
    translate([0,0,length])
    difference() {
      //outer tube
      cylinder(d = outer * .95, h = length * 0.1);
      //inner tube
      cylinder(d = cable_dia * 1.1, h = length * 0.1);
    }
  }

//slice
cube([outer,1,length + length * 0.1]);
}
