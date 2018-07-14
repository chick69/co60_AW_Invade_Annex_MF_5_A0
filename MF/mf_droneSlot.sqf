

_drone = ["B_recon_JTAC_F","B_CTRG_soldier_engineer_exp_F","B_Pilot_F","B_recon_medic_F","B_recon_F","B_recon_TL_F","B_recon_LAT_F","B_recon_M_F","B_recon_LAT_F","B_recon_exp_F","B_soldier_UAV_F"];


[] spawn {

	waitUntil {!isNull player};
	waitUntil {player == player};
	if (typeof player == "B_recon_JTAC_F") then 
	{
		player addEventHandler ["Respawn",LoadOut_player_killed];
		MFLoadOutAction = player addAction ["<t color='#99cc33'>Drone", "MF\mf_drone.sqf"];
		hint "POMPE STARTED";
	}
};