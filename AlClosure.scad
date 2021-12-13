//
// AlClosure
// A Beautiful Professional Screwless Aluminum Device Enclosure
// Version 1.0.0
//
// (c) 2021 karl@pitrich.com
//
// License: CC BY-SA 4.0
//          Createive Commons Attribution-ShareAlike 4.0 International
//          https://creativecommons.org/licenses/by-sa/4.0/legalcode
//

// outer dimensions of final enclosure
outerW = 300;
outerH = 60;
outerD = 150;

// 💡 known-good ratios side thickness + screws
//    5mm sides and M2   screws
//    6mm sides and M2.5 screws
//    8mm sides and M3   screws

// sheet metal thickness of top, bottom, front & back panel
// 💡 Recommended to use anodized aluminum for front + back
panelThickness = 2;

// thickness of sheet metal for sides
sideThickness = 6; 

// slot milling distance from side's edge
// 💡 less than 1.5mm not practical
millDistancefromEdge = max(sideThickness / 4, 1.5);

// M3 thread + screws
// threadSize = 3;
// threadBore = 2.5;
// counterSinkOuter = 6 / 2;
// coutnerSinkHeight = 1.65;

// M2.5 thread + screws
threadSize = 2.5;
threadBore = 2.0;
counterSinkOuter =  4.7 / 2;
coutnerSinkHeight = 1.5;

// M2 thread + screws
// threadSize = 2;
// threadBore = 1.6;
// counterSinkOuter =  3.8 / 2;
// coutnerSinkHeight = 1.2;

threadPosition = outerD * 0.15; // 💡 15% inwards is mostly nice 
threadDepth = 15;

tolerance = 0.1; // used for width of front/back panels

// colors
aluminum = [0.9, 0.9, 0.9];
steel = [0.8, 0.8, 0.9];
steelSeeThrough = [0.8, 0.8, 0.9, 0.8];

module sideThread() {
    cylinder(r = threadBore / 2, h = threadDepth, center = false, $fn = 40);
}

module sideThreads(d, sideThickness) {
    for(y = [threadPosition, d - threadPosition]) 
        translate([sideThickness / 2, y, 0])
            sideThread();
}

module sideSlot(h, materialThickness, panel, center = false) {
    millDepth = materialThickness / 2;
    cube([millDepth, panel, h], center);
}

module side(h, d, center = false) {
    difference() {
        cube([sideThickness, d, h], center);

        // slots
        for (y = [millDistancefromEdge, d - 2 * millDistancefromEdge])
            translate([0, y, 0])
                sideSlot(h, sideThickness, panelThickness);

        // threads
        for(z = [0, h - threadDepth]) 
            translate([0, 0, z])
                sideThreads(d, sideThickness);
    }
}

module panel() {
    color(steel)
        cube([outerW - (sideThickness) - tolerance * 2, panelThickness, outerH], center = false);
}

module screwHead() {
    cylinder(h = coutnerSinkHeight, r1 = counterSinkOuter, r2 = threadSize / 2, center = false, $fn = 40);
}

module cover() {
    difference() {
        cube([outerW, outerD, panelThickness], center = false);
        
        for(x = [sideThickness / 2, outerW - sideThickness / 2], 
            y = [threadPosition, outerD - threadPosition])
        {
            translate([x, y, 0]) {
                sideThread();
                screwHead();
            }
        }
    }
}


// left side
translate([sideThickness, 0, outerH])
    rotate([0, 180, 0])
        color(aluminum) side(outerH, outerD);

// right side
translate([outerW - sideThickness, 0, 0])
    color(aluminum) side(outerH, outerD);

// fontpanel
translate([sideThickness / 2 + tolerance, millDistancefromEdge, 0])
    color("lightgreen") panel();

// backpanel
translate([sideThickness / 2 + tolerance, outerD - millDistancefromEdge - panelThickness, 0])
   panel();

// bottom cover
translate([0, 0, 0 - panelThickness])
    color(steel) cover();

// top cover
rotate([180, 0, 180])
    translate([0 - outerW, 0, 0 - outerH - panelThickness])
        color(steelSeeThrough) cover();
