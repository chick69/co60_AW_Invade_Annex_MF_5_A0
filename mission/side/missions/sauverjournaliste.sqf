/*
@file: destroyUrban.sqf
Author:

	Quiksilver 	(credit to Jester [AW] for initial build)
				(credit to chucky [allFPS] for initial help with addAction)	
				(credit to BangaBob [EOS] for EOS)
Last modified:

	29/04/2014
	
Description:

	Objective appears in urban area, with selection of OPFOR Uinfantry, and civilians.
	Inf and civs spawn in foot patrols and randomly placed in and around buildings.
	Vehicle spawning can be unstable and the veh can spawn into buildings.
	Good CQB mission and players seem to enjoy it.

_____________________________________________________________________*/


private ["_journaliste","_briefing","_smPos"];
#define OBJUNIT_TYPES_INTEL "B_Survivor_F"

//-------------------- PREPARE MISSION. SELECT OBJECT, POSITION AND MESSAGES FROM ARRAYS


	currentSM = ["sm1","sm2","sm3","sm4","sm5","sm6","sm7","sm8","sm9","sm10","sm11","sm12","sm13","sm14","sm15","sm16","sm17"] call BIS_fnc_selectRandom;
	

//-------------------- SPAWN OBJECTIVE (okay okay, setPos not spawn/create)

	
	_smPos = getMarkerPos currentSM;
	sleep 1;
	_surrenderGroup = createGroup civilian;
	[OBJUNIT_TYPES_INTEL] call BIS_fnc_selectRandom createUnit [_smPos, _surrenderGroup];
	
	
//--------- INTEL OBJ

	sleep 0.3;
	
	_journaliste = ((units _surrenderGroup) select 0);
	removeAllWeapons _journaliste;
	removeAllItems _journaliste;
	removeAllAssignedItems _journaliste;
	removeUniform _journaliste;
	removeVest _journaliste;
	removeBackpack _journaliste;
	removeHeadgear _journaliste;
	removeGoggles _journaliste;
	_journaliste forceAddUniform "U_C_Journalist";
	_journaliste addHeadgear "H_Cap_press";

	
//--------------------------------------------------------------------------- ADD ACTION TO OBJECTIVE. NOTE: NEEDS WORK STILL. avoid BIS_fnc_MP! Good enough for now though.
	
	sleep 0.1;
	[_journaliste,"QS_fnc_addActionRescueIntel",nil,true] spawn BIS_fnc_MP; 
	
	
//-------------------- SPAWN GUARDS and CIVILIANS
    
    [[currentSM],[4,2],[4,2],[0,0],[0],[0],[0,0],[5,1,1200,INDEPENDENT,FALSE,FALSE]] call EOS_Spawn; //guards
    sleep 1;
    [[currentSM],[3,1],[3,1],[0,0],[0],[0],[0,0],[3,1,1100,INDEPENDENT,FALSE,FALSE]] call EOS_Spawn; //civs
	
//-------------------- BRIEFING
	
	"sideMarker" setMarkerPos (getMarkerPos currentSM);
	sideMarkerText = "Libérer et ramener le journaliste à la base principale"; publicVariable "sideMarkerText";
	"sideMarker" setMarkerText "Mission secondaire: Libérer et ramener le journaliste à la base principale"; publicVariable "sideMarker";
	_briefing = "<t align='center'><t size='2.2'>Nouvel objectif secondaire</t><br/><t size='1.5' color='#00B2EE'>Libérer le journaliste</t><br/>____________________<br/>Un journaliste d'une gande chaîne télévisée a été prise en otage.<br/><br/> Les CSAT les retiennenent et préparent leur éxecution. Retrouver les et ramenez-les à la base principale.</t>";
	GlobalHint = _briefing; hint parseText GlobalHint; publicVariable "GlobalHint";
	showNotification = ["Nouvel objectif secondaire", "Libérer le journaliste"]; publicVariable "showNotification";
			
	sideMissionUp = true; publicVariable "sideMissionUp";
	SM_SUCCESS = false;	publicVariable "SM_SUCCESS";

while { sideMissionUp } do {

//SUCESS SIDE

if ((alive _journaliste) && (_journaliste distance getMarkerPos "respawn_west" < 50)) then
	{
		SM_SUCCESS = true; publicVariable "SM_SUCCESS";

		sleep 0.3;
		
		//---------- DE-BRIEF
		
		hqSideChat = "Le journaliste est sécurisé ! Mission Accomplie !"; publicVariable "hqSideChat"; [WEST,"HQ"] sideChat hqSideChat;
		sideMissionUp = false; publicVariable "sideMissionUp";
		[] spawn QS_fnc_SMhintSUCCESS;
		"sideMarker" setMarkerPos [-10000,-10000,-10000]; publicVariable "sideMarker";
		
		//---------- DELETE

		sleep 120;
		{ deleteVehicle _x } forEach [_journaliste];
		SM_SUCCESS = false; publicVariable "SM_SUCCESS";			// reset var for next cycle
		[[currentSM]] call EOS_deactivate;							// despawn enemies and civs
		
	};	
		

//FAIL SIDE

	if (!alive _journaliste) exitWith {
	
		sleep 0.3;
		
		//---------- DE-BRIEF
		
		hqSideChat = "Objective destroyed! Mission FAILED!"; publicVariable "hqSideChat"; [WEST,"HQ"] sideChat hqSideChat;
		sideMissionUp = false; publicVariable "sideMissionUp";
		[] spawn QS_fnc_SMhintFAIL;
		SM_SUCCESS = false; publicVariable "SM_SUCCESS";			// reset var for next cycle
		sleep 120;													// sleep to hide despawns from players. default 120, 1 for testing	
		[[currentSM]] call EOS_deactivate;							// despawn enemies and civs
		"sideMarker" setMarkerPos [-10000,-10000,-10000]; publicVariable "sideMarker";
	};	
	
};
	

