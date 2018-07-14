_u = _this select 0;
if (isNull _u) exitWith {};

_t = typeOf _u;
_tran = ["I_Heli_Transport_02_F","I_Heli_light_03_F"];
_blackVehicles = ["B_Heli_Light_01_armed_F"];									// black skin
_strider = ["I_MRAP_03_F","I_MRAP_03_hmg_F","I_MRAP_03_gmg_F"];					// strider
_wasp = ["B_Heli_Light_01_F","B_Heli_Light_01_armed_F"];						// MH-9
_orca = ["O_Heli_Light_02_unarmed_F"];											// Orca


//===== Mohawk
if (_t in _tran) then {
	_u setVariable ["BIS_enableRandomization", false];
	_u  setObjectTexture [0,"#(argb,8,8,3)color(0.518,0.519,0.455,0.2)"];
	_u  setObjectTexture [1,"#(argb,8,8,3)color(0.518,0.519,0.455,0.2)"];
	_u  setObjectTexture [2,"#(argb,8,8,3)color(0.518,0.519,0.455,0.2)"];
};

//===== black camo
if (_t in _blackVehicles) then {
	_u setObjectTexture [0,'a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_furious_co.paa'];
};

//===== strider nato skin
if (_t in _strider) then {
	_u setVariable ["BIS_enableRandomization", false];
	_u setObjectTexture [0,'A3\soft_f_beta\mrap_03\data\mrap_03_ext_co.paa'];
	_u setObjectTexture [1,'A3\data_f\vehicles\turret_co.paa']; 
};

//===== aaf skin
if(_t in _wasp) then {
	_u setObjectTexture [0,'A3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_wasp_co.paa'];
};

//===== aaf skin
if(_t in _orca) then {
	_u setObjectTexture [0,'A3\Air_F\Heli_Light_02\Data\heli_light_02_ext_indp_co.paa'];
};

