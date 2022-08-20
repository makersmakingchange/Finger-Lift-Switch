$fn=60;	
holderHeight = 23;

hullDiam=5; //Hull radius diam
balScrewDiam = 3+.4; //Hole for M3 screw + fudge factor
balScrewHeadfDiam = 5.6; //Hole for M3 screw + fudge factor
minkRad = 1;
difference(){

union(){
//FRONT END (hulled)
translate ([0,0,5/2+10])hull() { //nice rounded front end
translate([0,-3.5+5.6,0])sphere(d=hullDiam+2, center = true,$fn=24);//
translate([-3,-4,0])sphere(d=hullDiam+3, center = true,$fn=24);//
translate([3,-4,0])sphere(d=hullDiam+3, center = true,$fn=24);//
}//hull

translate ([0,0,-2])minkowski(){	//TRIANGULAR TUBE
translate ([0,0,5/2])hull() { //rounded bearing mount
translate([0,-3.5+5.6,0])cylinder(d=hullDiam,h=holderHeight, center = true,$fn=24);//
translate([-3,-4,0])cylinder(d=hullDiam+1,h=holderHeight, center = true,$fn=24);//
translate([3,-4,0])cylinder(d=hullDiam+1,h=holderHeight, center = true,$fn=24);//
	
//CircleItems(3,5,30+180)cylinder(d=3,h=5, center = true,$fn=24);//
 
}//hull
sphere(minkRad);


}//minkowski
}//union
//Removals:

//translate([0,-3.5,5.2/2])cube([10.2,3,10], center = true);//original lever cutout
translate([0,-8,5.2/2])cube([7,5,holderHeight+10], center = true);//bottom end cutout for nut access

translate([0,-4,-1])rotate([90,0,0])cutOutSlug();//chop out balance beam area
translate([0,-4.5+5.6,5.2/2])cylinder(d=balScrewDiam,h=10, center = true,$fn=24);//m3 screw holder
translate([0,-4.5+5.6,5.2/2+8.5])cylinder(d=balScrewHDiam,h=9, center = true,$fn=24);//m3 screw Head top
translate([0,-4.5+5.6,5.2/2-8.5+1])cylinder(d=balScrewHeadfDiam,h=10, center = true,$fn=24);//m3 screw Head bottom

translate([0,-4.5+5.6,-12])cylinder(d=balScrewDiam,h=10, center = true,$fn=24);//Screwdriver head access 

translate([0,-4.5+5.6,2.5])rotate([0,0,0])hull(){
cylinder(d=6.5,h=2.8, center = true,$fn=6);//nut cutout
translate([0,-4,0])cylinder(d=6.5,h=2.8, center = true,$fn=6);//nut cutout shifted to make insertion channel
}//hull


//create front screw shaft access 
translate([0,-4.5+5.6,9.5])rotate([0,0,0])hull(){
cylinder(d=6.5,h=7, center = true,$fn=24);//nut cutout
translate([0,-4,0])cylinder(d=6.5,h=9.5, center = true,$fn=24);//nut cutout shifted to make insertion channel
}//hull

//create rear screw head access
translate([0,-4.5+5.6,-5.5])rotate([0,0,0])hull(){
cylinder(d=6.5,h=11, center = true,$fn=24);//nut cutout
translate([0,-4,0])cylinder(d=6.5,h=11, center = true,$fn=24);//nut cutout shifted to make insertion channel
}//hull

translate([0,-4,5.2/2+3])cube([3.5,10,holderHeight-10], center = true);//bottom end cutout for view
translate([0,-7.5,10.5])rotate([-10,0,0])cube([14,3,25], center = true);//angled chop off, to make room for finger lift pad

}//diff
//test area


//
//test nut dummy
//translate([0,-4.5+5.6,2.5])rotate([0,0,0])cylinder(d=6.5,h=2.8, center = true,$fn=6);//nut cutout
//*********** MODULES *****************************

module cutOutSlug(){

difference(){
minkowski(){
translate([0,0,0])roundedCube (8,holderHeight+5,2,0);
 sphere(r=1.2,center=true,$fn=30);//added .2 to loosen grip
}// Mink
//"hard" removals (no rounding) 

//translate([-4.5,0,-1])cube([2,2,3], center = true);
//translate([4.5,0,-1])cube([2,2,3], center = true);
}// diff
}//module


module CircleItems(n,r,myRot)
{
segment=360 / n;
for (i=[1:n])
{
rotate([0, 0, segment*i+myRot])
translate ([r,0,0])
children();
}//for
}//module


module roundedCube (myBoxWidth,myBoxDepth,myBoxHeight,minkRadius)
//** maintains proper 'cube' dimensions due to compensation for object expansion 
//** that normally occurs while using Minkowski operations in OpenSCAD)
{

translate([0,0,0])minkowski(){
cube([myBoxWidth-minkRadius*2,myBoxDepth-minkRadius*2,myBoxHeight-minkRadius*2], center = true);
sphere(r=minkRadius,center=true,$fn=30);
}  //end mink

}//end module roundBottomCube
	
	