













Sqx_Markers_Marker_CreateIconMarker = { 
    params [
    "_position", 
    ["_type", "hd_dot"], 
    ["_color", "ColorBlack"], 
    ["_text", ""], 
    ["_isVisible", true]]; (


    ([_position, "ICON", [1, 1], 0, _type, _color, "Solid", _text, 0.4, _isVisible] call cl_Sqx_Markers_Marker_constructor)) };



Sqx_Markers_Marker_CreateShapeMarker = { 
    params [
    "_position", 
    ["_shape", "RECTANGLE"], 
    ["_size", [50, 50]], 
    ["_direction", 0], 
    ["_color", "ColorBlack"], 
    ["_brush", "Solid"], 
    ["_text", ""], 
    ["_alpha", 0.4], 
    ["_isVisible", true]]; (


    ([_position, _shape, _size, _direction, _color, _brush, _text, _alpha, _isVisible] call cl_Sqx_Markers_Marker_constructor)) };



Sqx_Markers_Marker_CreateMarkerFromMarker = { 
    params ["_marker"]; (












    ([getMarkerPos _marker, markerShape _marker, markerSize _marker, markerDir _marker, markerType _marker, markerColor _marker, markerBrush _marker, markerText _marker, markerAlpha _marker, true] call cl_Sqx_Markers_Marker_constructor)) };







cl_Sqx_Markers_Marker_constructor = { private "_class_fields"; _class_fields = [["Sqx_Markers_Marker", []]];
    params [
    "_position", 
    ["_shape", "ICON"], 
    ["_size", [1, 1]], 
    ["_direction", 0], 
    ["_type", "hd_dot"], 
    ["_color", "ColorBlack"], 
    ["_brush", "Solid"], 
    ["_text", ""], 
    ["_alpha", 0.4], 
    ["_isVisible", true], 
    ["_name", ""]];


    if (isNil "Sqx_Markers_Marker_CurrentId") then {
        Sqx_Markers_Marker_CurrentId = 1; };



    if (_name == "") then {
        _name = "Sqx_Markers_Marker_" + str Sqx_Markers_Marker_CurrentId;
        Sqx_Markers_Marker_CurrentId = Sqx_Markers_Marker_CurrentId + 1; };


    _class_fields set [9, _name];
    _class_fields set [10, _position];
    _class_fields set [11, _isVisible];
    _class_fields set [12, false];

    _class_fields set [1, _shape];
    _class_fields set [2, _size];
    _class_fields set [3, _direction];
    _class_fields set [4, _type];
    _class_fields set [5, _color];
    _class_fields set [6, _brush];
    _class_fields set [7, _text];
    _class_fields set [8, _alpha];


    if ((_class_fields select 11)) then {
        ([_class_fields, []] call cl_Sqx_Markers_Marker_Draw); }; _class_fields };




cl_Sqx_Markers_Marker_Draw = { params ["_class_fields", "_this"];
    private _name = (_class_fields select 9);

    createMarker [_name, (_class_fields select 10)];
    _name setMarkerShape (_class_fields select 1);
    _name setMarkerSize (_class_fields select 2);
    _name setMarkerDir (_class_fields select 3);
    _name setMarkerType (_class_fields select 4);
    _name setMarkerColor (_class_fields select 5);
    _name setMarkerBrush (_class_fields select 6);
    _name setMarkerText (_class_fields select 7);
    _name setMarkerAlpha (_class_fields select 8); };



cl_Sqx_Markers_Marker_Name_PropIndex = 9;


cl_Sqx_Markers_Marker_Position_PropIndex = 10;


cl_Sqx_Markers_Marker_IsVisible_PropIndex = 11;


cl_Sqx_Markers_Marker_IsBlinking_PropIndex = 12;


cl_Sqx_Markers_Marker_Show = { params ["_class_fields", "_this"];
    if (!(_class_fields select 11)) then {
        _class_fields set [11, true];
        ([_class_fields, []] call cl_Sqx_Markers_Marker_Draw); }; };




cl_Sqx_Markers_Marker_Hide = { params ["_class_fields", "_this"];
    if ((_class_fields select 11)) then {
        deleteMarker (_class_fields select 9);
        _class_fields set [11, false];
        _class_fields set [12, false]; }; };





cl_Sqx_Markers_Marker_StartBlinking = { params ["_class_fields", "_this"];
    params ["_interval"];

    if (!(_class_fields select 12)) then {
        _class_fields set [12, true];
        ([_class_fields, [_interval]] spawn cl_Sqx_Markers_Marker_DoBlink); }; };




cl_Sqx_Markers_Marker_StopBlinking = { params ["_class_fields", "_this"];
    _class_fields set [12, false];

    if ((_class_fields select 11)) then {
        ([_class_fields, []] call cl_Sqx_Markers_Marker_Draw); }; };





cl_Sqx_Markers_Marker_DoBlink = { params ["_class_fields", "_this"];
    params ["_interval"];

    private _blinkVisible = true;

    while { (_class_fields select 12) } do {
        if (_blinkVisible) then {
            deleteMarker (_class_fields select 9); } else { 


            ([_class_fields, []] call cl_Sqx_Markers_Marker_Draw); };


        _blinkVisible = !_blinkVisible;
        sleep _interval; }; };





cl_Sqx_Markers_Marker_SetPosition = { params ["_class_fields", "_this"];
    params ["_position"];

    if (!(_position isEqualTo (_class_fields select 10))) then {
        _class_fields set [10, _position];

        if ((_class_fields select 11)) then {
            ((_class_fields select 9)) setMarkerPos _position; }; }; };