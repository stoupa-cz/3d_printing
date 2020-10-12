railway_length = 50;
railway_width = 40; // Don't change this
railway_height = 12;

module key(cylinder_d, length_total, stem_width) {   
    union() {
        translate([-stem_width/2, 0, 0])
            cube([stem_width, 10, railway_height]);
        translate([0, length_total-(cylinder_d/2)])
            cylinder(d=cylinder_d, h=railway_height);
    }
    
}

module rail() {
    linear_extrude(3, scale=[6/4, 1])
        translate([-2, 0, 0])
            square([4, railway_length]);
}

module railway() {
    difference() {
        // Base
        cube([railway_width, railway_length, railway_height]);
        
        // Rails
        translate([7,0,9]) rail();
        translate([33,0,9]) rail();
        
        // Socket
        translate([railway_width/2, 0, 0])
            key(cylinder_d = 12.6, length_total = 17, stem_width = 7.6);


    }
    // Plug
    translate([railway_width/2, railway_length, 0])
        key(cylinder_d = 11.4, length_total = 17, stem_width = 6.5);
}

railway();