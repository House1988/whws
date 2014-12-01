--[[--
    新手指引分支新手指引管理类，管理创建所有状态分支指引
--]]--
require("scripts.game.guidelines.f_guidelines_text_show_panel")
local f_lua_second_guidelines_manager = class("f_lua_second_guidelines_manager")
f_lua_second_guidelines_manager.__index = f_lua_second_guidelines_manager


-------------------------------------------------
-- @function [parent=#f_lua_second_guidelines_manager] ctor
-------------------------------------------------
function f_lua_second_guidelines_manager:ctor()	
	self.m_is_inited 	= false
	self.m_component	= nil
	
	
	--新手指引文本
	self.m_guidelines_text_table = {}
	self.m_guidelines_person_image_table = {}
	
	--布阵引导指引
	self.m_guidelines_text_table[101]	= 320--"兵部尚书：皇上，胜败乃兵家常事，不必太过在意。只需要调整下阵容，没准就可扭转乾坤哦！"
	self.m_guidelines_text_table[102]	= 321--"兵部尚书：皇上，在换阵界面就可以调整阵容了！"
	self.m_guidelines_text_table[103]	= 322--"兵部尚书：皇上，选中一个名臣后，再点击另一个名臣头像上的“换”字按钮后，即可将两个名臣位置进行互换！"
	self.m_guidelines_text_table[104]	= 323--"兵部尚书：兵种之间，互相克制，调整名臣的位置是战场取胜的关键哦。只有战场上对位的名臣才会发生克制关系，皇上千万要牢记啊！"
	
	self.m_guidelines_person_image_table[101] = "nobatch/guidelines_dachen.png"
	self.m_guidelines_person_image_table[102] = "nobatch/guidelines_dachen.png"
	self.m_guidelines_person_image_table[103] = "nobatch/guidelines_dachen.png"
	self.m_guidelines_person_image_table[104] = "nobatch/guidelines_dachen.png"
	
	--竞技场引导指引
	self.m_guidelines_text_table[201]	= 324--"礼部尚书：皇上，霸业功能开启了，快去争夺千古一帝的称号吧！"
	self.m_guidelines_text_table[202]	= 325--"礼部尚书：这是皇上当前的排名，通过挑战其他玩家，就可以提高自己的霸业排名！"
	self.m_guidelines_text_table[203]	= 326--"礼部尚书：这是皇上当前排名可获得的功绩值，排名越高，每10分钟可获得的功绩值也越多。"
	self.m_guidelines_text_table[204]	= 327--"礼部尚书：功绩值可以兑换很多珍惜道具！皇上一定要小心使用哦！"
	self.m_guidelines_text_table[205]	= 328--"礼部尚书：启禀皇上，我朝国力日盛，为了显示大国威望，臣等恳请皇上进行争霸，夺取千古一帝称号，留名青史，臣等定全力为皇上争光！"

	self.m_guidelines_person_image_table[201] = "nobatch/guidelines_dachen.png"
	self.m_guidelines_person_image_table[202] = "nobatch/guidelines_dachen.png"
	self.m_guidelines_person_image_table[203] = "nobatch/guidelines_dachen.png"
	self.m_guidelines_person_image_table[204] = "nobatch/guidelines_dachen.png"
	self.m_guidelines_person_image_table[205] = "nobatch/guidelines_dachen.png"
	
	--第一步皇子引导
	self.m_guidelines_text_table[301]	= 329--"小桂子： 恭喜皇上喜得龙子。快到东宫去看看他吧！"
	self.m_guidelines_text_table[302]	= 330--"小桂子：所有的皇子都会在东宫内生活，皇上要时时来看他们哦！"
	self.m_guidelines_text_table[303]	= 331--"小桂子：皇上快看，小皇子长得多可爱啊，快看看他成长的怎么样吧！"
	self.m_guidelines_text_table[304]	= 332--"小桂子： 小皇子长大后就可以上阵督军，替皇上分忧解难啦！皇上快看，这就是小皇子的督军效果。"
	self.m_guidelines_text_table[305]	= 333--"小桂子：为了让小皇子早日为国分忧，皇上快帮他成长起来吧，鲤鱼跃龙门，就可化身为金龙啦！！"
	self.m_guidelines_text_table[306]	= 334--"小桂子： 尚书房是皇子们学习的地方，皇上快去看看吧！"
	self.m_guidelines_text_table[307]	= 335--"小桂子：皇子在上书房可以接受额娘们的教育，皇上快让妃子们教小皇子读书吧！"
	self.m_guidelines_text_table[308]	= 336--"小桂子：小皇子只要达到5级，便会成长为青年，到时候就可以上阵督军啦，皇上一定要经常来教育皇子噢！"

	self.m_guidelines_person_image_table[301] = "nobatch/xiaotaijian.png"
	self.m_guidelines_person_image_table[302] = "nobatch/xiaotaijian.png"
	self.m_guidelines_person_image_table[303] = "nobatch/xiaotaijian.png"
	self.m_guidelines_person_image_table[304] = "nobatch/xiaotaijian.png"
	self.m_guidelines_person_image_table[305] = "nobatch/xiaotaijian.png"
	self.m_guidelines_person_image_table[306] = "nobatch/xiaotaijian.png"
	self.m_guidelines_person_image_table[307] = "nobatch/xiaotaijian.png"
	self.m_guidelines_person_image_table[308] = "nobatch/xiaotaijian.png"
	
	--第二步皇子引导
	self.m_guidelines_text_table[401]	=337 --"小桂子：恭喜皇上，有一位皇子升到5级，已经成年啦，皇上赶快安排他去督军吧！"
	self.m_guidelines_text_table[402]	=338 --"小桂子：恭喜皇上，有一位皇子升到5级，已经成年啦，皇上赶快安排他去督军吧！"
	self.m_guidelines_text_table[403]	= 339--"小桂子：皇子想要上阵督军，也是要在排兵布阵中进行的哦！皇上赶快去看看吧！"
	self.m_guidelines_text_table[408]	= 340--"小桂子：皇上要是想查看所有皇子的督军效果，记得要点这里哦！"
	
	self.m_guidelines_person_image_table[401] = "nobatch/xiaotaijian.png"
	self.m_guidelines_person_image_table[402] = "nobatch/xiaotaijian.png"
	self.m_guidelines_person_image_table[403] = "nobatch/xiaotaijian.png"
	self.m_guidelines_person_image_table[408] = "nobatch/xiaotaijian.png"
	
	--精英副本引导
	self.m_guidelines_text_table[502]	= 341--"兵部尚书：启禀皇上！八百里加急来报，葛尔丹死灰复燃，秦率贴身侍卫和蒙古死士前来进攻，此次来袭，非同小可，还望皇上尽快派兵征讨！！！"
	
	self.m_guidelines_person_image_table[502] = "nobatch/guidelines_dachen.png"
	
	--阵容2
	self.m_guidelines_text_table[602]	= 342--"兵部尚书：启禀皇上，最近战事日益增多，我军不光要外出征讨，还要防御敌军来袭，为了方便皇上指挥，特意安排的两套阵容，供皇上调遣，还请皇上前往查看。"
	self.m_guidelines_text_table[605]	=343-- "兵部尚书：两套阵容建议一套为攻击阵容，用来进攻敌人，另一套做防御阵容，用来防御敌人进攻。皇上若是不在朝，千万记得切换成防御阵容再离开哦！"
	
	self.m_guidelines_person_image_table[602] = "nobatch/guidelines_dachen.png"
	self.m_guidelines_person_image_table[605] = "nobatch/guidelines_dachen.png"
	
	--抢夺引导
	self.m_guidelines_text_table[702]	= 344--"礼部尚书：启禀皇上，我朝藏书多残破不堪，近日听闻邻邦收藏了不少珍贵兵书，若是我们能将其夺来，稍加练习，我军战力必能大幅提升吧！"
	self.m_guidelines_person_image_table[702] = "nobatch/guidelines_dachen.png"
	
	--通关三星奖励引导
	self.m_guidelines_text_table[901]	= 345--"小桂子：恭喜皇上！本战役的所有关卡均达到了3星评价，您现在可以领取全3星奖励了！往后的每个战役拿到全3星均会有奖励，别忘了领取哦~"
	self.m_guidelines_text_table[903]	=346-- "兵部尚书：启奏皇上！我军势如破竹，大破“乌兰布通”战役的所有关卡，可以前往下一个章节了！"
	self.m_guidelines_person_image_table[901] = "nobatch/xiaotaijian.png"
	self.m_guidelines_person_image_table[903] = "nobatch/guidelines_dachen.png"
	
	--选秀
	self.m_guidelines_text_table[1002]	=347 --"小桂子：启禀皇上，最近听说内务府又从民间找来一批绝色美女，咱们快去看看吧！"
	self.m_guidelines_person_image_table[1002] = "nobatch/xiaotaijian.png"
	
	--真龙宝阁
	self.m_guidelines_text_table[1102]	=348-- "礼部尚书：启禀皇上，近日我朝国威日盛，番邦纷纷前来进贡，有不少珍惜宝物和人才等待皇上前去挑选，还请皇上移驾真龙宝阁一览。"	
	self.m_guidelines_person_image_table[1102] = "nobatch/guidelines_dachen.png"
	
	--征税
	self.m_guidelines_text_table[1202]	=349-- "户部尚书：启禀皇上，最近我朝连年征战，国库空虚，入不敷出。为了维持军备，臣以为只能加大征收，以充实国库了，请皇上准奏。"	
	self.m_guidelines_person_image_table[1202] = "nobatch/guidelines_dachen.png"
	
	--布阵引导指引
	self.m_buzhen_guildelines_array = {}
	self.m_buzhen_index = 1
	self.m_buzhen_need_guidelines = false
	self.m_buzhen_max_count = 4
	--竞技场引导指引
	self.m_jingjichang_guildelines_array = {}
	self.m_jingjichang_index = 1
	self.m_jingjichang_need_guidelines = false
	self.m_jingjichang_max_count = 5
	--第一步皇子引导
	self.m_huangzi_guildelines_array = {}
	self.m_huangzi_index = 1
	self.m_huangzi_need_guidelines = false
	self.m_huangzi_max_count = 9
	--第二步皇子引导
	self.m_second_huangzi_guildelines_array = {}
	self.m_second_huangzi_index = 1
	self.m_second_huangzi_need_guidelines = false
	self.m_second_huangzi_max_count = 7
	--支线精英副本挑战
	self.m_second_elite_guidelines_array = {}
	self.m_second_elite_index = 1
	self.m_second_elite_need_guidelines = false
	self.m_second_elite_max_count = 6
	--支线任务阵容2
	self.m_second_arr2_guidelines_array = {}
	self.m_second_arr2_index = 1
	self.m_second_arr2_need_guidelines = false
	self.m_second_arr2_max_count = 5
	--抢夺引导
	self.m_second_qiangduo_arr = {}
	self.m_second_qiangduo_index = 1
	self.m_second_qiangduo_need_guidelines = false
	self.m_second_qiangduo_max_count = 4
	--合成引导
	self.m_second_hecheng_arr = {}
	self.m_second_hecheng_index = 1
	self.m_second_hecheng_need_guidelines = false
	self.m_second_hecheng_max_count = 1
	
	--三星通关奖励
	self.m_second_3star_arr = {}
	self.m_second_3star_index = 1
	self.m_second_3star_need_guidelines = false
	self.m_second_3star_max_count = 3
	
	--选秀引导
	self.m_xuanxiu_arr = {}
	self.m_xuanxiu_arr_index = 1
	self.m_xuanxiu_arr_need_guidelines = false
	self.m_xuanxiu_arr_max_count = 3
	
	--真龙宝阁
	self.m_baoge_arr = {}
	self.m_baoge_arr_index = 1
	self.m_baoge_arr_need_guidelines = false
	self.m_baoge_arr_max_count = 2
	
	-- 征税
	self.m_tax_arr = {}
	self.m_tax_arr_index = 1
	self.m_tax_arr_need_guidelines = false
	self.m_tax_arr_max_count = 3
end


-------------------------------------------------------------------------------
-- @function [parent=#f_lua_second_guidelines_manager] preInitGuidelines
-- 预初始化新手指引管理
-------------------------------------------------------------------------------
function f_lua_second_guidelines_manager:preInitGuidelines()
	self.m_buzhen_need_guidelines = g_game.g_userInfoManager:getBuzhenGuidleStep()
	self.m_jingjichang_need_guidelines = g_game.g_userInfoManager:getJingjichangGuidleStep()	
	self.m_huangzi_need_guidelines = g_game.g_userInfoManager:getHuangziGuidleStep()
	self.m_second_huangzi_need_guidelines = g_game.g_userInfoManager:getSecondHuangziGuidleStep()
--	self.m_second_elite_need_guidelines = g_game.g_userInfoManager:getEliteBattleGuideStep()
	self.m_second_arr2_need_guidelines =  g_game.g_userInfoManager:getArr2GuideStep()
	self.m_second_qiangduo_need_guidelines = g_game.g_userInfoManager:getQiangduoGuideStep()
	self.m_second_hecheng_need_guidelines = g_game.g_userInfoManager:getHechengGuideStep()
	self.m_second_3star_need_guidelines =  g_game.g_userInfoManager:get3StarGuideStep()
	self.m_xuanxiu_arr_need_guidelines = g_game.g_userInfoManager:getXuanXiuGuildStep()
	self.m_baoge_arr_need_guidelines = g_game.g_userInfoManager:getBaogeGuildStep()
	self.m_tax_arr_need_guidelines = g_game.g_userInfoManager:getTaxGuildStep()
	
	if self.m_is_inited == true then
		g_game.g_gameManager:removeUpdateObj(self)
		self.m_buzhen_guildelines_array = {}
		self.m_jingjichang_guildelines_array = {}
		self.m_huangzi_guildelines_array = {}
		self.m_second_huangzi_guildelines_array = {}
--		self.m_second_elite_guidelines_array = {}
		self.m_second_arr2_guidelines_array = {}
		self.m_second_qiangduo_arr = {}
		self.m_second_hecheng_arr = {}
		self.m_second_3star_arr = {}
		self.m_xuanxiu_arr = {}
		self.m_baoge_arr = {}
		self.m_tax_arr = {}
	end
	self.m_is_inited = true
	
	self:updateGuidelinesState()
end

-------------------------------------------------------------------------------
-- @function [parent=#f_lua_second_guidelines_manager] updateGuidelinesState
-- 更新新手指引状态
-------------------------------------------------------------------------------
function f_lua_second_guidelines_manager:updateGuidelinesState()
	if self.m_buzhen_need_guidelines == true or self.m_jingjichang_need_guidelines == true or self.m_huangzi_need_guidelines == true 
		or self.m_second_huangzi_need_guidelines == true or 
--		self.m_second_elite_need_guidelines == true or
		 self.m_second_arr2_need_guidelines == true
		or self.m_second_qiangduo_need_guidelines == true or self.m_second_hecheng_need_guidelines == true or
			self.m_second_3star_need_guidelines == true  or self.m_xuanxiu_arr_need_guidelines == true or
			self.m_baoge_arr_need_guidelines == true or self.m_tax_arr_need_guidelines == true
			 then
		if DEBUG_ENABLE_GUIDELINES then
			g_game.g_gameManager:addUpdateObj(self)
		end
	end
	
	if self.m_buzhen_need_guidelines then			
		for i = 101, 100+self.m_buzhen_max_count do
			local guidelinesItem = require("scripts.game.guidelines.f_guidelines_" .. i).new()
			guidelinesItem:setGuidelinesManager(self)		
			table.insert(self.m_buzhen_guildelines_array, guidelinesItem)		
		end	
	end
	
	if self.m_jingjichang_need_guidelines then			
		for i = 201, 200+self.m_jingjichang_max_count do
			local guidelinesItem = require("scripts.game.guidelines.f_guidelines_" .. i).new()
			guidelinesItem:setGuidelinesManager(self)		
			table.insert(self.m_jingjichang_guildelines_array, guidelinesItem)		
		end	
	end
	
	if self.m_huangzi_need_guidelines then
		for i = 301, 300 + self.m_huangzi_max_count do
			local guidelinesItem = require("scripts.game.guidelines.f_guidelines_" .. i).new()
			guidelinesItem:setGuidelinesManager(self)		
			table.insert(self.m_huangzi_guildelines_array, guidelinesItem)	
		end
	end
	
	if self.m_second_huangzi_need_guidelines then
		for i = 401, 400 + self.m_second_huangzi_max_count do
			local guidelinesItem = require("scripts.game.guidelines.f_guidelines_" .. i).new()
			guidelinesItem:setGuidelinesManager(self)		
			table.insert(self.m_second_huangzi_guildelines_array, guidelinesItem)	
		end
	end
	
--	if self.m_second_elite_need_guidelines then
--		for i = 501, 500 + self.m_second_elite_max_count do
--			local guidelinesItem = require("scripts.game.guidelines.f_guidelines_" .. i).new()
--			guidelinesItem:setGuidelinesManager(self)		
--			table.insert(self.m_second_elite_guidelines_array, guidelinesItem)	
--		end
--	end
	
	if self.m_second_arr2_need_guidelines then
		for i = 601, 600 + self.m_second_arr2_max_count do
			local guidelinesItem = require("scripts.game.guidelines.f_guidelines_" .. i).new()
			guidelinesItem:setGuidelinesManager(self)		
			table.insert(self.m_second_arr2_guidelines_array, guidelinesItem)	
		end
	end
	
	if self.m_second_qiangduo_need_guidelines then
		for i = 701, 700 + self.m_second_qiangduo_max_count do
			local guidelinesItem = require("scripts.game.guidelines.f_guidelines_" .. i).new()
			guidelinesItem:setGuidelinesManager(self)		
			table.insert(self.m_second_qiangduo_arr, guidelinesItem)	
		end
	end
	
	if self.m_second_hecheng_need_guidelines then
		for i = 801, 800 + self.m_second_hecheng_max_count do
			local guidelinesItem = require("scripts.game.guidelines.f_guidelines_" .. i).new()
			guidelinesItem:setGuidelinesManager(self)		
			table.insert(self.m_second_hecheng_arr, guidelinesItem)	
		end
	end
	
	if self.m_second_3star_need_guidelines then
		for i = 901, 900 + self.m_second_3star_max_count do
			local guidelinesItem = require("scripts.game.guidelines.f_guidelines_" .. i).new()
			guidelinesItem:setGuidelinesManager(self)		
			table.insert(self.m_second_3star_arr, guidelinesItem)	
		end
	end
	
	if self.m_xuanxiu_arr_need_guidelines then
		for i = 1001, 1000 + self.m_xuanxiu_arr_max_count do
			local guidelinesItem = require("scripts.game.guidelines.f_guidelines_" .. i).new()
			guidelinesItem:setGuidelinesManager(self)		
			table.insert(self.m_xuanxiu_arr, guidelinesItem)	
		end
	end
	
	if self.m_baoge_arr_need_guidelines then
		for i = 1101, 1100 + self.m_baoge_arr_max_count do
			local guidelinesItem = require("scripts.game.guidelines.f_guidelines_" .. i).new()
			guidelinesItem:setGuidelinesManager(self)		
			table.insert(self.m_baoge_arr, guidelinesItem)	
		end
	end
	
	if self.m_tax_arr_need_guidelines then
		for i = 1201, 1200 + self.m_tax_arr_max_count do
			local guidelinesItem = require("scripts.game.guidelines.f_guidelines_" .. i).new()
			guidelinesItem:setGuidelinesManager(self)		
			table.insert(self.m_tax_arr, guidelinesItem)	
		end
	end
end

-------------------------------------------------------------------------------
-- @function [parent=#f_lua_second_guidelines_manager] update
-- 新手指引管理类心跳
-------------------------------------------------------------------------------
function f_lua_second_guidelines_manager:update(dt)
	if self.m_buzhen_index <= #self.m_buzhen_guildelines_array then
		self.m_buzhen_guildelines_array[self.m_buzhen_index]:update(dt)
		if self.m_buzhen_guildelines_array[self.m_buzhen_index]:guidelinesFinish() then
			self.m_buzhen_index = self.m_buzhen_guildelines_array[self.m_buzhen_index]:guidelinesNextIndex()
		end
		
		if self.m_buzhen_index > self.m_buzhen_max_count then
			self.m_buzhen_guildelines_array = {}
		end
	end

	if self.m_jingjichang_index <= #self.m_jingjichang_guildelines_array then
		self.m_jingjichang_guildelines_array[self.m_jingjichang_index]:update(dt)
		if self.m_jingjichang_guildelines_array[self.m_jingjichang_index]:guidelinesFinish() then
			self.m_jingjichang_index = self.m_jingjichang_guildelines_array[self.m_jingjichang_index]:guidelinesNextIndex()
		end
		
		if self.m_jingjichang_index > self.m_jingjichang_max_count then
			self.m_jingjichang_guildelines_array = {}
		end
	end
	
	
	if self.m_huangzi_index <= #self.m_huangzi_guildelines_array then
		self.m_huangzi_guildelines_array[self.m_huangzi_index]:update(dt)
		if self.m_huangzi_guildelines_array[self.m_huangzi_index]:guidelinesFinish() then
			self.m_huangzi_index = self.m_huangzi_guildelines_array[self.m_huangzi_index]:guidelinesNextIndex()
		end
		
		if self.m_huangzi_index > self.m_huangzi_max_count then
			self.m_huangzi_guildelines_array = {}
		end
	end
	
	
	if self.m_second_huangzi_index <= #self.m_second_huangzi_guildelines_array then
		self.m_second_huangzi_guildelines_array[self.m_second_huangzi_index]:update(dt)
		if self.m_second_huangzi_guildelines_array[self.m_second_huangzi_index]:guidelinesFinish() then
			self.m_second_huangzi_index = self.m_second_huangzi_guildelines_array[self.m_second_huangzi_index]:guidelinesNextIndex()
		end
		
		if self.m_second_huangzi_index > self.m_second_huangzi_max_count then
			self.m_second_huangzi_guildelines_array = {}
		end
	end

--	if self.m_second_elite_index <= #self.m_second_elite_guidelines_array then
--		self.m_second_elite_guidelines_array[self.m_second_elite_index]:update(dt)
--		if self.m_second_elite_guidelines_array[self.m_second_elite_index]:guidelinesFinish() then
--			self.m_second_elite_index = self.m_second_elite_guidelines_array[self.m_second_elite_index]:guidelinesNextIndex()
--		end
--		
--		if self.m_second_elite_index > self.m_second_elite_max_count then
--			self.m_second_elite_guidelines_array = {}
--		end
--	end
	
	
	if self.m_second_arr2_index <= #self.m_second_arr2_guidelines_array then
		self.m_second_arr2_guidelines_array[self.m_second_arr2_index]:update(dt)
		if self.m_second_arr2_guidelines_array[self.m_second_arr2_index]:guidelinesFinish() then
			self.m_second_arr2_index = self.m_second_arr2_guidelines_array[self.m_second_arr2_index]:guidelinesNextIndex()
		end
		
		if self.m_second_arr2_index > self.m_second_arr2_max_count then
			self.m_second_arr2_guidelines_array = {}
		end
	end
	
	if self.m_second_qiangduo_index <= #self.m_second_qiangduo_arr then
		self.m_second_qiangduo_arr[self.m_second_qiangduo_index]:update(dt)
		if self.m_second_qiangduo_arr[self.m_second_qiangduo_index]:guidelinesFinish() then
			self.m_second_qiangduo_index = self.m_second_qiangduo_arr[self.m_second_qiangduo_index]:guidelinesNextIndex()
		end
		
		if self.m_second_qiangduo_index > self.m_second_arr2_max_count then
			self.m_second_qiangduo_arr = {}
		end
	end
	
	if self.m_second_hecheng_index <= #self.m_second_hecheng_arr then
		self.m_second_hecheng_arr[self.m_second_hecheng_index]:update(dt)
		if self.m_second_hecheng_arr[self.m_second_hecheng_index]:guidelinesFinish() then
			self.m_second_hecheng_index = self.m_second_hecheng_arr[self.m_second_hecheng_index]:guidelinesNextIndex()
		end
		
		if self.m_second_hecheng_index > self.m_second_hecheng_max_count then
			self.m_second_hecheng_arr = {}
		end
	end
	
	if self.m_second_3star_index <= #self.m_second_3star_arr then
		self.m_second_3star_arr[self.m_second_3star_index]:update(dt)
		if self.m_second_3star_arr[self.m_second_3star_index]:guidelinesFinish() then
			self.m_second_3star_index = self.m_second_3star_arr[self.m_second_3star_index]:guidelinesNextIndex()
		end
		
		if self.m_second_3star_index > self.m_second_3star_max_count then
			self.m_second_3star_arr = {}
		end
	end
	
	
	if self.m_xuanxiu_arr_index <= #self.m_xuanxiu_arr then
		self.m_xuanxiu_arr[self.m_xuanxiu_arr_index]:update(dt)
		if self.m_xuanxiu_arr[self.m_xuanxiu_arr_index]:guidelinesFinish() then
			self.m_xuanxiu_arr_index = self.m_xuanxiu_arr[self.m_xuanxiu_arr_index]:guidelinesNextIndex()
		end
		
		if self.m_xuanxiu_arr_index > self.m_xuanxiu_arr_max_count then
			self.m_xuanxiu_arr = {}
		end
	end
	
	if self.m_baoge_arr_index <= #self.m_baoge_arr then
		self.m_baoge_arr[self.m_baoge_arr_index]:update(dt)
		if self.m_baoge_arr[self.m_baoge_arr_index]:guidelinesFinish() then
			self.m_baoge_arr_index = self.m_baoge_arr[self.m_baoge_arr_index]:guidelinesNextIndex()
		end
		
		if self.m_baoge_arr_index > self.m_baoge_arr_max_count then
			self.m_baoge_arr = {}
		end
	end
	
	if self.m_tax_arr_index <= #self.m_tax_arr then
		self.m_tax_arr[self.m_tax_arr_index]:update(dt)
		if self.m_tax_arr[self.m_tax_arr_index]:guidelinesFinish() then
			self.m_tax_arr_index = self.m_tax_arr[self.m_tax_arr_index]:guidelinesNextIndex()
		end
		
		if self.m_tax_arr_index > self.m_tax_arr_max_count then
			self.m_tax_arr = {}
		end
	end
	
end

-------------------------------------------------------------------------------
-- @function [parent=#f_lua_second_guidelines_manager] initComponent
-- 初始化新手指引使用的一系列组件
-------------------------------------------------------------------------------
function f_lua_second_guidelines_manager:initComponent()
	self.m_component = require("scripts.extend.f_lua_stencil_panel").new()
		
	self.m_component:setVisible(false)
end

-------------------------------------------------------------------------------
-- @function [parent=#f_lua_second_guidelines_manager] getComponent
-- 获取新手指引使用的一系列组件
-------------------------------------------------------------------------------
function f_lua_second_guidelines_manager:getComponent()
	return self.m_component
end


-------------------------------------------------------------------------------
-- @function [parent=#f_lua_second_guidelines_manager] getGuidelinesText
-- 获取新手指引文本
-------------------------------------------------------------------------------
function f_lua_second_guidelines_manager:getGuidelinesText(guidelinesIndex)
	local id = self.m_guidelines_text_table[guidelinesIndex]
	return  g_game.g_dictConfigManager:getLanTextById(id)
end



-------------------------------------------------------------------------------
-- @function [parent=#f_lua_second_guidelines_manager] getGuidelinesPerson
-- 获取新手指引圣旨大臣
-------------------------------------------------------------------------------
function f_lua_second_guidelines_manager:getGuidelinesPerson(guidelinesIndex)
	return self.m_guidelines_person_image_table[guidelinesIndex]
end


return f_lua_second_guidelines_manager