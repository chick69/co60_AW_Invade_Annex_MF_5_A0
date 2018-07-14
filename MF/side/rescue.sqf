//////////////////////////////////////
//----ALiVE NATOFOR Random Tasks----//
//---By Valixx, Kylania & M4RT14L---//
//---------------v1.4---------------//
//////////////////////////////////////

_missionType = [_this, 0, ""] call BIS_fnc_param;

sleep 10;



//-------------------- FIND SAFE POSITION FOR OBJECTIVE

	_basepos = getMarkerPos "respawn_west";
	_flatPos = [0,0,0];
	_accepted = false;
	while {!_accepted} do {
		_position = [[[_basepos,2000]],["water","out"]] call BIS_fnc_randomPos;
		_flatPos = _position isFlatEmpty [5, 0, 0.2, 5, 0, false];

		while {(count _flatPos) < 2} do {
			_position = [[[_basepos,6000]],["water","out"]] call BIS_fnc_randomPos;
			_flatPos = _position isFlatEmpty [5, 0, 0.2, 5, 0, false];
		};

		if ((_flatPos distance _basepos) > 2000) then {
			if ((_flatPos distance _basepos) < 3750) then {
				if ((_flatPos distance (getMarkerPos currentAO)) > 500) then {
					_accepted = true;
				};
			};
		};
	};
	
	_flatPos1 = [(_flatPos select 0) - 2, (_flatPos select 1) - 2, (_flatPos select 2)];

	_markerpop = createMarker ["mob_clear", _flatPos1];
	_markerpop setMarkerType "Empty";
	_markerpop setMarkerColor "ColorRed";
	_markerpop setMarkerText "pop side";
	_markerpop setMarkerShape "ELLIPSE";		
	_markerpop setMarkerBrush "Solid";	
	_markerpop setMarkerSize [150,150];
	
	
fn_spawnOceanMission = {
	


//-------------------- FIND SAFE POSITION FOR OBJECTIVE



_markerArray = _markerpop;

_mrkSpawnTown = getMarkerPos _markerArray;

sleep 10;



	hint "Mise a jour des missions OPS";
	//creating the marker 

	_markerCO = createMarker ["mob_clear", _flatPos1];
	_markerCO setMarkerType "mil_circle";
	_markerCO setMarkerColor "ColorRed";
	_markerCO setMarkerText "Tue les plongeur OPS test";
	_markerCO setMarkerShape "ELLIPSE";		
	_markerCO setMarkerBrush "Solid";	
	_markerCO setMarkerSize [150,150];
	
	_null = [west, "mob_clear", ["Take control of the zone and drive out OPFOR forces.", "Zone test", "Zone test"], getMarkerPos "mob_clear", false] spawn BIS_fnc_taskCreate;
	_null = ["mob_clear", "CREATED"] spawn BIS_fnc_taskSetState;



//-------------------- BRIEFING
	
		_briefing = "<t align='center'><t size='2.2'>Nouvel mission secondaire Test</t><br/><t size='1.5' color='#00B2EE'>Secure Smuggled Explosives</t><br/>____________________<br/>un sous marin des plongeur mission test .<br/><br/>Tue les plongeur et voila pour le moment mission test.</t>";
	GlobalHint = _briefing; publicVariable "GlobalHint"; hint parseText GlobalHint;
	
	
sleep 10;

	

	
	
//---------- INFANTRY PATROLS RANDOM

//	_newPos = [getMarkerPos _markerCO, 50, 100, 10, 2, 20, 1] call BIS_fnc_findSafePos;

	_grp1S = createGroup east;
	
	_grp1S = [_flatPos1, EAST, (configfile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfTeam")] call BIS_fnc_spawnGroup;
	nul = [_grp1S,_flatPos1] call BIS_fnc_taskPatrol;

	_grp2S = createGroup east;	
	
	_grp2S = [_flatPos1, EAST, (configfile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfTeam")] call BIS_fnc_spawnGroup;
	nul = [_grp2S,_flatPos1, 50] call BIS_fnc_taskPatrol;

	_grp3S = createGroup east;
	
	_grp3S = [_flatPos1, EAST, (configfile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSquad")] call BIS_fnc_spawnGroup;
	nul = [_grp3S,_flatPos1, 100] call BIS_fnc_taskPatrol;



	
	{
		_x addCuratorEditableObjects [[_hq], false];
		_x addCuratorEditableObjects [[_mine1], false];
		_x addCuratorEditableObjects [[_mine2], false];
		_x addCuratorEditableObjects [units _grp1S, false];
		_x addCuratorEditableObjects [units _grp2S, false];
		_x addCuratorEditableObjects [units _grp3S, false];
	} foreach adminCurators;	


	
	//trigger
	_trg = createTrigger ["EmptyDetector", _flatPos1]; 
	_trg setTriggerArea [150, 150, 0, false]; 
	_trg setTriggerActivation ["EAST", "NOT PRESENT", false]; 
	_trg setTriggerStatements ["this", "", ""]; 
	
	enemyDead = false; 
	waitUntil {triggerActivated _trg}; 

	_null = ["mob_clear", "SUCCEEDED"] spawn BIS_fnc_taskSetState;
	
	sleep 10;

	deleteMarker _markerCO;
	deleteMarker _markerpop;
	
	{deleteVehicle _x} forEach units grp1C;
	{deleteVehicle _x} forEach units grp2C;
	{deleteVehicle _x} forEach units grp3C;
	{deleteVehicle _x} forEach units ifv1;
	deleteGroup ifv1;
	deleteGroup _grp1S;
	deleteGroup _grp2S;
	deleteGroup _grp3S;
	deleteVehicle _hq;

	_myHint ="Good Job!";
	GlobalHint = _myHint;
	publicVariable "GlobalHint";
	hintsilent parseText _myHint;

	_mySChat ="OBJECTIVE COMPLETED";
	GlobalSCHat = _mySChat;
	publicVariable "GlobalSCHat";
	player sideChat _mySChat;
	
	[west, "mob_clear"] call LARs_fnc_removeTask;

	sleep 10;
};




// MAIN LOGIC

_missionDetails = switch (_missionType) do {
		case "Pilote": {call fn_spawnOceanMission;};
};	

nul = [] execVM "MF\side\missionRescue.sqf";