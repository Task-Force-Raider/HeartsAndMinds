
/* ----------------------------------------------------------------------------
Function: btc_fnc_mil_add_eh

Description:
    Fill me when you edit me !

Parameters:
    _unit - [Object]

Returns:

Examples:
    (begin example)
        _result = [] call btc_fnc_mil_add_eh;
    (end)

Author:
    Giallustio

---------------------------------------------------------------------------- */

params [
    ["_unit", objNull, [objNull]]
];

[_unit, "Killed", "btc_fnc_mil_unit_killed"] call btc_fnc_eh_persistOnLocalityChange;

true
