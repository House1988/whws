local FLuaResourceManager = class("FLuaResourceManager", function()
    return fc.FResourceManager:getInstance()
end)

-------------------------------------------------------------------------------
-- @function [parent=#FLuaResourceManager] ctor
-- 构造函数
-------------------------------------------------------------------------------
function FLuaResourceManager:ctor()
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaResourceManager] getMsgpackPath
-- 获取msgpack消息文件目录
-------------------------------------------------------------------------------
function FLuaResourceManager:getMsgpackPath()
	return "msg/"
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaResourceManager] getFontPath
-- 获取字体文件路径
-------------------------------------------------------------------------------
function FLuaResourceManager:getFontPath()
	return "font/"
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaResourceManager] getStoryImage
-- 获取剧情文件
-------------------------------------------------------------------------------
function FLuaResourceManager:getStoryImage(path)
	return "story/"..path..".png"
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaResourceManager] getImageFontPath
-- 获取图片字体文件路径
-------------------------------------------------------------------------------
function FLuaResourceManager:getImageFontPath(type)
	if type == g_game.g_f_image_font_type.F_BLUE_TYPE then
		return self:getFontPath() .. "blue_number.fnt"
	elseif type == g_game.g_f_image_font_type.F_RED_TYPE then
		return self:getFontPath() .. "red_number.fnt"
	elseif type == g_game.g_f_image_font_type.F_YELLOW_TYPE then
		return self:getFontPath() .. "yellow_number.fnt"	
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaResourceManager] getBatchUIPath
-- 获取大图路径
-------------------------------------------------------------------------------
function FLuaResourceManager:getBatchUIPath()
	return "batch_ui/"
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaResourceManager] getBatchFile
-- 获取大图文件路径
-------------------------------------------------------------------------------
function FLuaResourceManager:getBatchUIPath(file)
	return "batch_ui/" .. file .. ".m"
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaResourceManager] getCardHead
-- 获取卡牌头像
-------------------------------------------------------------------------------
function FLuaResourceManager:getCardHead(cardId)
	return "card_head/" .. cardId .. ".png"
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaResourceManager] getSoldierImage
-- 获取兵种头像
-------------------------------------------------------------------------------
function FLuaResourceManager:getSoldierImage(soldierName)
	return "soldier_icon/" .. soldierName .. ".jpg"
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaResourceManager] getCard
-- 获取卡牌
-------------------------------------------------------------------------------
function FLuaResourceManager:getCard(cardId)
	return "card/" .. cardId .. ".png"
end
-------------------------------------------------------------------------------
-- @function [parent=#FLuaResourceManager] getImage
-- 获取图片
-------------------------------------------------------------------------------
function FLuaResourceManager:getImage(image)
	return "batch_ui/" .. image .. ".png"
end
-------------------------------------------------------------------------------
-- @function [parent=#FLuaResourceManager] getNobatchImage
-- 获取nobatch图片
-------------------------------------------------------------------------------
function FLuaResourceManager:getNobatchImage(image)
	return "nobatch/" .. image .. ".png"
end
-------------------------------------------------------------------------------
-- @function [parent=#FLuaResourceManager] getSkillNameImage
-- 获取技能名称图片
-------------------------------------------------------------------------------
function FLuaResourceManager:getSkillNameImage(image)
	return "skill_name/" .. image .. ".png"
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaResourceManager] getSkillIconImage
-- 获取技能icon图片
-------------------------------------------------------------------------------
function FLuaResourceManager:getSkillIconImage(image)
	return "skill_icon/" .. image .. ".png"
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaResourceManager] getStageImage
-- 获取技能名称图片
-------------------------------------------------------------------------------
function FLuaResourceManager:getStageImage(image)
	return "stage/" .. image .. ".png"
end


-------------------------------------------------------------------------------
-- @function [parent=#FLuaResourceManager] getBeautyCardHead
-- 获取美女头像image
-------------------------------------------------------------------------------
function FLuaResourceManager:getBeautyCardHead(image)
	return "beauty_head/" .. image ..".png"
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaResourceManager] getBeautyDressedImage
-- 获取穿衣服的美女 image
-------------------------------------------------------------------------------
function FLuaResourceManager:getBeautyDressedImage(image)
	return "beauty_card/" .. image .."01.png"
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaResourceManager] getBeautyNakedImage
-- 获取脱了点衣服的美女 image
-------------------------------------------------------------------------------
function FLuaResourceManager:getBeautyNakedImage(image)
--	if DEBUG_SDK_TYPE == 14 or DEBUG_SDK_TYPE == 38 or DEBUG_SDK_TYPE == 39 then
	if  DEBUG_SDK_TYPE == 38 or DEBUG_SDK_TYPE == 39 then
		return "beauty_card/" .. image .."02.png"
	else
		return "beauty_card/" .. image .."01.png"
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaResourceManager] getItemImage
-- 获取道具图片
-------------------------------------------------------------------------------
function FLuaResourceManager:getItemImage(image)
	return "item/" .. image ..".png"
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaResourceManager] getPrinceImage
-- 获取皇子图像
-------------------------------------------------------------------------------
function FLuaResourceManager:getPrinceImage(image)
	return "prince_card/" .. image ..".png"
