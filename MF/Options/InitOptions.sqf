

call compile preprocessFile "MF\Options\functions.sqf";


[] spawn {

	waitUntil {!isNull player};
	waitUntil {player == player};
	
	_uid = getPlayerUID player;
	
	player addEventHandler ["Respawn",Options_player_killed];
	player setVariable ["MFFATIGUE","ON"];
	player enableFatigue true;
	player enableStamina true;
	
	if ( _uid in MF_UID ) then {
		_AMf1 = player addAction ["<t color='#99cc33'>Ammo Resupply</t>", "MF\mf_drop.sqf"];
		_AMF2 = player addaction ["<t color='#ffff00'>Ouvrir Virtual Arsenal</t>", { ["Open",true] call BIS_fnc_arsenal; }, [], 1, false, true, "","alive _target"];
	};
	if (isClass (configFile >> "CfgPatches" >> "MF_Retexture")) then { MFretexture = player addAction [("<t color=""#ffff33"">") + ("Refresh Textures") + "</t>", "MF\mf_RefreshTextures.sqf"]; };
	MFFATIGUE = player addAction ["<t color='#99cc33'>Fatigue OFF</t>", "MF\Options\MF_FatigueOff.sqf"];
	VDS = player addAction ["View Distance Settings", CHVD_fnc_openDialog, [], -99, false, true];
		

};