use <pin.scad>;
include <screw/screw_holes.scad>;

// Select one ...
print();
//vizualize();

module print() {
    rotate([0,180,0]) box();
    
    rotate([0,180,0]) translate([50,0,12]) cover();
}

module vizualize() {
    rotate([0,180,0]) box();

    translate([0,0,5]) pins();

    translate([0,0,10]) cover();
    
    translate([0,0,15]) screws();
}


module screws() {
    translate([0,-20,3]) rotate([180,0,0]) screw_hole(DIN965, M2, 15);
    translate([0,20,3]) rotate([180,0,0]) screw_hole(DIN965, M2, 15);
}

module pins() {
    $fn=100;
    
    translate([34,0,0]) rotate([180,90,0]) pin_solid(0.2);
    translate([-34,0,0]) rotate([0,90,0]) pin_solid(0.2);
    translate([-20,0,0]) rotate([0,90,0]) cylinder (40,1+0.2,1+0.2);
}

module box() {
    difference() {
        box_body();  
        union() {
            rotate([180,0,0]) screws();
            pins();
        }
    }
}

module box_body() {
    $fn = 100;

    difference() {
         cylinder (15,22,22);  
        
         union() {
             cylinder (13,18.5,18.5);  
        
             cylinder (20,1,1);
             
             translate([4,0,0] ) cylinder(20,1,1);
             rotate([0,0,45]) translate([4,0,0] ) cylinder(20,1,1);
             translate([-4,0,0]) cylinder(20,1,1);
             rotate([0,0,45]) translate([-4,0,0] ) cylinder(20,1,1);
             translate([0,4,0] ) cylinder(20,1,1);
             rotate([0,0,45]) translate([0,4,0] ) cylinder(20,1,1);
             translate([0,-4,0]) cylinder(20,1,1);
             rotate([0,0,45]) translate([0,-4,0] ) cylinder(20,1,1);
         }
    }
    
    translate([0,17,10]) cylinder (2,0.5,0.5);
    translate([0,-17,11]) cylinder (2,0.5,0.5);
    translate([17,0,11]) cylinder (2,0.5,0.5);
    translate([-17,0,11]) cylinder (2,0.5,0.5);
    
    rotate([0,0,45]) union() {
        translate([0,17,10]) cylinder (2,0.5,0.5);
        translate([0,-17,11]) cylinder (2,0.5,0.5);
        translate([17,0,11]) cylinder (2,0.5,0.5);
        translate([-17,0,11]) cylinder (2,0.5,0.5);
    }
    
}

module cover() {
    $fn = 100;

    difference() {
        union() {
            cylinder (3,22,22);  
            //translate([0,0,2]) import_stl("dog/test-dog.stl", convexity = 5);
        }
      union () {
        screws();  
          pins();
          
        translate([0,0,2.5]) linear_extrude(height = 1) {
          translate([12, -2.5, 10]) {
             text("+", font = "Liberation Sans", size = 5);
          }
          translate([-13, -1, 5]) rotate([0,0,90]) {
             text("-", font = "Liberation Sans", size = 5);
          }
    }
          
      }
    }
}
