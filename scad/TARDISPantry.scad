//! TARDISPantry is a community food pantry designed for decentralized production, easy assembly, and fun.
$pp1_colour = "grey";           // Override any global defaults here if required, see NopSCADlib/global_defs.scad.
include <NopSCADlib/lib.scad>   // Includes all the vitamins and utilities in NopSCADlib but not the printed parts.
include <NopSCADlib/printed/flat_hinge.scad> // Includes door hinges

module rear_side_dxf()
    dxf("rear_side"){
        render_2D_sheet(MDF19, w = undef, d = undef)
            difference() {
                sheet_2D(MDF19, 24 * 25.4, 60*25.4, [10,10,10,10]);

                dogbone_rectangle(size = [3/4 * 25.4, 3 * 25.4], r = 1/8 * 25.4, center = true, xy_center = true, x_offset = 0, y_offset = 0);
            }
    }

module side_dxf()
    dxf("rear_side"){
        render_2D_sheet(MDF19, w = undef, d = undef)
            difference() {
                sheet_2D(MDF19, 24 * 25.4, 60*25.4, [10,10,10,10]);

                dogbone_rectangle(size = [3/4 * 25.4, 3 * 25.4], r = 1/8 * 25.4, center = true, xy_center = true, x_offset = 0, y_offset = 0);
            }
    }

module door_side_dxf()
    dxf("rear_side"){
        render_2D_sheet(MDF19, w = undef, d = undef)
            difference() {
                sheet_2D(MDF19, 24 * 25.4, 60*25.4, [10,10,10,10]);

                dogbone_rectangle(size = [3/4 * 25.4, 3 * 25.4], r = 1/8 * 25.4, center = true, xy_center = true, x_offset = 0, y_offset = 0);
            }
    }
    
module door_assembly()
    assembly("door"){
        width = 50; // [20 : 100]
        depth = 20; // [8  : 50]
        thickness = 4; //[1 : 10]
        screws = 4; // [1  : 20]
        knuckles = 5; // [3 : 10]
        pin_diameter = 4; // [1:  10]
        knuckle_diameter = 9; //[4 : 15]
        margin = 0; // [0 : 10]
        clearance = 0.2;

        angle = 0; // [-90 : 180]
        
        hinge_type = flat_hinge(name = "big",  size = [width, depth, thickness], pin_d = pin_diameter, knuckle_d = knuckle_diameter, knuckles = knuckles, screw = M3_dome_screw, screws = screws, clearance = clearance, margin = margin);
        hinge_fastened_assembly(hinge_type, 3, 3, angle);
    }

module door_dxf()
    dxf("rear_side"){
        render_2D_sheet(MDF19, w = undef, d = undef)
            difference() {
                sheet_2D(MDF19, 20 * 25.4, 50*25.4, [10,10,10,10]);

                dogbone_rectangle(size = [3/4 * 25.4, 3 * 25.4], r = 1/8 * 25.4, center = true, xy_center = true, x_offset = 0, y_offset = 0);
            }
    }

module corner_bracket_dxf()
    dxf("corner_bracket"){
        
    }

module window_dxf()
    dxf("widnow"){
        
    }

module lid_assembly()
    addembly("lid"){
        
    }

module grid_dxf()
    dxf("grid"){
        render_2D_sheet(MDF19, w = undef, d = undef)
            difference() {
                sheet_2D(MDF19, 20 * 25.4, 50*25.4, [10,10,10,10]);

                dogbone_rectangle(size = [3/4 * 25.4, 3 * 25.4], r = 1/8 * 25.4, center = true, xy_center = true, x_offset = 0, y_offset = 0);
            }
    }
    
module grid_side_dxf()
    dxf("grid_side"){
        render_2D_sheet(MDF19, w = undef, d = undef)
            difference() {
                sheet_2D(MDF19, 20 * 25.4, 50*25.4, [10,10,10,10]);

                dogbone_rectangle(size = [3/4 * 25.4, 3 * 25.4], r = 1/8 * 25.4, center = true, xy_center = true, x_offset = 0, y_offset = 0);
            }
    }

//! Assembly instructions in Markdown format in front of each module that makes an assembly.
module main_assembly()
assembly("main") {
    
    rotate([0,0,0])
    //door_assembly();

    translate([0,-12*25.4,30*25.4])
    rotate([90,0,0])
    door_side_dxf();

    translate([0,12*25.4,30*25.4])
    rotate([90,0,0])
    rear_side_dxf();
    
    translate([0,-12.75*25.4,30*25.4])
    rotate([90,0,0])
    grid_dxf();
    
    translate([-12*25.4,0,30*25.4])
    rotate([90,0,90])
    side_dxf();
    
    translate([-12.75*25.4,0,30*25.4])
    rotate([90,0,90])
    grid_side_dxf();

    translate([12*25.4,0,30*25.4])
    rotate([90,0,90])
    side_dxf();

    translate([12.75*25.4,0,30*25.4])
    rotate([90,0,90])
    grid_side_dxf();
    
    shelf_dxf();
    
    top_dxf();
    
    bottom_dxf();
}

if($preview)
    main_assembly();
