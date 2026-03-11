$fn = 100;
outer = 19.1; // 3/4"
inner = outer * .9;
length = 15;

//main tube
difference() {
  //outer tube
  cylinder(d = outer, h = length);
  //inner tube
  cylinder(d = inner, h = length);
}

//taper
difference() {
  //outer taper
  cylinder(h = length * 0.1, d2 = outer * 1.2, d1 = outer);
  //inner taper
  cylinder(d = inner, h = length);
}

//collar
translate([0,0,length * 0.1]) {
  color("red")
  difference() {
    //outer tube
    cylinder(d = outer * 1.2, h = length * 0.1);
    //inner tube
    cylinder(d = inner, h = length * 0.1);
  }
}
