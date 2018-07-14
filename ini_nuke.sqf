// by ALIAS
// Tutorial: https://www.youtube.com/watch?v=brQa42CRcWE


/*
* Script MP and SP compatible
** Impact on FPS can be remarcable depending on parameters, so use with care and test first

// nul = [nuke_obj,radius,damage_buildings_units,weather_effect,radiation,fallout] execvm "AlNuke\alias_nuke.sqf";

nuke_obj				- string, the name you gave to the object you want as origin for nuke
radius					- meters, area around marker where damage and radiation will be effective
damage_buildings_units	- boolean, if true the objects inside the radius will be destroyed
weather_effect			- boolean, if true the wheather will be affected for 300 seconds
radiation				- boolean, if true players will get damage from radiation inside defined radius
fallout					- boolean, if true screen effect will simulate fallout once the initial blast is gone
*/

/**** Example Usage

ex. 1- Will be only for show, no damage will be inflicted, no radiation, no fallout and weather effect
	nul = [nuke,0,false,false,false,false] execvm "AlNuke\alias_nuke.sqf";

ex. 2- All optional parameters enabled
	nul = [nuke,200,true,true,true,true] execvm "AlNuke\alias_nuke.sqf";
*/


nul = [nuke_me,200,true,true,true,true] execvm "AlNuke\alias_nuke.sqf";

// ======== Example for player dropped NUKE - designate the type of bomb by giving the className below in this example i used "Bomb_04_F" found on vanilla Wipeout plane
// you can define whatever bomb you want to work as NUKE, edit value of _custom_nuke_bomb variable
//Place lines below in init field of the plane you want to use to drop nukes from.

this addEventHandler ["Fired",{private ["_bomb_type","_custom_nuke_bomb","_plane_player"];_plane_player = _this select 0;_bomb_type = _this select 6;
_custom_nuke_bomb = "Bomb_04_F";  
[[_bomb_type,_custom_nuke_bomb,_plane_player,300,true,true,true,true],"AlNuke\alias_nuke_player.sqf"] remoteExec ["BIS_fnc_execVM"]}];

//^^^^ Method above might work with AI flying the plane with those lines in the init field, i didn't have time to test it tho