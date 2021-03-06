/*
@filename: init.sqf
Author:
	
	Quiksilver

Last modified:

	12/05/2014
	
Description:

	Things that may run on both server and client.
	Deprecated initialization file, still using until the below is correctly partitioned between server and client.
______________________________________________________*/


call compile preprocessFile "scripts\=BTC=_revive\=BTC=_revive_init.sqf";		// revive
call compile preprocessFileLineNumbers "SHK_pos\shk_pos_init.sqf";

vts_debug=false;
vts_nettype=1;

// fonctions Communes appelable depuis ZEUS
_script=[] execvm "functions\vtsfunctions.sqf";waitUntil {scriptDone _script};
// -----
//-------------------------------------------------- Headless Client

MHHQ=compile preprocessfilelinenumbers "CHHQ.sqf";

[] execVM "outlw_magRepack\MagRepack_init_sv.sqf";
[] execVM "DEP\init.sqf";
[] execVM "MF\mf_grenadeStop.sqf";
[] execVM "GF_Earplugs\Credits.sqf";	// Please keep the Credits or add them to your Diary
[] execVM "GF_Earplugs\GF_Earplugs.sqf";
[] execVM "MF\mf_hello.sqf";

// Virtual arsenal
FNC_AddVASAction = 

	{
	_this addaction ["<t color='#ff11ff'>Ouvrir Virtual Arsenal</t>", { ["Open",true] call BIS_fnc_arsenal; }, [], 1, false, true, "","alive _target"];
	};

//bUG MAJ ARMA 3 SHAKING
enableCamShake false;

if (isServer) then {
[] execVM "MF\real_weather.sqf";};
