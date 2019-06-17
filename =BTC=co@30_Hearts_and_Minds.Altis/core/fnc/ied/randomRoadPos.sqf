
/* ----------------------------------------------------------------------------
Function: btc_fnc_ied_randomRoadPos

Description:
    Find a position on a road based on the road width.
    The selection of the position is random (left, right or center).

Parameters:
    _road - Road segment. [Object]

Returns:
    Array:
        _this select 0: Position. [Array]
        _this select 1: Directon. [Number]

Examples:
    (begin example)
        _result = [(player nearRoads 20)#0] call btc_fnc_ied_randomRoadPos;
        player setPos _result#0;
        player setDir _result#1;
    (end)

Author:
    kuemmel

---------------------------------------------------------------------------- */
params [
    ["_road", objNull, [objNull]]
];
private _roadDir = _road call btc_fnc_road_direction;
private _roadRadius = ((0 boundingBoxReal _road) select 2) * 0.4;

private _cond = switch (btc_p_ied_placement) do {
    case 0: {floor random 2};
    case 1: {-1};
    default {floor random 3};
};

switch (_cond) do {
    case 0: {
        [_road getPos [_roadRadius, _roadDir + 90], _roadDir]
    };
    case 1: {
        [_road getPos [_roadRadius, _roadDir - 90], _roadDir]
    };
    default {
        [_road getPos [_roadRadius * 0.5 - random(_roadRadius * 0.4), _roadDir + (90 * selectRandom [-1, 1])], random 360]
    };
};
