// PRUSA iteration3
// Y frame corners
// GNU GPL v3
// Josef Průša <josefprusa@me.com>
// Václav 'ax' Hůla <axtheb@gmail.com>
// http://www.reprap.org/wiki/Prusa_Mendel
// http://github.com/prusajr/PrusaMendel

include <configuration.scad>
use <y-drivetrain.scad>

module nutrod(r=4.4){
    rotate([0,90,0]){
        //translate([0,0,-0.1]) nut(m8_nut_diameter,6.7,false);
        //this is pretty but annoying
        //translate([-7.5/2,0,7/2-1.5]) cube([7.5,15,7], center=true);
        //translate([0,0,-1.5]) cylinder(h = 7, r=7.5);
        translate([0,0,-5]) cylinder(h = 270, r=r, $fn=30);
    }
}

/*
   20 mm betwenn the front threaded rods
   25 mm between the side threaded and smooth rod
 */

module leftfront(thru = false){
	y_end_plug=2;
    // translate so the rod is on x = 0
    translate([-11,-y_end_plug,12-board_thickness])

        difference(){
            if (thru == false) {
                #cube_fillet([22,22,37+board_thickness], vertical=[4,4,4,4], top=[2,6,6,6], fn=8);
            } else {
                cube_fillet([22,22,38.5+board_thickness], vertical=[4,4,4,4], top=[2,4,9,4], fn=8);
            }

            translate([0,11,10]) rotate([0,0,0]) nutrod();
            translate([0,11,30]) rotate([0,0,0]) nutrod();

            translate([11,0,20]) rotate([0,0,90]) rotate([00,0,0]) nutrod(r=5.4);

            if(thru==false){
                #translate([11,15+y_end_plug,45+3]) rotate([0,0,0]) cube([8.2,30,4], center=true);
                translate([11,y_end_plug,45]) rotate([0,90,90]) cylinder(h = 270, r=4.0);
            }else{
                translate([11,17-5,45+2.05]) rotate([0,0,0]) cube([8.2,30,4.1], center=true);
                translate([11,2-5,45]) #rotate([0,90,90]) cylinder(h = 270, r=4.0);
            }

        }
}

leftfront();
translate([25,0,0]) mirror([1,0,0]) leftfront();
//translate([12,2,28]) rotate([0,0,0]) cube([10,4,1], center=true);

translate([0,25,0]) {
    leftfront();
    translate([25,0,0]) mirror([1,0,0]) leftfront();
    //translate([12,2,28]) rotate([0,0,0]) cube([10,4,1], center=true);
}

