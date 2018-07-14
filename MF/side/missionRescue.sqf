//--By Kylania----------------------//
//----------------------------------//


//Mission Select
if(!isServer) exitWith {};

//waituntil {!isnil "bis_fnc_init"}; //waiting

_missions = ["Pilote"]; //mission array

_choose = _missions call BIS_fnc_selectRandom; // random mission 
//_choose = "convoy";
[_choose] execVM "MF\side\AAsite.sqf";  //call mission