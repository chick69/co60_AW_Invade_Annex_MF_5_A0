_unit = _this select 1;
_typeOf = typeOf _unit;
_okOk = 0;
_reserved_slots = ["B_recon_JTAC_F","B_Fighter_Pilot_F","B_T_Pilot_F"]; // List des users autorisés

if (_typeOf in _reserved_slots) then {
	if (isNil "JETa10") then {
		_okOk = 1;
	} else {
		if (!alive JETa10) then {_okOk = 1;};
	};

	if (_okOk==1)  then {
    JETa10 = createVehicle ["B_Plane_CAS_01_dynamicLoadout_F",[729.422,14948.643,27.109],[],0,"NONE"];
	[JETa10,["CamoGrey",1],true] call BIS_fnc_initVehicle;
    JETa10 setPosWorld [729.422,14948.643,27.109]; // [x,y,z] or positionWorld
    JETa10 setDir 90.310; // North
   
   private _pylons = ["PylonRack_7Rnd_Rocket_04_AP_F","PylonRack_7Rnd_Rocket_04_HE_F","PylonRack_1Rnd_Missile_AGM_02_F","PylonRack_1Rnd_Missile_AGM_02_F","PylonMissile_1Rnd_Bomb_04_F","PylonMissile_1Rnd_Bomb_04_F",
   "PylonRack_1Rnd_Missile_AGM_02_F","PylonRack_1Rnd_Missile_AGM_02_F","PylonRack_7Rnd_Rocket_04_AP_F","PylonRack_1Rnd_LG_scalpel"];
private _pylonPaths = (configProperties [configFile >> "CfgVehicles" >> typeOf JETa10 >> "Components" >> "TransportPylonsComponent" >> "Pylons", "isClass _x"]) apply {getArray (_x >> "turret")};
{ JETa10 removeWeaponGlobal getText (configFile >> "CfgMagazines" >> _x >> "pylonWeapon") } forEach getPylonMagazines JETa10;
{ JETa10 setPylonLoadOut [_forEachIndex + 1, _x, true, _pylonPaths select _forEachIndex] } forEach _pylons;
  

   {_x addCuratorEditableObjects [units JETa10, false];} foreach adminCurators;
 
   [JETa10] call BIS_fnc_Carrier01PosUpdate;
		hint "Un A-10 livré";
	} else {
		hint "Le A-10 est déjà en cours d'utilisation";
	};
} else {
	hint "Vous n'etes pas autorisé à utiliser ce véhicule";
};
