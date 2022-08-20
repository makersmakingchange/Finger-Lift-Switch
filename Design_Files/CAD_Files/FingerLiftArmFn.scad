//Software : MMC Finger Lift Switch (component: Finger Lever)
//Developed by : MakersMakingChange  A Neil Squire Society Program
// Code Type: Written in OpenSCAD, a code based, open source 3D CAD modeling environment.
//Original Author: Derrick Andrews
//VERSION: 2.2-beta (July 2022) 
//Copyright Neil Squire Society 2022. 
//LICENSE: This work is licensed under the CC BY SA 4.0 License: http://creativecommons.org/licenses/by-sa/4.0 .

leverArm();   
 translate([2.5,10,-1.24])roundedCube (7,3,1.5,.5);
 //rotate([-90,90,90])leverArm();   
//fingerPad(); //call Subroutine 



//test
//translate([3,10,3])rotate([90,90,90])cylinder(d=3.0,h=3, center = true,$fn=100); //Final clean out bore for bearing screw


module leverArm()
{ //begin module
//roundedCube (myBoxWidth,myBoxDepth,myBoxHeight,minkRadius)
difference(){
minkowski(){
union(){
difference(){
translate([0,0,0])roundedCube (8,56,2,0);
translate([0,25,0]) cylinder(d=4,h=4, center = true,$fn=24);  //? 
translate([-16,10,0]) rotate([0,0,30])cylinder(d=34,h=4, center = true,$fn=6); //bearing side bearing pivot cutout
translate([16,10,0]) rotate([0,0,30])cylinder(d=34,h=4, center = true,$fn=6); //nut side bearing pivot cutout
translate([5,10,3])rotate([90,90,90])cylinder(d=8,h=4, center = true,$fn=6); 

}//diff
translate([-1,10,0])roundedCube (4,1,2,0);//leave in support for bearing shaft pivot tube
translate([0,0,0])roundedCube (10,1,2,0);//limiter "stop" for lever for slide on balance screw holder (near bearing tube)
translate([0,26,0]) rotate([0,0,90])cylinder(d=14,h=2, center = true,$fn=6); //Hex rear end
translate([0,32,0]) rotate([0,0,90])cylinder(d=6,h=2, center = true,$fn=30); //Magnet cover rear tip
}//union
 sphere(r=1,center=true,$fn=30);

}// Mink
//"hard" removals (no rounding) 
translate([0,26,0]) cylinder(d=3.2,h=4, center = true,$fn=24); //counterweight screw
translate([0,26,-1]) cylinder(d=6,h=3, center = true,$fn=24);  //countersink
translate([3,10,3])rotate([90,90,90])cylinder(d=3.4,h=20, center = true,$fn=32); //Final clean out bore for bearing screw
//translate([0,-23,3])cube([6.4,12.4,3], center = true);// chop out aligner for finger lift pad.
translate([0,-23,1])hull(){
cube([6.4,12.4,.1], center = true);// chop out aligner for finger lift pad.
translate([0,0,1])cube([6.4-2,12.4,.1], center = true);// chop out aligner for finger lift pad.
}//hull


//translate([-4.5,-10,-1])cube([2,2,3], center = true);//aligner notches for counterweight
//translate([4.5,-10,-1])cube([2,2,3], center = true);



}//outer diff

difference(){
 union(){
    
    translate([1,10,3])rotate([90,90,90])buildPost(6,3.6,15);//outer bearing tube
	translate([1,10,3])rotate([90,90,90])buildPost(5,3.6,19);//inner bearing tube
    //originals
    //translate([3,10,3])rotate([90,90,90])buildPost(6,3.6,15);//outer bearing tube
	//translate([3,10,3])rotate([90,90,90])buildPost(5,3.6,19);//inner bearing tube
 }//union
     translate([12,10,3])rotate([90,90,90])cylinder(d=8,h=17, center = true,$fn=24); //chop off unwanted bearing shaft end
	 }//diff
	
    //rounded M3 Nut Accepter for bearing screw
 translate([4,10,3])rotate([90,90,90])minkowski(){
buildHexPost(8,7.5,3);//was 2.8 now 3
 sphere(r=.5,center=true,$fn=30);
}  //end mink


	//translate([12,10,3])rotate([90,90,90])cylinder(d=5.4,h=7, center = true,$fn=24);
	 translate([1.5,10,3])rotate([90,90,90])buildConePost(6,8,4,3);
  }//end module leverArm   
 


// ****************************************   Subroutines   *********************************************
module fingerPad()
{
//rounded lift pad for finger
translate([0,-25,18])rotate([0,270-10,90])minkowski(){
 intersection(){translate([-14,0,0])roundedCube (5,14,12,2); translate([0,0,0])buildPost(30,28,12);}
 sphere(r=2,center=true,$fn=30);
}  //end mink
}//end module

