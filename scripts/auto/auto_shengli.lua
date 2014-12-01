function createshengli()

    local table_shengli = {}

    local shengli = fc.FContainerPanel:create()
    shengli:setSize(cc.size(960,640))
    table_shengli["shengli"] = shengli

    local bottom_panel = fc.FContainerPanel:create()
    bottom_panel:setSize(cc.size(700,600))
    bottom_panel:setAnchorPoint(cc.p(0.5,0.5))
    shengli:appendComponent(bottom_panel)
    bottom_panel:setPositionInContainer(cc.p(505,301))
    table_shengli["bottom_panel"] = bottom_panel

    local shengli_bg_left = fc.FExtensionsImage:create()
    shengli_bg_left:setImage("nobatch/shengli.png")
    shengli_bg_left:setSize(cc.size(202,488))
    shengli_bg_left:setAnchorPoint(cc.p(0.5,0.5))
    bottom_panel:appendComponent(shengli_bg_left)
    shengli_bg_left:setPositionInContainer(cc.p(230,337))
    table_shengli["shengli_bg_left"] = shengli_bg_left

    local shengli_bg_right = fc.FExtensionsImage:create()
    shengli_bg_right:setImage("nobatch/shengli.png")
    shengli_bg_right:setSize(cc.size(202,488))
    shengli_bg_right:setFlipType(2)
    shengli_bg_right:setAnchorPoint(cc.p(0.5,0.5))
    bottom_panel:appendComponent(shengli_bg_right)
    shengli_bg_right:setPositionInContainer(cc.p(432,337))
    table_shengli["shengli_bg_right"] = shengli_bg_right

    local shengli_yuanbao_image = fc.FExtensionsImage:create()
    shengli_yuanbao_image:setImage("batch_ui/yuanbao_da.png")
    shengli_yuanbao_image:setSize(cc.size(58,43))
    shengli_yuanbao_image:setAnchorPoint(cc.p(0.5,0.5))
    bottom_panel:appendComponent(shengli_yuanbao_image)
    shengli_yuanbao_image:setPositionInContainer(cc.p(209,206.5))
    table_shengli["shengli_yuanbao_image"] = shengli_yuanbao_image

    local shengli_yuanbao_num_label = fc.FLabel:createBMFont()
    shengli_yuanbao_num_label:setSize(cc.size(80,30))
    shengli_yuanbao_num_label:setAnchorPoint(cc.p(0.5,0.5))
    shengli_yuanbao_num_label:setFontSize(21)
    shengli_yuanbao_num_label:setString("+99999")
    shengli_yuanbao_num_label:setColor(cc.c3b(137,32,18))
    bottom_panel:appendComponent(shengli_yuanbao_num_label)
    shengli_yuanbao_num_label:setPositionInContainer(cc.p(282,206))
    table_shengli["shengli_yuanbao_num_label"] = shengli_yuanbao_num_label

    local shengli_exp_image = fc.FExtensionsImage:create()
    shengli_exp_image:setImage("batch_ui/exp.png")
    shengli_exp_image:setSize(cc.size(71,42))
    shengli_exp_image:setAnchorPoint(cc.p(0.5,0.5))
    bottom_panel:appendComponent(shengli_exp_image)
    shengli_exp_image:setPositionInContainer(cc.p(385.5,206))
    table_shengli["shengli_exp_image"] = shengli_exp_image

    local shengli_exp_num_label = fc.FLabel:createBMFont()
    shengli_exp_num_label:setSize(cc.size(80,30))
    shengli_exp_num_label:setAnchorPoint(cc.p(0.5,0.5))
    shengli_exp_num_label:setFontSize(21)
    shengli_exp_num_label:setString("+99999")
    shengli_exp_num_label:setColor(cc.c3b(137,32,18))
    bottom_panel:appendComponent(shengli_exp_num_label)
    shengli_exp_num_label:setPositionInContainer(cc.p(461,206))
    table_shengli["shengli_exp_num_label"] = shengli_exp_num_label

    local shengli_word_label = fc.FLabel:createBMFont()
    shengli_word_label:setSize(cc.size(330,72))
    if LANGUAGE_TYPE == 3 then
        shengli_word_label:setWidth(365)
    else
	    shengli_word_label:setWidth(330)
    end
    shengli_word_label:setAnchorPoint(cc.p(0.5,0.5))
    shengli_word_label:setFontSize(20)
    local strT = g_game.g_dictConfigManager:getLanTextById(287)
    shengli_word_label:setString(strT)
    shengli_word_label:setColor(cc.c3b(137,32,18))
    bottom_panel:appendComponent(shengli_word_label)
    shengli_word_label:setPositionInContainer(cc.p(340,287))
    table_shengli["shengli_word_label"] = shengli_word_label

    local title_bg_image = fc.FScale9Image:createWithBatchUIFrame("nobatch/shengli_biaotikuang.png",cc.rect(233,30,5,5))
    title_bg_image:setSize(cc.size(578,87))
    title_bg_image:setAnchorPoint(cc.p(0.5,0.5))
    bottom_panel:appendComponent(title_bg_image)
    title_bg_image:setPositionInContainer(cc.p(327,84.5))
    table_shengli["title_bg_image"] = title_bg_image

    local line_l = fc.FExtensionsImage:create()
    line_l:setImage("batch_ui/sheng_shengli.png")
    line_l:setSize(cc.size(27,73))
    line_l:setAnchorPoint(cc.p(0.5,0.5))
    bottom_panel:appendComponent(line_l)
    line_l:setPositionInContainer(cc.p(182.5,36.5))
    table_shengli["line_l"] = line_l

    local line_r = fc.FExtensionsImage:create()
    line_r:setImage("batch_ui/sheng_shengli.png")
    line_r:setSize(cc.size(27,73))
    line_r:setAnchorPoint(cc.p(0.5,0.5))
    bottom_panel:appendComponent(line_r)
    line_r:setPositionInContainer(cc.p(488.5,36.5))
    table_shengli["line_r"] = line_r

    local sui = fc.FExtensionsImage:create()
    sui:setImage("batch_ui/sui_shengli.png")
    sui:setSize(cc.size(80,179))
    sui:setAnchorPoint(cc.p(0.5,0.5))
    bottom_panel:appendComponent(sui)
    sui:setPositionInContainer(cc.p(86,175.5))
    table_shengli["sui"] = sui

    local sui2 = fc.FExtensionsImage:create()
    sui2:setImage("batch_ui/sui_shengli.png")
    sui2:setSize(cc.size(80,179))
    sui2:setFlipType(2)
    sui2:setAnchorPoint(cc.p(0.5,0.5))
    bottom_panel:appendComponent(sui2)
    sui2:setPositionInContainer(cc.p(574,175.5))
    table_shengli["sui2"] = sui2

    return table_shengli

end

