require("scripts.auto.auto_jump_tip_popup1")

f_jump_tip_popup = class("f_jump_tip_popup")
f_jump_tip_popup.__index = f_jump_tip_popup

-------------------------------------------------------------------------------
-- @function [parent=#f_jump_tip_popup] static_create
-------------------------------------------------------------------------------
function f_jump_tip_popup.static_create()
	local infoTable = createjump_tip_popup1()
	local panel = infoTable["jump_tip_popup1"]
	
	local funTable = {}
	tolua.setpeer(panel, funTable)
	setmetatable(funTable, f_jump_tip_popup)
	panel.m_componentTable = infoTable
	panel:initAllComponent()
	
	return panel
end

-------------------------------------------------------------------------------
-- @function [parent=#f_jump_tip_popup] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_jump_tip_popup:initAllComponent()
	
	self.m_leftHandler = nil
	self.m_rightHandler = nil
	
	local cpTable = self.m_componentTable
	
	-- 关闭按钮
    local closeBtnCallback = function()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
		g_game.g_panelManager:removeUiPanel("jump_tip_popup")
	end
	cpTable["jtp_close_btn"]:setTouchRectAdjust(g_game.RECT_OFFSET)
	cpTable["jtp_close_btn"]:addHandleOfcomponentEvent(closeBtnCallback, g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	-- 左侧按钮
    local leftBtnCallback = function()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
		if self.m_leftHandler ~= nil then
			self.m_leftHandler()
		end
	end
	cpTable["jtp_left_btn"]:addHandleOfcomponentEvent(leftBtnCallback, g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	-- 右侧按钮
    local rightBtnCallback = function()
		send_lua_event(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU)
		if self.m_rightHandler ~= nil then
			self.m_rightHandler()
		end
	end
	cpTable["jtp_right_btn"]:addHandleOfcomponentEvent(rightBtnCallback, g_game.g_f_touch_event.F_TOUCH_UPINSIDE)
	
	-- 弹出动作
	self:setScale(0.1)
	local actionTo = CCScaleTo:create(0.5,1)
	self:runAction(cc.EaseBounceOut:create(actionTo))
end

-------------------------------------------------------------------------------
-- @function [parent=#f_jump_tip_popup] setBtnHandler
-------------------------------------------------------------------------------
function f_jump_tip_popup:setBtnHandler(leftHandler, rightHandler)
	self.m_leftHandler = leftHandler
	self.m_rightHandler = rightHandler
end

-------------------------------------------------------------------------------
-- @function [parent=#f_jump_tip_popup] setPanelByType
-------------------------------------------------------------------------------
function f_jump_tip_popup:setPanelByType(type)
	local cpTable = self.m_componentTable
	
	if type == 1 then
		-- 1后宫宠幸提示
		self:setBtnNameByType(cpTable["jtp_left_btn"], {"qu_uizi","xiao_uizi"})
		self:setBtnNameByType(cpTable["jtp_right_btn"], {"shang_uizi","ci_uizi"})
		
		if LANGUAGE_TYPE == 3 then
			self:setContent("興趣值不足，賞賜美女可以增加美女的興趣值，\n現在賞賜？")
		else
			self:setContent("兴趣值不足，赏赐美女可以增加美女的兴趣值，\n现在赏赐？")
		end
		
	elseif type == 6 then
		-- 6征税
		self:setBtnNameByType(cpTable["jtp_left_btn"], {"qu_uizi","xiao_uizi"})
		cpTable["jtp_right_btn"]:setButtonImage("batch_ui/teshuanniu.png")
		self:setBtnNameByType(cpTable["jtp_right_btn"], {"chong_uizi","zhi_uizi"})
		
		if LANGUAGE_TYPE == 3 then
			self:setContent("征稅次數不足！\nVIP等級越高，可征稅次數越多！\n是否立即前往充值升級VIP？")
		else	
			self:setContent("征税次数不足！\nVIP等级越高，可征税次数越多！\n是否立即前往充值升级VIP？")
		end
		
	elseif type == 7 then
		-- 7东宫无子
		self:setBtnNameByType(cpTable["jtp_left_btn"], {"qu_uizi","xiao_uizi"})
		cpTable["jtp_right_btn"]:setButtonImage("batch_ui/teshuanniu.png")
		self:setBtnNameByType(cpTable["jtp_right_btn"], {"tang_uizi","quan3_uizi","xing_uizi","gong_uizi"})
		
		if LANGUAGE_TYPE == 3 then
			self:setContent("後宮-湯泉行宮 寵幸娘娘有機率懷孕\n生子，立即前往？")
		else
			self:setContent("后宫-汤泉行宫 宠幸娘娘有几率怀孕\n生子，立即前往？")
		end
		
	elseif type == 8 then
		-- 8皇子督军
		self:setBtnNameByType(cpTable["jtp_left_btn"], {"qu_uizi","xiao_uizi"})
		cpTable["jtp_right_btn"]:setButtonImage("batch_ui/teshuanniu.png")
		self:setBtnNameByType(cpTable["jtp_right_btn"], {"dong_uizi","gong_uizi"})
		
		if LANGUAGE_TYPE == 3 then
			self:setContent("5級及以上皇子可上陣督軍，\n可在東宮中躍龍門為皇子升級，\n立即前往？")
		else
			self:setContent("5级及以上皇子可上阵督军，\n可在东宫中跃龙门为皇子升级，\n立即前往？")
		end
		
	elseif type == 81 then
		-- 8选秀
		self:setBtnNameByType(cpTable["jtp_left_btn"], {"qu_uizi","xiao_uizi"})
		cpTable["jtp_right_btn"]:setButtonImage("batch_ui/teshuanniu.png")
		self:setBtnNameByType(cpTable["jtp_right_btn"], {"xuan_uizi","xiu_uizi"})
		
		if LANGUAGE_TYPE == 3 then
			self:setContent("選秀必得美女，立即前往？")
		else
			self:setContent("选秀必得美女，立即前往？")
		end
		
	elseif type == 9 then
		-- 9科举
		self:setBtnNameByType(cpTable["jtp_left_btn"], {"qu_uizi","xiao_uizi"})
		cpTable["jtp_right_btn"]:setButtonImage("batch_ui/teshuanniu.png")
		self:setBtnNameByType(cpTable["jtp_right_btn"], {"ke_uizi","ju_uizi"})
		
		if LANGUAGE_TYPE == 3 then
			self:setContent("科舉必得名臣，立即前往？")
		else	
			self:setContent("科举必得名臣，立即前往？")
		end
		
	elseif type == 10 then
		-- 10没有装备
		self:setBtnNameByType(cpTable["jtp_left_btn"], {"qu_uizi","xiao_uizi"})
		cpTable["jtp_right_btn"]:setButtonImage("batch_ui/teshuanniu.png")
		self:setBtnNameByType(cpTable["jtp_right_btn"], {"xun_uizi","fang_uizi"})
		
		if LANGUAGE_TYPE == 3 then
			self:setContent("尋訪可獲得裝備，立即前往？")
		else	
			self:setContent("寻访可获得装备，立即前往？")
		end
		
	elseif type == 11 then
		-- 11没有装备碎片，或装备碎片合成“数量不足”
		cpTable["jtp_left_btn"]:setButtonImage("batch_ui/teshuanniu.png")
		self:setBtnNameByType(cpTable["jtp_left_btn"], {"xun_uizi","fang_uizi"})
		
		cpTable["jtp_right_btn"]:setButtonImage("batch_ui/teshuanniu.png")
		self:setBtnNameByType(cpTable["jtp_right_btn"], {"jing_uizi","ying_uizi","fu_uizi","ben_uizi"})
		
		if LANGUAGE_TYPE == 3 then
			self:setContent("尋訪、精英副本戰鬥可獲得裝備碎片，立即前往？")
		else
			self:setContent("寻访、精英副本战斗可获得装备碎片，立即前往？")
		end
		
	elseif type == 12 then
		-- 12没有兵法
		self:setBtnNameByType(cpTable["jtp_left_btn"], {"qu_uizi","xiao_uizi"})
		cpTable["jtp_right_btn"]:setButtonImage("batch_ui/teshuanniu.png")
		self:setBtnNameByType(cpTable["jtp_right_btn"], {"xun_uizi","fang_uizi"})
		
		if LANGUAGE_TYPE == 3 then
			self:setContent("尋訪可獲得兵法殘頁，用來合成兵法，立即前往？")
		else
			self:setContent("寻访可获得兵法残页，用来合成兵法，立即前往？")
		end
		
	elseif type == 13 then
		-- 13没有兵法残页
		cpTable["jtp_left_btn"]:setButtonImage("batch_ui/teshuanniu.png")
		self:setBtnNameByType(cpTable["jtp_left_btn"], {"xun_uizi","fang_uizi"})
		
		cpTable["jtp_right_btn"]:setButtonImage("batch_ui/teshuanniu.png")
		self:setBtnNameByType(cpTable["jtp_right_btn"], {"tang_uizi","quan3_uizi","xing_uizi","gong_uizi"})
		
		if LANGUAGE_TYPE == 3 then
			self:setContent("尋訪、寵幸美女可獲得兵法殘頁，\n用來合成兵法，立即前往？")
		else
			self:setContent("寻访、宠幸美女可获得兵法残页，\n用来合成兵法，立即前往？")
		end
		
	elseif type == 14 then
		-- 14上书房没有娘娘有学识
		self:setBtnNameByType(cpTable["jtp_left_btn"], {"qu_uizi","xiao_uizi"})
		cpTable["jtp_right_btn"]:setButtonImage("batch_ui/teshuanniu.png")
		self:setBtnNameByType(cpTable["jtp_right_btn"], {"tang_uizi","quan3_uizi","xing_uizi","gong_uizi"})
		
		if LANGUAGE_TYPE == 3 then
			self:setContent("後宮-湯泉行宮寵幸娘娘可以獲得學識，\n立即前往？")
		else
			self:setContent("后宫-汤泉行宫宠幸娘娘可以获得学识，\n立即前往？")
		end
		
	elseif type == 15 then
		-- 15册封美女亲密度不足
		self:setBtnNameByType(cpTable["jtp_left_btn"], {"qu_uizi","xiao_uizi"})
		cpTable["jtp_right_btn"]:setButtonImage("batch_ui/teshuanniu.png")
		self:setBtnNameByType(cpTable["jtp_right_btn"], {"shang_uizi","ci_uizi"})
		
		if LANGUAGE_TYPE == 3 then
			self:setContent("賞賜可提升美女親密度，立即前往？")
		else
			self:setContent("赏赐可提升美女亲密度，立即前往？")
		end
		
	elseif type == 16 then
		-- 16赐官朝珠不足
		cpTable["jtp_left_btn"]:setButtonImage("batch_ui/teshuanniu.png")
		self:setBtnNameByType(cpTable["jtp_left_btn"], {"ba_uizi","ye_uizi"})
		
		cpTable["jtp_right_btn"]:setButtonImage("batch_ui/teshuanniu.png")
		self:setBtnNameByType(cpTable["jtp_right_btn"], {"zhen_uizi(2)","long_uizi","bao_uizi (2)","ge1_uizi"})
		
		if LANGUAGE_TYPE == 3 then
			self:setContent("霸業-功績值兌換、真龍寶閣可獲得大量朝珠，立即前往？")
		else	
			self:setContent("霸业-功绩值兑换、真龙宝阁可获得大量朝珠，立即前往？")
		end
		
	elseif type == 17 then
		-- 17没有魂魄或魂魄合成“数量不足”
		cpTable["jtp_left_btn"]:setButtonImage("batch_ui/teshuanniu.png")
		self:setBtnNameByType(cpTable["jtp_left_btn"], {"xun_uizi","fang_uizi"})
		
		cpTable["jtp_right_btn"]:setButtonImage("batch_ui/teshuanniu.png")
		self:setBtnNameByType(cpTable["jtp_right_btn"], {"jing_uizi","ying_uizi","fu_uizi","ben_uizi"})
		
		if LANGUAGE_TYPE == 3 then
			self:setContent("尋訪、精英副本戰鬥可獲得魂魄，立即前往")
		else
			self:setContent("寻访、精英副本战斗可获得魂魄，立即前往？")
		end
		
	end
	
	
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_jump_tip_popup] setBtnNameByType
-------------------------------------------------------------------------------
function f_jump_tip_popup:setBtnNameByType(btn, nameTable)
	local spaceH = 30+(4-#nameTable)*5
	local width = 32+spaceH*(#nameTable-1)
	local posX = (144-width)/2
	
	for i,chara in pairs(nameTable) do
		local img = fc.FExtensionsImage:create()
	    img:setImage("batch_ui/" .. chara .. ".png")
	    img:setSize(cc.size(32,32))
	    img:setAnchorPoint(cc.p(0,0.5))
	    btn:appendComponent(img)
	    img:setPositionInContainer(cc.p(posX+spaceH*(i-1),26))
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_jump_tip_popup] setContent
-------------------------------------------------------------------------------
function f_jump_tip_popup:setContent(content)
    self.m_componentTable["jtp_pop_notice_label"]:setString(content)
end





