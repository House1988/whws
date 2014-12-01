--[[--
    新手指引管理类，管理创建所有状态指引
--]]--
require("scripts.game.guidelines.f_guidelines_text_show_panel")
local f_lua_guidelines_manager = class("f_lua_guidelines_manager")
f_lua_guidelines_manager.__index = f_lua_guidelines_manager


-------------------------------------------------
-- @function [parent=#f_lua_guidelines_manager] ctor
-------------------------------------------------
function f_lua_guidelines_manager:ctor()	
	--新手指引文本
	self.m_guidelines_text_table = {}
	self.m_guidelines_text_table[1]	= 294--"小桂子：皇上您终于来啦，小桂子等您好久啦！今天是可是您荣登大典的好日子，群臣都在等候皇上，还请皇上赶快移驾金銮殿吧！"
	self.m_guidelines_text_table[2]	= 295--"礼部尚书：恭贺皇上荣登大典，国不可一日无号，还请皇上尽快定夺本朝年号。"
	self.m_guidelines_text_table[4]	= 296 --"小桂子：皇上，早朝已经结束了，还请皇上赶快退朝休息吧，保重龙体重要哦，还有好多妃子在等您呢，嘿嘿！"
	self.m_guidelines_text_table[5]	= 297--"小桂子：皇上，今天是您登基第一天，妃子们都已经沐浴更衣好了，迫不及待的等着您呐！您快去瞧瞧吧！"
	self.m_guidelines_text_table[8]	= 298 --"小桂子： 皇上，您对妃子还满意吗？要是不满意，下回小桂子给您找更好的来！对了，刚刚兵部尚书来找皇上，貌似有要紧的事禀报，还请皇上赶快去瞧瞧吧！"
	self.m_guidelines_text_table[9]	= 299 --"兵部尚书：皇上，大事不妙，刚刚接到陕甘总督奏报，葛尔丹在漠北起兵，情况万分紧急，还请皇上尽快派兵征讨"
	self.m_guidelines_text_table[13]	= 300--"吏部尚书：皇上，我军虽然取胜，但是也损失惨重。国难思良将，如今我军良将匮乏，不如进行科举选材，或可寻得猛将谋士一二，替皇上分忧啊！"
	self.m_guidelines_text_table[14]	= 301--"吏部尚书： 科举同样分为乡试、会试、殿试三种，选得的人才肯定也是各不相同，现在情况紧急，我们还是进行档次最高的殿试吧！"
	self.m_guidelines_text_table[15]	=302-- "兵部尚书：皇上，良将已得，还是赶快将他派遣上阵吧！"
	self.m_guidelines_text_table[16]	=303-- "兵部尚书：皇上，前方战事吃紧，葛尔丹再次出兵侵扰，还是赶快安排新得的大将，上阵出战吧！"
	self.m_guidelines_text_table[20]	= 304--"兵部尚书： 皇上，兵马粮草已经全部备齐了，赶快派兵前往征讨葛尔丹吧，此次出征定能大获全胜！"
	self.m_guidelines_text_table[24]	= 305--"韦小宝：皇上，内务府最近从民间找到了一批绝色美女，赶快去挑一个吧！"
	self.m_guidelines_text_table[25]	= 306--"韦小宝：在集市里可以进行选秀哦，马上就可以看到美女啦，皇上激动吗？"
	self.m_guidelines_text_table[26]	= 307--"韦小宝：选秀分为乡选、会选、殿选三个档次，美女的质量也各有不同，这次当然是选质量最高的殿选啦！"
	self.m_guidelines_text_table[27]	= 308--"韦小宝：皇上的眼光真是一顶一的好，刚才选的美女真是绝色天香啊，小宝对皇上的敬仰就如滔滔江水延绵不绝，又如黄河泛滥，一发不可收拾……"
	self.m_guidelines_text_table[28]	= 309--"小桂子：皇上，这就是汤泉行宫啦，是妃子们陪伴皇上的地方，以后皇上要是想找哪位妃子，一定记得来这里哦！"
	self.m_guidelines_text_table[30]	= 310--"韦小宝：皇上，后宫美女虽多，但是人人勾心斗角，难免无事生非，不如让心仪的美人宫斗掉其他不中意的，宫斗后美女会升级，助阵效果也会提高哦！"
	self.m_guidelines_text_table[38]	= 311--"韦小宝：皇上，升级后的名臣，属性会大幅提升！如果战斗有困难，一定记得来给名臣升级哦！"
	self.m_guidelines_text_table[39]	= 312--"韦小宝：皇上，敌军逃散之后，好像留下了一件装备，赶快给咱们的武将装备上吧！有了装备，我军的战斗力就更强啦！"
	self.m_guidelines_text_table[48]	= 313--"小桂子：皇上，听说您今日登基，番邦纷纷送上贺礼，赶快去瞧瞧有什么好东西吧！"
	self.m_guidelines_text_table[51]	= 314--"兵部尚书： 皇上，新得的大将是否很英勇啊！不过，大将虽然天生神力，也同样要注意后天培养！只有不断训练，才能成为一代名将！"
	self.m_guidelines_text_table[55]	= 315--"兵部尚书：皇上，赶快去看看名臣培养之后的效果吧！"
	self.m_guidelines_text_table[56]	= 316--"兵部尚书： 皇上，敌军被打的丢盔卸甲，狼狈逃窜而去。我军正好军备稀缺，何不将收缴来的武器，给我军将士装备上？"
	self.m_guidelines_text_table[58]	= 317--"兵部尚书： 皇上，装备的威力可是很大的哦，赶快去找个倒霉鬼试试看吧！"
	self.m_guidelines_text_table[61]	= 318--"户部尚书：启禀皇上，今日民间疾苦甚多，各地百姓请愿的折子，纷纷送达京城，还请皇上亲自批阅"
	self.m_guidelines_text_table[62]	= 319--"户部尚书：皇上，文治武功缺一不可，能做到内可平定天下，受百姓爱戴，外可征讨四方，让万国朝贺，才能称得上千古一帝啊！"
	
	
	self.m_guidelines_person_image_table = {}
	self.m_guidelines_person_image_table[1] = "nobatch/xiaotaijian.png"
	self.m_guidelines_person_image_table[2] = "nobatch/guidelines_dachen.png"
	self.m_guidelines_person_image_table[4] = "nobatch/xiaotaijian.png"
	self.m_guidelines_person_image_table[5] = "nobatch/xiaotaijian.png"
	self.m_guidelines_person_image_table[8] = "nobatch/xiaotaijian.png"
	self.m_guidelines_person_image_table[9] = "nobatch/guidelines_dachen.png"
	self.m_guidelines_person_image_table[13] = "nobatch/guidelines_dachen.png"
	self.m_guidelines_person_image_table[14] = "nobatch/guidelines_dachen.png"
	self.m_guidelines_person_image_table[15] = "nobatch/guidelines_dachen.png"
	self.m_guidelines_person_image_table[16] = "nobatch/guidelines_dachen.png"
	self.m_guidelines_person_image_table[20] = "nobatch/guidelines_dachen.png"
	self.m_guidelines_person_image_table[24] = "nobatch/xiaotaijian.png"
	self.m_guidelines_person_image_table[25] = "nobatch/xiaotaijian.png"
	self.m_guidelines_person_image_table[26] = "nobatch/xiaotaijian.png"
	self.m_guidelines_person_image_table[27] = "nobatch/xiaotaijian.png"
	self.m_guidelines_person_image_table[28] = "nobatch/xiaotaijian.png"
	self.m_guidelines_person_image_table[30] = "nobatch/xiaotaijian.png"
	self.m_guidelines_person_image_table[38] = "nobatch/xiaotaijian.png"
	self.m_guidelines_person_image_table[39] = "nobatch/xiaotaijian.png"
	self.m_guidelines_person_image_table[48] = "nobatch/xiaotaijian.png"
	self.m_guidelines_person_image_table[51] = "nobatch/guidelines_dachen.png"
	self.m_guidelines_person_image_table[55] = "nobatch/guidelines_dachen.png"
	self.m_guidelines_person_image_table[56] = "nobatch/guidelines_dachen.png"
	self.m_guidelines_person_image_table[58] = "nobatch/guidelines_dachen.png"
	self.m_guidelines_person_image_table[61] = "nobatch/guidelines_dachen.png"
	self.m_guidelines_person_image_table[62] = "nobatch/guidelines_dachen.png"
	
	self.m_component	= nil
	
	self.m_is_inited = false
	self.m_need_guidelines = false
	
	self.m_guildelines_array = {}
	
	self.GUIDELINES_MAX_COUNT	= 65
	self.m_inBrunchGuildLine = false
	
	self.m_clickBtnTable = {["paibing"] = 0, ["huodong"] = 0, ["guoqing"] = 0, ["shangchen"] = 0, ["guoku"] = 0, ["baye"] = 0, ["kaifu"] = 0, ["chongzhi"] = 0,
	 ["shouchong"] = 0, ["keju"] = 0, ["xuanxiu"] = 0, ["paihang"] = 0,																				
	["hougong"] = 0, ["jinluandian"] = 0, ["donggong"] = 0, ["junjichu"] = 0, ["deshengmen"] = 0, ["cangshuge"] = 0, ["xunfang"] = 0,["officerCardLvupClose"] = 0,["paibingClose"]=0,["equipDetailClose"]=0,
	["jitian"] = 0}
end

-------------------------------------------------------------------------------
-- @function [parent=#f_lua_guidelines_manager] setBrunchGuildline
-- 设置是否在分支引导
-------------------------------------------------------------------------------
function f_lua_guidelines_manager:setBrunchGuildline(isIn)
	self.m_inBrunchGuildLine = isIn
end

-------------------------------------------------------------------------------
-- @function [parent=#f_lua_guidelines_manager] isBrunchGuildline
-- 是否在分支引导
-------------------------------------------------------------------------------
function f_lua_guidelines_manager:isBrunchGuildline()
	return self.m_inBrunchGuildLine
end

-------------------------------------------------------------------------------
-- @function [parent=#f_lua_guidelines_manager] canBtnClick
-- 能否点击按钮
-------------------------------------------------------------------------------
function f_lua_guidelines_manager:canBtnClick(key)
	if g_game.g_utilManager:allGuidelinesIsFinish() and not self.m_inBrunchGuildLine  then
		return true
	end
	if self.m_clickBtnTable[key] == nil then	
		return true
	end
	return self.m_clickBtnTable[key] == 1
end

-------------------------------------------------------------------------------
-- @function [parent=#f_lua_guidelines_manager] enableBtnAndDisOther
-- 设置按钮能否点击
-------------------------------------------------------------------------------
function f_lua_guidelines_manager:enableBtnAndDisOther(key)
	for k,v in pairs(self.m_clickBtnTable) do	
		if k == key then
			self.m_clickBtnTable[k] = 1
		else 
			self.m_clickBtnTable[k] = 0
		end 
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_lua_guidelines_manager] disableAllBtn
-- 设置全部不能点击
-------------------------------------------------------------------------------
function f_lua_guidelines_manager:disableAllBtn()
	for k,v in pairs(self.m_clickBtnTable) do
		self.m_clickBtnTable[k] = 0	
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_lua_guidelines_manager] preInitGuidelines
-- 预初始化新手指引管理
-------------------------------------------------------------------------------
function f_lua_guidelines_manager:preInitGuidelines()	
	self.m_current_guidelines_index = g_game.g_userInfoManager:getCurrentGuidleStep()--从服务器或者本地记录文件中获取当前指引步骤
	
	if self.m_is_inited == true then
		g_game.g_gameManager:removeUpdateObj(self)
		self.m_guildelines_array = {}
	end
	self.m_is_inited = true
	self.m_need_guidelines = true --获取记录状态是否需要开启新手指引
	
	if self.m_current_guidelines_index > self.GUIDELINES_MAX_COUNT then
		self.m_need_guidelines = false --指引结束
	end

	if self.m_current_guidelines_index < 1 then
		self.m_current_guidelines_index = 1	
	end
	
	self:updateGuidelinesState()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_lua_guidelines_manager] updateGuidelinesState
-- 更新新手指引状态
-------------------------------------------------------------------------------
function f_lua_guidelines_manager:updateGuidelinesState()
--	local userLevel = g_game.g_userInfoManager:getLevel()
	if self.m_need_guidelines then			
		for i = 1, self.GUIDELINES_MAX_COUNT do
			local guidelinesItem = require("scripts.game.guidelines.f_guidelines_" .. i).new()
			guidelinesItem:setGuidelinesManager(self)		
			table.insert(self.m_guildelines_array, guidelinesItem)		
		end		
		if DEBUG_ENABLE_GUIDELINES then
			g_game.g_gameManager:addUpdateObj(self)
		end
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_lua_guidelines_manager] update
-- 新手指引管理类心跳
-------------------------------------------------------------------------------
function f_lua_guidelines_manager:update(dt)
	if self.m_current_guidelines_index <= #self.m_guildelines_array then	
		self.m_guildelines_array[self.m_current_guidelines_index]:update(dt)
		if self.m_guildelines_array[self.m_current_guidelines_index]:guidelinesFinish() then
			self.m_current_guidelines_index = self.m_guildelines_array[self.m_current_guidelines_index]:guidelinesNextIndex()
			print("next index::"..self.m_current_guidelines_index)
		end
		
		if self.m_current_guidelines_index > self.GUIDELINES_MAX_COUNT then
			self.m_need_guidelines = false
			g_game.g_director:getRunningScene():getGameMap():setTouchEnabled(true)
			g_game.g_gameManager:removeUpdateObj(self)
		end
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_lua_guidelines_manager] guidelinesIsFinish
-- 主线新手指引是否完成
-------------------------------------------------------------------------------
function f_lua_guidelines_manager:guidelinesIsFinish()
	if DEBUG_ENABLE_GUIDELINES == true then
		return self.m_need_guidelines == false
	else
		return true
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_lua_guidelines_manager] initComponent
-- 初始化新手指引使用的一系列组件
-------------------------------------------------------------------------------
function f_lua_guidelines_manager:initComponent()
	if self.m_need_guidelines then
	
		self.m_component = require("scripts.extend.f_lua_stencil_panel").new()
		
		self.m_component:setVisible(false)
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_lua_guidelines_manager] getComponent
-- 获取新手指引使用的一系列组件
-------------------------------------------------------------------------------
function f_lua_guidelines_manager:getComponent()
	return self.m_component
end


-------------------------------------------------------------------------------
-- @function [parent=#f_lua_guidelines_manager] getGuidelinesText
-- 获取新手指引文本
-------------------------------------------------------------------------------
function f_lua_guidelines_manager:getGuidelinesText(guidelinesIndex)
	local id = self.m_guidelines_text_table[guidelinesIndex]
	return  g_game.g_dictConfigManager:getLanTextById(id)
end



-------------------------------------------------------------------------------
-- @function [parent=#f_lua_guidelines_manager] getGuidelinesPerson
-- 获取新手指引圣旨大臣
-------------------------------------------------------------------------------
function f_lua_guidelines_manager:getGuidelinesPerson(guidelinesIndex)
	return self.m_guidelines_person_image_table[guidelinesIndex]
end


return f_lua_guidelines_manager