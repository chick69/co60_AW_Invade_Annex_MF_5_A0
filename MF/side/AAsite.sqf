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
	_flatPos2 = [(_flatPos select 0) + 2, (_flatPos select 1) + 2, (_flatPos select 2)];
	_flatPos3 = [(_flatPos select 0) + 20, (_flatPos select 1) + random 20, (_flatPos select 2)];

	_markerpop = createMarker ["mob_clear", _flatPos1];
	_markerpop setMarkerType "Empty";
	_markerpop setMarkerColor "ColorRed";
	_markerpop setMarkerText "pop side";
	_markerpop setMarkerShape "ELLIPSE";		
	_markerpop setMarkerBrush "Solid";	
	_markerpop setMarkerSize [400,400];
	
	
fn_spawnOceanMission = {
	


//-------------------- FIND SAFE POSITION FOR OBJECTIVE


	
	_null = [west, "mob_clear", ["AA Site1", "AA Site2", "AA Site3"], getMarkerPos "mob_clear", false] spawn BIS_fnc_taskCreate;
	_null = ["mob_clear", "CREATED"] spawn BIS_fnc_taskSetState;



//-------------------- BRIEFING
	
		_briefing = "<t align='center'><t size='2.2'>Nouvelle mission secondaire</t><br/><t size='1.5' color='#00B2EE'>Neutralize le site Anti Aerien</t><br/>____________________<br/>Les CSAT on deployer un groupe militaire specializer dans l'anti aerien.<br/><br/>Neutralize tous les blinde anti aerien sur la zone.</t>";
	GlobalHint = _briefing; publicVariable "GlobalHint"; hint parseText GlobalHint;
	
	
sleep 10;

	
//-------------------- 2. SPAWN OBJECTIVES

	_PTdir = random 360;
	
	sleep 1;
	
	priorityObj1 = "O_APC_Tracked_02_AA_F" createVehicle _flatPos1;
	waitUntil {!isNull priorityObj1};
	priorityObj1 setDir _PTdir;
	
	sleep 1;
	
	priorityObj2 = "O_APC_Tracked_02_AA_F" createVehicle _flatPos2;
	waitUntil {!isNull priorityObj2};
	priorityObj2 setDir _PTdir;
	
	sleep 1;
	
	//----- SPAWN AMMO TRUCK (for ambiance and plausibiliy of unlimited ammo)
	
	ammoTruck = "O_Truck_03_ammo_F" createVehicle _flatPos3;
	waitUntil {!isNull ammoTruck};
	ammoTruck setDir random 360;
	
	{_x lock 3;_x allowCrewInImmobile true;} forEach [priorityObj1,priorityObj2,ammoTruck];
	
//-------------------- 3. SPAWN CREW
	
	_unitsArray = [objNull]; 			// for crew and h-barriers
	
	_priorityGroup = createGroup east;
	
		"O_officer_F" createUnit [_flatPos, _priorityGroup];
		"O_officer_F" createUnit [_flatPos, _priorityGroup];
		"O_engineer_F" createUnit [_flatPos, _priorityGroup];
		"O_engineer_F" createUnit [_flatPos, _priorityGroup];
		
		((units _priorityGroup) select 0) assignAsCommander priorityObj1;
		((units _priorityGroup) select 0) moveInCommander priorityObj1;
		((units _priorityGroup) select 1) assignAsCommander priorityObj2;
		((units _priorityGroup) select 1) moveInCommander priorityObj2;
		((units _priorityGroup) select 2) assignAsGunner priorityObj1;
		((units _priorityGroup) select 2) moveInGunner priorityObj1;
		((units _priorityGroup) select 3) assignAsGunner priorityObj2;
		((units _priorityGroup) select 3) moveInGunner priorityObj2;
	
	_unitsArray = _unitsArray + [_priorityGroup];

	{
		_x addCuratorEditableObjects [[priorityObj1, priorityObj2, ammoTruck] + (units _priorityGroup), false];
	} foreach adminCurators;

	
	//---------- Engines on baby
	
	sleep 0.1;
	priorityObj1 engineOn true;
	sleep 0.1;
	priorityObj2 engineOn true;
	priorityObj1 doWatch _basepos;
	priorityObj2 doWatch _basepos;
	
	//----- 6a. UNLIMITED AMMO

	priorityObj1 addEventHandler ["Fired",{ priorityObj1 setVehicleAmmo 1 }];
	priorityObj2 addEventHandler ["Fired",{ priorityObj2 setVehicleAmmo 1 }];	


	//---------- OBJ 1
	
		priorityObj1 setVariable ["selections", []];
		priorityObj1 setVariable ["gethit", []];
		priorityObj1 addEventHandler
		[
			"HandleDamage",
			{
				_unit = _this select 0;
				_selections = _unit getVariable ["selections", []];
				_gethit = _unit getVariable ["gethit", []];
				_selection = _this select 1;
				if !(_selection in _selections) then
				{
					_selections set [count _selections, _selection];
					_gethit set [count _gethit, 0];
				};
				_i = _selections find _selection;
				_olddamage = _gethit select _i;
				_damage = _olddamage + ((_this select 2) - _olddamage) * 0.25;
				_gethit set [_i, _damage];
				_damage;
			}
		];
	
	//---------- OBJ 2
	
		priorityObj2 setVariable ["selections", []];
		priorityObj2 setVariable ["gethit", []];
		priorityObj2 addEventHandler
		[
			"HandleDamage",
			{
				_unit = _this select 0;
				_selections = _unit getVariable ["selections", []];
				_gethit = _unit getVariable ["gethit", []];
				_selection = _this select 1;
				if !(_selection in _selections) then
				{
					_selections set [count _selections, _selection];
					_gethit set [count _gethit, 0];
				};
				_i = _selections find _selection;
				_olddamage = _gethit select _i;
				_damage = _olddamage + ((_this select 2) - _olddamage) * 0.25;
				_gethit set [_i, _damage];
				_damage;
			}
		];

	
	
//-------------------- 5. SPAWN FORCE PROTECTION

	_enemiesArray = [priorityObj1] call QS_fnc_PTenemyEAST;

//-------------------- 
	
	
	//trigger
	_trg = createTrigger ["EmptyDetector", _flatPos1]; 
	_trg setTriggerArea [150, 150, 0, false]; 
	_trg setTriggerActivation ["EAST", "NOT PRESENT", false]; 
	_trg setTriggerStatements ["this", "", ""]; 
	
	enemyDead = false; 
	waitUntil {triggerActivated _trg}; 

	_null = ["mob_clear", "SUCCEEDED"] spawn BIS_fnc_taskSetState;
	
	sleep 10;


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

nul = [] execVM "MF\side\AAsite.sqf";