//Software : Sunny Hill Finger Lift Switch (component: Finger Lever)
//Developed by : MakersMakingChange  A Neil Squire Society Program
// Code Type: Written in OpenSCAD, a code based, open source 3D CAD modeling environment.
//Original Author: Derrick Andrews
//VERSION: 2.2-beta (2 May 2021) 
//Copyright Neil Squire Society 2021. 
//LICENSE: This work is licensed under the CC BY SA 4.0 License: http://creativecommons.org/licenses/by-sa/4.0 .



//roundedCube (myBoxWidth,myBoxDepth,myBoxHeight,minkRadius)

translate([0,2,1.7])roundedCube (4.5,12,3,.4);
//cube([6,12,3], center = true);

fingerPad(); //call Subroutine 

translate([0,2,-1])hull(){
cube([6.0,12.0,.1], center = true);// build aligner for finger lift pad.
translate([0,0,1.2])cube([6.0-2,12.0,.1], center = true);// chop out aligner for finger lift pad.
}//hull


// ****************************************   Subroutines   *********************************************
module fingerPad()
{
//rounded lift pad for finger
translate([0,0,18])rotate([0,270-10,90])minkowski(){
 intersection(){translate([-14,0,0])roundedCube (5,14,12,2); translate([0,0,0])buildPost(30,28,12);}
 sphere(r=2,center=true,$fn=30);
}  //end mink
}//end module

module buildPost(myPostDiam,myTapDiam,myPostHeight)
{
difference(){

cylinder(r=myPostDiam/2,h=myPostHeight, center = true,$fn=60);//Create post//fn60
cylinder(r=myTapDiam/2,h=myPostHeight+.01, center = true,$fn=60);//Drill screw hole 
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
cylinder(r=myTapDiam/2,h=myPostHeight+.01, center = true,$fn=24);//Drill screw hole 
    
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
	
	