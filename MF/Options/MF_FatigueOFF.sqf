_unit = _this select 0;
_unit removeAction MFFATIGUE;
//
_unit enableFatigue false;
_unit enableStamina false;
_unit setVariable ["MFFATIGUE","OFF"];
//
MFFATIGUE = _unit addAction ["<t color='#99cc33'>Fatigue ON</t>", "MF\Options\MF_FatigueOn.sqf"];

