--[[
	继承自container panel, 用于显示邮件列表
]]--

require("scripts.auto.auto_lb_levelRankItem")

local f_lb_levelRank_item = class("f_lb_levelRank_item", function()
    return g_game.g_classFactory.newFLuaContainerPanel("f_lb_levelRank_item")
end)


-------------------------------------------------------------------------------
-- @function [parent=#f_lb_levelRank_item] ctor
-- 构造函数
-------------------------------------------------------------------------------
function f_lb_levelRank_item:ctor()    
    self:registerNodeEvent()   
    	
	self.m_data = nil
	self.m_componentTable = nil
	self:setSize(cc.size(854, 40))
	
	self:initAllComponent()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_lb_levelRank_item] onEnter
-- on, 初始化事件监听
-------------------------------------------------------------------------------
function f_lb_levelRank_item:onEnter() 
	
end


function f_lb_levelRank_item:onExit()    
    self:unregisterNodeEvent()
end

function f_lb_levelRank_item:onEnterTransitionFinish()
end

function f_lb_levelRank_item:onExitTransitionStart()
end

function f_lb_levelRank_item:onCleanup()
end


function f_lb_levelRank_item:registerNodeEvent(handler)
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

function f_lb_levelRank_item:unregisterNodeEvent()
    self:unregisterScriptHandler()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_lb_levelRank_item] initAllComponent
-- 初始化所有面板中的组件
-------------------------------------------------------------------------------
function f_lb_levelRank_item:initAllComponent()
	self.m_componentTable = createlb_levelRankItem()
	self.mailPage = self.m_componentTable["lb_levelRankItem"]
	self.m_currentPage = 1

	self:setAnchorPoint(cc.p(0.5, 0.5))
	
	self:appendComponent(self.mailPage)
	
	self.mailPage:setAnchorPoint(cc.p(0.5, 0.5))
	self.mailPage:setPositionInContainer(cc.p(427, 20))

end

-------------------------------------------------------------------------------
-- @function [parent=#f_lb_levelRank_item] setData
-- 设置邮件信息
-------------------------------------------------------------------------------
function f_lb_levelRank_item:setData(data, rank, current)	
	
	self.m_componentTable["it_rank"]:setString("第" .. rank .. "名")
	local name = "【" .. data["reign"] .. "帝】" .. data["roleName"]
	self.m_componentTable["it_name"]:setString(name)
	self.m_componentTable["it_level"]:setString("" .. data["current"])
	self.m_componentTable["currentLevel"]:setString(current)
	
--	if data["vipLevel"] <= 0 then
--		self.m_componentTable["vip_lv"]:setVisible(false)
--		self.m_componentTable["vip"]:setVisible(false)
--	else
--		self.m_componentTable["vip_lv"]:setVisible(true)
--		self.m_componentTable["vip"]:setVisible(true)
--		self.m_componentTable["vip_lv"]:setTextWithInt(data["vipLevel"])
--	end
	
	if rank % 2 == 0 then
		self.m_componentTable["itembg1"]:setVisible(false)
		self.m_componentTable["itembg2"]:setVisible(true)
	else
		self.m_componentTable["itembg1"]:setVisible(true)
		self.m_componentTable["itembg2"]:setVisible(false)
	end
	
	local color = cc.c3b(91, 24, 6)
	if rank == 1 then
		color = cc.c3b(255, 144, 0)
	elseif rank >= 2 and rank <= 3 then
		color = cc.c3b(180, 0, 255)
	elseif rank > 3 and rank <= 10 then
		color = cc.c3b(0, 192, 255)
	end
	self.m_componentTable["it_rank"]:setColor(color)
	self.m_componentTable["it_name"]:setColor(color)
	self.m_componentTable["it_level"]:setColor(color)
	self.m_componentTable["currentLevel"]:setColor(color)
end

return f_lb_levelRank_item