/* --
[this] call vts_isStealableUniform; 
[this] call vts_isHostage; 
[this] call vts_isVIPtoCapture; 
[this] call vts_property_revive;
-- */

vts_gmmessage=
{
	private ["_gmtxt","_log"];
	_gmtxt=_this;
	_log=false;
	if ((typename _this)=="ARRAY") then
	{
		_gmtxt=_this select 0;
		if (count _this>1) then {_log=_this select 1;};
	};
	
	if (_gmtxt!="") then
	{	
		//No more needed with the hint displayed on camera
		hintSilent _gmtxt;
		playsound ["computer",true];
	}
	else
	{
		//No "" else it break up display :(
		//hintSilent "";
		playsound ["computerok",true];
	};
	if (_log) then
	{
		_gmtxt call vts_addlog;
	};	
};

//Execute action function
vts_ExecuteAction={
	private ["_object","_caller","_id","_script"];
  _object=_this select 0;
  _caller=_this select 1;
  _id=_this select 2;
  
  _script=_object getVariable (format["vtsaction_%1",_id]);
  _this call _script; 
};

vts_AddAction={

  private ["_object","_action","_script","_arguments","_priority","_showWindow","_hideOnUse","_shortcut","_condition"];
  _object=_this select 0;
  _action=_this select 1;
  _script=_this select 2;
  if (count _this > 3) then {_arguments = _this select 3};
  if (count _this > 4) then {_priority = _this select 4};
  if (count _this > 5) then {_showWindow = _this select 5};
  if (count _this > 6) then {_hideOnUse = _this select 6};
  if (count _this > 7) then {_shortcut = _this select 7};
  if (count _this > 8) then {_condition = _this select 8};
  if (isNil "_arguments") then {_arguments = []};
  if (isNil "_priority") then {_priority = 100};
  if (isNil "_showWindow") then {_showWindow = TRUE};
  if (isNil "_hideOnUse") then {_hideOnUse = TRUE};
  if (isNil "_shortcut") then {_shortcut = ""};
  if (isNil "_condition") then {_condition = "TRUE"};

  //player sidechat "addaction";
  _action = _object addaction [_action,"functions\vts_addaction.sqf",_arguments,_priority,_showWindow,_hideOnUse,_shortcut,_condition];
  _object setvariable [format["vtsaction_%1",_action],_script,true]; 
  _action;
};
if (isserver) then {publicvariable "vts_AddAction";};

vts_broadcastcommand=
{
	private ["_codetorun","_arg"];
	
	
	_codetorun=_this select 0;;
	_arg="";
	if (count _this>1) then {_arg=_this select 1;};
	
	if (vts_nettype==1) then
	{
			vtsnetcommand=_this;
			publicVariable "vtsnetcommand";
			_arg spawn _codetorun;
	}
	else
	{
		if (isserver) then 
		{
			vtsnetcommand=_this;
			publicVariable "vtsnetcommand";
			_arg spawn _codetorun;
		}
		else
		{
			vtsservernetcommand=_this;
			publicVariableServer "vtsservernetcommand";
		};
	};
	if (vts_debug) then {player globalchat "VTS_DEBUG : Broadcast"};	
};

vts_broadcastedcommand=
{
	private ["_arg"];
	_arg="";
	if (count _this>1) then {_arg=_this select 1;};
	_arg spawn (_this select 0);
	if (vts_debug) then {player globalchat "VTS_DEBUG : Executing broadcasted command"};
};

vts_broadcastcommandlistener=
{
	"vtsnetcommand" addPublicVariableEventHandler 
	{
		(_this select 1) call vts_broadcastedcommand;
	};
};

vts_serverbroadcastcommandlistener=
{
	"vtsservernetcommand" addPublicVariableEventHandler 
	{
		vtsnetcommand=(_this select 1);
		publicVariable "vtsnetcommand";
		_arg="";
		if (count (_this select 1)>1) then {_arg=(_this select 1) select 1;};
		_arg spawn ((_this select 1) select 0);
		if (vts_debug) then {player globalchat "VTS_DEBUG : Executing broadcasted command"};
	};
};

