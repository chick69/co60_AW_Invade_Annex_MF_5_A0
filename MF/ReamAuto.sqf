
private ["_damage","_percentage","_veh","_vehType","_fuelLevel"];
_veh = _this select 0;
_vehType = getText(configFile>>"CfgVehicles">>typeOf _veh>>"DisplayName");
_magazines = getArray(configFile >> "CfgVehicles" >> _vehType >> "magazines");
_count = count (configFile >> "CfgVehicles" >> _vehType >> "Turrets");


while {true} do {
	
	_veh setFuel 0;
	_veh setDamage 0;
	_veh setVehicleAmmo 1;	// Reload turrets / drivers magazine
	sleep (900);

};

