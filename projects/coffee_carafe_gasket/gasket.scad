$fn=100;

module ring(
        h=1,
        od = 10,
        id = 5,
        de = 0.1
        )
{
    difference() {
        cylinder(h=h, r=od/2);
        translate([0, 0, -de])
            cylinder(h=h+2*de, r=id/2);
    }
}

ring(h = 3.1, od = 79.2, id = 72);
