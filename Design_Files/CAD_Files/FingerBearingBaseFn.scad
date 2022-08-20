
baseBlockHeight =5;
nutPocketHeight =2.4+.6+1;// M3 nut height in mm with .6 extra clearance
nutHexDiam =6 +.4 ; 
//translate([10,73,9])rotate([0,270,180])import("/Users/derrickandrews/My Drive/NSS Office/MMC Finger Lift Review Improvements /ReedSwitchPlateWideProto.stl");


translate([0,0,0])makeBearingCoverPlate();//accepts bearing 
translate([0,50,2])rotate([180,0,0]) makeBearingStand(); //Cover Plate goes on this portion of base
//translate([0,50,2])rotate([180,0,0]) makeBearingBaseOld(); //The main base block original narrow version
translate([7.5,47,9])rotate([180,270,180]) makeBearingBaseNew(); //The main base block wider version
//makeBearingBaseNew(); //The main base block wider version (base default centered here)


module makeBearingBaseNew()
{
difference(){	
union(){

minkowski(){
translate([-1,-2,3.8/2+.5])rotate([0,0,0]) sideRoundedCube(16-1.2,38-1.2,3.8,2);//even better with rounding
sphere(r=.6, center = true,$fn=30);
}  //end mink
translate([0,-2,4.8+.2])ArrayCentItemsVar(1,28,1,1.2)cube([12,.6,.6], center = true);
}//union

//Removals
ArrayCentItemsVar(1,3,0,10)cylinder(d=3.4,h=20, center = true,$fn=24);//Create line of 3 screw holes in base
translate([0,0,3/2-.2])cylinder(d=6.4,h=nutPocketHeight-.5, center = true,$fn=6);//Create center lower nut catch
translate([0,0,(baseBlockHeight+.5)-nutPocketHeight/2+.01])ArrayCentItemsVar(1,2,0,20)cylinder(d=6.4,h=nutPocketHeight, center = true,$fn=6);////Create upper (outer) nut catches

translate([0,0,baseBlockHeight+.2])ArrayCentItemsVar(1,3,0,10)cylinder(d=6.4+2,h=1, center = true,$fn=6);//Remove grip from around screw holes
translate([0,-17.5,5])cylinder(d=5.4,h=2, center = true,$fn=24);//Bore magnet recess
translate([0,-17.5,6])cylinder(d=7,h=2.2, center = true,$fn=24);//Bore magnet recess
translate([0,-17.5,6])cylinder(d=2.4,h=20, center = true,$fn=24);//Create magnet release hole in base
}//diff	
//test cube([14,36,14], center = true);
}



module makeBearingBaseOld()
{
difference(){	
union(){
//translate([6.6,5,-13/2])cube([2,30,17], center = true);	//original Base portion (printed vertically)
//translate([6.6-1.5,5+1,-13/2+1])cube([2+3,30+2,15], center = true);	//new fatter Base portion (printed vertically)
minkowski(){
translate([6.6-1.5,5+1,-13/2+1.5])rotate([90,0,90]) sideRoundedCube(34-1.2,14-1.2,5-1.2,2);//even better with rounding
sphere(r=.6,center=true,$fn=30);
}  //end mink
translate([2.4,6,-5.5])ArrayCentItemsVar(1,26,1,1.2)cube([.6,.6,10], center = true);
}

translate([0,-5-1,-6])rotate([0,90,0])cylinder(d=3.4,h=20, center = true,$fn=24);//Create front hole in base
translate([3.5,-5-1,-6])rotate([0,90,0])cylinder(d=6.4,h=4, center = true,$fn=6);//Bore front screw head countersink in base

translate([0,5-1,-6])rotate([0,90,0])cylinder(d=3.4,h=20, center = true,$fn=24);//Create center hole in base
translate([6.7,5-1,-6])rotate([0,90,0])cylinder(d=6.4,h=5, center = true,$fn=6);//Create center lower nut catch

translate([0,15-1,-6])rotate([0,90,0])cylinder(d=3.4,h=20, center = true,$fn=24);//Create rear hole in base
translate([3.5,15-1,-6])rotate([0,90,0])cylinder(d=6.4,h=4, center = true,$fn=6);//Bore rear screw head countersink in base
	
translate([0,15+4,-6+4])rotate([0,90,0])cylinder(d=2.4,h=20, center = true,$fn=24);//Create magnet release hole in base
//translate([0,15+4,-6+4])rotate([0,90,0])cylinder(d=2.4,h=20, center = true,$fn=24);//Create pseudo magnet 	
translate([2.5,15+4,-6+4])rotate([0,90,0])cylinder(d=5.4,h=2.2, center = true,$fn=24);//Bore magnet recess	

}	

}


