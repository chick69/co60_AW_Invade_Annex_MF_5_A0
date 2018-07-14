/*
      ::: ::: :::             ::: :::             :::
     :+: :+:   :+:           :+:   :+:           :+:
    +:+ +:+     +:+         +:+     +:+         +:+
   +#+ +#+       +#+       +#+       +#+       +#+
  +#+ +#+         +#+     +#+         +#+     +#+
 #+# #+#           #+#   #+#           #+#   #+#
### ###             ### ###             ### ###

 Helicopter ammo box drop script (aw_drop.sqf) was written by Jester [AW] of AhoyWorld.co.uk
 You may add or alter this code to your liking as long as you leave the authors name in place.
 set _reloadtime = 30 to however many seconds you want before it is available to use again.
 place "this addAction ["<t color='#0000f6'>Ammo Drop</t>", "aw_drop.sqf",[1],0,false,true,""," driver  _target == _this"];", "aw_drop.sqf"];" in the helicopter/plane init field.
 change the loadouts to the crate to your likings.
*/

private ["_heli", "_reloadtime","_pos"];

	// lets set some local variables
	_heli = _this select 0;
	_chuteType = "B_Parachute_02_F";	//parachute for blufor, for opfor and greenfor replace the 'B' with 'O' or 'G' respectively
	_crateType =  "B_supplyCrate_F";	//ammocrate class for blufor, feel free to change to whichever box you desire
	_smokeType =  "SmokeShellPurple";  //smoke shell color you want to use
	_lightType =  "Chemlight_blue";  //chemlightcolor you want used
	_reloadtime = 120;  // time before next ammo drop is available to use
	_minheight = 10;  // the height you have to be before you can actually drop the crate
	_HQ = [West,"HQ"];  // do not touch this!

	if (!isServer && isNull player) then {isJIP=true;} else {isJIP=false;};

	// Wait until player is initialized
	if (!isDedicated) then
	{
		waitUntil {!isNull player && isPlayer player};
	};
	// meat and potatoes
	
	//if ( !(isNil "AW_ammoDrop") ) exitWith {hint "Ammo drop is not currently available"};
	//AW_ammoDrop = false;
	//publicVariable "AW_ammoDrop";

	player groupchat "Left click on the map where you want to insert";

	openMap true;

	mapclick = false;

	onMapSingleClick "clickpos = _pos; mapclick = true; onMapSingleClick """";true;";

	waituntil {mapclick or !(visiblemap)};
	
	if (!visibleMap) exitwith {
		_caller groupchat "ok ...";
	};
	_pos = clickpos;
	openMap false;
	
	_chute = createVehicle [_chuteType, [100, 100, 200], [], 0, 'FLY'];
	_chute setPos [ ( _pos select 0), ( _pos select 1) , ( _pos select 2) + 120];
	_crate = createVehicle [_crateType, position _chute, [], 0, 'NONE'];
	_crate attachTo [_chute, [0, 0, -1.3]];
	_crate allowdamage false;
	_light = createVehicle [_lightType, position _chute, [], 0, 'NONE'];
	_light attachTo [_chute, [0, 0, 0]];

	// clear crate - leaves medkits in place. add clearItemCargoGlobal _crate; to remove medkits
	clearWeaponCargoGlobal _crate;
	clearMagazineCargoGlobal _crate;

	// fill crate with our junk
	[_crate,"Fnc_AddVASAction",nil,true] spawn BIS_fnc_MP;

	// lets people know stuff happened
	_HQ sideChat "ammo crate has been dropped.";
	hint format ["ammo crate dropped, Next one will be ready in: %1 seconds",_reloadtime];
	waitUntil {position _crate select 2 < 1 || isNull _chute};
	detach _crate;
	_crate setPos [position _crate select 0, position _crate select 1, 0];
	_smoke = _smokeType createVehicle [getPos _crate select 0, getPos _crate select 1,5];

	// let ground forces know they can resupply
	_HQ sideChat "Be advised: ammo crate has touched down!";
	sleep 3;
	_HQ sideChat "I say again, ammo crate has touched down!";

	// time to reload a new ammo crate
	sleep _reloadtime;

	deleteVehicle _light;
	deleteVehicle _smoke;
	deleteVehicle _crate;  
	// we are back in action
	vehicle player vehicleChat "Ammo drop available...";
	//AW_ammoDrop = nil;
	//publicVariable "AW_ammoDrop";