end
-------------------------------------------------------------------------------
-- @function [parent=#FLuaResourceManager] getPrinceHeadImage
-- 获取皇子头像图像
-------------------------------------------------------------------------------
function FLuaResourceManager:getPrinceHeadImage(image)
	return "prince_head/" .. image ..".png"
end
-------------------------------------------------------------------------------
-- @function [parent=#FLuaResourceManager] getSkillImage
-- 获取技能图标
-------------------------------------------------------------------------------
function FLuaResourceManager:getSkillImage(image)
	return "skill_icon/" .. image ..".png"
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaResourceManager] getBuilding
-- 获取建筑图片
-------------------------------------------------------------------------------
function FLuaResourceManager:getBuilding(resourceId)
	return "batch_ui/" .. resourceId .. ".png"
end


-------------------------------------------------------------------------------
-- @function [parent=#FLuaResourceManager] getBattleMap
-- 获取战斗地图
-------------------------------------------------------------------------------
function FLuaResourceManager:getBattleMap(resourceId)
	if device.platform == "android" then 
		return "android_map/battle/" .. resourceId .. ".pkm"
	elseif device.platform == "ios" then
		return "ios_map/battle/" .. resourceId .. ".pvr"
	elseif device.platform == "mac" or device.platform == "windows" then   
		return "win32_map/battle/" .. resourceId .. ".png"
	end
	return ""
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaResourceManager] getPrinceSkillBg
-- 获取皇子技能背景
-------------------------------------------------------------------------------
function FLuaResourceManager:getPrinceSkillBg(resourceId)
	if device.platform == "android" then 
		return "android_map/prince_skill_bg/" .. resourceId .. ".pkm"
	elseif device.platform == "ios" then
		return "ios_map/prince_skill_bg/" .. resourceId .. ".pvr"
	elseif device.platform == "mac" or device.platform == "windows" then   
		return "win32_map/prince_skill_bg/" .. resourceId .. ".png"
	end
	return ""
end


-------------------------------------------------------------------------------
-- @function [parent=#FLuaResourceManager] getUiMap
-- 获取ui的 大图 
-------------------------------------------------------------------------------
function FLuaResourceManager:getUiMap(resourceId)
	if device.platform == "android" then 
		if resourceId == "paihangbangbeijing" then
			return "android_map/ui/" .. resourceId .. ".png"
		else
			return "android_map/ui/" .. resourceId .. ".pkm"
		end
	elseif device.platform == "ios" then
		return "ios_map/ui/" .. resourceId .. ".pvr"
	elseif device.platform == "mac" or device.platform == "windows" then  
		if resourceId == "paihangbangbeijing" then
			return "win32_map/ui/" .. resourceId .. ".png"
		else
			return "win32_map/ui/" .. resourceId .. ".png"
		end
	end
	return ""
end


-------------------------------------------------------------------------------
-- @function [parent=#FLuaResourceManager] getMainCityMap
-- 主场景地图
-------------------------------------------------------------------------------
function FLuaResourceManager:getMainCityMap(resourceId)
	if device.platform == "android" then 
		return "android_map/main/" .. resourceId .. ".pkm"
	elseif device.platform == "ios" then
		return "ios_map/main/" .. resourceId .. ".pvr"
	elseif device.platform == "mac" or device.platform == "windows" then  
		return "win32_map/main/" .. resourceId .. ".png"
	end
	return ""
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaResourceManager] getEffectResource
-- 获取特效资源
-------------------------------------------------------------------------------
function FLuaResourceManager:getEffectResource(resourceId)
--	return "animation/gongjian_test_output/gongjian_test.plist", "animation/gongjian_test_output/gongjian_test.png", "animation/gongjian_test_output/gongjian_test.xml" 
	return "animation/" .. resourceId .. "/" .. resourceId .. ".plist","animation/" .. resourceId .. "/" .. resourceId .. ".png","animation/" .. resourceId .. "/" .. resourceId .. ".xml"
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaResourceManager] getParticleEffectResource
-- 获取粒子特效资源
-------------------------------------------------------------------------------
function FLuaResourceManager:getParticleEffectResource(resourceId)
	return "animation/particle/" .. resourceId .. ".plist"
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaResourceManager] preloadFAnimation
-------------------------------------------------------------------------------
function FLuaResourceManager:preloadFAnimation(resourceId)
	local animationPlist, animationPng, animationDes = self:getEffectResource(resourceId)
	ccs.ArmatureDataManager:getInstance():addArmatureFileInfo(animationDes)
	ccs.ArmatureDataManager:getInstance():addSpriteFrameFromFile(animationPlist,animationPng,animationDes)
end

-------------------------------------------------------------------------------
-- @function [parent=#FLuaResourceManager] removeFAnimation
-------------------------------------------------------------------------------
function FLuaResourceManager:removeFAnimation(resourceId)
	local animationPlist, animationPng, animationDes = self:getEffectResource(resourceId)
	ccs.ArmatureDataManager:getInstance():removeArmatureFileInfo(animationDes)
    cc.Director:getInstance():getTextureCache():removeUnusedTextures()
end

return FLuaResourceManager