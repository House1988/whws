lang = {}

local language

if LANGUAGE_TYPE == 3 then
	language = require("scripts.localstring.lang_tw")
else
	language = require("scripts.localstring.lang_cn")
end

function lang.get( str )
	if language then
		if language[str] then
			return language[str]
		end
	end
	return ""
end

return lang