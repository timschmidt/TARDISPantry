//! TARDISPantry is a community food pantry designed for decentralized production, easy assembly, and fun.
$pp1_colour = "grey";           // Override any global defaults here if required, see NopSCADlib/global_defs.scad.
include <NopSCADlib/lib.scad>   // Includes all the vitamins and utilities in NopSCADlib but not the printed parts.
include <NopSCADlib/printed/flat_hinge.scad> // Includes door hinges

module rear_side_dxf()
    dxf("rear_side"){
        render_2D_sheet(MDF19, w = undef, d = undef)
            difference() {
                sheet_2D(MDF19, 24.75 * 25.4, 60*25.4, [10,10,10,10]);

                dogbone_rectangle(size = [3/4 * 25.4, 3 * 25.4], r = 1/8 * 25.4, center = true, xy_center = true, x_offset = 0, y_offset = 0);
            }
    }

module side_dxf()
    dxf("rear_side"){
        render_2D_sheet(MDF19, w = undef, d = undef)
            difference() {
                sheet_2D(MDF19, 23.25 * 25.4, 60*25.4, [10,10,10,10]);

                dogbone_rectangle(size = [3/4 * 25.4, 3 * 25.4], r = 1/8 * 25.4, center = true, xy_center = true, x_offset = 0, y_offset = 0);
            }
    }

