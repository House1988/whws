require("scripts.game.main.beauty.f_game_beauty_kng_beauty")
--[[
	继承自container table, 实现美女table
]]--

local f_game_beauty_kng_beautys_table = class("f_game_beauty_kng_beautys_table", function()
    return g_game.g_classFactory.newFLuaContainerTable("f_game_beauty_kng_beautys_table", 2)
end)


-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_kng_beautys_table] ctor
-- 构造函数
-------------------------------------------------------------------------------
function f_game_beauty_kng_beautys_table:ctor()      
    self.m_componentsTable = {}
    self.m_selectCard = nil
    self:registerNodeEvent()   
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_kng_beautys_table] onEnter
-- on
-------------------------------------------------------------------------------
function f_game_beauty_kng_beautys_table:onEnter()   
	self:setStopTouchEvent(true)	
	self:enableClipping(true)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_kng_beautys_table] updateTable
-- 返回选中card
-------------------------------------------------------------------------------
function f_game_beauty_kng_beautys_table:updateTable(groupBeauty)
	for j = 1, #self.m_componentsTable do
		self.m_componentsTable[j]:setSelectCallBack(nil)
		self:deleteComponent(self.m_componentsTable[j])
	end
	self.m_componentsTable = {}
	
	local groupNum = table.getn(groupBeauty)
	
	for i = 1,groupNum do
	
		local beautyCard = f_game_beauty_kng_beauty.static_create()
		beautyCard:panelInitBeforePopup()
		beautyCard:setSize(cc.size(165,232))
		beautyCard:setIndex(i)
		beautyCard:setData(groupBeauty[i])
		self:appendComponent(beautyCard)
		
		local selectCallBack = function(selectCard)
			self:selectCardCallBack(selectCard)
		end
		beautyCard:setSelectCallBack(selectCallBack)
		
		if i == 1 then
			beautyCard.m_componentTable["kng_card_shanguang_image"]:setVisible(true)
		else
			beautyCard.m_componentTable["kng_card_shanguang_image"]:setVisible(false)
		end	
		
		table.insert(self.m_componentsTable, beautyCard)
	end
	
	--默认选中为第一个
	if self.m_componentsTable[1] ~= nil then
		self.m_selectCard = self.m_componentsTable[1]
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_kng_beautys_table] getSelectCard
-- 返回选中card
-------------------------------------------------------------------------------
function f_game_beauty_kng_beautys_table:getSelectCard()
	return self.m_selectCard
end

-------------------------------------------------------------------------------
-- @function [parent=#f_game_beauty_kng_beautys_table] selectCardCallBack
-- 选中card的call back
-------------------------------------------------------------------------------
function f_game_beauty_kng_beautys_table:selectCardCallBack(selectCard)
	self.m_selectCard = selectCard
	
	for i = 1, #self.m_componentsTable do
		if i == self.m_selectCard:getIndex() then
			self.m_componentsTable[i].m_componentTable["kng_card_shanguang_image"]:setVisible(true)
		else
			self.m_componentsTable[i].m_componentTable["kng_card_shanguang_image"]:setVisible(false)
		end
	end
end


function f_game_beauty_kng_beautys_table:onExit()    
    self:unregisterNodeEvent()
end

function f_game_beauty_kng_beautys_table:onEnterTransitionFinish()
end

function f_game_beauty_kng_beautys_table:onExitTransitionStart()
end

function f_game_beauty_kng_beautys_table:onCleanup()
end


function f_game_beauty_kng_beautys_table:registerNodeEvent(handler)
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

function f_game_beauty_kng_beautys_table:unregisterNodeEvent()
    self:unregisterScriptHandler()
end

return f_game_beauty_kng_beautys_table