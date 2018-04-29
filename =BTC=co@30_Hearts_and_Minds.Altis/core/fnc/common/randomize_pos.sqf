params ["_pos", "_random_area", ["_allowwater", false]];

private _return_pos = _pos;

_check_pos = [_pos, _random_area] call CBA_fnc_randPos;

if ((surfaceIsWater _check_pos) && !(_allowwater)) then {
    _return_pos = [_check_pos, 0, _random_area, 13, false] call btc_fnc_findsafepos;
} else {
    _return_pos = _check_pos;
};
_return_pos
