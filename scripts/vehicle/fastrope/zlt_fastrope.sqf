#define MAX_SPEED_WHILE_FASTROPING 10
#define MAX_SPEED_ROPES_AVAIL 30
#define MAX_ALT_ROPES_AVAIL 200

#define STR_TOSS_ROPES "Toss Ropes"
#define STR_FAST_ROPE "Fast Rope"
#define STR_CUT_ROPES "Cut Ropes"


if (isdedicated) exitwith {};
waituntil {player == player};

zlt_rope_ropes = [];
zlt_mutexAction = false;

zlt_rope_helis = ["B_T_VTOL_01_infantry_F","I_Heli_light_03_F","O_Heli_Light_02_unarmed_F", "O_Heli_Light_02_F", "B_Heli_Transport_01_F", "B_Heli_Transport_01_camo_F", "RHS_UH60M", "RHS_UH60M_d", "CAF_CH146_F_D", "CAF_CH146_SF", "B_Heli_Transport_03_F", "B_Heli_Transport_03_unarmed_F", "CFB_Helo_Chinook", "I_Heli_light_03_unarmed_F", "CFB_Helo_Griffon_Unarmed", "O_Heli_Attack_02_F", "O_Heli_Attack_02_black_F", "I_Heli_Transport_02_F", "B_Heli_Light_01_F","ST1_UH_80_MED_FG"];
zlt_rope_helidata =
[
[
["O_Heli_Light_02_unarmed_F", "O_Heli_Light_02_F"],
[1.35,1.35,0],[-1.45,1.35,0]
],
[
["B_Heli_Transport_01_F", "B_Heli_Transport_01_camo_F", "RHS_UH60M", "RHS_UH60M_d", "CAF_CH146_F_D", "CAF_CH146_SF","ST1_UH_80_MED_FG	"],
[-1.11,2.5,0],[1.13,2.5,0]
],
[
["B_Heli_Transport_03_F", "B_Heli_Transport_03_unarmed_F", "CFB_Helo_Chinook"],
[-1.11,-3.5,0],[1.08,-3.5,0]
],
[
["I_Heli_light_03_unarmed_F", "CFB_Helo_Griffon_Unarmed"],
[0.7,2.5,0],[-0.9,2.5,0]
],
[
["O_Heli_Attack_02_F", "O_Heli_Attack_02_black_F"],
[1.3,1.3,0],[-1.3,1.3,0]
],
[
["I_Heli_Transport_02_F"],
[0,-5,0]
],
[
["B_T_VTOL_01_infantry_F"],
[0,-6,-5]
],
[
["I_Heli_light_03_F"],
[0.95,3,-0.9],[-0.95,3,-0.9]
],
[
["B_Heli_Light_01_F"],
[1.1,0.5,0],[-1.1,0.5,0]
]
];


zlt_fnc_tossropes = {
private ["_heli","_ropes","_oropes","_rope"];
_heli = _this;
_ropes = [];
_oropes = _heli getvariable ["zlt_ropes",[]];
if (count _oropes != 0 ) exitWith {};
    random 0.3;
{
if ((typeof _heli) in (_x select 0)) exitwith {
_ropes pushBack (_x select 1);
if ( count (_x select 2) !=0 ) then {
_ropes pushBack (_x select 2);
	};
};
} foreach zlt_rope_helidata;

sleep random 0.3;
if ( count (_heli getvariable ["zlt_ropes",[]]) != 0 ) exitwith { zlt_mutexAction = false; };
_heli animateDoor ['door_R', 1];
_heli animateDoor ['door_L', 1];
{
_rope = ropeCreate [vehicle player, _x, (getPosATL player select 2) + 3];
_oropes pushBack _rope;
} foreach _ropes;

_heli setvariable ["zlt_ropes",_oropes,true];

        _heli spawn {
        private ["_heli","_ropes"];
        _heli = _this;
        while {alive _heli AND count (_heli getVariable ["zlt_ropes", []]) != 0 AND (abs (speed _heli) < MAX_SPEED_ROPES_AVAIL) AND ((getposATL _heli select 2) <= MAX_ALT_ROPES_AVAIL ) } do {
            sleep 1;
        };
        _ropes = (_heli getVariable ["zlt_ropes", []]);
        {ropeDestroy _x} forEach _ropes;
        _heli setVariable ["zlt_ropes", [], true];
};

};

zlt_fnc_ropes_cond = {
_veh = vehicle player;
_flag = (_veh != player) and {(not zlt_mutexAction)} and {count (_veh getvariable ["zlt_ropes", []]) == 0} and { (typeof _veh) in zlt_rope_helis } and {alive player and alive _veh and (abs (speed _veh) < MAX_SPEED_ROPES_AVAIL ) and ((getposATL _veh select 2) <= MAX_ALT_ROPES_AVAIL ) };
_flag;

};

