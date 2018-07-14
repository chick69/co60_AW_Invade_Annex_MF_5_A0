// Started from init_Client.sqf
// execVM "scripts\3d_markers.sqf";

onEachFrame
{
    private["_vis","_pos","_name","_pic","_offset"];
    {
        if(player distance _x < 64 && alive _x && _x != player) then
        {
            _vis = lineIntersects [eyePos player, eyePos _x,player, _x];
            if(!_vis) then
            {
                _pos = visiblePosition _x;
				_color = [0,0.64,0,1];
				_name = "";
				_pic = "";
				_offset = 2.5;
				switch (typeof _x) do 
				{
					case "B_supplyCrate_F": {
						_name = "Ammo Box";
						_pic = "\a3\ui_f\data\map\Markers\NATO\b_support.paa";};
					case "B_Slingload_01_Ammo_F": {
						_name = "FOB Ammo Box";
						_pic = "\a3\ui_f\data\map\Markers\NATO\b_service.paa";
						_offset = 1.5; };
					case "Land_BagBunker_Large_F": {
						_name = "Squad manager HQ";
						_pic = "\a3\ui_f\data\map\Markers\NATO\b_service.paa";};
					case "B_officer_F": {
						_name = "Change team";
						_pic = "\a3\ui_f\data\map\Markers\NATO\b_inf.paa";};
					case "Land_Laptop_unfolded_F": {
						_name = "View setting";
						_pic = "\a3\ui_f\data\map\Markers\NATO\b_service.paa";
						_offset = 1.5; };	
					case "Logic": {
						_name = "Get in";
						_pic = "\a3\ui_f\data\IGUI\Cfg\Cursors\getIn_ca.paa";
						_offset = 0.5; };		
					default {_name = "Default";};
				};
				_pos set[2,(getPosATLVisual _x select 2) + _offset];
                drawIcon3D [_pic,_color,_pos,1,1,0,_name,0,0.04];
            };
        };
    } foreach [AL1,AL2,AL3,AL4,AL5,ALB1,west_respawn_tent];
};

if (true) exitWith {};