vts_CanSee=
{
	private ["_target","_source","_dirTo","_eyeD","_eyePb","_eyePa","_eyeDV","_cansee","_eyeangle","_eyemin","_eyemax"];
	_cansee=false;
	_source = _this select 0;
	_target = _this select 1;
	_eyeangle=40;
	if (count _this>2) then {_eyeangle=_this select 2;};
	_eyemin=360-_eyeangle;
	_eyemax=_eyeangle;
	_eyeDV = eyeDirection _source;
	_eyeD = ((_eyeDV select 0) atan2 (_eyeDV select 1));
	if (_eyeD < 0) then {_eyeD = 360 + _eyeD};
	_eyePb = eyePos _target;
	_eyePa = eyePos _source;
	_dirTo = ((_eyePb select 0) - (_eyePa select 0)) atan2 ((_eyePb select 1) - (_eyePa select 1));
	_dirTo = _dirTo % 360; 
	if ((abs(_dirTo - _eyeD) >= _eyemax && (abs(_dirTo - _eyeD) <= _eyemin)) || (lineIntersects [_eyePb, _eyePa]) ||(terrainIntersectASL [_eyePb, _eyePa])) then 
	{
		_cansee=false;
	}
	else
	{
		_cansee=true;
	};
	_cansee;
};

vts_isFacing=
{	
	private ["_post","_poss","_target","_source","_eyeangle","_anglemax","_anglemin","_facing","_Dir","_D"];
	_target=_this select 1;
	_source=_this select 0;
	_post=getposasl _target;
	_poss=getposasl _source;
	_eyeangle=40;
	if (count _this>2) then {_eyeangle=_this select 2;};
	_anglemin=360-_eyeangle;
	_anglemax=_eyeangle;	
	_D=direction _source;
	_Dir=((_post select 0) - (_poss select 0)) atan2 ((_post select 1) - (_poss select 1));
	if (_Dir < 0) then {_Dir = 360 + _Dir};

	if ((abs(_Dir - _D) >= _anglemax && (abs(_Dir - _D) <= _anglemin)) ) then 
	{	
		_facing=false;
	}
	else
	{
		_facing=true;
	};
	_facing;	
};

vts_SpyInLosWithInfiltredSide=
{
	private ["_source","_target","_sourceside","_distance","_checkangle","_obj","_sideobj","_i","_nearunits","_listwatching","_listnotwatching","_closestwatching","_dist"];
	_source=_this select 0;
	_distance=_this select 1;
	//_checkdistance=_this select 2;
	_checkangle=_this select 2;
	_sourceside=missionNamespace getvariable ["vts_spyside",nil];
	if (isnil "_sourceside") then {_sourceside=side group _source;};
	
	_closestwatching=objnull;
	_ClosestDistanceWatching=10000;
	_listwatching=[];
	_listnotwatching=[];
	_nearunits= (position _source) nearEntities [["CAManBase", "LandVehicle"], _distance];	
	for "_i" from 0 to (count _nearunits)-1 do
	{
		_obj=_nearunits select _i;
		if (!(isplayer _obj) && (alive _obj)) then
		{
			if !(isnull group _obj) then
			{
				_sideobj=(side group _obj);
				if (((side group _source)==_sideobj) && ((_sourceside getFriend _sideobj)<0.6)) then
				{
					if ([_obj,_source,_checkangle] call vts_CanSee) then
					{
						_listwatching set [count _listwatching,_obj];
						_dist=_source distance _obj;
						if ((_dist min _ClosestDistanceWatching)==_dist) then
						{
							_ClosestDistanceWatching=_dist;
							_closestwatching=_obj;
						};
					}
					else
					{
						_listnotwatching set [count _listnotwatching,_obj];
					};
				};
			};
		};
		sleep 0.001;
	};	
	[_closestwatching,_ClosestDistanceWatching,_listwatching,_listnotwatching];
};


