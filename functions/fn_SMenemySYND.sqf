/*
Author: 

	Quiksilver
	
Last modified:

	25/04/2014

Description:

	Spawn INDEPENDENT enemy around side objectives.
	Enemy should have backbone AA/AT + random composition.
	
___________________________________________*/

//---------- CONFIG

#define INF_TEAMS "ParaFireTeam","ParaShockTeam","ParaCombatGroup","BanditFireTeam","BanditShockTeam","BanditCombatGroup"
#define VEH_TYPES "O_APC_Tracked_02_AA_F"
private ["_x","_pos","_flatPos","_randomPos","_unitsArray","_enemiesArray","_infteamPatrol","_SMvehPatrol","_SMveh","_SMaaPatrol","_SMaa","_indSniperTeam"];
_enemiesArray = [grpNull];
_x = 0;

//---------- CREATE GROUPS

_infteamPatrol = createGroup east;
_indSniperTeam = createGroup east;
_SMvehPatrol = createGroup east;
_SMaaPatrol = createGroup east;

//---------- INFANTRY

for "_x" from 0 to (4 + (random 6)) do {
	_randomPos = [[[getPos sideObj, 300],[]],["water","out"]] call BIS_fnc_randomPos;
	_infteamPatrol = [_randomPos, EAST, (configfile >> "CfgGroups" >> "Indep" >> "IND_C_F" >> "Infantry" >> [INF_TEAMS] call BIS_fnc_selectRandom)] call BIS_fnc_spawnGroup;
	[_infteamPatrol, getPos sideObj, 100] call BIS_fnc_taskPatrol;
				
	_enemiesArray = _enemiesArray + [_infteamPatrol];

	{
		_x addCuratorEditableObjects [units _infteamPatrol, false];
	} foreach adminCurators;

};

//---------- SNIPER

for "_x" from 0 to 1 do {
	_randomPos = [getPos sideObj, 500, 100, 20] call BIS_fnc_findOverwatch;
	_indSniperTeam = [_randomPos, EAST, (configfile >> "CfgGroups" >> "Indep" >> "IND_F" >> "Infantry" >> "HAF_SniperTeam")] call BIS_fnc_spawnGroup;
	_indSniperTeam setBehaviour "COMBAT";
	_indSniperTeam setCombatMode "RED";
	
	_enemiesArray = _enemiesArray + [_indSniperTeam];

	{
		_x addCuratorEditableObjects [units _indSniperTeam, false];
	} foreach adminCurators;

};

//---------- RANDOM VEHICLE

_randomPos = [[[getPos sideObj, 300],[]],["water","out"]] call BIS_fnc_randomPos;
_SMveh = [VEH_TYPES] call BIS_fnc_selectRandom createVehicle _randomPos;
waitUntil {sleep 0.5; !isNull _SMveh};
	"I_C_Soldier_Bandit_4_F" createUnit [_randomPos,_SMvehPatrol];
	"I_C_Soldier_Bandit_2_F" createUnit [_randomPos,_SMvehPatrol];
	"I_C_Soldier_Bandit_3_F" createUnit [_randomPos,_SMvehPatrol];
	((units _SMvehPatrol) select 0) assignAsDriver _SMveh;
	((units _SMvehPatrol) select 1) assignAsGunner _SMveh;
	((units _SMvehPatrol) select 2) assignAsCommander _SMveh;
	((units _SMvehPatrol) select 0) moveInDriver _SMveh;
	((units _SMvehPatrol) select 1) moveInGunner _SMveh;
	((units _SMvehPatrol) select 2) moveInCommander _SMveh;
	
_SMveh lock 3;
[_SMvehPatrol, getPos sideObj, 150] call BIS_fnc_taskPatrol;
if (random 1 >= 0.5) then {
	_SMveh allowCrewInImmobile true;
};
	
_enemiesArray = _enemiesArray + [_SMvehPatrol];
sleep 0.1;
_enemiesarray = _enemiesArray + [_SMveh];

{
	_x addCuratorEditableObjects [[_SMveh], false];
	_x addCuratorEditableObjects [units _SMvehPatrol, false];
} foreach adminCurators;

//---------- AA VEHICLE

for "_x" from 0 to 1 do {
	_randomPos = [[[getPos sideObj, 300],[]],["water","out"]] call BIS_fnc_randomPos;
	_SMaa = "I_C_Van_01_transport_olive_F" createVehicle _randomPos;
	waitUntil {sleep 0.5; !isNull _SMaa};
	[_SMaa, _SMaaPatrol] call BIS_fnc_spawnCrew;
	
	_SMaa lock 3;
	[_SMaaPatrol, getPos sideObj, 150] call BIS_fnc_taskPatrol;
	if (random 1 >= 0.5) then {
		_SMaa allowCrewInImmobile true;
	};
	
	_enemiesArray = _enemiesArray + [_SMaaPatrol];
	sleep 0.1;
	_enemiesArray = _enemiesArray + [_SMaa];

	{
		_x addCuratorEditableObjects [[_SMaa], false];
		_x addCuratorEditableObjects [units _SMaaPatrol, false];
	} foreach adminCurators;

};

//---------- COMMON

[(units _infteamPatrol)] call QS_fnc_setSkill2;
[(units _indSniperTeam)] call QS_fnc_setSkill3;
[(units _SMvehPatrol)] call QS_fnc_setSkill2;
[(units _SMaaPatrol)] call QS_fnc_setSkill4;

//---------- GARRISON FORTIFICATIONS

	{
		_newGrp = [_x] call QS_fnc_garrisonFortSYN;
		if (!isNull _newGrp) then { 
		_enemiesArray = _enemiesArray + [_newGrp]; };
		{
			_x addCuratorEditableObjects [units _newGrp, false];
		} foreach adminCurators;

	} forEach (getPos sideObj nearObjects ["House", 150]);

_enemiesArray