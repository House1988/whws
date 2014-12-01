
local f_event_manager = class("f_event_manager")
f_event_manager.__index = f_event_manager

-------------------------------------------------------------------------------
-- @function [parent=#f_event_manager] ctor
-- 构造函数
-------------------------------------------------------------------------------
function f_event_manager:ctor()	
	self.m_event_function_array = {}
end


-------------------------------------------------------------------------------
-- @function [parent=#f_event_manager] registerLuaEvent
-- 注册需要监听的消息以及回调函数
-------------------------------------------------------------------------------
function f_event_manager:registerLuaEvent(luaEvent, callback)	
    local functionArray = self.m_event_function_array[luaEvent]
    if functionArray == nil then
        functionArray = {callback}
        self.m_event_function_array[luaEvent] = functionArray
    else
        table.insert(functionArray, callback)
    end
--[[
    for i=1, #self.m_event_function_array[luaEvent] do
        print(self.m_event_function_array[luaEvent][i])
    end
]]--    
    return #self.m_event_function_array[luaEvent]
end

-------------------------------------------------------------------------------
-- @function [parent=#f_event_manager] removeLuaEvent
-- 移除已经注册的消息监听
-------------------------------------------------------------------------------
function f_event_manager:removeLuaEvent(luaEvent)
     self.m_event_function_array[luaEvent] = nil
end

-------------------------------------------------------------------------------
-- @function [parent=#f_event_manager] removeLuaEventFunction
-- 移除已经注册的消息监听
-------------------------------------------------------------------------------
function f_event_manager:removeLuaEventFunction(luaEvent, callback)	
    local functionArray = self.m_event_function_array[luaEvent]
    if functionArray == nil then
        return
    end
    if callback ~= nil then
      local index = 0
      for i=1, #functionArray do
          if functionArray[i] == callback then
              index = i
              break
          end
      end
      if index>0 then
          table.remove(functionArray, index)
      end
    else   
      self.m_event_function_array[luaEvent] = nil
    end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_event_manager] event_handler
-- 本地消息处理循环
-------------------------------------------------------------------------------
function f_event_manager:event_handler(luaEvent)
  	local functionArray = self.m_event_function_array[luaEvent]
  	if functionArray==nil then
      	echo("\nf_event_manager.lua: no logic function for type=" .. luaEvent)
      	return
  	end
  	for i=1, #functionArray do
      	if functionArray[i] == nil then
          	echo("\nf_event_manager.lua: function is nil: "..functionArray[i])
      	else 
          	functionArray[i]()
      	end
  	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_event_manager] event_handler_param
-- 本地消息处理循环,消息可以带有一个table进行数据传递
-------------------------------------------------------------------------------
function f_event_manager:event_handler_param(luaEvent, paramTable)
  	local functionArray = self.m_event_function_array[luaEvent]
  	if functionArray==nil then
      	echo("\nf_event_manager.lua: no logic function for type=" .. luaEvent)
      	return
  	end
  	for i=1, #functionArray do
      	if functionArray[i] == nil then
          	echo("\f_event_manager.lua: function is nil: "..functionArray[i])
      	else 
          	functionArray[i](paramTable)
      	end
  	end
end

return f_event_manager