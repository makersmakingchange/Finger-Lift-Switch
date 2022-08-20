
//Software : Counter Weight Holder (component: CounterWeightHolder)
//Developed by : MakersMakingChange  A Neil Squire Society Program
// Code Type: Written in OpenSCAD, a code based, open source 3D CAD modeling environment.
//Original Author: Derrick Andrews
//VERSION: 2.2-beta (July 2022) 
//Copyright Neil Squire Society 2022. 
//LICENSE: This work is licensed under the CC BY SA 4.0 License: http://creativecommons.org/licenses/by-sa/4.0 .

difference(){
	minkowski(){	
	    union(){
		translate([0,0,8/2]) cylinder(d=13,h=6, center = true,$fn=6);//counterweight nut cutout
	    translate([5,0,8/2])cylinder(d=6,h=6, center = true,$fn=24);//magnet cutout
			}//union
		sphere(r=1,center=true,$fn=30);
}  //end mink	n
   //removals
	translate([5,0,8/2+2])cylinder(d=6,h=8, center = true,$fn=24);//**magnet drop in chute
translate([0,0,8/2+2]) cylinder(d=13,h=8, center = true,$fn=6);//counterweight nut cutout

translate([5,0,1.2/2+1])cylinder(d1=4.6,d2=6,h=1.2, center = true,$fn=24);//magnet cutout
 translate([5,0,0])cylinder(d=2,h=10, center = true,$fn=24);//magnet release
cylinder(d=3.2,h=5, center = true,$fn=24);//M3 screw hole
cylinder(d=3.2,h=8, center = true,$fn=24);//M3 screw hole
translate([0,0,-.5])rotate([0,0,30])cylinder(d=6.2,h=2.1, center = false,$fn=6);//M3 nut capture  hole
}
 translate([0,0,5])difference(){

 cylinder(d=5,h=6, center = true,$fn=24);//M3 screw hole
  cylinder(d=3.2,h=6, center = true,$fn=24);//M3 screw hole
	}