
local f_fake_beauty = class("f_fake_beauty")
f_fake_beauty.__index = f_fake_beauty


-------------------------------------------------------------------------------
-- @function [parent=#f_fake_beauty] ctor
-- 构造函数
-------------------------------------------------------------------------------
function f_fake_beauty:ctor()    
    self.m_data = {}
end

-------------------------------------------------------------------------------
-- @function [parent=#f_fake_beauty] setData
-- 设置数据
-------------------------------------------------------------------------------
function f_fake_beauty:setData(id)    
    local data = {}
    data["beautyId"] = id
    data["beautyLevel"] = 1
    data["beautyExp"] = 0
    data["beautyIntimacy"] = 0
    data["beautyTitle"] = 0
    data["id"] = 0
    data["princeList_Num"] = 0
    data["conceive"] = 0
    self.m_data = data
end

-------------------------------------------------------------------------------
-- @function [parent=#f_fake_beauty] setWholeData
-- 设置完整数据
-------------------------------------------------------------------------------
function f_fake_beauty:setWholeData(data)
	self.m_data = data  
end

-------------------------------------------------------------------------------
-- @function [parent=#f_fake_beauty] getData
-- 获取数据
-------------------------------------------------------------------------------
function f_fake_beauty:getData()    
    return self.m_data
end

return f_fake_beauty