--[[--
    audio manager，用于管理声音播放
--]]--

local f_lua_audio_manager = class("f_lua_audio_manager")
f_lua_audio_manager.__index = f_lua_audio_manager

-------------------------------------------------
-- @function [parent=#f_lua_audio_manager] ctor
-------------------------------------------------
function f_lua_audio_manager:ctor()	
	self.m_audio = require("prescripts.framework.audio")
	
	self.m_audio.setEffectsVolume(1.0)
	self.m_audio.setMusicVolume(1.0)
	
	self.m_current_music = ""
	self.m_current_effect = ""
	
if DEBUG_ENABLE_SOUND then	

	self.event_stop_all_effect = function()
		self:stopAllEffect()
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_EFFECT_STOP, self.event_stop_all_effect)
	
	--注册监听函数
	self.event_play_music_maincity = function()
		local musicFile = g_game.g_f_background_music[g_game.g_f_lua_game_event.F_LUA_MUSIC_MAIN_CITY - g_game.g_f_lua_game_event.F_LUA_SOUND_START]
		self:playBackgroundMusic(musicFile, true)
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_MUSIC_MAIN_CITY, self.event_play_music_maincity)
	
	self.event_play_music_hougong = function()
		local musicFile = g_game.g_f_background_music[g_game.g_f_lua_game_event.F_LUA_MUSIC_HOUGONG - g_game.g_f_lua_game_event.F_LUA_SOUND_START]
		self:playBackgroundMusic(musicFile, true)
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_MUSIC_HOUGONG, self.event_play_music_hougong)
	
	self.event_play_music_xuanguan = function()
		local musicFile = g_game.g_f_background_music[g_game.g_f_lua_game_event.F_LUA_MUSIC_XUANGUAN - g_game.g_f_lua_game_event.F_LUA_SOUND_START]
		self:playBackgroundMusic(musicFile, true)
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_MUSIC_XUANGUAN, self.event_play_music_xuanguan)
	
	self.event_play_music_gl1 = function()
		local musicFile = g_game.g_f_background_music[g_game.g_f_lua_game_event.F_LUA_GUILDLINE_1 - g_game.g_f_lua_game_event.F_LUA_SOUND_START]
		self:playBackgroundMusic(musicFile, true)
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_GUILDLINE_1, self.event_play_music_gl1)
	
	self.event_play_music_gl2 = function()
		local musicFile = g_game.g_f_background_music[g_game.g_f_lua_game_event.F_LUA_GUILDLINE_2 - g_game.g_f_lua_game_event.F_LUA_SOUND_START]
		self:playBackgroundMusic(musicFile, true)
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_GUILDLINE_2, self.event_play_music_gl2)
	
	self.event_play_music_gl3 = function()
		local musicFile = g_game.g_f_background_music[g_game.g_f_lua_game_event.F_LUA_GUILDLINE_3 - g_game.g_f_lua_game_event.F_LUA_SOUND_START]
		self:playBackgroundMusic(musicFile, true)
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_GUILDLINE_3, self.event_play_music_gl3)
	
	self.event_play_music_gl4 = function()
		local musicFile = g_game.g_f_background_music[g_game.g_f_lua_game_event.F_LUA_GUILDLINE_4 - g_game.g_f_lua_game_event.F_LUA_SOUND_START]
		self:playBackgroundMusic(musicFile, true)
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_GUILDLINE_4, self.event_play_music_gl4)
	
	self.event_play_music_zhandou = function()
		local musicFile = g_game.g_f_background_music[g_game.g_f_lua_game_event.F_LUA_MUSIC_ZHANDOU - g_game.g_f_lua_game_event.F_LUA_SOUND_START]
		self:playBackgroundMusic(musicFile, true)
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_MUSIC_ZHANDOU, self.event_play_music_zhandou)
	
	self.event_play_music_login = function()
		local musicFile = g_game.g_f_background_music[g_game.g_f_lua_game_event.F_LUA_MUSIC_LOGIN - g_game.g_f_lua_game_event.F_LUA_SOUND_START]
		self:playBackgroundMusic(musicFile, true)
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_MUSIC_LOGIN, self.event_play_music_login)
	
	
	
	
	--音效
	self.event_play_effect_anniu = function()
		local effectFile = g_game.g_f_background_music[g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU - g_game.g_f_lua_game_event.F_LUA_SOUND_START]
		self:playEffect(effectFile)
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_EFFECT_ANNIU, self.event_play_effect_anniu)
	
	
	self.event_play_effect_bubing = function()
		local effectFile = g_game.g_f_background_music[g_game.g_f_lua_game_event.F_LUA_EFFECT_BUBING - g_game.g_f_lua_game_event.F_LUA_SOUND_START]
		self:playEffect(effectFile)
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_EFFECT_BUBING, self.event_play_effect_bubing)
	
	self.event_play_effect_gongbing = function()
		local effectFile = g_game.g_f_background_music[g_game.g_f_lua_game_event.F_LUA_EFFECT_GONGBING - g_game.g_f_lua_game_event.F_LUA_SOUND_START]
		self:playEffect(effectFile)
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_EFFECT_GONGBING, self.event_play_effect_gongbing)
	
	
	self.event_play_effect_huoqiang = function()
		local effectFile = g_game.g_f_background_music[g_game.g_f_lua_game_event.F_LUA_EFFECT_HUOQIANG - g_game.g_f_lua_game_event.F_LUA_SOUND_START]
		self:playEffect(effectFile)
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_EFFECT_HUOQIANG, self.event_play_effect_huoqiang)
	
	self.event_play_effect_qibing = function()
		local effectFile = g_game.g_f_background_music[g_game.g_f_lua_game_event.F_LUA_EFFECT_QIBING - g_game.g_f_lua_game_event.F_LUA_SOUND_START]
		self:playEffect(effectFile)
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_EFFECT_QIBING, self.event_play_effect_qibing)
		
	self.event_play_effect_jineng1 = function()
		local effectFile = g_game.g_f_background_music[g_game.g_f_lua_game_event.F_LUA_EFFECT_JINENG1 - g_game.g_f_lua_game_event.F_LUA_SOUND_START]
		self:playEffect(effectFile)
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_EFFECT_JINENG1, self.event_play_effect_jineng1)
	
	self.event_play_effect_jineng2 = function()
		local effectFile = g_game.g_f_background_music[g_game.g_f_lua_game_event.F_LUA_EFFECT_JINENG2 - g_game.g_f_lua_game_event.F_LUA_SOUND_START]
		self:playEffect(effectFile)
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_EFFECT_JINENG2, self.event_play_effect_jineng2)
	
	self.event_play_effect_jineng3 = function()
		local effectFile = g_game.g_f_background_music[g_game.g_f_lua_game_event.F_LUA_EFFECT_JINENG3 - g_game.g_f_lua_game_event.F_LUA_SOUND_START]
		self:playEffect(effectFile)
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_EFFECT_JINENG3, self.event_play_effect_jineng3)
	
	self.event_play_effect_jineng4 = function()
		local effectFile = g_game.g_f_background_music[g_game.g_f_lua_game_event.F_LUA_EFFECT_JINENG4 - g_game.g_f_lua_game_event.F_LUA_SOUND_START]
		self:playEffect(effectFile)
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_EFFECT_JINENG4, self.event_play_effect_jineng4)
	
	
	self.event_play_effect_jineng5 = function()
		local effectFile = g_game.g_f_background_music[g_game.g_f_lua_game_event.F_LUA_EFFECT_JINENG5 - g_game.g_f_lua_game_event.F_LUA_SOUND_START]
		self:playEffect(effectFile)
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_EFFECT_JINENG5, self.event_play_effect_jineng5)
	
	
		
	self.event_play_effect_jinruyouxi = function()
		local effectFile = g_game.g_f_background_music[g_game.g_f_lua_game_event.F_LUA_EFFECT_JINRUYOUXI - g_game.g_f_lua_game_event.F_LUA_SOUND_START]
		self:playEffect(effectFile)
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_EFFECT_JINRUYOUXI, self.event_play_effect_jinruyouxi)
	
	
	
	self.event_play_effect_huangzijineng1 = function()
		local effectFile = g_game.g_f_background_music[g_game.g_f_lua_game_event.F_LUA_EFFECT_HUANGZIJINENG1 - g_game.g_f_lua_game_event.F_LUA_SOUND_START]
		self:playEffect(effectFile)
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_EFFECT_HUANGZIJINENG1, self.event_play_effect_huangzijineng1)
	
	
	self.event_play_effect_kezhi = function()
		local effectFile = g_game.g_f_background_music[g_game.g_f_lua_game_event.F_LUA_EFFECT_KEZHI - g_game.g_f_lua_game_event.F_LUA_SOUND_START]
		self:playEffect(effectFile)
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_EFFECT_KEZHI, self.event_play_effect_kezhi)
	
	
	
	self.event_play_effect_suiji = function()
		local effectFile = g_game.g_f_background_music[g_game.g_f_lua_game_event.F_LUA_EFFECT_SUIJI - g_game.g_f_lua_game_event.F_LUA_SOUND_START]
		self:playEffect(effectFile)
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_EFFECT_SUIJI, self.event_play_effect_suiji)
	
	self.event_play_effect_siwang = function()
		local effectFile = g_game.g_f_background_music[g_game.g_f_lua_game_event.F_LUA_EFFECT_SIWANG - g_game.g_f_lua_game_event.F_LUA_SOUND_START]
		self:playEffect(effectFile)
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_EFFECT_SIWANG, self.event_play_effect_siwang)
	
	
	
	self.event_play_effect_tuicao = function()
		local effectFile = g_game.g_f_background_music[g_game.g_f_lua_game_event.F_LUA_EFFECT_TUICAO - g_game.g_f_lua_game_event.F_LUA_SOUND_START]
		self:playEffect(effectFile)
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_EFFECT_TUICAO, self.event_play_effect_tuicao)
	
	
	
	self.event_play_effect_wansui = function()
		local effectFile = g_game.g_f_background_music[g_game.g_f_lua_game_event.F_LUA_EFFECT_WUHUANGWANSUI - g_game.g_f_lua_game_event.F_LUA_SOUND_START]
		self:playEffect(effectFile)
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_EFFECT_WUHUANGWANSUI, self.event_play_effect_wansui)
	
	self.event_play_effect_chongxing1 = function()
		if DEBUG_SDK_TYPE == 14 or DEBUG_SDK_TYPE == 38 or DEBUG_SDK_TYPE == 39 then
			local chongxingIndex = math.random(0,12)
			local effectFile = g_game.g_f_background_music[g_game.g_f_lua_game_event.F_LUA_EFFECT_CHONGXING1 + chongxingIndex - g_game.g_f_lua_game_event.F_LUA_SOUND_START]
			self:playEffect(effectFile)
		end
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_EFFECT_CHONGXING1, self.event_play_effect_chongxing1)
	