module makeBearingCoverPlate()
{

difference(){
minkowski(){	
hull() { //rounded bearing mount
    translate([-15,0,4/2])cylinder(d=10,h=2, center = true,$fn=24);//
    translate([6,8,4/2])cylinder(d=1,h=2, center = true,$fn=24);//Create center side hole
	translate([6,-8,4/2])cylinder(d=1,h=2, center = true,$fn=24);//Create center side hole
}//hull
sphere(r=1,center=true,$fn=30);
}  //end mink
//removals
translate([0,0,3/2+3]) cube([50,30,3], center = true);
translate([-15,0,4/2])cylinder(d=7.3,h=4, center = true,$fn=24);//Create bearing catch hole
translate([-15,0,4/2+.6])cylinder(d=8.3,h=4, center = true,$fn=24);//Create bearing hole	

translate([-7,0,4/2]) cylinder(d=3.2,h=4, center = true,$fn=24);//Create plate cinch hole
translate([-7,0,2/2]) cylinder(d=6.6,h=2, center = true,$fn=24);//Create plate cinch head countersink
 //emboss text
 union(){
  translate([5.5,7.5,0.5])rotate([0,180,90]) linear_extrude(height = 5) {
       text(text = "MMC",font = "Liberation Sans:style=Bold Italic",size = 4.5);
     }//text 
}//union

}//difference


//translate([0,-5,3/2])cylinder(d=2,h=3, center = true,$fn=24);//test post
minkowski(){
translate([0,5,5/2])cylinder(d=1.2,h=4, center = true,$fn=24);//Create center side aligner pin
sphere(r=.5,center=true,$fn=30);
}  //end mink
minkowski(){
translate([0,-5,5/2])cylinder(d=1.2,h=4, center = true,$fn=24);//Create center side aligner pin
sphere(r=.5,center=true,$fn=30);
}  //end mink



}//end module make bearing plate


module makeBearingStand()
{


difference(){
minkowski(){	
hull() { //rounded bearing mount
    translate([-15,0,4/2])cylinder(d=10,h=2, center = true,$fn=24);//
    translate([6,8,4/2])cylinder(d=1,h=2, center = true,$fn=24);//Create center side hole
	translate([6,-8,4/2])cylinder(d=1,h=2, center = true,$fn=24);//Create center side hole
}//hull
sphere(r=1,center=true,$fn=30);
}  //end mink
//removals
translate([0,0,3/2+3]) cube([50,30,3], center = true);
translate([-15,0,4/2])cylinder(d=7.3,h=4, center = true,$fn=24);//Create bearing back catch bore
//translate([-15,0,4/2+.6])cylinder(d=8.3,h=4, center = true,$fn=24);//Create bearing holder bore if needed	
translate([0,5,3/2])cylinder(d=2.4,h=5, center = true,$fn=24);//Create center side hole
translate([0,-5,3/2])cylinder(d=2.4,h=5, center = true,$fn=24);//Create center side hole
translate([-7,0,4/2]) cylinder(d=3,h=4, center = true,$fn=24);//Create plate cinch hole
translate([-7,0,3/2+2]) cube([35,25,3], center = true);//remove unwanted bottom
}//difference
//translate([0,-5,3/2])cylinder(d=2,h=3, center = true,$fn=24);//test post

minkowski(){
difference(){
translate([-7,0,-1]) cylinder(d=7.75,h=4, center = true,$fn=60);//Create screw thread extension
translate([-7,0,0]) cylinder(d=6.4+1.2,h=10, center = true,$fn=6);//Create nut catch below bearing
}//diff
sphere(r=.5,center=true,$fn=30);
}  //end mink

//translate([-14,-5,-1]) cylinder(d=2,h=3, center = true,$fn=24);/Create lever drop limiter post 

minkowski(){
hull(){
translate([-14.5,-4.8,-2])cylinder(d=.8,h=6, center = true,$fn=24);////Create lever drop limiter post: top (rounded)
translate([-11,-4,-2])cylinder(d=.8,h=6, center = true,$fn=24);////Create lever drop limiter post: inside middle(rounded)
translate([-10,-5.6,-2])cylinder(d=.8,h=6, center = true,$fn=24);////Create lever drop limiter post: bottom (rounded)
}

sphere(r=.75,center=true,$fn=30);
}  //end mink

}//end module makeBearingStand()



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
	