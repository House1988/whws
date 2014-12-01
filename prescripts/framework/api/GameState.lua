
local GameState = class("GameState")
GameState.__index = GameState

GameState.ERROR_INVALID_FILE_CONTENTS = -1
GameState.ERROR_HASH_MISS_MATCH       = -2
GameState.ERROR_STATE_FILE_NOT_FOUND  = -3

function GameState:ctor()	

	self.json   = require("prescripts.framework.json")
	
	self.encodeSign    = "=QP="
	self.stateFilename = "state.txt"
	self.eventListener = nil
	self.secretKey     = nil
end



function GameState:isEncodedContents_(contents)
    return string.sub(contents, 1, string.len(self.encodeSign)) == self.encodeSign
end

function GameState:encode_(values)
    local s = self.json.encode(values)
    local hash = "fei"--s..secretKey
    local contents = self.json.encode({h = hash, s = s})
    return self.encodeSign..contents    
end

function GameState:decode_(fileContents)
    local contents = string.sub(fileContents, string.len(self.encodeSign) + 1)
    local j = self.json.decode(contents)

    if type(j) ~= "table" then
        echoError("GameState.decode_() - invalid contents")
        return {errorCode = GameState.ERROR_INVALID_FILE_CONTENTS}
    end

    local hash,s = j.h, j.s
    local testHash = "fei"--s..secretKey
    if testHash ~= hash then
        echoError("GameState.decode_() - hash miss match")
        return {errorCode = GameState.ERROR_HASH_MISS_MATCH}
    end

    local values = self.json.decode(s)
    if type(values) ~= "table" then
        echoError("GameState.decode_() - invalid state data")
        return {errorCode = GameState.ERROR_INVALID_FILE_CONTENTS}
    end

    return {values = values}
end

----------------------------------------

function GameState:init(eventListener_, stateFilename_, secretKey_)
    if type(eventListener_) ~= "function" then
        echoError("GameState.init() - invalid eventListener")
        return false
    end

    self.eventListener = eventListener_

    if type(stateFilename_) == "string" then
        self.stateFilename = stateFilename_
    end

    if type(secretKey_) == "string" then
        self.secretKey = secretKey_
    end

    self.eventListener({
        name     = "init",
        filename = self:getGameStatePath(),
        encode   = type(self.secretKey) == "string"
    })

    return true
end

function GameState:load()
    local filename = self:getGameStatePath()

    if not io.exists(filename) then
        echoInfo("GameState.load() - file \"%s\" not found", filename)
        return self.eventListener({name = "load", errorCode = GameState.ERROR_STATE_FILE_NOT_FOUND})
    end

    local contents = io.readfile(filename)
    echoInfo("GameState.load() - get values from \"%s\"", filename)
	local decryptStr = g_game.g_utilManager:decryptStringLua(13, contents, string.len(contents))
		
    local values
    local encode = false

    if self.secretKey and self:isEncodedContents_(decryptStr) then
        local d = self:decode_(decryptStr)
        if d.errorCode then
            return self.eventListener({name = "load", errorCode = d.errorCode})
        end

        values = d.values
        encode = true
    else
        values = self.json.decode(decryptStr)
        if type(values) ~= "table" then
            echoError("GameState.load() - invalid data")
            return self.eventListener({name = "load", errorCode = GameState.ERROR_INVALID_FILE_CONTENTS})
        end
    end

    return self.eventListener({
        name   = "load",
        values = values,
        encode = encode,
        time   = os.time()
    })
end

function GameState:save(newValues)
    local values = self.eventListener({
        name   = "save",
        values = newValues,
        encode = type(self.secretKey) == "string"
    })
    if type(values) ~= "table" then
        echoError("GameState.save() - listener return invalid data")
        return false
    end

    local filename = self:getGameStatePath()
    local ret = false
    if self.secretKey then
        local s = self:encode_(values)
        local encryptStr = g_game.g_utilManager:encryptStringLua(13, s, string.len(s))
        ret = io.writefile(filename, encryptStr)
    else
        local s = self.json.encode(values)
        if type(s) == "string" then
        	local encryptStr = g_game.g_utilManager:encryptStringLua(13, s, string.len(s))
            ret = io.writefile(filename, encryptStr)
        end
    end

    echoInfo("GameState.save() - update file \"%s\"", filename)
    return ret
end

function GameState:getGameStatePath()
    return string.gsub(device.writablePath, "[\\\\/]+$", "") .. "/" .. self.stateFilename
end

return GameState