vts_spyFireEvent=
{
	private ["_delay","_delayboardcast","_weaponitems","_silencer","_checkdistance","_angleeye","_shooter","_watcher","_revealvalue","_shotdist","_list"];
	_delay=1;
	_delayboardcast=5;
	_shooter=(_this select 1);
	_shotdist=(_this select 2);
	_revealvalue=75;
	if (isplayer _shooter) then
	{
		if (isnil "vts_infiltratelastfire") then {vts_infiltratelastfire=(time-_delay);};
		if ((vts_infiltratelastfire+_delay)<=time) then
		{
			
			//systemchat "test";
			vts_infiltratelastfire=time;
			_silencer=false;
			_weaponitems=["","",""];	
			call compile "_weaponitems=_shooter weaponAccessories (_this select 3);";
			if !(isnil "_weaponitems") then {if ((_weaponitems select 0)!="") then {_silencer=true;};};
			_revealvalue=75;
			if (_silencer) then {_revealvalue=50;};
			vts_spyreveal=vts_spyreveal+_revealvalue;
			if (vts_spyreveal>500) then {vts_spyreveal=500;};
		};
		
		if (isnil "vts_infiltratelastfirebroadcast") then {vts_infiltratelastfirebroadcast=(time-_delayboardcast);};
		if ((vts_infiltratelastfirebroadcast+_delayboardcast)<=time) then
		{
			vts_infiltratelastfirebroadcast=time;
			_list=nearestObjects [(position _shooter),["CAManBase", "LandVehicle"],_revealvalue]; 
			{if !(alive _x) then {_list=_list-[_x];};} foreach _list;
			if (count _list>5) then {_list resize 5;};
			if (count _list>0) then
			{
				[{_this spawn vts_spylookat;},[_shooter,_list]] call vts_broadcastcommand;
			};
		};
		
	};
};

vts_spylookat=
{
	private ["_unit","_list","_target","_i"];
	_target=_this select 0;
	_list=_this select 1;
	for "_i" from 0 to (count _list)-1 do
	{
		_unit=_list select _i;
		if (local _unit) then
		{
			[_unit,_target] spawn {(_this select 0) dowatch (_this select 1);sleep 5;(_this select 0) dowatch objnull;};
			if (speed _unit>3) then {_unit domove position _target;sleep 2;_unit dofollow leader _unit;};
		};
	};
};