module buildPost(myPostDiam,myTapDiam,myPostHeight)
{
difference(){

cylinder(r=myPostDiam/2,h=myPostHeight, center = true,$fn=60);//Create post//fn60
cylinder(r=myTapDiam/2,h=myPostHeight+.01, center = true,$fn=6);//Drill screw hole 
}//diff
}//end module


module buildHexPost(myPostDiam,myTapDiam,myPostHeight)
{
difference(){

cylinder(r=myPostDiam/2,h=myPostHeight, center = true,$fn=60);//Create post//fn60
cylinder(r=myTapDiam/2,h=myPostHeight+.01, center = true,$fn=6);//Drill screw hole 
}//diff
}//end module


module buildConePost(myPostDiam,myPostDiamTop,myTapDiam,myPostHeight)
{
difference(){

cylinder(d1=myPostDiam,d2=myPostDiamTop,h=myPostHeight, center = true,$fn=24);//Create post
cylinder(r=myTapDiam/2,h=myPostHeight, center = true,$fn=6);//Drill screw hole 
    
}//diff
}//end module

module basicBox (myBoxWidth,myBoxDepth,myBoxHeight,myWallWidth)
{
difference(){	
cube([myBoxWidth,myBoxDepth,myBoxHeight], center = true); // Build box body
translate([0,0,myWallWidth+.01])cube([myBoxWidth-myWallWidth*2,myBoxDepth-myWallWidth*2,myBoxHeight-myWallWidth*2], center = true); // Mill out box cavity
}//end diff
}//end module basic box
	

module roundedBox (myBoxWidth,myBoxDepth,myBoxHeight,myWallWidth,minkRadius)
//creates hollow rounded bottom box IMPORTANT*** requires module roundBottomCube 
{
difference(){	
roundBottomCube (myBoxWidth,myBoxDepth,myBoxHeight,minkRadius); // Build box body
translate([0,0,myWallWidth+.01])roundBottomCube (myBoxWidth-myWallWidth*2,myBoxDepth-myWallWidth*2,myBoxHeight-myWallWidth*2,minkRadius); //Mill out box cavity
}//end diff
//translate([20,0,myWallWidth+.01])roundBottomCube (myBoxWidth-myWallWidth*2,myBoxDepth-myWallWidth*2,myBoxHeight-myWallWidth*2,minkRadius); // Mill out box cavity
//translate([20,0,myWallWidth+.01])roundBottomCube (myBoxWidth,myBoxDepth,myBoxHeight,minkRadius); // Build box body
}//end module rounded box

//roundBottomCube (myBoxWidth,myBoxDepth,myBoxHeight,minkRadius);


module roundBottomCube (myBoxWidth,myBoxDepth,myBoxHeight,minkRadius)
//** Same as regular cube, but with rounded sides and bottom
//** maintains proper 'cube' dimensions due to compensation for object expansion 
//** that normally occurs while using Minkowski operations in OpenSCAD)
{
union()
{
difference()
{
translate([0,0,minkRadius/2])minkowski(){
cube([myBoxWidth-minkRadius*2,myBoxDepth-minkRadius*2,myBoxHeight-minkRadius], center = true);//Main plate   original cube([90,testSize8,8.5]
sphere(r=minkRadius,center=true,$fn=30);
}  //end mink
translate([0,0,myBoxHeight/2+minkRadius/2]) cube([myBoxWidth,myBoxDepth,minkRadius], center = true);
}

}//end union
}//end module roundBottomCube

//test
//translate ([15,0,0])cube([35,35,35],center=true);

module roundedCube (myBoxWidth,myBoxDepth,myBoxHeight,minkRadius)
//** maintains proper 'cube' dimensions due to compensation for object expansion 
//** that normally occurs while using Minkowski operations in OpenSCAD)
{

translate([0,0,0])minkowski(){
cube([myBoxWidth-minkRadius*2,myBoxDepth-minkRadius*2,myBoxHeight-minkRadius*2], center = true);
sphere(r=minkRadius,center=true,$fn=30);
}  //end mink

}//end module roundBottomCube

module mountingRails() {//(experimental) mounting rail grooves
translate([4.0,-15,0])rotate([0,90,0])hull(){//rail mount
cube([2.4,30.4,.1], center = true);// chop out aligner for finger lift pad.
translate([-.5,0,1])cube([2.4-1,30.4,.1], center = true);// chop out aligner for finger lift pad.
}//hull
translate([-4.0,-15,0])rotate([0,90,180])hull(){//rail mount
cube([2.4,30.4,.1], center = true);// chop out aligner for finger lift pad.
translate([-.5,0,1])cube([2.4-1,30.4,.1], center = true);// chop out aligner for finger lift pad.
}//hull

}//module
