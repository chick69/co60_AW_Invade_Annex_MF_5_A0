/*
@filename: onPlayerRespawn.sqf
Author:
	
	Quiksilver

Last modified:

	29/10/2014 ArmA 1.32 by Quiksilver
	
Description:

	Client scripts that should execute after respawn.
______________________________________________________*/

private ["_iampilot"];

//=========================== Fatigue setting

//if (PARAMS_Fatigue == 0) then {player enableFatigue FALSE;};

//=========================== PILOTS ONLY

_pilots = ["B_pilot_F","B_helipilot_F","B_recon_JTAC_F"];
_iampilot = ({typeOf player == _x} count _pilots) > 0;
if (_iampilot) then {
	//===== FAST ROPE
//	if (PARAMS_HeliRope != 0) then {
//		player addAction ["Toss Ropes",zlt_fnc_createropes, [], -1, false, false, '','[] call zlt_fnc_ropes_cond'];
//		player addAction ["Cut Ropes",zlt_fnc_removeropes, [], 98, false, false, '','not zlt_mutexAction and count ((vehicle player) getvariable ["zlt_ropes", []]) != 0'];
//	};
	//===== HELI SUPPLY DROP
	if (PARAMS_HeliDrop != 0) then {
		player addAction ["Drop supply crate",QS_fnc_airDrop,[],0,false,true,'','[] call QS_fnc_conditionAirDrop'];
	};
	//===== UH-80 TURRETS
	if (PARAMS_UH80TurretControl != 0) then {
		inturretloop = false;
		UH80TurretAction = player addAction ["Turret Control",QS_fnc_uh80TurretControl,[],-95,false,false,'','[] call QS_fnc_conditionUH80TurretControl'];
	};
};


//============================= non-pilots units fastrope

//if (PARAMS_HeliRope != 0) then {
//	player addAction ["Fast Rope (Press Space)", zlt_fnc_fastrope, [], 99, false, false, '','not zlt_mutexAction and count ((vehicle player) getvariable ["zlt_ropes", []]) != 0 and player != driver vehicle player'];
//};


//====================== Seating and Clear vehicle inventory stuff

saving_inventory = FALSE;
inventory_cleared = FALSE;
player setVariable ["seated",FALSE];
player allowSprint true;
player setCustomAimCoef 0.6;
player setUnitRecoilCoefficient 0.6;

player addAction ["Clear vehicle inventory",QS_fnc_actionClearInventory,[],-97,FALSE,FALSE,'','[] call QS_fnc_conditionClearInventory'];

//======================= Add players to Zeus

{_x addCuratorEditableObjects [[player],FALSE];} count allCurators;


// official groupe manager
["InitializePlayer", [player]] call BIS_fnc_dynamicGroups; 