

size_bp_x = 165;
size_bp_y = 190;
size_bp_z = 5;

ridge_bottom=60;
ridge_size_y=6;
ridge_size_z=30;


battery_spacing_x=size_bp_x - 105;
battery_spacing_size_x=1;
battery_spacing_size_y=100;

size_bms_x = 104;
size_bms_y = 162;
bms_screw_x=4;
bms_screw_y=13;
bms_distance_screw_x=95;
bms_distance_screw_y=136;
bms_screw_diameter=3.5;

fusebox_dist_y=105;
fusebox_dist_x=36-9*2;
fusebox_spacing_x = 9;
fusebox_spacing_y = 12;
fusebox_screw_diameter=4.5;

difference() {
    union() {
        cube([size_bp_x,size_bp_y,size_bp_z]);

        translate([0,size_bp_y-ridge_bottom,-ridge_size_z])
        cube([size_bp_x,ridge_size_y,ridge_size_z]);

        translate([battery_spacing_x,size_bp_y-ridge_bottom-battery_spacing_size_y,-ridge_size_z])
        cube([battery_spacing_size_x,battery_spacing_size_y,ridge_size_z]);

    }
    
    translate([fusebox_spacing_x,fusebox_spacing_y,-0.1]) {
        cylinder(h=size_bp_z+0.2,d=fusebox_screw_diameter,center=false,$fn=30);
        
        translate([fusebox_dist_x,fusebox_dist_y,0])
        cylinder(h=size_bp_z+0.2,d=fusebox_screw_diameter,center=false,$fn=30);
    }
    
    
    translate([size_bp_x-size_bms_x+bms_screw_x,size_bp_y -size_bms_y+bms_screw_y ,-0.1]) {
        
        cylinder(h=size_bp_z+0.2,d=bms_screw_diameter,center=false,$fn=20);
        
        translate([bms_distance_screw_x,0,0])
          cylinder(h=size_bp_z+0.2,d=bms_screw_diameter,center=false,$fn=20);
        translate([bms_distance_screw_x,bms_distance_screw_y,0])
          cylinder(h=size_bp_z+0.2,d=bms_screw_diameter,center=false,$fn=20);
        translate([0,bms_distance_screw_y,0])
          cylinder(h=size_bp_z+0.2,d=bms_screw_diameter,center=false,$fn=20);
            
    }
}


