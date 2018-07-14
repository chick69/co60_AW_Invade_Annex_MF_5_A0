_unit = _this select 0;
_unit  addaction ["<t color='#ffff00'>Ouvrir Virtual Arsenal</t>", { ["Open",true] call BIS_fnc_arsenal; }, [], 1, false, true, "","alive _target"];