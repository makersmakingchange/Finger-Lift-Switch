//Software : Sunny Hill Finger Lift Switch (component)
//Developed by : MakersMakingChange  A Neil Squire Society Program
// Code Type: Written in OpenSCAD, a code based, open source 3D CAD modeling environment.
//Original Author: Derrick Andrews
//VERSION: 2.0-beta (18 Aug 2021) 
//Copyright Neil Squire Society 2021. 
//LICENSE: This work is licensed under the CC BY SA 4.0 License: http://creativecommons.org/licenses/by-sa/4.0 .


//roundedCube (myBoxWidth,myBoxDepth,myBoxHeight,minkRadius)
//translate([0,0,3/2])roundedCube (80,100,3,1);

difference(){
union(){
//translate([0,27.5+2.5-1.5,4/2])roundedCube (12,33,4,1);	//increased from 30 to 33mm (allows for needle nose plier bend of reed wire to mimimize breakage)
//translate([0,27.5+2.5-1.5,4/2+.4]) sideRoundedCube(12,33,4,2);//  roundedCube (12,33,4,1);	//increased from 30 to33mm (allows for needle nose plier bend of reed wire to mimimize breakage)
translate([0,27.5+2.5-2.5,4.4/2]) roundBottomCube (14,38,4.4,2);
translate([0,45,4/2])roundedCube (6,10,3,.5);//wire strain relief
translate([0,47,4/2])roundedCube (8,3,4,1);//wire strain relief
translate([0,50,4/2])roundedCube (8,3,4,1);//wire strain relief
}//union	
//removals

//translate([0,25,(15+3+3)/2])rotate([0,90,0])cylinder(d=2.8,h=20, center = true,$fn=24);//Create center side hole
//translate([0,35,(15+3+3)/2])rotate([0,90,0])cylinder(d=2.8,h=20, center = true,$fn=24);//Create rear side hole
//translate([0,15,(15+3+3)/2])rotate([0,90,0])cylinder(d=2.8,h=20, center = true,$fn=24);//Create front side hole


translate([0,20.4,(15+3)/2])hull() {cylinder(d=3.0,h=20, center = true,$fn=24);//Create top center slot
translate([0,14,0])cylinder(d=3.0,h=20, center = true,$fn=24);
	}//hull
	
translate([0,20.4,0.5])hull() {cylinder(d1=5.4,d2=5,h=1, center = true,$fn=60);//Create top center nut slider guide slot
translate([0,14,0])cylinder(d1=5.4,d2=5,h=1, center = true,$fn=60);
	}//hull	
	
//translate([0,35,(15+3)/2])cylinder(d=2.8,h=20, center = true,$fn=24);//Create rear top hole
//translate([0,15,(15+3)/2])cylinder(d=2.8,h=20, center = true,$fn=24);//Create front top hole


translate([-3.8,25,2.4/2+1.9])cube([2.4,15,3.2], center = true);//reed tube cutout
translate([-3.8,25+2.5,2.4/2+1.9])cube([1,21,3.2], center = true);//reed wire cutout
translate([-3.8,25+2.5-1.5,2.4/2+1.9])cube([1,23,3.2], center = true);//reed wire
translate([4,25+2.5-1.5,2.4/2+1.9])cube([1.6,24,3.2], center = true);//wire return cutout (opposite reed)
translate([-.4,12+5-4.5,3.2/2+2])cube([9,2,3.2], center = true);//reed wire return cutout (front side)	
//translate([3.2,38,3/2+1.5])cylinder(d=2.8,h=4, center = true,$fn=24);//Create rear solder well
//translate([-3.2,39,3/2+1])cylinder(d=3,h=3, center = true,$fn=24);//old Create rear solder well reed side	
translate([0,25,3/2+2.5])ArrayCentItemsVar(2,2,7.5,26)sphere(d=5,$fn=24);//Cutout rear solder wells    
translate([0,41,3/2+1.5])cylinder(d=7,h=4, center = true,$fn=24);//Hot Melt glue well strain relief
translate([0,50,3/2+1])rotate([90,90,0])cylinder(d=3,h=15, center = true,$fn=24);//Create cord hole
translate([0,50,3/2+3])rotate([90,90,0])cylinder(d=3,h=15, center = true,$fn=24);//Create cord hole upper
translate([0,30,4.2])ArrayCentItemsVar(1,38,1,1.2)cube([14,.6,.6], center = true);
}//diff

//test translate([0,26,3/2+2.5])ArrayCentItemsVar(2,2,8,27)sphere(d=5,$fn=24);//Cutout rear solder well 
//test translate([-3.5,12+5-4,3/2+2.5])sphere(d=5,$fn=24);//Create front solder well sphere, reed side
//***************      Subroutines      *************************	
module buildPost(myPostDiam,myTapDiam,myPostHeight)
{
difference(){

cylinder(r=myPostDiam/2,h=myPostHeight, center = true,$fn=24);//Create post
cylinder(r=myTapDiam/2,h=myPostHeight+.01, center = true,$fn=24);//Drill screw hole 
    
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
// !!!!!! requires module ArrayCentItemsVar !!!!!!
module sideRoundedCube(width,depth,height,radi)//note: calls ArrayCentItemsVar 
{
hull() {//create rounded main base plate
ArrayCentItemsVar(2,2,width-radi*2,depth-radi*2) cylinder(r=radi,h=height, center = true,$fn=50);
}//hull
}


module ArrayCentItemsVar(xCount,yCount,itemGapX,itemGapY)
{
for (x = [1:xCount]){
for (y = [1:yCount]){
translate([x*itemGapX-(xCount+1)*itemGapX/2,y*itemGapY-(yCount+1)*itemGapY/2,0])
children();
}//for y
}//for x
}//end module


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
	
	