vts_spymodeon=
{
	disableserialization;
	private ["_speedmod","_lastveh","_firedevent","_vehfiredevent","_distancecheck","_watchers","_check","_distance","_infiltred","_obj","_i","_revealdistance","_eyeanglereveal","_originalside","_infside","_newgrp","_oldgrp","_fireevent","_dist","_ctrlui","_maskcolor","_revealvalue"];
	_spy=_this select 0;
	_infside=_this select 1;
	_originalside=missionNamespace getvariable ["vts_spyside",nil];
	if !(isnil "_originalside") exitwith {hint "You're already in infiltration mode";};
	
	if (vts_debug) then {systemchat "Spy On";};
	19459 cutrsc ["vts_spymask","plain"];
	_ctrlui=(uiNamespace getVariable "vts_spyhud_id") displayctrl 1200;
	//enableRadio false;
	_originalside=side group _spy;
	missionNamespace setvariable ["vts_spyside",_originalside];
	_oldgrp=group _spy;
	_newgrp=creategroup _infside;
	[_spy] joinsilent _newgrp;
	deletegroup _oldgrp;
	_spy addrating 100000;
	_lastveh=objnull;
	_distancecheck=100;
	_revealdistance=3;
	_eyeanglereveal=50;
	_firedevent=_spy addEventHandler ["FiredNear",{_this spawn vts_spyFireEvent;}];
	vts_spyreveal=20;
	vts_spyinfiltred=true;
	while {vts_spyinfiltred} do
	{
		//Handle class change, respawn or new unit
		if (_spy!=player) then 
		{
			_spy removeeventhandler ["FiredNear",_firedevent];
			_spy=player;
			_firedevent=_spy addEventHandler ["FiredNear",{_this spawn vts_spyFireEvent;}];
		};
		//Handle vehicles events
		if (vehicle _spy!=_spy) then
		{
			if (isnil "_vehfiredevent") then {_vehfiredevent=(vehicle _spy) addEventHandler ["FiredNear",{_this spawn vts_spyFireEvent;}];_lastveh==(vehicle _spy);};
		}
		else
		{
			if !(isnull _lastveh) then {_lastveh removeeventhandler ["FiredNear",_vehfiredevent];_vehfiredevent=nil;_lastveh=objnull;};
		};
		sleep 0.5;
		_check=[_spy,_distancecheck,_eyeanglereveal] call vts_SpyInLosWithInfiltredSide;
		_dist=_check select 1;
		_watchers=_check select 2;
		_revealvalue=-5;
		_speedmod=1;
		if (vehicle _spy==_spy) then 
		{
			if ((speed _spy)>10) then {_speedmod=3;};
		};
		if (_dist<=(_revealdistance*3*_speedmod)) then {_revealvalue=2.5;};
		if (_dist<=(_revealdistance*2*_speedmod)) then {_revealvalue=7.5;};
		if (_dist<=(_revealdistance)) then {_revealvalue=15;};
		
		vts_spyreveal=vts_spyreveal+_revealvalue;
		if (vts_spyreveal<0) then {vts_spyreveal=0;};
		if (vts_debug) then {systemchat str vts_spyreveal;};
		_maskcolor=[1,1,1,0];
		if (vts_spyreveal>=10) then {_maskcolor=[1,1,1,0.75];};
		if (vts_spyreveal>=25) then {_maskcolor=[1,(100-vts_spyreveal)/100,0,0.75];};
		_ctrlui ctrlSetTextColor _maskcolor;
		if ((vts_spyreveal>=100) && (count _watchers>0)) then 
		{	
			vts_spyinfiltred=false;
		};
	};
	//enableRadio true;
	_spy removeeventhandler ["FiredNear",_firedevent];
	_oldgrp=group _spy;
	_newgrp=creategroup _originalside;
	[_spy] joinsilent _newgrp;
	deletegroup _oldgrp;	
	_spy addrating 100000;
	playsound "reveal";

	if (vts_debug) then {systemchat "Spy Off";};
	for "_i" from 0 to 25 do
	{
		_ctrlui ctrlSetTextColor [0,0.0,0.0,0.75];
		sleep 0.1;
		_ctrlui ctrlSetTextColor [1.0,0,0,0.75];
		sleep 0.1;
	};
	19459 cutFadeOut 0.0;
	if (isnil "vts_spymode_active") then {missionNamespace setvariable ["vts_spyside",nil];};
};

vts_burryDead =
{
	private ["_gen","_caller","_id","_side","_items","_originalside","_uniform"];
	_gen = _this select 0;
	_caller = _this select 1;
	_id = _this select 2 ;
	_caller action ["RepairVehicle",_caller];
	hideBody _gen;
	hintSilent "Body has been hidden.";
	sleep 3;
	hintSilent "";	
};

