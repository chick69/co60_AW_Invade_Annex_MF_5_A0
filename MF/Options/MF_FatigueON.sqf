_unit = _this select 0;
_unit removeAction MFFATIGUE;
//
_unit enableFatigue true;
_unit enableStamina true;
_unit setVariable ["MFFATIGUE","ON"];
//
MFFATIGUE = _unit addAction ["<t color='#99cc33'>Fatigue OFF</t>", "MF\Options\MF_FatigueOff.sqf"];

