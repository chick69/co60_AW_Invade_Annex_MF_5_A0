/*
V1.3.3 Script by: Ghost put this in an objects init line - ghst_halo = host1 addAction ["Halo", "MF\ghst_halo.sqf", [(true,false),2500], 6, true, true, "","alive _target"];
*/

_host = _this select 0;
_caller = _this select 1;
_id = _this select 2;
_params = _this select 3;
_typehalo = _params select 0;//true for all group, false for player only.
_althalo = _params select 1;//altitude of halo jump
_altchute = _params select 2;//altitude for autochute deployment


if (not alive _host) exitwith {
hint "Halo Not Available"; 
_host removeaction _id;
};

if (vehicle _caller == _caller) then {
//Unit(s) not in aircraft
	private ["_pos"];
	
	_caller groupchat "Left click on the map where you want to insert";

	openMap true;

	mapclick = false;

	onMapSingleClick "clickpos = _pos; mapclick = true; onMapSingleClick """";true;";

	waituntil {mapclick or !(visiblemap)};
	
	if (!visibleMap) exitwith {
		_caller groupchat "Im too scared to jump";
	};
	_pos = clickpos;

	if (_typehalo) then {
	
		_grp1 = group _caller;
		{
			_x setpos [_pos select 0, _pos select 1, _althalo];
			_x spawn bis_fnc_halo;
		} foreach units _grp1;

	} else {
	
		_caller setpos [_pos select 0, _pos select 1, _althalo];
		_caller spawn bis_fnc_halo;

	};

} else {
//Unit(s) in aircraft
	
	if (_typehalo) then {
	
		_grp1 = group _caller;
		
		{
			_x allowdamage false;
			unassignVehicle (_x);
			(_x) action ["EJECT", vehicle _x];
			_x spawn bis_fnc_halo;
			sleep 0.5;
			_x allowdamage true;
		} foreach units _grp1;

	} else {

		_caller allowdamage false;
		unassignVehicle (_caller);
		(_caller) action ["EJECT", vehicle _caller];
		_caller spawn bis_fnc_halo;
		sleep 0.5;
		_caller allowdamage true;

	};
};

if (getpos _caller select 2 > (_altchute + 100)) then {
sleep 1;

[_caller] spawn bis_fnc_halo;

openMap false;

_bis_fnc_halo_action = _caller addaction ["<t color='#ff0000'>Open Chute</t>","A3\functions_f\misc\fn_HALO.sqf",[],1,true,true,"Eject"];

sleep 5;

_caller groupchat "Have a nice trip";// and dont forget to open your chute!";

//auto open before impact
waituntil {(position _caller select 2) <= _altchute};

_caller removeaction _bis_fnc_halo_action;

if ((vehicle _caller) iskindof "ParachuteBase") exitwith {};

_caller groupchat "Deploying Chute";

[_caller] spawn bis_fnc_halo;

waituntil {(position _caller select 2) < 1};

_caller action ["Eject", vehicle _caller];
_caller switchmove "adthppnemstpsraswrfldnon_1";
_caller setvelocity [0,0,0];
_caller allowdamage true;
};
