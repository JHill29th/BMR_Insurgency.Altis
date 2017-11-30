//capture_n_hold.sqf by Jigsor

sleep 2;
params ["_newZone","_type"];
private ["_rnum","_fireF","_cap_rad","_VarName","_uncaped","_caped","_ins_debug","_objmkr","_outpost","_grp","_stat_grp","_handle","_tskW","_tasktopicW","_taskdescW","_tskE","_tasktopicE","_taskdescE","_fireF","_sfCount","_smokePos","_manArray","_text","_rwave","_hold_rad","_defender_rad","_currTime","_defenderArr","_defcnt","_holdTime","_staticGuns"];

_rnum = str(round (random 999));
_fireF = 1;
_cap_rad = 25;
_hold_rad = 50;
_defender_rad = 200;
_VarName = "OutPost1";
_uncaped = true;
_caped = true;
_ins_debug = if (DebugEnabled isEqualTo 1) then {TRUE}else{FALSE};

if !(_ins_debug) then {
	waitUntil {sleep 2; time > 300};//wait until server time sync
};

//Positional info
objective_pos_logic setPos _newZone;
_objmkr = createMarker ["ObjectiveMkr", _newZone];
"ObjectiveMkr" setMarkerShape "ELLIPSE";
"ObjectiveMkr" setMarkerSize [2, 2];
"ObjectiveMkr" setMarkerShape "ICON";
"ObjectiveMkr" setMarkerType "mil_dot";
"ObjectiveMkr" setMarkerColor "ColorRed";
"ObjectiveMkr" setMarkerText "Capture and Hold";

//Spawn Objective Object
_outpost = createVehicle [_type, _newZone, [], 0, "NONE"];
sleep jig_tvt_globalsleep;

_outpost setDir (random 359);
_outpost setVectorUp [0,0,1];
_outpost setVehicleVarName _VarName;
_outpost Call Compile Format ["%1=_This ; PublicVariable ""%1""",_VarName];

//Spawn Objective enemy defences
_grp = [_newZone,10] call spawn_Op4_grp; sleep 3;
_stat_grp = [_newZone,3,12] call spawn_Op4_StatDef;

//movement
_handle=[_grp, position objective_pos_logic, 75] call BIS_fnc_taskPatrol;
if (_ins_debug) then {[_grp] spawn INS_Tsk_GrpMkrs;};

//create west task
_tskW = "tskW_Cap_n_Hold" + _rnum;
_tasktopicW = localize "STR_BMR_Tsk_topicW_cnho";
_taskdescW = localize "STR_BMR_Tsk_descW_cnho";
[_tskW,_tasktopicW,_taskdescW,WEST,[],"created",_newZone] call SHK_Taskmaster_add;
sleep 5;
//create east task
_tskE = "tskE_Cap_n_Hold" + _rnum;
_tasktopicE = localize "STR_BMR_Tsk_topicE_cnho";
_taskdescE = localize "STR_BMR_Tsk_descE_cnho";
[_tskE,_tasktopicE,_taskdescE,EAST,[],"created",_newZone] call SHK_Taskmaster_add;

if (daytime > 3.00 && daytime < 5.00) then {[] spawn {[[], "INS_fog_effect"] call BIS_fnc_mp};};

while {_uncaped} do {
	if (_fireF isEqualTo 1) then {
		if ((daytime > 20.00) || (daytime < 4.00)) then {
			_sfCount = [1,6] call BIS_fnc_randomInt;
			null=[_sfCount,1,220,"red",100,_newZone] spawn Drop_SmokeFlare_fnc;
			_fireF = 2;
		};
	}else{
		if (_fireF isEqualTo 9) then {_fireF = 1;}else{_fireF = _fireF +1;};
	};

	_manArray = objective_pos_logic nearEntities ["CAManBase", _cap_rad];
	{
		if ((!(side _x == INS_Blu_side)) || (captiveNum _x isEqualTo 1)) then {
			_manArray = _manArray - [_x];
		};
	} forEach _manArray;
	sleep 4;
	if ((count _manArray) > 0) exitWith {_uncaped = false};
};
waitUntil {!_uncaped};

