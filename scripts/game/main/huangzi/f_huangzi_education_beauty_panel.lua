require("scripts.game.main.huangzi.f_huangzi_education_beauty_card")
--[[
继承自container panel, 每个panel最多显示8张教育美女卡牌
]]--

local f_huangzi_education_beauty_panel = class("f_huangzi_education_beauty_panel", function()
	return g_game.g_classFactory.newFLuaContainerPanel("f_huangzi_education_beauty_panel")
end)

-------------------------------------------------------------------------------
-- @function [parent=#f_huangzi_education_beauty_panel] ctor
-- 构造函数
-------------------------------------------------------------------------------
function f_huangzi_education_beauty_panel:ctor()

	self.m_educationBtnCallback = nil
	
	self.m_panelIndex = 0
	self.m_panelComponentNum = 0
	self.m_components_arr = {}
	
	self.CARD_SPACE = 5
	self:registerNodeEvent()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_huangzi_education_beauty_panel] setPanelIndex
-- 设置panel的索引
-------------------------------------------------------------------------------
function f_huangzi_education_beauty_panel:setPanelIndex(index)
	self.m_panelIndex = index
end

-------------------------------------------------------------------------------
-- @function [parent=#f_huangzi_education_beauty_panel] setPanelIndex
-- 设置panel中子件的 数目
-------------------------------------------------------------------------------
function f_huangzi_education_beauty_panel:setComponentNum(num)
	self.m_panelComponentNum = num
end

-------------------------------------------------------------------------------
-- @function [parent=#f_huangzi_education_beauty_panel] updatePanelData
-- 更新 panel中的卡牌
-------------------------------------------------------------------------------
function f_huangzi_education_beauty_panel:updatePanelData(educationBeautyArr)
	for i = 1 , #self.m_components_arr do
		if self.m_components_arr[i] ~= nil then
			self:deleteComponent(self.m_components_arr[i])
		end
	end
	self.m_components_arr = {}

	local educationArr = educationBeautyArr
	
	for i=1,self.m_panelComponentNum do

		local educationCard =  f_huangzi_education_beauty_card.static_create()
		educationCard:panelInitBeforePopup()
		educationCard:setSize(cc.size(160,236))

		local educationBtnSelect = function(card)
			self.m_educationBtnCallback(card)
		end
		educationCard:educationBtnSelectCallBack(educationBtnSelect)

		self:appendComponent(educationCard)
		educationCard:setAnchorPoint(cc.p(0,1))

		local pos_x = -10 + (i-1)% 4*(150+self.CARD_SPACE+10)
		local pos_y = 10
		if i > 4 then
			pos_y = 2+pos_y + 243+self.CARD_SPACE-8
		end

		educationCard:setPositionInContainer(cc.p(pos_x,pos_y))

		local indexInList = 8*(self.m_panelIndex-1) + i
		educationCard:setIndex(indexInList)
		educationCard:setData(educationArr[indexInList])

		table.insert(self.m_components_arr,educationCard)
	end

end

-------------------------------------------------------------------------------
-- @function [parent=#f_huangzi_education_beauty_panel] getCurPanelEducationBeautys
-- 获取  集体教育 当前页的所有美女
-------------------------------------------------------------------------------
function f_huangzi_education_beauty_panel:getCurPanelEducationBeautys()
	return self.m_components_arr
end

-------------------------------------------------------------------------------
-- @function [parent=#f_huangzi_education_beauty_panel] setPrinceMotherId
-- 设置 princeMother id
-------------------------------------------------------------------------------
function f_huangzi_education_beauty_panel:setPrinceMotherId(motherId)
	for i = 1,#self.m_components_arr do
		self.m_components_arr[i]:setPrinceMotherId(motherId)
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_huangzi_education_beauty_panel] setEducationBtnCallBack
-- 教育button按下回调
-------------------------------------------------------------------------------
function f_huangzi_education_beauty_panel:setEducationBtnCallBack(callBack)
	self.m_educationBtnCallback = callBack
end

-------------------------------------------------------------------------------
-- @function [parent=#f_huangzi_education_beauty_panel] onEnter
-- on, 初始化事件监听
-------------------------------------------------------------------------------
function f_huangzi_education_beauty_panel:onEnter()

end


function f_huangzi_education_beauty_panel:onExit()
	self:unregisterNodeEvent()
	self.m_components_arr = {}
end

function f_huangzi_education_beauty_panel:onEnterTransitionFinish()
end

function f_huangzi_education_beauty_panel:onExitTransitionStart()
end

function f_huangzi_education_beauty_panel:onCleanup()
end


function f_huangzi_education_beauty_panel:registerNodeEvent(handler)
	if not handler then
		handler = function(event)
			if event == "enter" then
				self:onEnter()
			elseif event == "exit" then
				self:onExit()
			elseif event == "enterTransitionFinish" then
				self:onEnterTransitionFinish()
			elseif event == "exitTransitionStart" then
				self:onExitTransitionStart()
			elseif event == "cleanup" then
				self:onCleanup()
			end
		end
	end
	self:registerScriptHandler(handler)
end

function f_huangzi_education_beauty_panel:unregisterNodeEvent()
	self:unregisterScriptHandler()
end

return f_huangzi_education_beauty_panel