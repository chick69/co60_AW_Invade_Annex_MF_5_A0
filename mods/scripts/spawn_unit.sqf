_group1 = createGroup east;
	_unit1 = _group1 createUnit ["O_Soldier_SL_F",[11560.45,11746.619,0]];
		(group _unit1) selectLeader _unit1;
		_unit1 setRank "SERGEANT";
		_unit1 forceSpeed 0;
	_unit2 = _group1 createUnit ["O_Soldier_F",[11561.95,11739.644,0]];
		_unit2 forceSpeed 0;
	_unit3 = _group1 createUnit ["O_soldier_M_F",[11559.499,11739.811,0]];
		_unit3 forceSpeed 0;
	_unit4 = _group1 createUnit ["O_Soldier_AR_F",[11562.14,11737.549,0]];
		_unit4 forceSpeed 0;
	_unit5 = _group1 createUnit ["O_Soldier_A_F",[11559.445,11738.079,0]];
		_unit5 forceSpeed 0;
	_unit6 = _group1 createUnit ["O_Soldier_F",[11561.639,11744.016,0]];
		_unit6 forceSpeed 0;
	_unit7 = _group1 createUnit ["O_Soldier_F",[11559.619,11743.947,0]];
		_unit7 forceSpeed 0;
	_unit8 = _group1 createUnit ["O_Soldier_F",[11561.598,11741.894,0]];
		_unit8 forceSpeed 0;
	_unit9 = _group1 createUnit ["O_Soldier_F",[11559.544,11741.971,0]];
		_unit9 forceSpeed 0;
	_unit10 = _group1 createUnit ["O_Soldier_F",[11562.433,11735.74,0]];
		_unit10 forceSpeed 0;
	_unit11 = _group1 createUnit ["O_Soldier_F",[11559.011,11735.893,0]];
		_unit11 forceSpeed 0;
	_unit12 = _group1 createUnit ["O_Soldier_AR_F",[11564.779,11745.535,0]];
		_unit12 forceSpeed 0;
	_unit13 = _group1 createUnit ["O_Soldier_AR_F",[11564.899,11743.742,0]];
		_unit13 forceSpeed 0;
	_unit14 = _group1 createUnit ["O_Soldier_GL_F",[11557.16,11746.73,0]];
		_unit14 forceSpeed 0;
	_unit15 = _group1 createUnit ["O_Soldier_GL_F",[11556.762,11744.896,0]];
		_unit15 forceSpeed 0;
	_unit16 = _group1 createUnit ["O_HeavyGunner_F",[11556.683,11743.144,0]];
		_unit16 forceSpeed 0;
	_unit17 = _group1 createUnit ["O_HeavyGunner_F",[11563.425,11747.248,0]];
		_unit17 forceSpeed 0;
		
		

[(units _group1)] call QS_fnc_setSkill2;

{
	_x addCuratorEditableObjects [units _group1, false];
} foreach adminCurators;
