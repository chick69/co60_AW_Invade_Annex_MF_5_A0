_unit = _this select 0;

if(isNull _unit) exitWith {};

if(_unit isKindOf "B_MBT_01_arty_F") then {
	_unit removeMagazines "6Rnd_155mm_Mo_mine";
	_unit removeMagazines "6Rnd_155mm_Mo_AT_mine";
	_unit removeMagazines "6Rnd_155mm_Mo_smoke";
	_unit removeMagazines "2Rnd_155mm_Mo_Cluster";
	_unit removeMagazines "32Rnd_155mm_Mo_shells"
};


if(_unit isKindOf "I_Heli_light_03_F") then {
	_unit removeMagazines "24Rnd_missiles";
	_unit addMagazine "24Rnd_PG_missiles";
	_unit addWeapon "missiles_DAGR"
};

// pawned rearmed

if(_unit isKindOf "B_Heli_Light_01_armed_F") then {
	_unit addMagazine "7Rnd_Rocket_04_HE_F";
	_unit addMagazine "7Rnd_Rocket_04_HE_F";
	_unit addWeapon "Rocket_04_HE_Plane_CAS_01_F";
	_unit addMagazine "7Rnd_Rocket_04_AP_F";
	_unit addMagazine "7Rnd_Rocket_04_AP_F";
	_unit addWeapon "Rocket_04_AP_Plane_CAS_01_F";
	_unit addMagazine "60Rnd_CMFlareMagazine";
	_unit addWeapon "CMFlareLauncher";
	_unit removeMagazines "24Rnd_missiles";
	_unit removeWeapon "missiles_DAR";
};
 
// hummingbird

if(_unit isKindOf "B_Heli_Light_01_F") then {
	_unit addWeapon "CMFlareLauncher";
	_unit addMagazine "60Rnd_CMFlareMagazine";
};
 
 // UAV

if(_unit isKindOf "B_UAV_02_CAS_F") then {
	_unit addMagazine "240Rnd_CMFlare_Chaff_Magazine";
	_unit addWeapon "CMFlareLauncher";
	_unit addMagazine "2Rnd_GBU12_LGB";
	_unit addWeapon "GBU12BombLauncher";
	_unit addMagazine "Laserbatteries";
};
