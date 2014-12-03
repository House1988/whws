

-- define global module
g_game = {}

require("scripts.preload.fpreload")

math.randomseed(os.time())


local size = g_game.g_utilManager:getDeviceScreenSize()	
local scale = cc.Director:getInstance():getContentScaleFactor()
g_game.g_real_size = cc.size(size.width/scale, size.height/scale)


g_game.g_current_loading_scene 	= nil

g_game.SCENE_TYPE_NONE			= 1
g_game.SCENE_TYPE_LOGIN			= 2
g_game.SCENE_TYPE_GAME			= 3
g_game.SCENE_TYPE_BATTLE		= 4
g_game.SCENE_TYPE_LOADING		= 5
g_game.SCENE_TYPE_STORY			= 6

g_game.g_current_scene_type		= g_game.SCENE_TYPE_NONE

g_game.g_game_is_init			= false

g_game.m_isLoadFinish			= false

g_game.m_isDisconnectTrigger 	= false

function g_game.startup()
	g_game.enterLoadingScene(3)
	if g_game.g_current_loading_scene ~= nil then
		g_game.g_current_loading_scene:setLoadingData({"test"})
	end
end

function g_game.exit()
    cc.Director:getInstance():endToLua()
end

function g_game.enterLoginScene()
 	 cc.Director:getInstance():replaceScene(require("scripts.game.login.f_login_scene").new())
--  cc.Director:getInstance():replaceScene(require("scripts.scenes.MainScene").new())
  	 g_game.g_current_scene_type = 	g_game.SCENE_TYPE_LOGIN
end

function g_game.enterGameScene()
    cc.Director:getInstance():replaceScene(require("scripts.game.main.f_game_scene").new())
  	 g_game.g_current_scene_type = 	g_game.SCENE_TYPE_GAME
end

function g_game.enterStoryScene()
	 cc.Director:getInstance():replaceScene(require("scripts.game.story.f_story_scene").new())
	 g_game.g_current_scene_type = 	g_game.SCENE_TYPE_STORY
end

function g_game.enterBattleScene()
    cc.Director:getInstance():replaceScene(require("scripts.game.battle.f_battle_scene").new())
  	 g_game.g_current_scene_type = 	g_game.SCENE_TYPE_BATTLE
end

function g_game.enterLoadingScene(type)

	--local testScene = require("scriptes.scenes.MainScene").new()
	--cc.Director:getInstance():runWithScene(testScene)
	g_game.g_utilManager:hideMovingMsg()
	g_game.g_current_loading_scene = require("scripts.game.loading.f_loading_scene").new()
	g_game.g_current_loading_scene:setLoadingType(type)
	if g_game.g_director:getRunningScene() then
   		cc.Director:getInstance():replaceScene(g_game.g_current_loading_scene)
	else
    	cc.Director:getInstance():runWithScene(g_game.g_current_loading_scene)
	end
  	 g_game.g_current_scene_type = 	g_game.SCENE_TYPE_LOADING
end

function network_recive_message(msg)
  	g_game.g_netManager:message_handler(msg)
end

function send_lua_event(luaEvent)
	g_game.g_eventManager:event_handler(luaEvent)
end

function send_lua_event_param(luaEvent, paramTable)
	g_game.g_eventManager:event_handler_param(luaEvent, paramTable)
end
function print_lua_table (lua_table, indent)
    indent = indent or 0
    for k, v in pairs(lua_table) do
        if type(k) == "string" then
            k = string.format("%q", k)
        end
        local szSuffix = ""
        if type(v) == "table" then
            szSuffix = "{"
        end
        local szPrefix = string.rep("    ", indent)
        formatting = szPrefix.."["..k.."]".." = "..szSuffix
        if type(v) == "table" then
            print(formatting)
            -- if #v > 20 then
            --     print_lua_table(v[1], indent + 1)
            -- else
            --     print_lua_table(v, indent + 1)
            -- end
            print_lua_table(v, indent + 1)
            print(szPrefix.."},")
        else
            local szValue = ""
            if type(v) == "string" then
                szValue = string.format("%q", v)
            else
                szValue = tostring(v)
            end
            print(formatting..szValue..",")
        end
    end
    print("")
end
function printlua( str )
    print("========     "..str.."       ===============")
end