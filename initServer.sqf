MF_reserved_slots = ["user1","user2"]; // List des slots réservés Cadre
publicVariable "MF_reserved_slots";
//
MF_slots = ["MF3","MF4","MF5","MF6","MF7","MF8","MF9","MF10","MF11","MF12","MF13","MF14","MF15","MF16","MF17","MF18","MF19","MF20","MF21"]; // List des slots MF
publicVariable "MF_slots";
//
MF_UID = [
    "76561198030498906", //[MF] Prophet    
    "76561197979807604", //[MF] Chick69   	
	"76561198159701411", //[MF] Yanoukovytsch    
    "76561198040144334", //[MF] Lylian
	"76561197990419224", //[MF] Chester  
	"76561198109182545", //[MF] Dyxon
    "76561198191885015", //[MF] MikeLawrie
	"76561197975268204", //[MF] Shorty
	"76561198020545006" //[MF] Error404
]; // List des users Cadres
publicVariable "MF_UID";
//
MF_ALL = [
    "76561198030498906", //[MF] Prophet    
    "76561197979807604", //[MF] Chick69   	
	"76561198159701411", //[MF] Yanoukovytsch    
    "76561198040144334", //[MF] Lylian
	"76561197990419224", //[MF] Chester  
	"76561198109182545", //[MF] Dyxon
    "76561198191885015", //[MF] MikeLawrie
    "76561198020545006", //[MF] Error404
	"76561197975268204", //[MF] Shorty
	"76561198009835461", //[MF] eZeK
	"76561198074290035", //[MF] Olander
	"76561198152159484", //[MF] Tom Lasky
	"76561198354405606"  // SEBi YAM
]; // List des users autorisés
publicVariable "MF_ALL";
//
MF_TextureChoix = "CE";
publicVariable "MF_TextureChoix";

//------------------------------------------------ Handle parameters

for [ {_i = 0}, {_i < count(paramsArray)}, {_i = _i + 1} ] do {
	call compile format
	[
		"PARAMS_%1 = %2",
		(configName ((missionConfigFile >> "Params") select _i)),
		(paramsArray select _i)
	];
};

//-------------------------------------------------- Server scripts

if (PARAMS_AO == 1) then { _null = [] execVM "mission\main\missionControl.sqf"; };						// Main AO
if (PARAMS_SideObjectives == 1) then { _null = [] execVM "mission\side\missionControl.sqf";};			// Side objectives		
_null = [] execVM "scripts\eos\OpenMe.sqf";																// EOS (urban mission and defend AO)
_null = [] execVM "scripts\misc\cleanup.sqf";															// cleanup
_null = [] execVM "scripts\misc\islandConfig.sqf";														// prep the island for mission
_null = [] execVM "scripts\misc\fn_advancedTowingInit.sqf";	
adminCurators = allCurators;
enableEnvironment FALSE;
BACO_ammoSuppAvail = true; publicVariable "BACO_ammoSuppAvail";

// official groupe manager
["Initialize"] call BIS_fnc_dynamicGroups;  