--	self.event_play_effect_cefeng = function()
--		local effectFile = g_game.g_f_background_music[g_game.g_f_lua_game_event.F_LUA_EFFECT_CEFENG - g_game.g_f_lua_game_event.F_LUA_SOUND_START]
--		self:playEffect(effectFile)
--	end
--	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_EFFECT_CEFENG, self.event_play_effect_cefeng)
	
--	self.event_play_effect_qinan = function()
--		local effectFile = g_game.g_f_background_music[g_game.g_f_lua_game_event.F_LUA_EFFECT_QINAN - g_game.g_f_lua_game_event.F_LUA_SOUND_START]
--		self:playEffect(effectFile)
--	end
--	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_EFFECT_QINAN, self.event_play_effect_qinan)
	
	self.event_play_effect_zhandouhuihe = function()
		local effectFile = g_game.g_f_background_music[g_game.g_f_lua_game_event.F_LUA_EFFECT_ZHANDOUHUIHE - g_game.g_f_lua_game_event.F_LUA_SOUND_START]
		self:playEffect(effectFile)
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_EFFECT_ZHANDOUHUIHE, self.event_play_effect_zhandouhuihe)
	
	self.event_play_effect_zhandoushengli = function()
		local effectFile = g_game.g_f_background_music[g_game.g_f_lua_game_event.F_LUA_EFFECT_ZHANDOUSHENGLI - g_game.g_f_lua_game_event.F_LUA_SOUND_START]
		self:playEffect(effectFile)
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_EFFECT_ZHANDOUSHENGLI, self.event_play_effect_zhandoushengli)
	
	self.event_play_effect_zhandoushibai = function()
		local effectFile = g_game.g_f_background_music[g_game.g_f_lua_game_event.F_LUA_EFFECT_ZHANDOUSHIBAI - g_game.g_f_lua_game_event.F_LUA_SOUND_START]
		self:playEffect(effectFile)
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_EFFECT_ZHANDOUSHIBAI, self.event_play_effect_zhandoushibai)
	
	self.event_play_effect_meinvzhuanpan = function()
		local effectFile = g_game.g_f_background_music[g_game.g_f_lua_game_event.F_LUA_EFFECT_MEINV_ZHUANPAN - g_game.g_f_lua_game_event.F_LUA_SOUND_START]
		self:playEffect(effectFile)
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_EFFECT_MEINV_ZHUANPAN, self.event_play_effect_meinvzhuanpan)
	
	
	self.event_play_effect_beikezhi = function()
		local effectFile = g_game.g_f_background_music[g_game.g_f_lua_game_event.F_LUA_EFFECT_BEIKEZHI - g_game.g_f_lua_game_event.F_LUA_SOUND_START]
		self:playEffect(effectFile)
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_EFFECT_BEIKEZHI, self.event_play_effect_beikezhi)
	
	self.event_play_effect_huangzijineng1 = function()
		local effectFile = g_game.g_f_background_music[g_game.g_f_lua_game_event.F_LUA_EFFECT_HUANGZI_JINENG1 - g_game.g_f_lua_game_event.F_LUA_SOUND_START]
		self:playEffect(effectFile)	
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_EFFECT_HUANGZI_JINENG1, self.event_play_effect_huangzijineng1)
	
	self.event_play_effect_huangzijineng2 = function()
		local effectFile = g_game.g_f_background_music[g_game.g_f_lua_game_event.F_LUA_EFFECT_HUANGZI_JINENG2 - g_game.g_f_lua_game_event.F_LUA_SOUND_START]
		self:playEffect(effectFile)	
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_EFFECT_HUANGZI_JINENG2, self.event_play_effect_huangzijineng2)
	
	self.event_play_effect_huangzijineng3 = function()
		local effectFile = g_game.g_f_background_music[g_game.g_f_lua_game_event.F_LUA_EFFECT_HUANGZI_JINENG3 - g_game.g_f_lua_game_event.F_LUA_SOUND_START]
		self:playEffect(effectFile)	
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_EFFECT_HUANGZI_JINENG3, self.event_play_effect_huangzijineng3)
	
	
	self.event_play_effect_huangzijineng4 = function()
		local effectFile = g_game.g_f_background_music[g_game.g_f_lua_game_event.F_LUA_EFFECT_HUANGZI_JINENG4 - g_game.g_f_lua_game_event.F_LUA_SOUND_START]
		self:playEffect(effectFile)	
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_EFFECT_HUANGZI_JINENG4, self.event_play_effect_huangzijineng4)
	
	self.event_play_effect_huangzijineng5 = function()
		local effectFile = g_game.g_f_background_music[g_game.g_f_lua_game_event.F_LUA_EFFECT_HUANGZI_JINENG5 - g_game.g_f_lua_game_event.F_LUA_SOUND_START]
		self:playEffect(effectFile)	
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_EFFECT_HUANGZI_JINENG5, self.event_play_effect_huangzijineng5)
	
	
	self.event_play_effect_bipinguocheng = function()
		local effectFile = g_game.g_f_background_music[g_game.g_f_lua_game_event.F_LUA_EFFECT_BIPINGGUOCHENG - g_game.g_f_lua_game_event.F_LUA_SOUND_START]
		self:playEffectLoop(effectFile)
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_EFFECT_BIPINGGUOCHENG, self.event_play_effect_bipinguocheng)
	
	
	self.event_play_effect_yunceng = function()
		local effectFile = g_game.g_f_background_music[g_game.g_f_lua_game_event.F_LUA_EFFECT_YUNCENG - g_game.g_f_lua_game_event.F_LUA_SOUND_START]
		self:playEffect(effectFile)
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_EFFECT_YUNCENG, self.event_play_effect_yunceng)
		
	self.event_play_effect_bipinshibai = function()
		local effectFile = g_game.g_f_background_music[g_game.g_f_lua_game_event.F_LUA_EFFECT_BIPING_SHIBAI - g_game.g_f_lua_game_event.F_LUA_SOUND_START]
		self:playEffect(effectFile)
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_EFFECT_BIPING_SHIBAI, self.event_play_effect_bipinshibai)
	
	self.event_play_effect = function()
		local effectFile = g_game.g_f_background_music[g_game.g_f_lua_game_event.F_LUA_EFFECT_FANYE - g_game.g_f_lua_game_event.F_LUA_SOUND_START]
		self:playEffect(effectFile)
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_EFFECT_FANYE, self.event_play_effect)
	
	self.event_play_effect = function()
		local effectFile = g_game.g_f_background_music[g_game.g_f_lua_game_event.F_LUA_EFFECT_FENYEQIAN - g_game.g_f_lua_game_event.F_LUA_SOUND_START]
		self:playEffect(effectFile)
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_EFFECT_FENYEQIAN, self.event_play_effect)
	
	self.event_play_effect = function()
		local effectFile = g_game.g_f_background_music[g_game.g_f_lua_game_event.F_LUA_EFFECT_GAIZHANG - g_game.g_f_lua_game_event.F_LUA_SOUND_START]
		self:playEffect(effectFile)
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_EFFECT_GAIZHANG, self.event_play_effect)
	
	self.event_play_effect = function()
		local effectFile = g_game.g_f_background_music[g_game.g_f_lua_game_event.F_LUA_EFFECT_CLOSE_POPUP - g_game.g_f_lua_game_event.F_LUA_SOUND_START]
		self:playEffect(effectFile)
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_EFFECT_CLOSE_POPUP, self.event_play_effect)
	
	self.event_play_effect = function()
		local effectFile = g_game.g_f_background_music[g_game.g_f_lua_game_event.F_LUA_EFFECT_HUANGDISHENGJI - g_game.g_f_lua_game_event.F_LUA_SOUND_START]
		self:playEffect(effectFile)
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_EFFECT_HUANGDISHENGJI, self.event_play_effect)
	
	self.event_play_effect = function()
		local effectFile = g_game.g_f_background_music[g_game.g_f_lua_game_event.F_LUA_EFFECT_CEFENGCHENGGONG - g_game.g_f_lua_game_event.F_LUA_SOUND_START]
		self:playEffect(effectFile)
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_EFFECT_CEFENGCHENGGONG, self.event_play_effect)
	
	self.event_play_effect = function()
		local effectFile = g_game.g_f_background_music[g_game.g_f_lua_game_event.F_LUA_EFFECT_JIXIANG - g_game.g_f_lua_game_event.F_LUA_SOUND_START]
		self:playEffect(effectFile)
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_EFFECT_JIXIANG, self.event_play_effect)
	
	self.event_play_effect = function()
		local effectFile = g_game.g_f_background_music[g_game.g_f_lua_game_event.F_LUA_EFFECT_MEINVXIANGQING - g_game.g_f_lua_game_event.F_LUA_SOUND_START]
		self:playEffect(effectFile)
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_EFFECT_MEINVXIANGQING, self.event_play_effect)
	
	self.event_play_effect = function()
		local effectFile = g_game.g_f_background_music[g_game.g_f_lua_game_event.F_LUA_EFFECT_JIAOYUHUANGZI - g_game.g_f_lua_game_event.F_LUA_SOUND_START]
		self:playEffect(effectFile)
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_EFFECT_JIAOYUHUANGZI, self.event_play_effect)
	
	self.event_play_effect = function()
		local effectFile = g_game.g_f_background_music[g_game.g_f_lua_game_event.F_LUA_EFFECT_QIJIA - g_game.g_f_lua_game_event.F_LUA_SOUND_START]
		self:playEffect(effectFile)
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_EFFECT_QIJIA, self.event_play_effect)
	
	self.event_play_effect = function()
		local r = math.random(0,1)
		local effectFile = g_game.g_f_background_music[g_game.g_f_lua_game_event.F_LUA_EFFECT_HUANGZIXIANGQING - g_game.g_f_lua_game_event.F_LUA_SOUND_START]
		if r == 1 then
			effectFile = g_game.g_f_background_music[g_game.g_f_lua_game_event.F_LUA_EFFECT_HUANGZIQINGAN - g_game.g_f_lua_game_event.F_LUA_SOUND_START]
		end
		self:playEffect(effectFile)
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_EFFECT_HUANGZIXIANGQING, self.event_play_effect)
	
	self.event_play_effect = function()
		local effectFile = g_game.g_f_background_music[g_game.g_f_lua_game_event.F_LUA_EFFECT_HUANGZIJIAOYU - g_game.g_f_lua_game_event.F_LUA_SOUND_START]
		self:playEffect(effectFile)
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_EFFECT_HUANGZIJIAOYU, self.event_play_effect)
	
	self.event_play_effect = function()
		local effectFile = g_game.g_f_background_music[g_game.g_f_lua_game_event.F_LUA_EFFECT_MC_JINENGZHANSHI - g_game.g_f_lua_game_event.F_LUA_SOUND_START]
		self:playEffect(effectFile)
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_EFFECT_MC_JINENGZHANSHI, self.event_play_effect)
	
	self.event_play_effect = function()
		local effectFile = g_game.g_f_background_music[g_game.g_f_lua_game_event.F_LUA_EFFECT_KAIBAOXIANG - g_game.g_f_lua_game_event.F_LUA_SOUND_START]
		self:playEffect(effectFile)
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_EFFECT_KAIBAOXIANG, self.event_play_effect)
	
	self.event_play_effect = function()
		local effectFile = g_game.g_f_background_music[g_game.g_f_lua_game_event.F_LUA_EFFECT_KAPAISHENGJI - g_game.g_f_lua_game_event.F_LUA_SOUND_START]
		self:playEffect(effectFile)
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_EFFECT_KAPAISHENGJI, self.event_play_effect)
	
	self.event_play_effect = function()
		local effectFile = g_game.g_f_background_music[g_game.g_f_lua_game_event.F_LUA_EFFECT_MINGCHENXIANGQING - g_game.g_f_lua_game_event.F_LUA_SOUND_START]
		self:playEffect(effectFile)
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_EFFECT_MINGCHENXIANGQING, self.event_play_effect)
	
	self.event_play_effect = function()
		local r = math.random(0,1)
		local effectFile = g_game.g_f_background_music[g_game.g_f_lua_game_event.F_LUA_EFFECT_CHENZAI + r - g_game.g_f_lua_game_event.F_LUA_SOUND_START]
		self:playEffect(effectFile)
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_EFFECT_CHENZAI, self.event_play_effect)

	self.event_play_effect = function()
		local effectFile = g_game.g_f_background_music[g_game.g_f_lua_game_event.F_LUA_EFFECT_CHENZAI2 - g_game.g_f_lua_game_event.F_LUA_SOUND_START]
		self:playEffect(effectFile)
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_EFFECT_CHENZAI2, self.event_play_effect)
	
	self.event_play_effect = function()
		local effectFile = g_game.g_f_background_music[g_game.g_f_lua_game_event.F_LUA_EFFECT_CHOUZHONGMINGCHEN - g_game.g_f_lua_game_event.F_LUA_SOUND_START]
		self:playEffect(effectFile)
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_EFFECT_CHOUZHONGMINGCHEN, self.event_play_effect)
	
	self.event_play_effect = function()
		local effectFile = g_game.g_f_background_music[g_game.g_f_lua_game_event.F_LUA_EFFECT_HUIQU - g_game.g_f_lua_game_event.F_LUA_SOUND_START]
		self:playEffect(effectFile)
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_EFFECT_HUIQU, self.event_play_effect)
	
	self.event_play_effect = function()
		local effectFile = g_game.g_f_background_music[g_game.g_f_lua_game_event.F_LUA_EFFECT_POPUP - g_game.g_f_lua_game_event.F_LUA_SOUND_START]
		self:playEffect(effectFile)
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_EFFECT_POPUP, self.event_play_effect)
	
	self.event_play_effect = function()
		local r = math.random(0,1)
		local effectFile = g_game.g_f_background_music[g_game.g_f_lua_game_event.F_LUA_EFFECT_HUANGZIXIANGQING_TN - g_game.g_f_lua_game_event.F_LUA_SOUND_START]
		if r == 1 then
			effectFile = g_game.g_f_background_music[g_game.g_f_lua_game_event.F_LUA_EFFECT_HUANGZIQINGAN_TN - g_game.g_f_lua_game_event.F_LUA_SOUND_START]
		end
		self:playEffect(effectFile)
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_EFFECT_HUANGZIXIANGQING_TN, self.event_play_effect)
	
	self.event_play_effect = function()
		local effectFile = g_game.g_f_background_music[g_game.g_f_lua_game_event.F_LUA_EFFECT_HUANGZIJIAOYU_TN - g_game.g_f_lua_game_event.F_LUA_SOUND_START]
		self:playEffect(effectFile)
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_EFFECT_HUANGZIJIAOYU_TN, self.event_play_effect)
	
	self.event_play_effect = function()
		local effectFile = g_game.g_f_background_music[g_game.g_f_lua_game_event.F_LUA_EFFECT_BABY_CRY - g_game.g_f_lua_game_event.F_LUA_SOUND_START]
		self:playEffect(effectFile)
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_EFFECT_BABY_CRY, self.event_play_effect)
	
	self.event_play_effect = function()
		local effectFile = g_game.g_f_background_music[g_game.g_f_lua_game_event.F_LUA_EFFECT_MEINV_XINTIAO - g_game.g_f_lua_game_event.F_LUA_SOUND_START]
		self:playEffectLoop(effectFile)
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_EFFECT_MEINV_XINTIAO, self.event_play_effect)
	
	self.event_play_effect = function()
		local effectFile = g_game.g_f_background_music[g_game.g_f_lua_game_event.F_LUA_EFFECT_MEINV_ZHUANPAN - g_game.g_f_lua_game_event.F_LUA_SOUND_START]
		self:playEffect(effectFile)
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_EFFECT_MEINV_ZHUANPAN, self.event_play_effect)
	
	self.event_play_effect = function()
		local effectFile = g_game.g_f_background_music[g_game.g_f_lua_game_event.F_LUA_EFFECT_MEINV_SHAZHANG - g_game.g_f_lua_game_event.F_LUA_SOUND_START]
		self:playEffect(effectFile)
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_EFFECT_MEINV_SHAZHANG, self.event_play_effect)
	
	self.event_play_effect = function()
		local effectFile = g_game.g_f_background_music[g_game.g_f_lua_game_event.F_LUA_EFFECT_QIAOLUO - g_game.g_f_lua_game_event.F_LUA_SOUND_START]
		self:playEffect(effectFile)
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_EFFECT_QIAOLUO, self.event_play_effect)
	
	self.event_play_effect = function()
		local effectFile = g_game.g_f_background_music[g_game.g_f_lua_game_event.F_LUA_EFFECT_BINGMA_JINRU - g_game.g_f_lua_game_event.F_LUA_SOUND_START]
		self:playEffect(effectFile)
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_EFFECT_BINGMA_JINRU, self.event_play_effect)
	
	self.event_play_effect = function()
		local effectFile = g_game.g_f_background_music[g_game.g_f_lua_game_event.F_LUA_EFFECT_QIANGHUA - g_game.g_f_lua_game_event.F_LUA_SOUND_START]
		self:playEffect(effectFile)
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_EFFECT_QIANGHUA, self.event_play_effect)
	
	self.stopBackground = function()
		if self.m_audio.isBackgroundMusicPlaying() then
			self.m_audio.stopBackgroundMusic(true)
		end
	end
	g_game.g_eventManager:registerLuaEvent(g_game.g_f_lua_game_event.F_LUA_STOPBG_MUSIC, self.stopBackground)
	
