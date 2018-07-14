waitUntil {player == player};	
	
	if (MFRETEXTURING) then
	{
		{
			[_x,MF_TextureChoix] execVM "MF\MF_Retexture.sqf";
		
		} forEach vehicles;
	} else {
		{
			[_x] execVM "MF\MF_StandardTexture.sqf";
		} forEach vehicles;
	};
