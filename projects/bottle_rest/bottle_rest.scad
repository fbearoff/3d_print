bottle_wl = 93;

difference() {
  translate(v=[0, -2.5, 0]) {
    color("red")
      cube(size=[120, bottle_wl + 5, 80], center=false);
  }
  rotate(a=[0, 25, 0]) {
    cube(size=[120, bottle_wl, 80], center=false);
  }
}
