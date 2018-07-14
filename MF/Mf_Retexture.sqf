private ["_u","_t","_m"];

_u = _this select 0;
_m = _this select 1;
_t = typeOf _u;

if (isNull _u) exitWith {};

//player globalchat "Texture "+_m;  
waitUntil {player == player};

if (_m=="CE") then {
	// Camo CE
	if(_u isKindOf "B_MRAP_01_F") then {
		_u setObjectTexture [0,"\MF_Retexture\datas\CE\hunter\mrap_01_base_co.paa"]; 
		_u setObjectTexture [1,"\MF_Retexture\datas\CE\hunter\mrap_01_adds_co.paa"]; 
	};
	if(_u isKindOf "B_MRAP_01_gmg_F") then {
		_u setObjectTexture [0,"\MF_Retexture\datas\CE\hunter\mrap_01_base_co.paa"]; 
		_u setObjectTexture [1,"\MF_Retexture\datas\CE\hunter\mrap_01_adds_co.paa"]; 
		_u setObjectTexture [2,"\MF_Retexture\datas\CE\turret\GMG\turret_co.paa"]; 
	};
	if(_u isKindOf "B_MRAP_01_hmg_F") then {
		_u setObjectTexture [0,"\MF_Retexture\datas\CE\hunter\mrap_01_base_co.paa"]; 
		_u setObjectTexture [1,"\MF_Retexture\datas\CE\hunter\mrap_01_adds_co.paa"]; 
		_u setObjectTexture [2,"\MF_Retexture\datas\CE\turret\HMG\turret_co.paa"]; 
	};
	if(_u isKindOf "B_Plane_CAS_01_F") then {
		_u setObjectTexture [0,"\MF_Retexture\datas\CE\A10\plane_cas_01_ext01_co.paa"]; 
		_u setObjectTexture [1,"\MF_Retexture\datas\CE\A10\plane_cas_01_ext02_co.paa"]; 
	};
	if(_u isKindOf "O_Plane_CAS_02_F") then {
		_u setObjectTexture [0,"\MF_Retexture\datas\CE\neophron\fighter02_ext01_co.paa"]; 
		_u setObjectTexture [1,"\MF_Retexture\datas\CE\neophron\fighter02_ext02_co.paa"]; 
	};
	if(_u isKindOf "I_MRAP_03_F") then {
		_u setObjectTexture [0,"\MF_Retexture\datas\CE\strider\mrap_03_ext_indp_co.paa"]; 
		_u setObjectTexture [1,"\MF_Retexture\datas\CE\strider\turret_indp_co.paa"]; 
	};
	if(_u isKindOf "I_MRAP_03_gmg_F") then {
		_u setObjectTexture [0,"\MF_Retexture\datas\CE\strider\mrap_03_ext_indp_co.paa"]; 
		_u setObjectTexture [1,"\MF_Retexture\datas\CE\turret\GMG\turret_co.paa"]; 
	};
	if(_u isKindOf "I_MRAP_03_hmg_F") then {
		_u setObjectTexture [0,"\MF_Retexture\datas\CE\strider\mrap_03_ext_indp_co.paa"]; 
		_u setObjectTexture [1,"\MF_Retexture\datas\CE\turret\HMG\turret_co.paa"]; 
	};
	if(_u isKindOf "B_Heli_Attack_01_F") then {
		_u setObjectTexture [0,"\MF_Retexture\datas\CE\blackfoot\heli_attack_01_co.paa"]; 
	};
	if(_u isKindOf "I_Heli_light_03_F") then {
		_u setObjectTexture [0,"\MF_Retexture\datas\CE\Hellcat\heli_light_03_base_indp_co.paa"]; 
	};
	if(_u isKindOf "B_Heli_Transport_01_F") then {
		_u setObjectTexture [0,"\MF_Retexture\datas\CE\GhostHawk\heli_transport_01_ext01_blufor_co.paa"]; 
		_u setObjectTexture [1,"\MF_Retexture\datas\CE\GhostHawk\heli_transport_01_ext02_blufor_co.paa"]; 
	};
	if(_u isKindOf "I_Heli_Transport_02_F") then {
		_u setObjectTexture [0,"\MF_Retexture\datas\CE\MoHawk\heli_transport_02_1_indp_co.paa"]; 
		_u setObjectTexture [1,"\MF_Retexture\datas\CE\MoHawk\heli_transport_02_2_indp_co.paa"]; 
		_u setObjectTexture [2,"\MF_Retexture\datas\CE\MoHawk\heli_transport_02_3_indp_co.paa"]; 
	};
	if(_u isKindOf "B_Heli_Light_01_armed_F") then {
		_u setObjectTexture [0,"\MF_Retexture\datas\CE\Pawnee\heli_light_01_ext_blufor_co.paa"]; 
	};
	if(_u isKindOf "B_Heli_Light_01_F") then {
		_u setObjectTexture [0,"\MF_Retexture\datas\CE\Pawnee\heli_light_01_ext_blufor_co.paa"]; 
	};
	if(_u isKindOf "B_Heli_Transport_03_F") then {
		_u setObjectTexture [0,"\MF_Retexture\datas\CE\huron\heli_transport_03_ext01_black_co.paa"]; 
		_u setObjectTexture [1,"\MF_Retexture\datas\CE\huron\heli_transport_03_ext02_black_co.paa"]; 
	};
	if(_u isKindOf "B_MBT_01_arty_F") then {
		_u setObjectTexture [0,"\MF_Retexture\datas\CE\Scorcher\mbt_01_body_co.paa"]; 
		_u setObjectTexture [1,"\MF_Retexture\datas\CE\Scorcher\mbt_01_scorcher_co.paa"]; 
		_u setObjectTexture [2,"\MF_Retexture\datas\CE\turret\HMG\turret_co.paa"]; 
	};
	if(_u isKindOf "B_G_Offroad_01_armed_F") then {
		_u setObjectTexture [0,"\MF_Retexture\datas\CE\OffroadArmed\offroad_01_ext_co.paa"]; 
		_u setObjectTexture [1,"\MF_Retexture\datas\CE\OffroadArmed\offroad_01_ext_co.paa"]; 
	};
	if(_u isKindOf "B_G_Van_01_transport_F") then {
		_u setObjectTexture [0,"\MF_Retexture\datas\CE\Portoss\van_01_ext_ig_co.paa"]; 
		_u setObjectTexture [1,"\MF_Retexture\datas\CE\Portoss\van_01_adds_ig_co.paa"]; 
	};
	if(_u isKindOf "B_APC_Wheeled_01_cannon_F") then {
		_u setObjectTexture [0,"\MF_Retexture\datas\CE\Marchall\apc_wheeled_01_base_co.paa"]; 
		_u setObjectTexture [1,"\MF_Retexture\datas\CE\Marchall\apc_wheeled_01_adds_co.paa"]; 
		_u setObjectTexture [2,"\MF_Retexture\datas\CE\Marchall\apc_wheeled_01_tows_co.paa"]; 
	};
	if(_u isKindOf "B_APC_Tracked_01_AA_F") then {
		_u setObjectTexture [0,"\MF_Retexture\datas\CE\Mora\apc_tracked_01_aa_body_co.paa"]; 
		_u setObjectTexture [1,"\MF_Retexture\datas\CE\Mora\mbt_01_body_co.paa"]; 
		_u setObjectTexture [2,"\MF_Retexture\datas\CE\Mora\apc_tracked_01_aa_tower_co.paa"]; 
	};
	if(_u isKindOf "B_MBT_01_TUSK_F") then {
		_u setObjectTexture [0,"\MF_Retexture\datas\CE\Slammer\mbt_01_body_co.paa"]; 
		_u setObjectTexture [1,"\MF_Retexture\datas\CE\Slammer\mbt_01_tow_co.paa"]; 
		_u setObjectTexture [2,"\MF_Retexture\datas\CE\Slammer\mbt_addons_co.paa"]; 
	};
	if(_u isKindOf "B_G_Offroad_01_F") then {
		_u setObjectTexture [0,"\MF_Retexture\datas\CE\OffroadArmed\offroad_01_ext_co.paa"]; 
		_u setObjectTexture [1,"\MF_Retexture\datas\CE\OffroadArmed\offroad_01_ext_co.paa"]; 
	};
	if(_u isKindOf "B_G_Quadbike_01_F") then {
		_u setObjectTexture [0,"\MF_Retexture\datas\CE\Quad\quadbike_01_ig_co.paa"]; 
	};
	if(_u isKindOf "B_APC_Tracked_01_rcws_F") then {
		_u setObjectTexture [0,"\MF_Retexture\datas\CE\Panther\apc_tracked_01_body_crv_co.paa"]; 
		_u setObjectTexture [1,"\MF_Retexture\datas\CE\Mora\mbt_01_body_co.paa"]; 
		_u setObjectTexture [2,"\MF_Retexture\datas\CE\turret\HMG\turret_co.paa"]; 
	};
	if(_u isKindOf "B_APC_Tracked_01_CRV_F") then {
		_u setObjectTexture [0,"\MF_Retexture\datas\CE\Panther\apc_tracked_01_body_crv_co.paa"]; 
		_u setObjectTexture [1,"\MF_Retexture\datas\CE\Mora\mbt_01_body_co.paa"]; 
		_u setObjectTexture [2,"\MF_Retexture\datas\CE\turret\HMG\turret_co.paa"]; 
		_u setObjectTexture [3,"\MF_Retexture\datas\CE\BOBCAT\apc_tracked_01_crv_co.paa"]; 
	};
	if(_u isKindOf "B_Boat_Armed_01_minigun_F") then {
		_u setObjectTexture [0,"\MF_Retexture\datas\CE\BoatArmed\boat_armed_01_ext_co.paa"]; 
		_u setObjectTexture [1,"\MF_Retexture\datas\CE\BoatArmed\boat_armed_01_int_co.paa"]; 
		_u setObjectTexture [2,"\MF_Retexture\datas\CE\BoatArmed\boat_armed_01_crows_blufor_co.paa"]; 
	};
	
};
if (_m=="DAGUET") then {
	// Camo DAGUET
	if(_u isKindOf "B_MRAP_01_F") then {
		_u setObjectTexture [0,"\MF_Retexture\datas\DAGUET\hunter\mrap_01_base_co.paa"]; 
		_u setObjectTexture [1,"\MF_Retexture\datas\DAGUET\hunter\mrap_01_adds_co.paa"]; 
	};
	if(_u isKindOf "B_MRAP_01_gmg_F") then {
		_u setObjectTexture [0,"\MF_Retexture\datas\DAGUET\hunter\mrap_01_base_co.paa"]; 
		_u setObjectTexture [1,"\MF_Retexture\datas\DAGUET\hunter\mrap_01_adds_co.paa"]; 
		_u setObjectTexture [2,"\MF_Retexture\datas\DAGUET\turret\GMG\turret_co.paa"]; 
	};
	if(_u isKindOf "B_MRAP_01_hmg_F") then {
		_u setObjectTexture [0,"\MF_Retexture\datas\DAGUET\hunter\mrap_01_base_co.paa"]; 
		_u setObjectTexture [1,"\MF_Retexture\datas\DAGUET\hunter\mrap_01_adds_co.paa"]; 
		_u setObjectTexture [2,"\MF_Retexture\datas\DAGUET\turret\HMG\turret_co.paa"]; 
	};
	if(_u isKindOf "B_Plane_CAS_01_F") then {
		_u setObjectTexture [0,"\MF_Retexture\datas\DAGUET\A10\plane_cas_01_ext01_co.paa"]; 
		_u setObjectTexture [1,"\MF_Retexture\datas\DAGUET\A10\plane_cas_01_ext02_co.paa"]; 
	};
	if(_u isKindOf "O_Plane_CAS_02_F") then {
		_u setObjectTexture [0,"\MF_Retexture\datas\DAGUET\neophron\fighter02_ext01_co.paa"]; 
		_u setObjectTexture [1,"\MF_Retexture\datas\DAGUET\neophron\fighter02_ext02_co.paa"]; 
	};
	if(_u isKindOf "I_MRAP_03_F") then {
		_u setObjectTexture [0,"\MF_Retexture\datas\DAGUET\strider\mrap_03_ext_indp_co.paa"]; 
		_u setObjectTexture [1,"\MF_Retexture\datas\DAGUET\strider\turret_indp_co.paa"]; 
	};
	if(_u isKindOf "I_MRAP_03_gmg_F") then {
		_u setObjectTexture [0,"\MF_Retexture\datas\DAGUET\strider\mrap_03_ext_indp_co.paa"]; 
		_u setObjectTexture [1,"\MF_Retexture\datas\DAGUET\turret\GMG\turret_co.paa"]; 
	};
	if(_u isKindOf "I_MRAP_03_hmg_F") then {
		_u setObjectTexture [0,"\MF_Retexture\datas\DAGUET\strider\mrap_03_ext_indp_co.paa"]; 
		_u setObjectTexture [1,"\MF_Retexture\datas\DAGUET\turret\HMG\turret_co.paa"]; 
	};
	if(_u isKindOf "B_Heli_Attack_01_F") then {
		_u setObjectTexture [0,"\MF_Retexture\datas\DAGUET\blackfoot\heli_attack_01_co.paa"]; 
	};
	if(_u isKindOf "I_Heli_light_03_F") then {
		_u setObjectTexture [0,"\MF_Retexture\datas\DAGUET\Hellcat\heli_light_03_base_indp_co.paa"]; 
	};
	if(_u isKindOf "B_Heli_Transport_01_F") then {
		_u setObjectTexture [0,"\MF_Retexture\datas\DAGUET\GhostHawk\heli_transport_01_ext01_blufor_co.paa"]; 
		_u setObjectTexture [1,"\MF_Retexture\datas\DAGUET\GhostHawk\heli_transport_01_ext02_blufor_co.paa"]; 
	};
	if(_u isKindOf "I_Heli_Transport_02_F") then {
		_u setObjectTexture [0,"\MF_Retexture\datas\DAGUET\MoHawk\heli_transport_02_1_indp_co.paa"]; 
		_u setObjectTexture [1,"\MF_Retexture\datas\DAGUET\MoHawk\heli_transport_02_2_indp_co.paa"]; 
		_u setObjectTexture [2,"\MF_Retexture\datas\DAGUET\MoHawk\heli_transport_02_3_indp_co.paa"]; 
	};
	if(_u isKindOf "B_Heli_Light_01_armed_F") then {
		_u setObjectTexture [0,"\MF_Retexture\datas\DAGUET\Pawnee\heli_light_01_ext_blufor_co.paa"]; 
	};
	if(_u isKindOf "B_Heli_Light_01_F") then {
		_u setObjectTexture [0,"\MF_Retexture\datas\DAGUET\Pawnee\heli_light_01_ext_blufor_co.paa"]; 
	};
	if(_u isKindOf "B_Heli_Transport_03_F") then {
		_u setObjectTexture [0,"\MF_Retexture\datas\DAGUET\huron\heli_transport_03_ext01_black_co.paa"]; 
		_u setObjectTexture [1,"\MF_Retexture\datas\DAGUET\huron\heli_transport_03_ext02_black_co.paa"]; 
	};
	if(_u isKindOf "B_MBT_01_arty_F") then {
		_u setObjectTexture [0,"\MF_Retexture\datas\DAGUET\Scorcher\mbt_01_body_co.paa"]; 
		_u setObjectTexture [1,"\MF_Retexture\datas\DAGUET\Scorcher\mbt_01_scorcher_co.paa"]; 
		_u setObjectTexture [2,"\MF_Retexture\datas\DAGUET\turret\HMG\turret_co.paa"]; 
	};
	if(_u isKindOf "B_G_Offroad_01_armed_F") then {
		_u setObjectTexture [0,"\MF_Retexture\datas\DAGUET\OffroadArmed\offroad_01_ext_co.paa"]; 
		_u setObjectTexture [1,"\MF_Retexture\datas\DAGUET\OffroadArmed\offroad_01_ext_co.paa"]; 
	};
	if(_u isKindOf "B_G_Van_01_transport_F") then {
		_u setObjectTexture [0,"\MF_Retexture\datas\DAGUET\Portoss\van_01_ext_ig_co.paa"]; 
		_u setObjectTexture [1,"\MF_Retexture\datas\DAGUET\Portoss\van_01_adds_ig_co.paa"]; 
	};
	if(_u isKindOf "B_APC_Wheeled_01_cannon_F") then {
		_u setObjectTexture [0,"\MF_Retexture\datas\DAGUET\Marchall\apc_wheeled_01_base_co.paa"]; 
		_u setObjectTexture [1,"\MF_Retexture\datas\DAGUET\Marchall\apc_wheeled_01_adds_co.paa"]; 
		_u setObjectTexture [2,"\MF_Retexture\datas\DAGUET\Marchall\apc_wheeled_01_tows_co.paa"]; 
	};
	if(_u isKindOf "B_APC_Tracked_01_AA_F") then {
		_u setObjectTexture [0,"\MF_Retexture\datas\DAGUET\Mora\apc_tracked_01_aa_body_co.paa"]; 
		_u setObjectTexture [1,"\MF_Retexture\datas\DAGUET\Mora\mbt_01_body_co.paa"]; 
		_u setObjectTexture [2,"\MF_Retexture\datas\DAGUET\Mora\apc_tracked_01_aa_tower_co.paa"]; 
	};
	if(_u isKindOf "B_MBT_01_TUSK_F") then {
		_u setObjectTexture [0,"\MF_Retexture\datas\DAGUET\Slammer\mbt_01_body_co.paa"]; 
		_u setObjectTexture [1,"\MF_Retexture\datas\DAGUET\Slammer\mbt_01_tow_co.paa"]; 
		_u setObjectTexture [2,"\MF_Retexture\datas\DAGUET\Slammer\mbt_addons_co.paa"]; 
	};
	if(_u isKindOf "B_G_Offroad_01_F") then {
		_u setObjectTexture [0,"\MF_Retexture\datas\DAGUET\OffroadArmed\offroad_01_ext_co.paa"]; 
		_u setObjectTexture [1,"\MF_Retexture\datas\DAGUET\OffroadArmed\offroad_01_ext_co.paa"]; 
	};
	if(_u isKindOf "B_G_Quadbike_01_F") then {
		_u setObjectTexture [0,"\MF_Retexture\datas\DAGUET\Quad\quadbike_01_ig_co.paa"]; 
	};
	if(_u isKindOf "B_APC_Tracked_01_rcws_F") then {
		_u setObjectTexture [0,"\MF_Retexture\datas\DAGUET\Panther\apc_tracked_01_body_crv_co.paa"]; 
		_u setObjectTexture [1,"\MF_Retexture\datas\DAGUET\Mora\mbt_01_body_co.paa"]; 
		_u setObjectTexture [2,"\MF_Retexture\datas\DAGUET\turret\HMG\turret_co.paa"]; 
	};
	if(_u isKindOf "B_APC_Tracked_01_CRV_F") then {
		_u setObjectTexture [0,"\MF_Retexture\datas\DAGUET\Panther\apc_tracked_01_body_crv_co.paa"]; 
		_u setObjectTexture [1,"\MF_Retexture\datas\DAGUET\Mora\mbt_01_body_co.paa"]; 
		_u setObjectTexture [2,"\MF_Retexture\datas\DAGUET\turret\HMG\turret_co.paa"]; 
		_u setObjectTexture [3,"\MF_Retexture\datas\DAGUET\BOBCAT\apc_tracked_01_crv_co.paa"]; 
	};
	if(_u isKindOf "B_Boat_Armed_01_minigun_F") then {
		_u setObjectTexture [0,"\MF_Retexture\datas\DAGUET\BoatArmed\boat_armed_01_ext_co.paa"]; 
		_u setObjectTexture [1,"\MF_Retexture\datas\DAGUET\BoatArmed\boat_armed_01_int_co.paa"]; 
		_u setObjectTexture [2,"\MF_Retexture\datas\DAGUET\BoatArmed\boat_armed_01_crows_blufor_co.paa"]; 
	};
};


