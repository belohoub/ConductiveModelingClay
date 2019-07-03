use <pin.scad>;
include <screw/screw_holes.scad>;

box();


module box() {
    $fn = 100;

    difference() {
         cylinder (35,5,5);  
        
         union() {
             cylinder (33,3.5,3.5);
         }
    }
    
}
