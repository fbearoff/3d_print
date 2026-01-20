// c-clip for gel combs to prevent holes in poured agarose gels

difference() {
    cube([3,8,19], center=true);

    color("red") translate([0,3,0])
    cube([3,5,13.5], center=true);
}
