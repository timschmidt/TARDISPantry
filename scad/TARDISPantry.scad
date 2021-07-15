//! TARDISPantry is a community food pantry designed for decentralized production, easy assembly, and fun.
$pp1_colour = "grey";           // Override any global defaults here if required, see NopSCADlib/global_defs.scad.
include <NopSCADlib/lib.scad>   // Includes all the vitamins and utilities in NopSCADlib but not the printed parts.
include <NopSCADlib/printed/flat_hinge.scad> // Includes door hinges

panel_thinckness = 3/4 * 25.4;
panel_width = 4 * 12 * 25.4;
panel_height = 8 * 12 * 25.4;

module rear_side_dxf()
    dxf("rear_side"){
        render_2D_sheet(MDF19, w = undef, d = undef)
            difference() {
                sheet_2D(MDF19, 48 * 25.4, 96*25.4, [10,10,10,10]);

                //circle(3);
            }
    }

module side_dxf()
    dxf("side"){
        dogbone_rectangle(size = [3/4 * 25.4, 3 * 25.4], r = cnc_bit_r, center = true, xy_center = true, x_offset, y_offset);
    }

module door_side_dxf()
    dxf("door_side"){
        
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
    dxf("door"){
        door_hinge_assembly(top, door_thickness = 6);
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
    dxf(""){
        
    }

//! Assembly instructions in Markdown format in front of each module that makes an assembly.
module main_assembly()
assembly("main") {
    //door_assembly();
    rear_side_dxf();
}

if($preview)
    main_assembly();