vts_spystealuniform=
{
	private ["_gen","_caller","_id","_side","_items","_originalside","_uniform"];
	_gen = _this select 0;
	_caller = _this select 1;
	_id = _this select 2 ;
	
	if !(isnil "vts_spymode_active") exitwith {hint "You are already wearing a stolen uniform";playsound "computer";};
	
	_gen removeAction _id;
	_side=_gen getvariable ["vts_unitside",nil];
	if (isnil "_side") exitwith {hint "You are already wearing a stolen uniform"};
	_gen setVariable ["vts_unitside",nil,true];	
	[_caller,_side] spawn vts_spymodeon;
	vts_spymode_active=_caller addEventHandler ["Respawn", {if !(isnil "vts_spymode_active") then {[(_this select 0),"Remove disguise",{_this call vts_spyremoveuniform},[],0,true,true,"",""] call vts_addaction;};}];
	
	hint "You are now disguised, be careful to not behave strangely and avoid getting close to the guards or your cover will be blown";
	playsound "computer";
	
	waituntil {sleep 0.1;(side group _caller)==_side};
	missionNamespace setvariable ['vts_spyoriginaluniform',uniform _caller];
	_items=uniformItems _caller;
	_uniform=uniform _gen;
	//systemchat _uniform;
	[{if !(local (_this select 0)) then {removeuniform (_this select 0);sleep 1;(_this select 0) forceAddUniform (_this select 1);};},[_caller,_uniform]] call vts_broadcastcommand;
	removeuniform _gen;
	sleep 2;
	_caller forceAddUniform _uniform;
	{_caller additemtouniform _x} foreach _items;
	 _caller action ["RepairVehicle",_caller];
	[_gen,"Bury dead body",{_this call vts_burryDead},[],100,true,true,"","!(alive _target)"] call vts_addaction;
	[_caller,"Torn disguise",{_this call vts_spyremoveuniform},[],0,true,true,"",""] call vts_addaction;
};

vts_spyremoveuniform=
{
	private ["_gen","_caller","_id","_side","_items","_uniform","_originalside"];
	_gen = _this select 0;
	_caller = _this select 1;
	_id = _this select 2 ;
	_gen removeAction _id;
	_originalside=missionNamespace getvariable ['vts_spyside',nil];
	_caller removeeventhandler ["Respawn",vts_spymode_active];
	_uniform=missionNamespace getvariable 'vts_spyoriginaluniform';
	missionNamespace setvariable ["vts_spyside",nil];
	hint "Disguise thrown away";
	playsound "computer";
	if (vts_spyinfiltred) then {vts_spyinfiltred=false};
	waituntil {sleep 0.1;(side group _caller)==_originalside};
	_items=uniformItems _caller;
	[{if !(local (_this select 0)) then {removeuniform (_this select 0);sleep 1;(_this select 0) forceAddUniform (_this select 1);};},[_caller,_uniform]] call vts_broadcastcommand;
	//removeuniform _caller;
	sleep 2;
	_caller forceAddUniform _uniform;
	{_caller additemtouniform _x} foreach _items;
	_caller action ["RepairVehicle",_caller];
	//Small sleep to make sure the spymode routine is disabled before allowing to grab a new uniform
	sleep 5;
	vts_spymode_active=nil;
};

vts_isStealableUniform=
{
   private ["_unit","_typeof"];
  _unit=_this select 0;
  _typeof=typeof _unit;
  if !(_typeof iskindof "Man") exitwith {hint "!!! Has stealable uniform Fail : Object is not a Man !!!";};
  if (local _unit) then {	_unit setVariable ["vts_unitside",(side group _unit),true];};
  [_unit,"Disguise as",{_this call vts_spystealuniform},[],100,true,true,"","!(alive _target) && ((typename (_target getVariable [""vts_unitside"",objnull]))!=""object"")"] call vts_addaction;
  "Disguise Set" call vts_gmmessage;
};
if (isserver) then {publicvariable "vts_isStealableUniform";};

