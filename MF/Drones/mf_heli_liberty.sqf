_unit = _this select 1;
_typeOf = typeOf _unit;
_okOk = 0;
_reserved_slots = ["B_recon_JTAC_F","B_CTRG_soldier_engineer_exp_F","B_Pilot_F","B_recon_medic_F","B_recon_F","B_recon_TL_F","B_recon_LAT_F","B_recon_M_F","B_recon_LAT_F","B_recon_exp_F","B_Helipilot_F"]; // List des users autorisés

if (_typeOf in _reserved_slots) then {
	if (isNil "heliliberty") then {
		_okOk = 1;
	} else {
		if (!alive heliliberty) then {_okOk = 1;};
	};

	if (_okOk==1)  then {
		heliliberty = createVehicle ["B_CTRG_Heli_Transport_01_tropic_F",[16172.956,4829,11],[],0,"NONE"];  
		heliliberty setPosWorld [16172.956,4829.220,11]; // [x,y,z] or positionWorld
		heliliberty setDir 262.485; 
		{
			_x addCuratorEditableObjects [units heliliberty, false];
		} foreach adminCurators;
		hint "UH 80 Ghost Hawk livre";
	} else {
		hint "Le sentinel est déjà en cours d'utilisation";
	};
} else {
	hint "Vous n'etes pas autorisé à utiliser le sentinel";
};



