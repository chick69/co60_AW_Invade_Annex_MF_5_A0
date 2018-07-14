Options_player_killed = {
	_unit = _this select 0;
	_uid = getPlayerUID player;
	
	if ( _uid in MF_UID ) then {
		_AMf1 = _unit addAction ["<t color='#99cc33'>Ammo Resupply</t>", "MF\mf_drop.sqf"];
		_AMF2 = _unit addaction ["<t color='#ffff00'>Ouvrir Virtual Arsenal</t>", { ["Open",true] call BIS_fnc_arsenal; }, [], 1, false, true, "","alive _target"];
	};
	if (isClass (configFile >> "CfgPatches" >> "MF_Retexture")) then { MFretexture = player addAction [("<t color=""#ffff33"">") + ("Refresh Textures") + "</t>", "MF\mf_RefreshTextures.sqf"]; };
	_fatigue = _unit getVariable "MFFATIGUE";
	if ( _fatigue == "ON" ) then {
		player enableFatigue true;
		player enableStamina true;
		MFFATIGUE = _unit addAction ["<t color='#99cc33'>Fatigue OFF</t>", "MF\Options\MF_FatigueOff.sqf"];
	} else {
		player enableFatigue false;
		player enableStamina false;
		MFFATIGUE = _unit addAction ["<t color='#99cc33'>Fatigue ON</t>", "MF\Options\MF_FatigueOn.sqf"];
	};
	VDS = _unit addAction ["View Distance Settings", CHVD_fnc_openDialog, [], -99, false, true];
};

