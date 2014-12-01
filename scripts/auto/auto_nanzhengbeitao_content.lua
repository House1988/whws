function createnanzhengbeitao_content()

    local table_nanzhengbeitao_content = {}

    local nanzhengbeitao_content = fc.FContainerPanel:create()
    nanzhengbeitao_content:setSize(cc.size(960,640))
    table_nanzhengbeitao_content["nanzhengbeitao_content"] = nanzhengbeitao_content

    local nzbt_content_pre_button = fc.FScaleButton:create()
    nzbt_content_pre_button:setSize(cc.size(38,60))
    nzbt_content_pre_button:setAnchorPoint(cc.p(0.5,0.5))
    nzbt_content_pre_button:setButtonImage("batch_ui/jiantou2.png")
    nanzhengbeitao_content:appendComponent(nzbt_content_pre_button)
    nzbt_content_pre_button:setPositionInContainer(cc.p(27,356))
    table_nanzhengbeitao_content["nzbt_content_pre_button"] = nzbt_content_pre_button

    local nzbt_content_next_button = fc.FScaleButton:create()
    nzbt_content_next_button:setSize(cc.size(38,60))
    nzbt_content_next_button:setAnchorPoint(cc.p(0.5,0.5))
    nzbt_content_next_button:setButtonImage("batch_ui/jiantou2.png")
    nzbt_content_next_button:setScaleX(-1)
    nanzhengbeitao_content:appendComponent(nzbt_content_next_button)
    nzbt_content_next_button:setPositionInContainer(cc.p(936,356))
    table_nanzhengbeitao_content["nzbt_content_next_button"] = nzbt_content_next_button

    local tips_label = fc.FLabel:createBMFont()
    tips_label:setSize(cc.size(343,27))
    tips_label:setAnchorPoint(cc.p(0.5,0.5))
    tips_label:setFontSize(24)
    if LANGUAGE_TYPE == 3 then
	    tips_label:setString("通關對應的普通副本后開啟精英副本")
    else
	    tips_label:setString("通关对应的普通副本后开启精英副本")
    end
    tips_label:setColor(cc.c3b(255,255,255))
    nanzhengbeitao_content:appendComponent(tips_label)
    tips_label:setPositionInContainer(cc.p(199.5,616.5))
    table_nanzhengbeitao_content["tips_label"] = tips_label

    local elite_challenge_num = fc.FLabel:createBMFont()
    elite_challenge_num:setSize(cc.size(200,27))
    elite_challenge_num:setAnchorPoint(cc.p(0.5,0.5))
    elite_challenge_num:setFontSize(24)
     if LANGUAGE_TYPE == 3 then
     	elite_challenge_num:setString("挑戰次數還剩")
     else
	    elite_challenge_num:setString("挑战次数还剩")
     end
    elite_challenge_num:setColor(cc.c3b(255,255,255))
    nanzhengbeitao_content:appendComponent(elite_challenge_num)
    elite_challenge_num:setPositionInContainer(cc.p(796,616.5))
    table_nanzhengbeitao_content["elite_challenge_num"] = elite_challenge_num

    return table_nanzhengbeitao_content

end

