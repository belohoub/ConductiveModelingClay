pin();

module pin() {
  $fn=100;
    
  difference() {
    pin_solid(0.0); 
    
    union() {
        translate([-5,0,18]) rotate([0,90,0]) cylinder (10,0.5,0.5);  
    
        translate([0,0,17]) cylinder (10,0.5,0.5);  
    }
  }
}

module pin_solid($add = 0.2) {
  $fn=100;
    union() {
        translate([0,0,1]) cylinder (20,1+$add,1+$add);    
        cylinder (1,0.5 + $add,1 + $add);       
        
        // osazeni
        translate([0,0,12]) cylinder (2,1.5+$add,1.5+$add, $fn=12); 
        rotate([0,0,15])  translate([0,0,12]) cylinder (2,1.5+$add,1.5+$add, $fn=12);   
        
        // konicky tvar
        translate([0,0,16]) cylinder (1,1.5+$add,1+$add); 
    }  
}