zlt_fnc_fastropeaiunits = {
private ["_heli","_grunits"];
diag_log ["zlt_fnc_fastropeaiunits", _this];
_heli = _this select 0;
_grunits = _this select 1;

dostop (driver _heli );
(driver _heli) setBehaviour "Careless";
(driver _heli) setCombatMode "Blue";

_heli spawn zlt_fnc_tossropes;

[_heli, _grunits] spawn {
private ["_units","_heli"];
sleep random 0.5;
_units = _this select 1;
_heli = _this select 0;
_units = _units - [player];
_units = _units - [driver _heli];
{if (!alive _x or isplayer _x or vehicle _x != _heli) then {_units = _units - [_x];}; } foreach _units;

{ sleep (0.5 + random 0.7); _x spawn zlt_fnc_fastropeUnit; } foreach _units;
waituntil {sleep 0.5; { (getpos _x select 2) < 1 } count _units == count _units; };
sleep 10;
(driver _heli) doFollow (leader group (driver _heli ));
(driver _heli) setBehaviour "Aware";
(driver _heli) setCombatMode "White";
_heli call zlt_fnc_cutropes;

};
};


zlt_fnc_fastrope = {
diag_log ["fastrope", _this];
zlt_mutexAction = true;
sleep random 0.3;
if (player == leader group player) then {
[vehicle player, units group player] call zlt_fnc_fastropeaiunits;
};
player call zlt_fnc_fastropeUnit;
zlt_mutexAction = false;
};

zlt_fnc_fastropeUnit = {
    _unit = _this;
    _veh = vehicle _unit;
    _ropes = (_veh getVariable ["zlt_ropes", []]);
    if (count _ropes == 0) exitWith {};
    _ropeSel = _ropes call BIS_fnc_selectRandom;
    _unit action ["Eject",_veh];
    sleep 0.5;
    _unit leaveVehicle _veh;
    moveOut _unit;
    _unit allowDamage false;
    _ropePos = (ropeEndPosition _ropeSel) select 0;
    _unit setPosATL [(_ropePos select 0),(_ropePos select 1),(_ropePos select 2) -0.5];
    _unit switchMove "LadderRifleStatic";
    While {Alive _unit && (((getPos _unit) select 2) > 1)} do
    {
        _unit switchMove "LadderRifleStatic";
    };
    _unit setVelocity [0,0,0];
    _unit playMove "LadderRifleDownOff";
    _unit allowDamage true;
};


zlt_fnc_cutropes = {
_veh = _this;
_ropes = (_veh getvariable ["zlt_ropes", []]);
{ropeDestroy _x} foreach _ropes;
_veh setvariable ["zlt_ropes", [], true];
_veh animateDoor ['door_R', 0];
_veh animateDoor ['door_L', 0];

};

zlt_fnc_removeropes = {
(vehicle player) call zlt_fnc_cutropes;
};

zlt_fnc_createropes = {
zlt_mutexAction = true;
(vehicle player) call zlt_fnc_tossropes;
zlt_mutexAction = false;
};


player createDiarySubject [STR_SCRIPTS_NAME,STR_SCRIPTS_NAME];
player createDiaryRecord [STR_SCRIPTS_NAME,[STR_SCRIPT_NAME, STR_HELP]];

player addAction["<t color='#ffff00'>"+STR_TOSS_ROPES+"</t>", zlt_fnc_createropes, [], -1, false, false, '','[] call zlt_fnc_ropes_cond'];
player addAction["<t color='#ff0000'>"+STR_CUT_ROPES+"</t>", zlt_fnc_removeropes, [], -1, false, false, '','not zlt_mutexAction and count ((vehicle player) getvariable ["zlt_ropes", []]) != 0'];
player addAction["<t color='#00ff00'>"+STR_FAST_ROPE+"</t>", zlt_fnc_fastrope, [], 15, false, false, '','not zlt_mutexAction and count ((vehicle player) getvariable ["zlt_ropes", []]) != 0 and player != driver vehicle player'];

player addEventHandler ["Respawn", {
player addAction["<t color='#ffff00'>"+STR_TOSS_ROPES+"</t>", zlt_fnc_createropes, [], -1, false, false, '','[] call zlt_fnc_ropes_cond'];
player addAction["<t color='#ff0000'>"+STR_CUT_ROPES+"</t>", zlt_fnc_removeropes, [], -1, false, false, '','not zlt_mutexAction and count ((vehicle player) getvariable ["zlt_ropes", []]) != 0'];
player addAction["<t color='#00ff00'>"+STR_FAST_ROPE+"</t>", zlt_fnc_fastrope, [], 15, false, false, '','not zlt_mutexAction and count ((vehicle player) getvariable ["zlt_ropes", []]) != 0 and player != driver vehicle player'];
}];