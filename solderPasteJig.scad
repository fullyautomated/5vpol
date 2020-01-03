pcb = [42.1,25.13,1.6];
gap = 0.1;

base = [120, 120, 0.2];

module jig() {
    difference() {
        union() {
            translate([0, 0, (base.z+pcb.z)/2])
                cube(base + [0,0, pcb.z], center=true);
        }
        union() {
            translate([0, 0, base.z+pcb.z/2+0.01])
                cube(pcb+[1,1,0]*gap, center=true);
            
            for(i=[0:2])
                translate([(i-1)*pcb.x/4,0,-1])
                    cylinder(d=4, h=pcb.z+base.z+2);
        }
    }
}

jig();

module shim() {
    difference() {
        cube([41, 24, 0.8], center=true);
        translate([-27,0,-1])
            rotate([0,0,45])
                cube([100,100,100]);
    }
}

$fn = 64;