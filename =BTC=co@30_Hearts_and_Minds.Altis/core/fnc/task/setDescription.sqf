
/* ----------------------------------------------------------------------------
Function: btc_fnc_task_setDescription

Description:
    Set description to created task accordingly to player language.

Parameters:
    _task_ids - ID of the task. [String]
    _side - Side of the player. [Side]
    _description - Number of the corresponding description. [Number]
    _destination - Destination of the task. [Object or Array]
    _priority - Task priority. [Number]
    _showNotification - Show notification. [Boolean]
    _location - Custom information to fill the task description. [String or Array]

Returns:

Examples:
    (begin example)
        ["btc_1", btc_player_side, -1] remoteExecCall ["btc_fnc_task_setDescription", [0, -2] select isDedicated, true];
    (end)

Author:
    Vdauphin

---------------------------------------------------------------------------- */

params [
    ["_task_ids", [], ["", []]],
    ["_side", west, [west]],
    ["_description", 0, [0]],
    ["_destination", [], [objNull, []]],
    ["_priority", 2, [0]],
    ["_showNotification", true, [true]],
    ["_location", "", ["", []]]
];

private _type = "";
private _image = "<br/><img image='%1' width='355' height='200'/>";
switch (_description) do {
    case -1 : {
        _description = [
            localize "STR_BTC_HAM_MISSION_OBJ_DESC",
            localize "STR_BTC_HAM_MISSION_OBJ_TITLE",
            localize "STR_BTC_HAM_MISSION_OBJ_TITLE"
        ];
        _type = "documents";
    };
    case 0 : {
        _description = [
            localize "STR_BTC_HAM_MISSION_DEFEAT_DESC",
            localize "STR_BTC_HAM_MISSION_DEFEAT_TITLE",
            localize "STR_BTC_HAM_MISSION_DEFEAT_TITLE"
        ];
        _type = "kill";
    };
    case 1 : {
        _description = [
            localize "STR_BTC_HAM_MISSION_DESTROY_DESC",
            localize "STR_BTC_HAM_MISSION_DESTROY_TITLE",
            localize "STR_BTC_HAM_MISSION_DESTROY_TITLE"
        ];
        _type = "destroy";
    };
    case 2 : {
        _description = [
            localize "STR_BTC_HAM_O_COMMON_SHOWHINTS_6",
            localize "STR_BTC_HAM_MISSION_SEIZE_TITLE",
            localize "STR_BTC_HAM_MISSION_SEIZE_TITLE"
        ];
        _type = "map";
    };
    case 3 : {
        _description = [
            format [localize "STR_BTC_HAM_SIDE_SUPPLIES_DESC", _location],
            format [localize "STR_BTC_HAM_SIDE_SUPPLIES_TITLE", _location],
            format [localize "STR_BTC_HAM_SIDE_SUPPLIES_TITLE", _location]
        ];
        _type = "container";
    };
    case 4 : {
        _description = [
            format [localize "STR_BTC_HAM_SIDE_MINES_DESC", _location],
            format [localize "STR_BTC_HAM_SIDE_MINES_TITLE", _location],
            format [localize "STR_BTC_HAM_SIDE_MINES_TITLE", _location]
        ];
        _type = "mine";
    };
    case 5 : {
        _location params ["_loc", "_vehicleType"];
        _description = [
            (format [localize "STR_BTC_HAM_SIDE_VEHICLE_DESC", _loc]) + format [_image, getText (configfile >> "CfgVehicles" >> _vehicleType >> "editorPreview")],
            format [localize "STR_BTC_HAM_SIDE_VEHICLE_TITLE", _loc],
            format [localize "STR_BTC_HAM_SIDE_VEHICLE_TITLE", _loc]
        ];
        _type = "repair";
    };
    case 6 : {
        _description = [
            format [localize "STR_BTC_HAM_SIDE_CONQUER_DESC", _location],
            format [localize "STR_BTC_HAM_SIDE_CONQUER_TITLE", _location],
            format [localize "STR_BTC_HAM_SIDE_CONQUER_TITLE", _location]
        ];
        _type = "attack";
    };
    case 7 : {
        _location params ["_loc", "_towerType"];
        _description = [
            (format [localize "STR_BTC_HAM_SIDE_TOWER_DESC", _loc]) + format [_image, getText (configfile >> "CfgVehicles" >> _towerType >> "editorPreview")],
            format [localize "STR_BTC_HAM_SIDE_TOWER_TITLE", _loc],
            format [localize "STR_BTC_HAM_SIDE_TOWER_TITLE", _loc]
        ];
        _type = "destroy";
    };
    case 8 : {
        _description = [
            format [localize "STR_BTC_HAM_SIDE_CIVTREAT_DESC", _location],
            format [localize "STR_BTC_HAM_SIDE_CIVTREAT_TITLE", _location],
            format [localize "STR_BTC_HAM_SIDE_CIVTREAT_TITLE", _location]
        ];
        _type = "heal";
    };
    case 9 : {
        _description = [
            format [localize "STR_BTC_HAM_SIDE_CHECKPOINT_DESC", _location],
            format [localize "STR_BTC_HAM_SIDE_CHECKPOINT_TITLE", _location],
            format [localize "STR_BTC_HAM_SIDE_CHECKPOINT_TITLE", _location]
        ];
        _type = "destroy";
    };
    case 10 : {
        _location params ["_loc", "_vehicleType"];
        _description = [
            (format [localize "STR_BTC_HAM_SIDE_CIVTREATBOAT_DESC", _loc]) + format [_image, getText (configfile >> "CfgVehicles" >> _vehicleType >> "editorPreview")],
            format [localize "STR_BTC_HAM_SIDE_CIVTREATBOAT_TITLE", _loc],
            format [localize "STR_BTC_HAM_SIDE_CIVTREATBOAT_TITLE", _loc]
        ];
        _type = "heal";
    };
    case 11 : {
        _location params ["_loc", "_vehicleType"];
        _description = [
            (format [localize "STR_BTC_HAM_SIDE_UNDERWATER_DESC", _loc]) + format [_image, getText (configfile >> "CfgVehicles" >> _vehicleType >> "editorPreview")],
            format [localize "STR_BTC_HAM_SIDE_UNDERWATER_TITLE", _loc],
            format [localize "STR_BTC_HAM_SIDE_UNDERWATER_TITLE", _loc]
        ];
        _type = "destroy";
    };
    case 12 : {
        _description = [
            format [localize "STR_BTC_HAM_SIDE_CONVOY_DESC", _location],
            format [localize "STR_BTC_HAM_SIDE_CONVOY_TITLE", _location],
            format [localize "STR_BTC_HAM_SIDE_CONVOY_TITLE", _location]
        ];
        _type = "car";
    };
    case 13 : {
        _description = [
            format [localize "STR_BTC_HAM_SIDE_RESC_DESC", _location],
            format [localize "STR_BTC_HAM_SIDE_RESC_TITLE", _location],
            format [localize "STR_BTC_HAM_SIDE_RESC_TITLE", _location]
        ];
        _type = "heli";
    };
    case 14 : {
        _description = [
            format [localize "STR_BTC_HAM_SIDE_CAPOFF_DESC", _location],
            format [localize "STR_BTC_HAM_SIDE_CAPOFF_TITLE", _location],
            format [localize "STR_BTC_HAM_SIDE_CAPOFF_TITLE", _location]
        ];
        _type = "run";
    };
    case 15 : {
        _location params ["_loc", "_hostageType"];
        _description = [
            (format [localize "STR_BTC_HAM_SIDE_HOSTAGE_DESC", _loc]) + format [_image, getText (configfile >> "CfgVehicles" >> _hostageType >> "editorPreview")],
            format [localize "STR_BTC_HAM_SIDE_HOSTAGE_TITLE", _loc],
            format [localize "STR_BTC_HAM_SIDE_HOSTAGE_TITLE", _loc]
        ];
        _type = "handcuff";
    };
    case 16 : {
        _description = [
            format [localize "STR_BTC_HAM_SIDE_HACK_DESC", _location],
            format [localize "STR_BTC_HAM_SIDE_HACK_TITLE", _location],
            format [localize "STR_BTC_HAM_SIDE_HACK_TITLE", _location]
        ];
        _type = "defend";
    };
    case 17 : {
        _description = [
            localize "STR_BTC_HAM_SIDE_HACK_OPEN_DESC" + format [_image, getText (configfile >> "CfgVehicles" >> _location >> "editorPreview")],
            localize "STR_BTC_HAM_SIDE_HACK_OPEN_TITLE",
            localize "STR_BTC_HAM_SIDE_HACK_OPEN_TITLE"
        ];
        _type = "interact";
    };
    case 18 : {
        _description = [
            localize "STR_BTC_HAM_SIDE_SUPPLIES_MOVE_DESC" + format [_image, getText (configfile >> "CfgVehicles" >> _location >> "editorPreview")],
            localize "STR_BTC_HAM_SIDE_SUPPLIES_MOVE_TITLE",
            localize "STR_BTC_HAM_SIDE_SUPPLIES_MOVE_TITLE"
        ];
        _type = "move";
    };
    case 19 : {
        _description = [
            localize "STR_BTC_HAM_SIDE_SUPPLIES_UNLOAD_DESC" + format [_image, getText (configfile >> "CfgVehicles" >> _location >> "editorPreview")],
            localize "STR_BTC_HAM_SIDE_SUPPLIES_UNLOAD_TITLE",
            localize "STR_BTC_HAM_SIDE_SUPPLIES_UNLOAD_TITLE"
        ];
        _type = "box";
    };
    case 20 : {
        _description = [
            localize "STR_BTC_HAM_SIDE_RESC_FIND_DESC" + format [_image, getText (configfile >> "CfgVehicles" >> _location >> "editorPreview")],
            localize "STR_BTC_HAM_SIDE_RESC_FIND_TITLE",
            localize "STR_BTC_HAM_SIDE_RESC_FIND_TITLE"
        ];
        _type = "scout";
    };
    case 21 : {
        _description = [
            localize "STR_BTC_HAM_SIDE_RESC_BACK_DESC" + format [_image, getText (configfile >> "CfgVehicles" >> _location >> "editorPreview")],
            localize "STR_BTC_HAM_SIDE_RESC_BACK_TITLE",
            localize "STR_BTC_HAM_SIDE_RESC_BACK_TITLE"
        ];
        _type = "move";
    };
    case 22 : {
        _description = [
            localize "STR_BTC_HAM_SIDE_HACK_STARTHACK" + format [_image, getText (configfile >> "CfgVehicles" >> _location >> "editorPreview")],
            localize "STR_BTC_HAM_SIDE_HACK_DEFEND_TITLE",
            localize "STR_BTC_HAM_SIDE_HACK_DEFEND_TITLE"
        ];
        _type = "defend";
    };
    case 23 : {
        _description = [
            localize "STR_BTC_HAM_SIDE_CHECKPOINT_DESTROY_DESC" + format [_image, getText (configfile >> "CfgVehicles" >> _location >> "editorPreview")],
            localize "STR_BTC_HAM_SIDE_CHECKPOINT_DESTROY_TITLE",
            localize "STR_BTC_HAM_SIDE_CHECKPOINT_DESTROY_TITLE"
        ];
        _type = "destroy";
    };
    case 24 : {
        _description = [
            localize "STR_BTC_HAM_SIDE_CAPOFF_SURRENDER_DESC" + format [_image, getText (configfile >> "CfgVehicles" >> _location >> "editorPreview")],
            localize "STR_BTC_HAM_SIDE_CAPOFF_SURRENDER_TITLE",
            localize "STR_BTC_HAM_SIDE_CAPOFF_SURRENDER_TITLE"
        ];
        _type = "surrender";
    };
};

[
    _task_ids, _side, _description, _destination,
    _task_id call BIS_fnc_taskState,
    _priority, false, false, _type
] call BIS_fnc_setTask;

if !(_showNotification) exitWith {};

private _task_id = if (_task_ids isEqualType []) then {
    _task_ids select 0
} else {
    _task_ids
};
[
    {!isNull player && {scriptDone btc_intro_done}},
    {
        params ["_task_id"];

        if !(_task_id call BIS_fnc_taskCompleted) then {
            _task_id call BIS_fnc_taskHint;
        };
    },
    _task_id
] call CBA_fnc_waitUntilAndExecute;