if (_m=="MARINE") then {
	// Camo CE
	if(_u isKindOf "B_MRAP_01_F") then {
		_u setObjectTexture [0,"\MF_Retexture\datas\MARINE\hunter\mrap_01_base_co.paa"]; 
		_u setObjectTexture [1,"\MF_Retexture\datas\MARINE\hunter\mrap_01_adds_co.paa"]; 
	};
	if(_u isKindOf "B_MRAP_01_gmg_F") then {
		_u setObjectTexture [0,"\MF_Retexture\datas\MARINE\hunter\mrap_01_base_co.paa"]; 
		_u setObjectTexture [1,"\MF_Retexture\datas\MARINE\hunter\mrap_01_adds_co.paa"]; 
		_u setObjectTexture [2,"\MF_Retexture\datas\MARINE\turret\GMG\turret_co.paa"]; 
	};
	if(_u isKindOf "B_MRAP_01_hmg_F") then {
		_u setObjectTexture [0,"\MF_Retexture\datas\MARINE\hunter\mrap_01_base_co.paa"]; 
		_u setObjectTexture [1,"\MF_Retexture\datas\MARINE\hunter\mrap_01_adds_co.paa"]; 
		_u setObjectTexture [2,"\MF_Retexture\datas\MARINE\turret\HMG\turret_co.paa"]; 
	};
	if(_u isKindOf "B_Plane_CAS_01_F") then {
		_u setObjectTexture [0,"\MF_Retexture\datas\MARINE\A10\plane_cas_01_ext01_co.paa"]; 
		_u setObjectTexture [1,"\MF_Retexture\datas\MARINE\A10\plane_cas_01_ext02_co.paa"]; 
	};
	if(_u isKindOf "O_Plane_CAS_02_F") then {
		_u setObjectTexture [0,"\MF_Retexture\datas\MARINE\neophron\fighter02_ext01_co.paa"]; 
		_u setObjectTexture [1,"\MF_Retexture\datas\MARINE\neophron\fighter02_ext02_co.paa"]; 
	};
	if(_u isKindOf "I_MRAP_03_F") then {
		_u setObjectTexture [0,"\MF_Retexture\datas\MARINE\strider\mrap_03_ext_indp_co.paa"]; 
		_u setObjectTexture [1,"\MF_Retexture\datas\MARINE\strider\turret_indp_co.paa"]; 
	};
	if(_u isKindOf "I_MRAP_03_gmg_F") then {
		_u setObjectTexture [0,"\MF_Retexture\datas\MARINE\strider\mrap_03_ext_indp_co.paa"]; 
		_u setObjectTexture [1,"\MF_Retexture\datas\MARINE\turret\GMG\turret_co.paa"]; 
	};
	if(_u isKindOf "I_MRAP_03_hmg_F") then {
		_u setObjectTexture [0,"\MF_Retexture\datas\MARINE\strider\mrap_03_ext_indp_co.paa"]; 
		_u setObjectTexture [1,"\MF_Retexture\datas\MARINE\turret\HMG\turret_co.paa"]; 
	};
	if(_u isKindOf "B_Heli_Attack_01_F") then {
		_u setObjectTexture [0,"\MF_Retexture\datas\MARINE\blackfoot\heli_attack_01_co.paa"]; 
	};
	if(_u isKindOf "I_Heli_light_03_F") then {
		_u setObjectTexture [0,"\MF_Retexture\datas\MARINE\Hellcat\heli_light_03_base_indp_co.paa"]; 
	};
	if(_u isKindOf "B_Heli_Transport_01_F") then {
		_u setObjectTexture [0,"\MF_Retexture\datas\MARINE\GhostHawk\heli_transport_01_ext01_blufor_co.paa"]; 
		_u setObjectTexture [1,"\MF_Retexture\datas\MARINE\GhostHawk\heli_transport_01_ext02_blufor_co.paa"]; 
	};
	if(_u isKindOf "I_Heli_Transport_02_F") then {
		_u setObjectTexture [0,"\MF_Retexture\datas\MARINE\MoHawk\heli_transport_02_1_indp_co.paa"]; 
		_u setObjectTexture [1,"\MF_Retexture\datas\MARINE\MoHawk\heli_transport_02_2_indp_co.paa"]; 
		_u setObjectTexture [2,"\MF_Retexture\datas\MARINE\MoHawk\heli_transport_02_3_indp_co.paa"]; 
	};
	if(_u isKindOf "B_Heli_Light_01_armed_F") then {
		_u setObjectTexture [0,"\MF_Retexture\datas\MARINE\Pawnee\heli_light_01_ext_blufor_co.paa"]; 
	};
	if(_u isKindOf "B_Heli_Light_01_F") then {
		_u setObjectTexture [0,"\MF_Retexture\datas\MARINE\Pawnee\heli_light_01_ext_blufor_co.paa"]; 
	};
	if(_u isKindOf "B_Heli_Transport_03_F") then {
		_u setObjectTexture [0,"\MF_Retexture\datas\MARINE\huron\heli_transport_03_ext01_black_co.paa"]; 
		_u setObjectTexture [1,"\MF_Retexture\datas\MARINE\huron\heli_transport_03_ext02_black_co.paa"]; 
	};
	if(_u isKindOf "B_MBT_01_arty_F") then {
		_u setObjectTexture [0,"\MF_Retexture\datas\MARINE\Scorcher\mbt_01_body_co.paa"]; 
		_u setObjectTexture [1,"\MF_Retexture\datas\MARINE\Scorcher\mbt_01_scorcher_co.paa"]; 
		_u setObjectTexture [2,"\MF_Retexture\datas\MARINE\turret\HMG\turret_co.paa"]; 
	};
	if(_u isKindOf "B_G_Offroad_01_armed_F") then {
		_u setObjectTexture [0,"\MF_Retexture\datas\MARINE\OffroadArmed\offroad_01_ext_co.paa"]; 
		_u setObjectTexture [1,"\MF_Retexture\datas\MARINE\OffroadArmed\offroad_01_ext_co.paa"]; 
	};
	if(_u isKindOf "B_G_Van_01_transport_F") then {
		_u setObjectTexture [0,"\MF_Retexture\datas\MARINE\Portoss\van_01_ext_ig_co.paa"]; 
		_u setObjectTexture [1,"\MF_Retexture\datas\MARINE\Portoss\van_01_adds_ig_co.paa"]; 
	};
	if(_u isKindOf "B_APC_Wheeled_01_cannon_F") then {
		_u setObjectTexture [0,"\MF_Retexture\datas\MARINE\Marchall\apc_wheeled_01_base_co.paa"]; 
		_u setObjectTexture [1,"\MF_Retexture\datas\MARINE\Marchall\apc_wheeled_01_adds_co.paa"]; 
		_u setObjectTexture [2,"\MF_Retexture\datas\MARINE\Marchall\apc_wheeled_01_tows_co.paa"]; 
	};
	if(_u isKindOf "B_APC_Tracked_01_AA_F") then {
		_u setObjectTexture [0,"\MF_Retexture\datas\MARINE\Mora\apc_tracked_01_aa_body_co.paa"]; 
		_u setObjectTexture [1,"\MF_Retexture\datas\MARINE\Mora\mbt_01_body_co.paa"]; 
		_u setObjectTexture [2,"\MF_Retexture\datas\MARINE\Mora\apc_tracked_01_aa_tower_co.paa"]; 
	};
	if(_u isKindOf "B_MBT_01_TUSK_F") then {
		_u setObjectTexture [0,"\MF_Retexture\datas\MARINE\Slammer\mbt_01_body_co.paa"]; 
		_u setObjectTexture [1,"\MF_Retexture\datas\MARINE\Slammer\mbt_01_tow_co.paa"]; 
		_u setObjectTexture [2,"\MF_Retexture\datas\MARINE\Slammer\mbt_addons_co.paa"]; 
	};
	if(_u isKindOf "B_G_Offroad_01_F") then {
		_u setObjectTexture [0,"\MF_Retexture\datas\MARINE\OffroadArmed\offroad_01_ext_co.paa"]; 
		_u setObjectTexture [1,"\MF_Retexture\datas\MARINE\OffroadArmed\offroad_01_ext_co.paa"]; 
	};
	if(_u isKindOf "B_G_Quadbike_01_F") then {
		_u setObjectTexture [0,"\MF_Retexture\datas\MARINE\Quad\quadbike_01_ig_co.paa"]; 
	};
	if(_u isKindOf "B_APC_Tracked_01_rcws_F") then {
		_u setObjectTexture [0,"\MF_Retexture\datas\MARINE\Panther\apc_tracked_01_body_crv_co.paa"]; 
		_u setObjectTexture [1,"\MF_Retexture\datas\MARINE\Mora\mbt_01_body_co.paa"]; 
		_u setObjectTexture [2,"\MF_Retexture\datas\MARINE\turret\HMG\turret_co.paa"]; 
	};
	if(_u isKindOf "B_APC_Tracked_01_CRV_F") then {
		_u setObjectTexture [0,"\MF_Retexture\datas\MARINE\Panther\apc_tracked_01_body_crv_co.paa"]; 
		_u setObjectTexture [1,"\MF_Retexture\datas\MARINE\Mora\mbt_01_body_co.paa"]; 
		_u setObjectTexture [2,"\MF_Retexture\datas\MARINE\turret\HMG\turret_co.paa"]; 
		_u setObjectTexture [3,"\MF_Retexture\datas\MARINE\BOBCAT\apc_tracked_01_crv_co.paa"]; 
	};
	if(_u isKindOf "B_Boat_Armed_01_minigun_F") then {
		_u setObjectTexture [0,"\MF_Retexture\datas\MARINE\BoatArmed\boat_armed_01_ext_co.paa"]; 
		_u setObjectTexture [1,"\MF_Retexture\datas\MARINE\BoatArmed\boat_armed_01_int_co.paa"]; 
		_u setObjectTexture [2,"\MF_Retexture\datas\MARINE\BoatArmed\boat_armed_01_crows_blufor_co.paa"]; 
	};
	
};