vts_isHostagebehavior={
	private ["_hostage","_loop","_help"];
	_hostage=_this select 0;
	_loop=true;
	_help=false;
	_hb=0;
	while {(!isnull _hostage) and (alive _hostage) and (_loop)} do
	{
	
	    //_hostage action ["Surrender",_hostage]; 
		if (((eyepos _hostage select 2)-(getposasl _hostage select 2))>1.5 && (_hb>0)) then {_hostage playactionnow "sitdown";};
		if !(captive _hostage) then {_loop=false;};

		sleep 3;
		//New check on follow since hostage stay captive what ever happen now
		if !(isnull (_hostage getvariable ["vts_dofollow",objnull])) then
		{
			_loop=false;
		};
		_hb=_hb+1;
	};
	if ((alive _hostage) and (!isnull _hostage)) then 
	{
		vtsunituptaded=_hostage;
		_code="";
		if (_help) then
		{
			_code=_code+"
			vtsunituptaded sidechat ""Help me !"";
			if (local vtsunituptaded) then 
			{
				_newgroup = creategroup (vtsunituptaded getVariable ""vts_unitside"");
				[vtsunituptaded] joinsilent _newgroup;
			};
			";
		};
		_code=_code+"
		vtsunituptaded setBehaviour ""COMBAT"";
		vtsunituptaded setcaptive true;
		vtsunituptaded forcespeed -1;
		vtsunituptaded playactionnow ""gear"";
		vtsunituptaded switchmove """";
		";
		call compile format["_code={%1};",_code];
		publicvariable "vtsunituptaded";
		[_code] call vts_broadcastcommand;
	};
};


vts_isHostage={
	private ["_hostage","_typeof"];
  _hostage=_this select 0;
  _typeof=typeof _hostage;
  if !(_typeof iskindof "Man") exitwith {};
  if (local _hostage) then {_hostage setVariable ["vts_unitside",(side group _hostage),true];};
  _hostage allowFleeing 0;
  _hostage setcaptive true;
  removeAllWeapons _hostage;
  _hostage setBehaviour "CARELESS";
  _hostage disableai "FSM";
  _hostage addMPEventHandler ["MPkilled","hint format[""INFO : Hostage killed : %1 by %2 "",name (_this select 0),name (_this select 1)] ;"];
  [_hostage,"""Follow Me""",{[(_this select 0)] joinsilent grpnull;(_this select 1) playactionnow "gesturefollow";(_this select 1) groupchat "Follow me";(_this select 0) setvariable ["vts_dofollow",(_this select 1),true];(_this select 0) forcespeed -1;(_this select 0) setcaptive true;},[],100,true,true,"","alive _target"] call vts_addaction;
  [_hostage,"""Stay here""",{(_this select 1) playactionnow "gestureFreeze";(_this select 1) groupchat "Stay here";(_this select 0) setvariable ["vts_dofollow",objnull,true];(_this select 0) forcespeed 0;},[],100,true,true,"","alive _target"] call vts_addaction;
  _hostage forcespeed 0;
  //Behavior
  if (local _hostage) then 
  {
	[_hostage] spawn vts_isHostagebehavior;
	[_hostage] spawn vts_Isfollowing;
  };
  "Hostage created" call vts_gmmessage;
};
if (isserver) then {publicvariable "vts_isHostage";};

vts_followloop=
{
	private ["_follower","_target","_stancepos","_stance","_speed","_dist","_pos","_newgrp","_oldgrp"];
	_follower=_this select 0;
	_target=_follower getVariable ["vts_dofollow",objnull];
	if !(isnull _target) then
	{
		//Change group of the follower to make sure he doesn't run away or have cover pathfinding with the target
		if ((side group _target)!= (side group _follower)) then
		{
			_oldgrp=group _follower;
			_newgrp=creategroup (side group _target);
			[_follower] joinsilent _newgrp;
			deletegroup _oldgrp;
		};
		if !(alive _target) exitwith 
		{
			if (vehicle _follower!=_follower) then {_follower leaveVehicle (vehicle _follower);moveout _follower;};
			_follower setvariable ["vts_dofollow",objnull,true];
		};
		
		//On foot behavior
		if (vehicle _follower==_follower) then 
		{
			
			_dist=_follower distance _target;
			
			if (_dist>10) then {_speed=100} else {_speed=2};
			if (_dist>5) then 
			{
				_follower forcespeed _speed;
				_pos=getposatl _target;
				_follower domove [(_pos select 0)-2.5+(random 5),(_pos select 1)-2.5+(random 5),(_pos select 2)];
			};
			_stancepos=(eyepos _target select 2)-(getposasl _target select 2);
			//player sidechat str _stancepos;
			switch (true) do
			{
				case (_stancepos<0.5) : {_stance="DOWN"};
				case (_stancepos<1.3) : {_stance="UP"};
				default {_stance="UP";};
			};		
			_follower setunitpos _stance;	
		};
		
		if ((vehicle _target)!=_target) then
		{
			if ((vehicle _follower)!=(vehicle _target)) then 
			{
				if (_dist<20) then 
				{
					if (((vehicle _target) emptyPositions "cargo")>0) then 
					{
						_follower action ["getincargo",(vehicle _target)];
						sleep 1.0;
						_follower moveincargo (vehicle _target);
					};
				};
			};
		};
		//Check if follower is in vehicle then when not in the same vehicle as target (or when he exit)
		if (vehicle _follower!=_follower) then
		{
			if (vehicle _follower!=vehicle _target) then {_follower leaveVehicle (vehicle _follower);moveout _follower;};
		};
	};
	
	
};
if (isserver) then {publicvariable "vts_followloop";};

//Follow behavior
vts_Isfollowing=
{
   private ["_follower","_target"];
	_follower=_this select 0;
	if (count _this>1) then 
	{
		_target=_this select 1;
		_follower setvariable ["vts_dofollow",_target,true];
	};
	while {alive _follower && !(isnull _follower)} do 
	{
		[_follower] spawn vts_followloop;
		sleep 5;
	};
	
};
if (isserver) then {publicvariable "vts_Isfollowing";};

vts_isVIPtoCaptureCheck=
{
	private ["_type","_unit","_arround","_pos","_surrender","_control","_around","_i","_fcontrol","_ocontrol","_o","_distance","_firer","_flos","_olos","_loop"];
	_unit=_this select 0;
	_surrender=false;
	_loop=true;
	
	while {alive _unit && _loop && !(_unit getvariable ["vts_capturevipok",false])} do
	{
		_flos=false;
		_olos=false;
		_control=[0,0];
		_around=(position _unit) nearEntities  ["CAManBase",20];
		for "_i" from 0 to (count _around)-1 do
		{
			_o=_around select _i;
			if (alive _o) then
			{
				_fcontrol=0;
				_ocontrol=0;
				if ((side group _o) getfriend (side group _unit)<0.6) then 
				{					
					if ([_o,_unit] call vts_CanSee) then
					{
						_olos=true;
						_ocontrol=1-(damage _o);
						if ([_unit,_o] call vts_isfacing) then {_flos=true;};
					};
				}
				else 
				{
					if !(lineIntersects [eyepos _o,eyepos _unit,vehicle _o,vehicle _unit]) then
					{
						_fcontrol=1-(damage _o);
					};
				};
				_distance=(_unit distance _o); 
				switch (true) do
				{
					case (_distance<=10) : {_ocontrol=_ocontrol*3;_fcontrol=_fcontrol*3;};
					case (_distance<=20) : {_ocontrol=_ocontrol*2;_fcontrol=_fcontrol*2;};
					default {_ocontrol=_ocontrol*1;_fcontrol=_fcontrol*1;};
				};
				_control=[(_control select 0)+_fcontrol,(_control select 1)+_ocontrol];
				
			};
		};
		_control=[(_control select 0)-(damage _unit),(_control select 1)];
		if (vts_debug) then {systemchat str _control;};

		if (((_control select 1)>(_control select 0)) && _olos && _flos) then
		{
			_loop=false;
		};
		sleep 2;
	};
	
	_surrender=true;
	if (_surrender) then
	{
		_unit setvariable ["vts_capturevipok",true,true];	
		moveout _unit;
		_unit setcaptive true;
		if (alive _unit) then
		{
			_pos=getposatl _unit;
			_ground=createVehicle [vts_weaponholder, _pos, [], 0, "NONE"];
			_ground setposatl _pos;
			_weaps=weapons _unit;
			for "_i" from 0 to (count _weaps)-1 do
			{
			_item=_weaps select _i;
			_ground addweaponcargoglobal [_item,1];
			};
			_mags=magazines _unit;
			for "_i" from 0 to (count _mags)-1 do
			{
			_item=_mags select _i;
			_ground addmagazinecargoglobal [_item,1];
			};			
			removeallweapons _unit;
			removeallitems _unit;
			_unit setunitpos "down";
			_unit forcespeed 0;
			dostop _unit;
			//_unit disableai "FSM";
			_unit setBehaviour "CARELESS";
		};
	};
};

vts_isVIPtoCaptureCheckNeutralize=
{
	private ["_b","_target","_interact"];
	_target=_this select 0;
	_interact=_this select 1;
	_b=false;
	if !(alive _target) exitwith {_b;};
	if !(_target getvariable ["vts_capturevipok",false]) then 
	{
		if ((_target distance _interact)<3) then 
		{
			if !(lineIntersects [(eyepos _target),(eyepos _interact)]) then
			{
				_b=true;
			};
		};
	};
	_b;
};

vts_isVIPtoCapture={
	private ["_hostage","_typeof"];
  _hostage=_this select 0;
  _typeof=typeof _hostage;
  if !(_typeof iskindof "Man") exitwith {};
  if (local _hostage) then {	_hostage setVariable ["vts_unitside",(side group _hostage),true];};
  _hostage addMPEventHandler ["MPkilled","hint format[""INFO : VIP killed : %1 by %2 "",name (_this select 0),name (_this select 1)];"];
  [_hostage,"""Follow Me""",{[(_this select 0)] joinsilent grpnull;(_this select 1) playactionnow "gesturefollow";(_this select 1) groupchat "Follow me";(_this select 0) setvariable ["vts_dofollow",(_this select 1),true];(_this select 0) forcespeed -1;(_this select 0) setcaptive true;},[],100,true,true,"","alive _target && (_target getvariable [""vts_capturevipok"",false])"] call vts_addaction;
  [_hostage,"""Stay here""",{(_this select 1) playactionnow "gestureFreeze";(_this select 1) groupchat "Stay here";(_this select 0) setvariable ["vts_dofollow",objnull,true];(_this select 0) forcespeed 0;},[],100,true,true,"","alive _target && (_target getvariable [""vts_capturevipok"",false])"] call vts_addaction;
  [_hostage,"Neutralize",{(_this select 0) setvariable ["vts_capturevipok",true,true];(_this select 1) playActionNow "ThrowGrenade";},[],100,true,true,"","[_target,_this] call vts_isVIPtoCaptureCheckNeutralize"] call vts_addaction;
  //Behavior
  if (local _hostage) then 
  {
	[_hostage] spawn vts_isVIPtoCaptureCheck;
	[_hostage] spawn vts_Isfollowing;
  }; 
  "VIP to capture created" call vts_gmmessage;
};
if (isserver) then {publicvariable "vts_isVIPtoCapture";};

vts_property_revive=
{
	if (count _this>0) then {vts_object_property=[_this select 0];};
	if ((count vts_object_property)>0) then
	{
		vts_object_modified=[vts_object_property];
		_code=
		{
			{
				if ((local _x) && (isplayer _x)) then
				{
					_x setUnconscious false;
					_x setdamage 0;
					_x setCaptive false;
					_x setvariable["BTC_need_revive",0,true];
					_x playactionnow "agonyStop";
					if (player==_x) then {_txt="You have been revived by a GM";hint _txt;titleText  [_txt,"WHITE IN",5];};
				};
				[_x] spawn 
				{
					sleep 3;
					(_this select 0) switchmove "";	
				};

			} foreach (_this select 0);
		};
		[_code,vts_object_modified] call vts_broadcastcommand;

		(str (vts_object_property)+" been revived and treated") call vts_gmmessage;
	};
};
if (isserver) then {publicvariable "vts_property_revive";};
