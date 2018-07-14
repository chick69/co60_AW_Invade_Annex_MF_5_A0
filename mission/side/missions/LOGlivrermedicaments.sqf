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


private ["_x","_object","_object2","_object3","_object4","_briefing"];

//-------------------- PREPARE MISSION. SELECT OBJECT, POSITION AND MESSAGES FROM ARRAYS


	
	currentSM = ["sm1","sm2","sm3","sm4","sm5","sm6","sm7","sm8","sm9","sm10","sm11","sm12","sm13","sm14","sm15","sm16","sm17"] call BIS_fnc_selectRandom;
	

//-------------------- SPAWN OBJECTIVE (okay okay, setPos not spawn/create)

	_object = "B_supplyCrate_F" createVehicle getMarkerPos "depside";
	_object2 = "B_supplyCrate_F" createVehicle getMarkerPos "depside2";
	_object3 = "B_supplyCrate_F" createVehicle getMarkerPos "depside3";
	_object4 = "B_supplyCrate_F" createVehicle getMarkerPos "depside4";

	
	

//-------------------- SPAWN GUARDS and CIVILIANS
    
    [[currentSM],[4,2],[4,2],[0,0],[0],[0],[0,0],[5,1,1200,INDEPENDENT,FALSE,FALSE]] call EOS_Spawn; //guards
    sleep 1;
    [[currentSM],[3,1],[3,1],[0,0],[0],[0],[0,0],[3,1,1200,INDEPENDENT,FALSE,FALSE]] call EOS_Spawn; //civs
	
//-------------------- BRIEFING
	
	"sideMarker" setMarkerPos (getMarkerPos currentSM);
	sideMarkerText = "Livrer des fournitures médicales"; publicVariable "sideMarkerText";
	"sideMarker" setMarkerText "Mission logistique: Livrer des fournitures médicales"; publicVariable "sideMarker";
	_briefing = "<t align='center'><t size='2.2'>Nouvel objectif secondaire</t><br/><t size='1.5' color='#00B2EE'>Livrer des fournitures médicales</t><br/>____________________<br/>The enemy is supplying insurgents with advanced weapons and explosives. Neutralize them!<br/><br/>We've marked the location on your map; Looks like it's in town. Get your CQB gear ready.</t>";
	GlobalHint = _briefing; hint parseText GlobalHint; publicVariable "GlobalHint";
	showNotification = ["Nouvel objectif secondaire", "Livrer des fournitures médicales"]; publicVariable "showNotification";
			
	sideMissionUp = true; publicVariable "sideMissionUp";
	SM_SUCCESS = false;	publicVariable "SM_SUCCESS";


	

	while { sideMissionUp } do {

	sleep 0.3;

	"mkr_hunt" setMarkerPos getPos _object;sleep 0.5;
	"mkr_hunt_1" setMarkerPos getPos _object2;sleep 0.5;
	"mkr_hunt_2" setMarkerPos getPos _object3;sleep 0.5;
	"mkr_hunt_3" setMarkerPos getPos _object4;sleep 0.5;
	
	
	//------------------------------------------ IF VEHICLE IS DESTROYED [FAIL]
	
	if ({alive _x} count [_object,_object2,_object3,_object4] < 4) exitWith {
	
		sleep 0.3;
		
		//---------- DE-BRIEF
		
		hqSideChat = "Fournitures médicales détruites! Mission FAILED!"; publicVariable "hqSideChat"; [WEST,"HQ"] sideChat hqSideChat;
		sideMissionUp = false; publicVariable "sideMissionUp";
		[] spawn QS_fnc_SMhintFAIL;
		{ _x setMarkerPos [-10000,-10000,-10000]; } forEach ["sideMarker", "sideCircle","mkr_hunt","mkr_hunt_1","mkr_hunt_2","mkr_hunt_3"]; publicVariable "sideMarker";
		
		
	
		//--------------------- DELETE, DESPAWN, HIDE and RESET
	
		SM_SUCCESS = false; publicVariable "SM_SUCCESS";			// reset var for next cycle
		sleep 120;													// sleep to hide despawns from players. default 120, 1 for testing	
		[[currentSM]] call EOS_deactivate;	
		{ deleteVehicle _x } forEach [_Object,_Object2,_Object3,_Object4];
		
	};
	
		//-------------------------------------------- THE INTEL WAS RECOVERED [SUCCESS]
	
	if (({alive _x} count [_object,_object2,_object3,_object4] > 0) && (_object distance getMarkerPos "sideMarker" < 50) && (_object2 distance getMarkerPos "sideMarker" < 50) && (_object3 distance getMarkerPos "sideMarker" < 50) && (_object4 distance getMarkerPos "sideMarker" < 50)) then
	{
	SM_SUCCESS = true; publicVariable "SM_SUCCESS";

	
		sleep 0.3;
		
		//-------------------- DE-BRIEFING

		hqSideChat = "Fournitures médicales livrées ! Mission Accomplie !"; publicVariable "hqSideChat"; [WEST,"HQ"] sideChat hqSideChat;
		sideMissionUp = false; publicVariable "sideMissionUp";
		[] spawn QS_fnc_SMhintSUCCESS;
		"sideMarker" setMarkerPos [-10000,-10000,-10000]; publicVariable "sideMarker";
		"mkr_hunt" setMarkerPos [-10100,-10000,-10000]; 
		"mkr_hunt_1" setMarkerPos [-10200,-10000,-10000]; 
		"mkr_hunt_2" setMarkerPos [-10300,-10000,-10000]; 
		"mkr_hunt_3" setMarkerPos [-10400,-10000,-10000]; 
		
		
	
		//--------------------- DELETE, DESPAWN, HIDE and RESET
	
		SM_SUCCESS = false; publicVariable "SM_SUCCESS";			// reset var for next cycle
		sleep 120;													// sleep to hide despawns from players. default 120, 1 for testing	
		[[currentSM]] call EOS_deactivate;	
		{ deleteVehicle _x } forEach [_Object,_Object2,_Object3,_Object4];
		
	};	
};	