if (_m=="WHITE") then {
	// Camo WHITE
	if(_u isKindOf "B_MRAP_01_F") then {
		_u setObjectTexture [0,"\MF_Retexture\datas\WHITE\hunter\mrap_01_base_co.paa"]; 
		_u setObjectTexture [1,"\MF_Retexture\datas\WHITE\hunter\mrap_01_adds_co.paa"]; 
	};
	if(_u isKindOf "B_MRAP_01_gmg_F") then {
		_u setObjectTexture [0,"\MF_Retexture\datas\WHITE\hunter\mrap_01_base_co.paa"]; 
		_u setObjectTexture [1,"\MF_Retexture\datas\WHITE\hunter\mrap_01_adds_co.paa"]; 
		_u setObjectTexture [2,"\MF_Retexture\datas\WHITE\turret\GMG\turret_co.paa"]; 
	};
	if(_u isKindOf "B_MRAP_01_hmg_F") then {
		_u setObjectTexture [0,"\MF_Retexture\datas\WHITE\hunter\mrap_01_base_co.paa"]; 
		_u setObjectTexture [1,"\MF_Retexture\datas\WHITE\hunter\mrap_01_adds_co.paa"]; 
		_u setObjectTexture [2,"\MF_Retexture\datas\WHITE\turret\HMG\turret_co.paa"]; 
	};
	if(_u isKindOf "B_Plane_CAS_01_F") then {
		_u setObjectTexture [0,"\MF_Retexture\datas\WHITE\A10\plane_cas_01_ext01_co.paa"]; 
		_u setObjectTexture [1,"\MF_Retexture\datas\WHITE\A10\plane_cas_01_ext02_co.paa"]; 
	};
	if(_u isKindOf "O_Plane_CAS_02_F") then {
		_u setObjectTexture [0,"\MF_Retexture\datas\WHITE\neophron\fighter02_ext01_co.paa"]; 
		_u setObjectTexture [1,"\MF_Retexture\datas\WHITE\neophron\fighter02_ext02_co.paa"]; 
	};
	if(_u isKindOf "I_MRAP_03_F") then {
		_u setObjectTexture [0,"\MF_Retexture\datas\WHITE\strider\mrap_03_ext_indp_co.paa"]; 
		_u setObjectTexture [1,"\MF_Retexture\datas\WHITE\strider\turret_indp_co.paa"]; 
	};
	if(_u isKindOf "I_MRAP_03_gmg_F") then {
		_u setObjectTexture [0,"\MF_Retexture\datas\WHITE\strider\mrap_03_ext_indp_co.paa"]; 
		_u setObjectTexture [1,"\MF_Retexture\datas\WHITE\turret\GMG\turret_co.paa"]; 
	};
	if(_u isKindOf "I_MRAP_03_hmg_F") then {
		_u setObjectTexture [0,"\MF_Retexture\datas\WHITE\strider\mrap_03_ext_indp_co.paa"]; 
		_u setObjectTexture [1,"\MF_Retexture\datas\WHITE\turret\HMG\turret_co.paa"]; 
	};
	if(_u isKindOf "B_Heli_Attack_01_F") then {
		_u setObjectTexture [0,"\MF_Retexture\datas\WHITE\blackfoot\heli_attack_01_co.paa"]; 
	};
	if(_u isKindOf "I_Heli_light_03_F") then {
		_u setObjectTexture [0,"\MF_Retexture\datas\WHITE\Hellcat\heli_light_03_base_indp_co.paa"]; 
	};
	if(_u isKindOf "B_Heli_Transport_01_F") then {
		_u setObjectTexture [0,"\MF_Retexture\datas\WHITE\GhostHawk\heli_transport_01_ext01_blufor_co.paa"]; 
		_u setObjectTexture [1,"\MF_Retexture\datas\WHITE\GhostHawk\heli_transport_01_ext02_blufor_co.paa"]; 
	};
	if(_u isKindOf "I_Heli_Transport_02_F") then {
		_u setObjectTexture [0,"\MF_Retexture\datas\WHITE\MoHawk\heli_transport_02_1_indp_co.paa"]; 
		_u setObjectTexture [1,"\MF_Retexture\datas\WHITE\MoHawk\heli_transport_02_2_indp_co.paa"]; 
		_u setObjectTexture [2,"\MF_Retexture\datas\WHITE\MoHawk\heli_transport_02_3_indp_co.paa"]; 
	};
	if(_u isKindOf "B_Heli_Light_01_armed_F") then {
		_u setObjectTexture [0,"\MF_Retexture\datas\WHITE\Pawnee\heli_light_01_ext_blufor_co.paa"]; 
	};
	if(_u isKindOf "B_Heli_Light_01_F") then {
		_u setObjectTexture [0,"\MF_Retexture\datas\WHITE\Pawnee\heli_light_01_ext_blufor_co.paa"]; 
	};
	if(_u isKindOf "B_Heli_Transport_03_F") then {
		_u setObjectTexture [0,"\MF_Retexture\datas\WHITE\huron\heli_transport_03_ext01_black_co.paa"]; 
		_u setObjectTexture [1,"\MF_Retexture\datas\WHITE\huron\heli_transport_03_ext02_black_co.paa"]; 
	};
	if(_u isKindOf "B_MBT_01_arty_F") then {
		_u setObjectTexture [0,"\MF_Retexture\datas\WHITE\Scorcher\mbt_01_body_co.paa"]; 
		_u setObjectTexture [1,"\MF_Retexture\datas\WHITE\Scorcher\mbt_01_scorcher_co.paa"]; 
		_u setObjectTexture [2,"\MF_Retexture\datas\WHITE\turret\HMG\turret_co.paa"]; 
	};
	if(_u isKindOf "B_G_Offroad_01_armed_F") then {
		_u setObjectTexture [0,"\MF_Retexture\datas\WHITE\OffroadArmed\offroad_01_ext_co.paa"]; 
		_u setObjectTexture [1,"\MF_Retexture\datas\WHITE\OffroadArmed\offroad_01_ext_co.paa"]; 
	};
	if(_u isKindOf "B_G_Van_01_transport_F") then {
		_u setObjectTexture [0,"\MF_Retexture\datas\WHITE\Portoss\van_01_ext_ig_co.paa"]; 
		_u setObjectTexture [1,"\MF_Retexture\datas\WHITE\Portoss\van_01_adds_ig_co.paa"]; 
	};
	if(_u isKindOf "B_APC_Wheeled_01_cannon_F") then {
		_u setObjectTexture [0,"\MF_Retexture\datas\WHITE\Marchall\apc_wheeled_01_base_co.paa"]; 
		_u setObjectTexture [1,"\MF_Retexture\datas\WHITE\Marchall\apc_wheeled_01_adds_co.paa"]; 
		_u setObjectTexture [2,"\MF_Retexture\datas\WHITE\Marchall\apc_wheeled_01_tows_co.paa"]; 
	};
	if(_u isKindOf "B_APC_Tracked_01_AA_F") then {
		_u setObjectTexture [0,"\MF_Retexture\datas\WHITE\Cheetah\apc_tracked_01_aa_body_co.paa"]; 
		_u setObjectTexture [1,"\MF_Retexture\datas\WHITE\Cheetah\mbt_01_body_co.paa"]; 
		_u setObjectTexture [2,"\MF_Retexture\datas\WHITE\Cheetah\apc_tracked_01_aa_tower_co.paa"]; 
	};
	if(_u isKindOf "B_MBT_01_TUSK_F") then {
		_u setObjectTexture [0,"\MF_Retexture\datas\WHITE\Slammer\mbt_01_body_co.paa"]; 
		_u setObjectTexture [1,"\MF_Retexture\datas\WHITE\Slammer\mbt_01_tow_co.paa"]; 
		_u setObjectTexture [2,"\MF_Retexture\datas\WHITE\Slammer\mbt_addons_co.paa"]; 
	};
	if(_u isKindOf "B_G_Offroad_01_F") then {
		_u setObjectTexture [0,"\MF_Retexture\datas\WHITE\OffroadArmed\offroad_01_ext_co.paa"]; 
		_u setObjectTexture [1,"\MF_Retexture\datas\WHITE\OffroadArmed\offroad_01_ext_co.paa"]; 
	};
	if(_u isKindOf "B_G_Quadbike_01_F") then {
		_u setObjectTexture [0,"\MF_Retexture\datas\WHITE\Quad\quadbike_01_ig_co.paa"]; 
	};
	if(_u isKindOf "B_APC_Tracked_01_rcws_F") then {
		_u setObjectTexture [0,"\MF_Retexture\datas\WHITE\Panther\apc_tracked_01_body_crv_co.paa"]; 
		_u setObjectTexture [1,"\MF_Retexture\datas\WHITE\Mora\mbt_01_body_co.paa"]; 
		_u setObjectTexture [2,"\MF_Retexture\datas\WHITE\turret\HMG\turret_co.paa"]; 
	};
	if(_u isKindOf "B_APC_Tracked_01_CRV_F") then {
		_u setObjectTexture [0,"\MF_Retexture\datas\WHITE\Panther\apc_tracked_01_body_crv_co.paa"]; 
		_u setObjectTexture [1,"\MF_Retexture\datas\WHITE\Bobcat\mbt_01_body_co.paa"]; 
		_u setObjectTexture [2,"\MF_Retexture\datas\WHITE\turret\HMG\turret_co.paa"]; 
		_u setObjectTexture [3,"\MF_Retexture\datas\WHITE\Bobcat\apc_tracked_01_crv_co.paa"]; 
	};
	if(_u isKindOf "B_Boat_Armed_01_minigun_F") then {
		_u setObjectTexture [0,"\MF_Retexture\datas\WHITE\BoatArmed\boat_armed_01_ext_co.paa"]; 
		_u setObjectTexture [1,"\MF_Retexture\datas\WHITE\BoatArmed\boat_armed_01_int_co.paa"]; 
		_u setObjectTexture [2,"\MF_Retexture\datas\WHITE\BoatArmed\boat_armed_01_crows_blufor_co.paa"]; 
	};
	if(_u isKindOf "O_APC_Tracked_02_cannon_F") then {
		_u setObjectTexture [0,"\MF_Retexture\datas\WHITE\Kamysh\apc_tracked_02_ext_01_hexarid_co.paa"]; 
		_u setObjectTexture [1,"\MF_Retexture\datas\WHITE\Kamysh\apc_tracked_02_ext_02_hexarid_co.paa"]; 
		_u setObjectTexture [2,"\MF_Retexture\datas\WHITE\Kamysh\rcws30_opfor_co.paa"]; 
	};
	if(_u isKindOf "O_APC_Tracked_02_AA_F") then {
		_u setObjectTexture [0,"\MF_Retexture\datas\WHITE\Tigris\apc_tracked_02_ext_01_aa_hexarid_co.paa"]; 
		_u setObjectTexture [1,"\MF_Retexture\datas\WHITE\Kamysh\apc_tracked_02_ext_02_hexarid_co.paa"];
		_u setObjectTexture [2,"\MF_Retexture\datas\WHITE\Tigris\apc_tracked_01_aa_tower_opfor_co.paa"];
	};
	if(_u isKindOf "I_APC_tracked_03_cannon_F") then {
		_u setObjectTexture [0,"\MF_Retexture\datas\WHITE\Mora\apc_tracked_03_ext_indp_co.paa"]; 
		_u setObjectTexture [1,"\MF_Retexture\datas\WHITE\Mora\apc_tracked_03_ext2_indp_co.paa"];
	};
	if(_u isKindOf "O_MBT_02_cannon_F") then {
		_u setObjectTexture [0,"\MF_Retexture\datas\WHITE\Varsuk\mbt_02_body_co.paa"]; 
		_u setObjectTexture [1,"\MF_Retexture\datas\WHITE\Varsuk\mbt_02_co.paa"];
		_u setObjectTexture [2,"\MF_Retexture\datas\WHITE\Varsuk\mbt_02_turret_co.paa"];
	};
	if(_u isKindOf "I_MBT_03_cannon_F") then {
		_u setObjectTexture [0,"\MF_Retexture\datas\WHITE\Kuma\mbt_03_ext01_co.paa"]; 
		_u setObjectTexture [1,"\MF_Retexture\datas\WHITE\Kuma\mbt_03_ext02_co.paa"];
		_u setObjectTexture [2,"\MF_Retexture\datas\WHITE\Kuma\mbt_03_rcws_co.paa"];
	};
		if(_u isKindOf "O_MRAP_02_hmg_F") then {
		_u setObjectTexture [0,"\MF_Retexture\datas\WHITE\Ifrit\mrap_02_ext_01_co.paa"]; 
		_u setObjectTexture [1,"\MF_Retexture\datas\WHITE\Ifrit\mrap_02_ext_02_co.paa"];
		_u setObjectTexture [2,"\MF_Retexture\datas\WHITE\turret\HMG\turret_opfor_co.paa"];
	};
	if(_u isKindOf "O_MRAP_02_gmg_F") then {
		_u setObjectTexture [0,"\MF_Retexture\datas\WHITE\Ifrit\mrap_02_ext_01_co.paa"]; 
		_u setObjectTexture [1,"\MF_Retexture\datas\WHITE\Ifrit\mrap_02_ext_02_co.paa"];
		_u setObjectTexture [2,"\MF_Retexture\datas\WHITE\turret\HMG\turret_opfor_co.paa"];
	};
	if(_u isKindOf "O_APC_Wheeled_02_rcws_F") then {
		_u setObjectTexture [0,"\MF_Retexture\datas\WHITE\Marid\apc_wheeled_02_ext_01_opfor_co.paa"]; 
		_u setObjectTexture [1,"\MF_Retexture\datas\WHITE\Marid\apc_wheeled_02_ext_02_opfor_co.paa"];
		_u setObjectTexture [2,"\MF_Retexture\datas\WHITE\Marid\turret_opfor_co.paa"];
	};
	if(_u isKindOf "I_APC_Wheeled_03_cannon_F") then {
		_u setObjectTexture [0,"\MF_Retexture\datas\WHITE\Gorgon\apc_wheeled_03_ext_indp_co.paa"];
		_u setObjectTexture [1,"\MF_Retexture\datas\WHITE\Gorgon\apc_wheeled_03_ext2_indp_co.paa"];
		_u setObjectTexture [2,"\MF_Retexture\datas\WHITE\Gorgon\rcws30_indp_co.paa"];
	};
	if(_u isKindOf "B_T_LSV_01_unarmed_F") then {
		_u setObjectTexture [0,"\MF_Retexture\datas\WHITE\Prowler\NATO_LSV_01_olive_CO.paa"];
		_u setObjectTexture [1,"\MF_Retexture\datas\WHITE\Prowler\NATO_LSV_02_olive_CO.paa"];
	};
	if(_u isKindOf "O_LSV_02_armed_F") then {
		_u setObjectTexture [0,"\MF_Retexture\datas\WHITE\Quillin\CSAT_LSV_01_arid_CO.paa"];
		_u setObjectTexture [1,"\MF_Retexture\datas\WHITE\Quillin\CSAT_LSV_02_arid_CO.paa"];
	};
};