module door_side_dxf()
    dxf("rear_side"){
        render_2D_sheet(MDF19, w = undef, d = undef)
            difference() {
                sheet_2D(MDF19, 24.75 * 25.4, 60*25.4, [10,10,10,10]);

                square([19*25.4, 49*25.4], center=true);
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
    dxf("window"){
        
    }
    
module top_dxf()
    dxf("top"){
        render_2D_sheet(MDF19, w = undef, d = undef)
            difference() {
                sheet_2D(MDF19, 24.75 * 25.4, 24.75*25.4, [10,10,10,10]);

                dogbone_rectangle(size = [3/4 * 25.4, 3 * 25.4], r = 1/8 * 25.4, center = true, xy_center = true, x_offset = 0, y_offset = 0);
            }
    }
    
module top2_dxf()
    dxf("top2"){
        render_2D_sheet(MDF19, w = undef, d = undef)
            difference() {
                sheet_2D(MDF19, 22.25 * 25.4, 22.25*25.4, [10,10,10,10]);

                dogbone_rectangle(size = [3/4 * 25.4, 3 * 25.4], r = 1/8 * 25.4, center = true, xy_center = true, x_offset = 0, y_offset = 0);
            }
    }
    
module top3_dxf()
    dxf("top3"){
        render_2D_sheet(MDF19, w = undef, d = undef)
            difference() {
                sheet_2D(MDF19, 18 * 25.4, 18*25.4, [10,10,10,10]);

                dogbone_rectangle(size = [3/4 * 25.4, 3 * 25.4], r = 1/8 * 25.4, center = true, xy_center = true, x_offset = 0, y_offset = 0);
            }
    }

module lid_assembly()
    assembly("lid"){
    translate([10.75*25.4,0,3*25.4])
    rotate([90,0,90])
    top_side_trim_dxf();
    
    translate([-10.75*25.4,0,3*25.4])
    rotate([90,0,90])
    top_side_trim_dxf();
    
    translate([0,10.75*25.4,3*25.4])
    rotate([90,0,0])
    top_face_trim_dxf();

    translate([0,-10.75*25.4,3*25.4])
    rotate([90,0,0])
    top_face_trim_dxf();
        
    translate([8.65*25.4,0,6.75*25.4])
    rotate([90,0,90])
    top2_side_trim_dxf();
    
    translate([-8.65*25.4,0,6.75*25.4])
    rotate([90,0,90])
    top2_side_trim_dxf();
        
    translate([0,8.65*25.4,6.75*25.4])
    rotate([90,0,0])
    top2_face_trim_dxf();

    translate([0,-8.65*25.4,6.75*25.4])
    rotate([90,0,0])
    top2_face_trim_dxf();
    
    translate([0,0,1.125*25.4])
    top_dxf();
        
    translate([0,0,4.875*25.4])
    top2_dxf();
    
    translate([0,0,8.625*25.4])
    top3_dxf();
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
    
module shelf_dxf()
    dxf("shelf"){
        render_2D_sheet(MDF19, w = undef, d = undef)
            difference() {
                sheet_2D(MDF19, 23.25 * 25.4, 23.25*25.4, [10,10,10,10]);

                dogbone_rectangle(size = [3/4 * 25.4, 3 * 25.4], r = 1/8 * 25.4, center = true, xy_center = true, x_offset = 0, y_offset = 0);
            }
    }
    
module side_trim_dxf()
    dxf("side_trim"){
        render_2D_sheet(MDF19, w = undef, d = undef)
            sheet_2D(MDF19, 24.75 * 25.4, 3*25.4, [10,10,10,10]);
    }
    
module face_trim_dxf()
    dxf("face_trim"){
        render_2D_sheet(MDF19, w = undef, d = undef)
            sheet_2D(MDF19, 26.25 * 25.4, 3*25.4, [10,10,10,10]);
    }
    
module top_side_trim_dxf()
    dxf("side_trim"){
        render_2D_sheet(MDF19, w = undef, d = undef)
            sheet_2D(MDF19, 20.75 * 25.4, 3*25.4, [10,10,10,10]);
    }
    
module top_face_trim_dxf()
    dxf("face_trim"){
        render_2D_sheet(MDF19, w = undef, d = undef)
            sheet_2D(MDF19, 22.25 * 25.4, 3*25.4, [10,10,10,10]);
    }
    
module top2_side_trim_dxf()
    dxf("side_trim"){
        render_2D_sheet(MDF19, w = undef, d = undef)
            sheet_2D(MDF19, 16.5 * 25.4, 3*25.4, [10,10,10,10]);
    }
    
module top2_face_trim_dxf()
    dxf("face_trim"){
        render_2D_sheet(MDF19, w = undef, d = undef)
            sheet_2D(MDF19, 18 * 25.4, 3*25.4, [10,10,10,10]);
    }

//! Assembly instructions in Markdown format in front of each module that makes an assembly.
module main_assembly()
assembly("main") {
    translate([0,-12*25.4,30*25.4])
    rotate([90,0,0])
    door_side_dxf();

    translate([0,12*25.4,30*25.4])
    rotate([90,0,0])
    rear_side_dxf();
    
    translate([-10*25.4,-22*25.4,30*25.4])
    rotate([90,0,90])
    grid_dxf();
    //door_assembly();
    
    translate([-12*25.4,0,30*25.4])
    rotate([90,0,90])
    side_dxf();
    
    translate([-12.75*25.4,0,30*25.4])
    rotate([90,0,90])
    grid_side_dxf();
    
    translate([0,12.75*25.4,30*25.4])
    rotate([90,0,0])
    grid_side_dxf();

    translate([12*25.4,0,30*25.4])
    rotate([90,0,90])
    side_dxf();

    translate([12.75*25.4,0,30*25.4])
    rotate([90,0,90])
    grid_side_dxf();
    
    translate([12.75*25.4,0,1.5*25.4])
    rotate([90,0,90])
    side_trim_dxf();
    
    translate([-12.75*25.4,0,1.5*25.4])
    rotate([90,0,90])
    side_trim_dxf();
    
    translate([0,12.75*25.4,1.5*25.4])
    rotate([90,0,0])
    face_trim_dxf();

    translate([0,-12.75*25.4,1.5*25.4])
    rotate([90,0,0])
    face_trim_dxf();
         
    translate([0,0,59.25*25.4])
    lid_assembly();
    
    translate([0,0,4*25.4])
    shelf_dxf();

    translate([0,0,18*25.4])
    shelf_dxf();
    
    translate([0,0,32*25.4])
    shelf_dxf();

    translate([0,0,46*25.4])
    shelf_dxf();
}

if($preview)
    main_assembly();
