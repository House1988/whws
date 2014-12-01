--[[
    bit元算
]]--
local f_bit = class("f_bit")
f_bit.__index = f_bit

-------------------------------------------------
-- @function [parent=#f_bit] ctor
-------------------------------------------------
function f_bit:ctor()
end

-------------------------------------------------
-- @function [parent=#f_bit] d2b
-- 10进制转2进制
----------------------------------------
function f_bit:d2b(arg)
	local tmp = 0
	local tr= {}
	for i=1,32 do
		tr[i] = 0
	end
	
	local index = 1
	while arg > 0 do
		tmp = arg%2
		tr[index] = tmp
		arg = math.floor(arg/2)
		index = index + 1
	end
	
	return tr
end

-------------------------------------------------
-- @function [parent=#f_bit] b2d
-- 2进制转10进制
----------------------------------------
function f_bit:b2d(arg)
	local nr = 0 
	for i = 1,32 do
		if arg[i] == 1 then
			nr = nr+2^(i-1)
		end
	end
	
	return nr
end

-------------------------------------------------
-- @function [parent=#f_bit] b2d
-- 位与
-------------------------------------------------
function  f_bit:_and(a,b)  
   local op1=self:d2b(a)  
   local op2=self:d2b(b)  
   local r={}
   
   for i=1,32 do  
     if op1[i]==1 and op2[i]==1  then  
         r[i]=1  
     else  
         r[i]=0  
     end  
   end  
   return self:b2d(r)
end

-------------------------------------------------
-- @function [parent=#f_bit] b2d
-- 位或
-------------------------------------------------
function f_bit:_or(a,b)  
   local op1=self:d2b(a)  
   local op2=self:d2b(b)  
   local r={}  
    
   for i=1,32 do  
     if op1[i]==1 or op2[i]==1 then  
        r[i]=1  
     else  
        r[i]=0  
     end  
   end  
   return  self:b2d(r)  
end   

-------------------------------------------------
-- @function [parent=#f_bit] _rshift
-- 右移
-------------------------------------------------
function f_bit:_rshift(a,n)  
   local   op1=self:d2b(a)  
   local   r=self:d2b(0)  
      
   if n < 32 and n > 0 then  
      for i=1,n do  
         for i=31,1,-1 do  
            op1[i+1]=op1[i]  
         end  
         op1[1]=0  
      end  
      r=op1  
   end  
   return  self:b2d(r)  
end

-------------------------------------------------
-- @function [parent=#f_bit] _lshift
-- 左移
-------------------------------------------------
function f_bit:_lshift(a,n)  
   local op1=self:d2b(a)  
   local r=self:d2b(0)  
     
   if n < 32 and n > 0 then  
      for i=1,n   do  
        for i=1,31 do  
            op1[i]=op1[i+1]  
        end  
        op1[32]=0  
      end  
      r=op1  
   end  
   return  self:b2d(r)  
end   

return f_bit