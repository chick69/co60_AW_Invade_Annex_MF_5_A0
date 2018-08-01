/*
@filename: initPlayerLocal.sqf
Author:
	
	Quiksilver

Last modified:

	29/10/2014 ArmA 1.32 by Quiksilver
	
Description:

	Client scripts and event handlers.
______________________________________________________*/
enableSentences FALSE;															
enableSaving [FALSE,FALSE];
player enableFatigue FALSE;
player addrating 10000;
//------------------------------------------------ Handle parameters

for [ {_i = 0}, {_i < count(paramsArray)}, {_i = _i + 1} ] do {
	call compile format
	[
		"PARAMS_%1 = %2",
		(configName ((missionConfigFile >> "Params") select _i)),
		(paramsArray select _i)
	];
};

//------------------- client executions

_uid = getPlayerUID player;
_name = str player;
_playername = name player;

//
if( _uid != "_SP_PLAYER_" ) then {
	player globalchat "Bienvenu/Welcome : "+ _playername;
	if ( ( _name in MF_reserved_slots) && !(_uid in MF_UID) ) then {
		player globalchat "Detection...ID : "+_uid ;  
		cutText ['YOU ARE IN RESERVED SLOT\nVOUS ETES DANS UN SLOT RESERVE','BLACK OUT'];
		sleep 3;			
		_txt="Error : Vous êtes dans un slot réservé/You are in reserved slot";
		_task = player createSimpleTask [_txt];
		_task setTaskState "Failed";
		_task setSimpleTaskDescription [_txt,_txt,_txt];
		["epicFail",false,2] call BIS_fnc_endMission;
	}; 
	if ( ( _name in MF_slots) && !(_uid in MF_ALL) ) then {
		player globalchat "Detection...ID : "+_uid ;  
		cutText ['YOU ARE IN RESERVED SLOT\nVOUS ETES DANS UN SLOT RESERVE','BLACK OUT'];
		sleep 3;			
		_txt="Error : Vous êtes dans un slot réservé/You are in reserved slot";
		_task = player createSimpleTask [_txt];
		_task setTaskState "Failed";
		_task setSimpleTaskDescription [_txt,_txt,_txt];
		["epicFail",false,2] call BIS_fnc_endMission;
	}; 
};


_null = [] execVM "scripts\restrictions.sqf"; 									// gear restrictions and safezone
0 = [] execVM "MF\MF_jump.sqf";
_null = [] execVM "MF\mf_pilotCheck.sqf"; 									// pilots/copilots only
call compile preprocessFile "MF\Options\InitOptions.sqf";											// jump action
_null = [] execVM "scripts\misc\diary.sqf";										// diary tabs	
_null = [] execVM "scripts\icons.sqf";											// blufor map tracker Quicksilver
_null = [] execVM "scripts\VAclient.sqf";										// Virtual Arsenal

["InitializePlayer", [player]] call BIS_fnc_dynamicGroups;

if (PARAMS_HeliRope != 0) then {call compile preprocessFileLineNumbers "scripts\vehicle\fastrope\zlt_fastrope.sqf";};	
if (PARAMS_HeliSling != 0) then {call compile preprocessFileLineNumbers "scripts\vehicle\sling\sling_config.sqf";};				// Heli Sling.

[] call QS_fnc_respawnPilot;

0 = execVM "IgiLoad\IgiLoadInit.sqf";

ghst_halo = compile preprocessfilelinenumbers "MF\ghst_halo.sqf";                 //halo jump
Mf_halojump = compile preprocessfilelinenumbers "MF\Mf_halojump.sqf";             //halo jump

//-------------------- PVEHs

"showNotification" addPublicVariableEventHandler
{
	private ["_type", "_message"];
	_array = _this select 1;
	_type = _array select 0;
	_message = "";
	if (count _array > 1) then { _message = _array select 1; };
	[_type, [_message]] call BIS_fnc_showNotification;
};

"GlobalHint" addPublicVariableEventHandler
{
	private ["_GHint"];
	_GHint = _this select 1;
	hint parseText format["%1", _GHint];
};

"hqSideChat" addPublicVariableEventHandler
{
	_message = _this select 1;
	[WEST,"HQ"] sideChat _message;
};

"addToScore" addPublicVariableEventHandler
{
	((_this select 1) select 0) addScore ((_this select 1) select 1);
};

"radioTower" addPublicVariableEventHandler
{
	"radioMarker" setMarkerPosLocal (markerPos "radioMarker");
	"radioMarker" setMarkerTextLocal (markerText "radioMarker");
	"radioCircle" setMarkerPosLocal (markerPos "radioCircle");
};

"sideMarker" addPublicVariableEventHandler
{
	"sideMarker" setMarkerPosLocal (markerPos "sideMarker");
	"sideCircle" setMarkerPosLocal (markerPos "sideCircle");
	"sideMarker" setMarkerTextLocal format["Side Mission: %1",sideMarkerText];
};

"priorityMarker" addPublicVariableEventHandler
{
	"priorityMarker" setMarkerPosLocal (markerPos "priorityMarker");
	"priorityCircle" setMarkerPosLocal (markerPos "priorityCircle");
	"priorityMarker" setMarkerTextLocal format["Priority Target: %1",priorityTargetText];
};

tawvd_disablenone = false;

enableEngineArtillery false;
if (player isKindOf "B_support_Mort_f") then {
	enableEngineArtillery true;
};
_infoArray = squadParams player;    
_infoSquad = _infoArray select 0;
_squad = _infoSquad select 1;
_infoName = _infoArray select 1;
_name = _infoName select 1; 
_email = _infoSquad select 2;

//******************
//** MOD AUTODECT **
//******************
// Are we using MF_Retexture  ????
MFRETEXTURING=isClass (configFile >> "CfgPatches" >> "MF_Retexture");

if (MFRETEXTURING) then
{
	player globalchat "MF_Retexture present - new texture loaded.";  
} else {player globalchat "MF_Retexture not present - standard texture applyed.";};

MF_TextureChoix = "CE";
if (MFRETEXTURING) then
{
	// tentative de retexturation des véhicules
	{
		[_x,MF_TextureChoix] execVM "MF\MF_Retexture.sqf";
	
	} forEach vehicles;
} else {
	{
		[_x] execVM "MF\MF_StandardTexture.sqf";
	} forEach vehicles;
};
waitUntil {time > 1};
enableEnvironment [false, true];	  

