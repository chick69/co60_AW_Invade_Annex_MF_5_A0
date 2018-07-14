//////////////////////////////////////
//----ALiVE NATOFOR Random Tasks----//
//---By Valixx, Kylania & M4RT14L---//
//---------------v1.4---------------//
//////////////////////////////////////

_missionType = [_this, 0, ""] call BIS_fnc_param;

sleep 10;


//-------------------- FIND SAFE POSITION FOR OBJECTIVE

	_flatPos = [0,0,0];
	_accepted = false;
	while {!_accepted} do {
		_position = [] call BIS_fnc_randomPos;
		_flatPos = _position isFlatEmpty [5,0,0.2,sizeOf "Land_TentHangar_V1_F",0,false];

		while {(count _flatPos) < 2} do {
			_position = [] call BIS_fnc_randomPos;
			_flatPos = _position isFlatEmpty [5,0,0.2,sizeOf "Land_TentHangar_V1_F",0,false];
			};

		if ((_flatPos distance (getMarkerPos "respawn_west")) > 1000 && (_flatPos distance (getMarkerPos currentAO)) > 2000) then
		{
			_accepted = true;
		};
	};
	
	_objPos = [_flatPos, 25, 35, 10, 0, 0.5, 0] call BIS_fnc_findSafePos;




//-------------------- FIND SAFE POSITION FOR OBJECTIVE



_markerArray = _objPos;

_mrkSpawnTown = getMarkerPos _markerArray;

sleep 10;

fn_spawnOceanMission = {

	hint "Mise a jour des missions OPS";
	//creating the marker 

	_markerCO = createMarker ["mob_clear", _mrkSpawnTown];
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

	//creating the vehicle
	
	_newPos = [getMarkerPos _markerCO, 50, 100, 10, 2, 20, 1] call BIS_fnc_findSafePos;
	

	_hq = createVehicle ["Submarine_01_F", _newPos, [], 0, "NONE"];

	_pos = getMarkerPos _markerCO;
	_posfinal0 = [_pos, 1, random 360] call BIS_Fnc_relPos;
	_posfinal1 = [_pos, 50, random 360] call BIS_Fnc_relPos;
	_posfinal2 = [_pos, 100, random 360] call BIS_Fnc_relPos;
	_posfinal3 = [_pos, 150, random 360] call BIS_Fnc_relPos;	
	
//---------- INFANTRY PATROLS RANDOM
	_grp1C = createGroup east;
	_grp1C = [getMarkerPos _markerCO, EAST, (configfile >> "CfgGroups" >> "East" >> "OPF_F" >> "SpecOps" >> "OI_diverTeam")] call BIS_fnc_spawnGroup;
	[(units _grp1C)] call QS_fnc_setSkill1;
	
	_wp1 = _grp1C addWaypoint [_posfinal0,-30];
	_wp1 setWaypointType "MOVE";		
	_wp2 = _grp1C addWaypoint [_posfinal1,-30];
	_wp2 setWaypointType "MOVE";	
	_wp3 = _grp1C addWaypoint [_posfinal2,-30];
	_wp3 setWaypointType "MOVE";		
	_wp4 = _grp1C addWaypoint [_posfinal3,-30];
	_wp4 setWaypointType "MOVE";
	_wp5 = _grp1C addWaypoint [_posfinal0,-30];
	_wp5 setWaypointType "CYCLE";	



	_grp2C = createGroup east;
	_grp2C = [getMarkerPos _markerCO, EAST, (configfile >> "CfgGroups" >> "East" >> "OPF_F" >> "SpecOps" >> "OI_diverTeam")] call BIS_fnc_spawnGroup;
	[(units _grp2C)] call QS_fnc_setSkill1;
	
	_wp1 = _grp2C addWaypoint [_posfinal0,-30];
	_wp1 setWaypointType "MOVE";		
	_wp2 = _grp2C addWaypoint [_posfinal1,-30];
	_wp2 setWaypointType "MOVE";	
	_wp3 = _grp2C addWaypoint [_posfinal2,-30];
	_wp3 setWaypointType "MOVE";		
	_wp4 = _grp2C addWaypoint [_posfinal2,-30];
	_wp4 setWaypointType "MOVE";
	_wp5 = _grp2C addWaypoint [_posfinal0,-30];
	_wp5 setWaypointType "CYCLE";	

	
	{
		_x addCuratorEditableObjects [[_hq], false];
		_x addCuratorEditableObjects [[_mine1], false];
		_x addCuratorEditableObjects [[_mine2], false];
		_x addCuratorEditableObjects [units _grp1C, false];
		_x addCuratorEditableObjects [units _grp2C, false];
		_x addCuratorEditableObjects [units _grp3C, false];
	} foreach adminCurators;	


	
	//trigger
	_trg = createTrigger ["EmptyDetector", getMarkerPos _markerCO]; 
	_trg setTriggerArea [150, 150, 0, false]; 
	_trg setTriggerActivation ["EAST", "NOT PRESENT", false]; 
	_trg setTriggerStatements ["this", "", ""]; 
	
	enemyDead = false; 
	waitUntil {triggerActivated _trg}; 

	_null = ["mob_clear", "SUCCEEDED"] spawn BIS_fnc_taskSetState;
	
	sleep 10;

	deleteMarker _markerCO;
	
	{deleteVehicle _x} forEach units grp1C;
	{deleteVehicle _x} forEach units grp2C;
	{deleteVehicle _x} forEach units grp3C;
	{deleteVehicle _x} forEach units ifv1;
	deleteGroup ifv1;
	deleteGroup _grp1C;
	deleteGroup _grp2C;
	deleteGroup _grp3C;
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