end
end


-------------------------------------------------
-- @function [parent=#f_lua_audio_manager] playBackgroundMusic
-- 播放背景音乐
-------------------------------------------------
function f_lua_audio_manager:playBackgroundMusic(music, loop)	
	if music == self.m_current_music then
		return 
	end
	if self.m_audio.isBackgroundMusicPlaying() then
		self.m_audio.stopBackgroundMusic(true)
	end
	
	if device.platform == "android" then
		self.m_current_music = "android_sound/" .. music
	elseif device.platform == "ios" then
		self.m_current_music = "ios_sound/" .. music
	else
		self.m_current_music = "win32_sound/" .. music
	end
	
	self.m_audio.preloadBackgroundMusic(self.m_current_music)
	self.m_audio.playBackgroundMusic(self.m_current_music, loop)
end


-------------------------------------------------
-- @function [parent=#f_lua_audio_manager] playEffect
-- 播放音效
-------------------------------------------------
function f_lua_audio_manager:playEffect(effect)	
	if device.platform == "android" then
		self.m_current_effect = "android_sound/" .. effect .. ".ogg"
	elseif device.platform == "ios" then
		self.m_current_effect = "ios_sound/" .. effect .. ".mp3.caf"
	else
		self.m_current_effect = "win32_sound/" .. effect .. ".mp3"
	end
	
	self.m_audio.preloadEffect(self.m_current_effect)
	self.m_audio.playEffect(self.m_current_effect)
end

-------------------------------------------------
-- @function [parent=#f_lua_audio_manager] preloadAllEffect
-- 加载所有音效
-------------------------------------------------
function f_lua_audio_manager:preloadAllEffect()	
	if self.m_hasPreload then
		return
	end
	if device.platform == "android" then
		for k,v in pairs(g_game.g_f_background_music) do
			if k >= 11 and v ~= nil then
				self.m_audio.preloadEffect("android_sound/" .. v .. ".ogg")
			end
		end
	end
	self.m_hasPreload = true
end

-------------------------------------------------
-- @function [parent=#f_lua_audio_manager] playEffectLoop
-- 循环播放音效
-------------------------------------------------
function f_lua_audio_manager:playEffectLoop(effect)	
	if device.platform == "android" then
		self.m_current_effect = "android_sound/" .. effect .. ".ogg"
	elseif device.platform == "ios" then
		self.m_current_effect = "ios_sound/" .. effect .. ".mp3.caf"
	else
		self.m_current_effect = "win32_sound/" .. effect .. ".mp3"
	end
	
	self.m_audio.preloadEffect(self.m_current_effect)
	self.m_audio.playEffect(self.m_current_effect, true)

end


-------------------------------------------------
-- @function [parent=#f_lua_audio_manager] stopAllEffect
-- 停止播放音效
-------------------------------------------------
function f_lua_audio_manager:stopAllEffect()
	self.m_audio.stopAllEffects()

end

return f_lua_audio_manager