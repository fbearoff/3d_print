//shelf for vactrap 2 to fit on support leg of Baker Co biosafety cabinet
//vactrap 2 260mm x 200mm

//base plate
cube(size = [210,250,10], center = true);

//support channel
translate([0,0,-15]){
  difference() {
    color("blue")
    cube(size = [77.5,220,20], center = true);
    cube(size = [57.5,230,20], center = true);
  }
}

//buttresses
module buttress(rot) {
  translate([rot*43.75,0,-10]){
    color("yellow")
    difference() {
      cube(size = [10,220,10], center = true);
      translate([rot*3.5,0,-3.5]){
        rotate(a =[0,rot*-45,0]){
        cube(size = [sqrt(200),220,10], center = true);
        }
      }
    }
  }
}

buttress(rot=1);
buttress(rot=-1);
