params ["_city", "_area", "_n", "_wp"];

if (_city isEqualType objNull) then {
    _city = position _city;
};

private _rpos = [_city, _area, btc_p_sea] call btc_fnc_randomize_pos;

private _unit_type = "";
private _pos_iswater = surfaceIsWater _rpos;
if (_pos_iswater) then {
    _unit_type = selectRandom btc_type_divers;
} else {
    _unit_type = selectRandom btc_type_units;
    private _newpos = _rpos findEmptyPosition [0, 40, _unit_type];
    if !(_newpos isEqualTo []) then {
        _rpos = _newpos;
    };
    _rpos = [_rpos] call btc_fnc_findPosOutsideRock;
};

private _group = createGroup btc_enemy_side;
[_group createUnit [_unit_type, _rpos, [], 0, "NONE"]] joinSilent _group;
(leader _group) setPos _rpos;
private _groups = [];
_groups pushBack _group;
private _structure = objNull;

switch (true) do {
    case (_wp < 0.3) : {
        private _structures = [_rpos, 70] call btc_fnc_mil_getStructures;
        if !(_structures isEqualTo []) then {
            _structure = selectRandom _structures;
            _n = count (_structure buildingPos -1);
            if (_n > 8) then {
                _n = 2;
            } else {
                _n = floor(_n/2);
            };
            for "_i" from 0 to _n do {
                [_group createUnit [selectRandom btc_type_units, _rpos, [], 0, "NONE"]] joinSilent _group;
                sleep 0.5;
            };
        } else {
            private _houses = [_rpos, 50] call btc_fnc_getHouses;
            if !(_houses isEqualTo []) then {
                _structure = selectRandom _houses;
            } else {
                [_group, _rpos, _area, 2 + floor (random 4), "MOVE", "SAFE", "RED", ["LIMITED", "NORMAL"] select ((vehicle leader _group) isKindOf "Air"), "STAG COLUMN", "", [5, 10, 20]] call CBA_fnc_taskPatrol;
            };
        };
    };
    case (_wp > 0.3 && _wp < 0.75) : {
        [_group, _rpos, _area, 2 + floor (random 4), "MOVE", "SAFE", "RED", ["LIMITED", "NORMAL"] select ((vehicle leader _group) isKindOf "Air"), "STAG COLUMN", "", [5, 10, 20]] call CBA_fnc_taskPatrol;
    };
    case (_wp > 0.75) : {
        [_group, _rpos, 0, "SENTRY", "AWARE", "RED"] call CBA_fnc_addWaypoint;
    };
};
if (_structure isEqualTo objNull) then {
    for "_i" from 0 to _n do {
        private _unit_type = [selectRandom btc_type_units, selectRandom btc_type_divers] select _pos_iswater;
        [_group createUnit [_unit_type, _rpos, [], 0, "NONE"]] joinSilent _group;
        sleep 0.5;
    };
} else {
    {
        private _grp = createGroup btc_enemy_side;
        [_x] joinSilent _grp;
        _grp setVariable ["inHouse", typeOf _structure];
        [_grp, _structure] spawn btc_fnc_house_addWP;
        _groups pushBack _grp;
    } forEach units _group;
};

{_x call btc_fnc_mil_unit_create;} foreach units _group;

if (btc_debug_log) then {diag_log format ["btc_fnc_mil_create_group: _this = %1 ; POS %2 UNITS N %3", _this, _rpos, count units _group];};

_groups
