
FLuaScene = class("FLuaScene")
FLuaScene.__index = FLuaScene

function FLuaScene.extend(target)
    local t = {}
    tolua.setpeer(target, t)
    setmetatable(t, FLuaScene)
    
    return target
end

function FLuaScene:config_layer()  
    self.preload_layers = {}
    for i=1,table.getn(g_game.g_panelManager.layer_name) do
      self.preload_layers[i] = g_game.g_classFactory.newFLuaLayer(g_game.g_panelManager.layer_name[i])
      self.preload_layers[i]:setTag(i)
      self:addChild(self.preload_layers[i])
  	end
end

function FLuaScene:add_panel_to_layer(panel, layer_config)
    if layer_config ~= nil then
        if self.preload_layers ~= nil then
            self.preload_layers[layer_config]:addChild(panel)
        end
    end
end

function FLuaScene:get_layer_from_config(tag)
    return self.preload_layers[tag]
end