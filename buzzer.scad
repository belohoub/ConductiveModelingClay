use <pin.scad>;
include <screw/screw_holes.scad>;

// Select one ...
print();
//vizualize();

module print() {
    rotate([0,180,0]) box();
    
    rotate([0,180,0]) translate([25,0,10]) cover();
}

module vizualize() {
    rotate([0,180,0]) box();

    translate([0,0,5]) parts();

    translate([0,0,10]) cover();
    
    translate([0,0,15]) screws();
}

module buzzer() {
    $fn = 100;
    
    difference() {
        union() {
            cylinder (9,6,6);  
    
            translate([4,0,9]) cylinder (6,0.5,0.5);  
            translate([-4,0,9]) cylinder (4,0.5,0.5); 
        }
    
        translate([0,0,-7]) cylinder (10,1.5,1.5);
    }
}


module parts() {
    translate([22,0,0]) rotate([180,90,0]) pin_solid(0.2);
    translate([-22,0,0]) rotate([0,90,0]) pin_solid(0.2);

    translate([0,0,-11]) buzzer();
}

module screws() {
    translate([0,-8,5]) rotate([180,0,0]) screw_hole(DIN965, M2, 15);
    translate([0,8,5]) rotate([180,0,0]) screw_hole(DIN965, M2, 15);
}

module box() {
    difference() {
        box_body();  
        union() {
            parts();
            rotate([180,0,0]) screws();
        }
    }
}

module box_body() {
    $fn = 100;

    difference() {
         cylinder (15,10,10);  
        
         union() {
             cylinder (13,6.5,6.5);  
        
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
    
    translate([0,2.5,11]) cylinder (2,0.5,0.5);
    translate([0,-2.5,11]) cylinder (2,0.5,0.5);
    translate([2.5,0,11]) cylinder (2,0.5,0.5);
    translate([-2.5,0,11]) cylinder (2,0.5,0.5);
    
}

module cover() {
    $fn = 100;

    difference() {
        cylinder (5,10,10);  
      union () {
        parts();
        screws();  
          
        translate([0,0,4.5]) linear_extrude(height = 1) {
          translate([3, -2.5, 10]) {
             text("+", font = "Liberation Sans", size = 5);
          }
          translate([-4, -1, 5]) rotate([0,0,90]) {
             text("-", font = "Liberation Sans", size = 5);
          }
    }
          
      }
    }
}
