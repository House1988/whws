--游戏主场景数据描述
local f_game_map_data = {}
	
	local ext = ".pvr"
	if device.platform == "android" then 
		ext = ".pkm" 
	elseif device.platform == "ios" then
		ext = ".pvr"
	elseif device.platform == "mac" or device.platform == "windows" then   
		ext = ".png" 
	end

	f_game_map_data.mapConfig = 	{
		top = {
		
		{g_game.g_resourceManager:getMainCityMap("top_1"), {256, 256}},
		{g_game.g_resourceManager:getMainCityMap("top_2"), {256, 256}},
		{g_game.g_resourceManager:getMainCityMap("top_3"), {256, 256}},
		{g_game.g_resourceManager:getMainCityMap("top_4"), {256, 256}},
		{g_game.g_resourceManager:getMainCityMap("top_5"), {256, 256}},
		{g_game.g_resourceManager:getMainCityMap("top_6"), {256, 256}},
		{g_game.g_resourceManager:getMainCityMap("top_7"), {256, 256}},
		{g_game.g_resourceManager:getMainCityMap("top_8"), {256, 256}},
		{g_game.g_resourceManager:getMainCityMap("top_9"), {256, 256}},
		{g_game.g_resourceManager:getMainCityMap("top_10"), {256, 256}}
		},
		bottom = {
		{g_game.g_resourceManager:getMainCityMap("bottom_1"), {512, 512}},
		{g_game.g_resourceManager:getMainCityMap("bottom_2"), {512, 512}},
		{g_game.g_resourceManager:getMainCityMap("bottom_3"), {512, 512}},
		{g_game.g_resourceManager:getMainCityMap("bottom_4"), {512, 512}},
		{g_game.g_resourceManager:getMainCityMap("bottom_5"), {512, 512}}
		},
		strategy_left = 48,	--地图左侧弹性距离
		strategy_right = 48, --地图右侧弹性距离
		
		map_width = 2560,
		map_height = 768,
		map_default_pos = {-700, g_game.g_display.sizeInPixels.height/2}
	}


return f_game_map_data