if (timesup) then {timesup = false;};
"timesup" addPublicVariableEventHandler {call compile format ["%1",_this select 1]};

_text = format [localize "STR_BMR_outpost_caped"];
[[_text],"JIG_MPsideChatWest_fnc"] call BIS_fnc_mp;

_defenderArr = objective_pos_logic nearEntities ["CAManBase", _defender_rad];
{
	if ((!(side _x == INS_Blu_side)) || (captiveNum _x isEqualTo 1)) then {
		_defenderArr = _defenderArr - [_x];
	};
} forEach _defenderArr;
sleep 3;
if (isNil "_defenderArr") then {_defenderArr = [];};
private _defcnt = count _defenderArr;

switch (true) do {
	case (_defcnt isEqualTo 2) : {_holdTime = 7;};
	case (_defcnt isEqualTo 3) : {_holdTime = 8;};
	case (_defcnt isEqualTo 4) : {_holdTime = 9;};
	case (_defcnt isEqualTo 5) : {_holdTime = 10;};
	case (_defcnt isEqualTo 6) : {_holdTime = 11;};
	case (_defcnt isEqualTo 7) : {_holdTime = 12;};
	case (_defcnt > 7) : {_holdTime = 13;};
	default {_holdTime = 7;};
};

_currTime = time;
if (_ins_debug) then {diag_log format["TIMER PARAMETERS Server Time %1 Timer Length %2 Defenders %3", _currTime, _holdTime, _defcnt];};

//[[[_currTime,false,_holdTime," Hold Outpost"],"scripts\Timer.sqf"],"BIS_fnc_execVM",true] call BIS_fnc_MP;//with JIP persistance
[[[_currTime,false,_holdTime," Hold Outpost"],"scripts\Timer.sqf"],"BIS_fnc_execVM"] call BIS_fnc_MP;// without JIP persistance

