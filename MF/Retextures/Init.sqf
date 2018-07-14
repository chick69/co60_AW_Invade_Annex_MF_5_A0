

call compile preprocessFile "MF\Retextures\functions.sqf";


[] spawn {

	waitUntil {!isNull player};
	waitUntil {player == player};
	player addEventHandler ["Respawn",Retexture_player_killed];
	MFretexture = player addAction ["<t color='#ffff00'>Prout</t>", "MF\mf_RefreshTextures.sqf"];
};