_rwave = [_newZone,_ins_debug,_defcnt] spawn {

	params ["_newZone","_ins_debug","_defcnt"];
	private ["_start_dis","_cnhWaveUnits","_cnhWaveGrps","_c","_start_pos1","_midLength","_midDir","_midPos","_pointC","_rgrp1","_newPosw","_wp","_bellDir"];

	_cnhWaveUnits = [];
	_cnhWaveGrps = [];
	curvePosArr = [];
	_c = 0;
	makewave = true;

	"makewave" addPublicVariableEventHandler {call compile format ["%1",_this select 1]};

	while {makewave} do	{
		if (floor random 2 isEqualTo 0) then {_bellDir = 90;}else{_bellDir = 270;};

		//Thanks to Larrow for this next block. Creates 2D obtuse isosceles triangle points.
		_start_dis = [250,400] call BIS_fnc_randomInt;
		_start_pos1 = [_newZone, 10, _start_dis, 10, 0, 0.6, 0] call BIS_fnc_findSafePos;
		_midLength = ( _newZone distance _start_pos1 ) / 2;
		_midDir = objective_pos_logic getRelDir _start_pos1;
		_midPos = [ _newZone, _midLength, _midDir ] call BIS_fnc_relPos;
		_pointC = [ _midPos, _midLength - 1, (_midDir + _bellDir) ] call BIS_fnc_relPos;

		if (count curvePosArr > 0) then {curvePosArr = curvePosArr - curvePosArr};

		curvePosArr = [_start_pos1,_newZone,_pointC,12,false,_ins_debug] call rej_fnc_bezier;

		private _count = 0;

		while {curvePosArr isEqualTo []} do	{
			curvePosArr = [_start_pos1,_newZone,_pointC,12,false,_ins_debug] call rej_fnc_bezier;
			if !(curvePosArr isEqualTo []) exitWith {};
			_count = _count + 1;
			if (_count > 3) exitWith {if (_ins_debug) then {hintSilent "Empty curvePosArr"}; curvePosArr = []};
			sleep 3;
		};
		if (curvePosArr isEqualTo []) exitWith {makewave = false; publicVariable "makewave";};

		if (count curvePosArr > 0) then	{
			_rgrp1 = [_start_pos1,6] call spawn_Op4_grp; sleep 1;

			_cnhWaveGrps pushBack _rgrp1;
			{_cnhWaveUnits pushBack _x;} forEach (units _rgrp1);

			_sfCount = [3,8] call BIS_fnc_randomInt;
			_smokePos = (curvePosArr select 6);
			null=[_sfCount,0,215,"red",50,_smokePos] spawn Drop_SmokeFlare_fnc;

			//reinforcement/wave group movement
			for "_i" from 0 to (count curvePosArr) -1 do {
				private _newPosx = (curvePosArr select 0);

				_wp = _rgrp1 addWaypoint [_newPosx, 0];
				_wp setWaypointType "MOVE";
				_wp setWaypointSpeed "NORMAL";
				_wp setWaypointBehaviour "AWARE";
				_wp setWaypointFormation "COLUMN";
				_wp setWaypointCompletionRadius 20;

				curvePosArr deleteAt 0;
				sleep 0.2;
			};
			if (_ins_debug) then {[_rgrp1] spawn INS_Tsk_GrpMkrs};

			sleep 27;
			if (diag_fps < 26 || _defcnt < 3) then {sleep 27};
			if (!makewave) exitWith {};

			_c = _c + 1;
			if (_c > 14) then {timesup = true; publicVariable "timesup"; sleep 3; makewave = false; publicVariableServer "makewave";};//added to combat runaway loop on dedi, happens when no player has timer.
		};
	};

	sleep 20;
	{deleteVehicle _x; sleep 0.1} forEach (units _rgrp1);
	deleteGroup _rgrp1; sleep 0.1;

	[_cnhWaveUnits,_cnhWaveGrps] spawn {
		params ["_unitsArr","_grpsArr"];
		sleep 120;
		{if (alive _x) then {deleteVehicle _x; sleep 0.1}} forEach _unitsArr;
		{deleteGroup _x} count _grpsArr;
	};
};

while {_caped} do {
	_manArray = objective_pos_logic nearEntities [["CAManBase","Landvehicle"],_hold_rad];

	{
		if ((!(side _x == INS_Blu_side)) || (captiveNum _x isEqualTo 1)) then {
			_manArray = _manArray - [_x];
		};
	} forEach _manArray;

	if ((count _manArray) < 1) exitWith	{
		makewave = false;publicVariable "makewave"; sleep 2;
		killtime = true;publicVariable "killtime"; sleep 2;
		[_tskE, "succeeded"] call SHK_Taskmaster_upd;
		[_tskW, "failed"] call SHK_Taskmaster_upd;
		_caped = false;
	};

	if (timesup) exitWith {
		makewave = false;publicVariable "makewave"; sleep 2;
		killtime = true;publicVariable "killtime"; sleep 2;
		[_tskW, "succeeded"] call SHK_Taskmaster_upd;
		[_tskE, "failed"] call SHK_Taskmaster_upd;
		_caped = false;
	};
	sleep 4;
};

//clean up
"ObjectiveMkr" setMarkerAlpha 0;
sleep 180;

if (!isNull _outpost) then {deleteVehicle _outpost};

{deleteVehicle _x; sleep 0.1} forEach (units _grp),(units _stat_grp);
{deleteGroup _x} forEach [_grp, _stat_grp];
_staticGuns = objective_pos_logic getVariable "INS_ObjectiveStatics";
{deleteVehicle _x} forEach _staticGuns;

{if (typeOf _x in INS_men_list) then {deleteVehicle _x; sleep 0.1}} forEach (NearestObjects [objective_pos_logic, [], 40]);
{if (typeOf _x in objective_ruins) then {deleteVehicle _x}} forEach (NearestObjects [objective_pos_logic, [], 30]);

deleteMarker "ObjectiveMkr";

if (true) exitWith {sleep 20; nul = [] execVM "Objectives\random_objectives.sqf"};