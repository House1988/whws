function createshibai()

    local table_shibai = {}

    local shibai = fc.FContainerPanel:create()
    shibai:setSize(cc.size(960,640))
    table_shibai["shibai"] = shibai

    local shibai_bottom_panel = fc.FContainerPanel:create()
    shibai_bottom_panel:setSize(cc.size(700,600))
    shibai_bottom_panel:setAnchorPoint(cc.p(0.5,0.5))
    shibai:appendComponent(shibai_bottom_panel)
    shibai_bottom_panel:setPositionInContainer(cc.p(508,300))
    table_shibai["shibai_bottom_panel"] = shibai_bottom_panel

    local shibai_bg_left = fc.FExtensionsImage:create()
    shibai_bg_left:setImage("nobatch/shengli.png")
    shibai_bg_left:setSize(cc.size(202,488))
    shibai_bg_left:setAnchorPoint(cc.p(0.5,0.5))
    shibai_bottom_panel:appendComponent(shibai_bg_left)
    shibai_bg_left:setPositionInContainer(cc.p(230,337))
    table_shibai["shibai_bg_left"] = shibai_bg_left

    local shibai_bg_right = fc.FExtensionsImage:create()
    shibai_bg_right:setImage("nobatch/shengli.png")
    shibai_bg_right:setSize(cc.size(202,488))
    shibai_bg_right:setFlipType(2)
    shibai_bg_right:setAnchorPoint(cc.p(0.5,0.5))
    shibai_bottom_panel:appendComponent(shibai_bg_right)
    shibai_bg_right:setPositionInContainer(cc.p(432,337))
    table_shibai["shibai_bg_right"] = shibai_bg_right

    local shibai_bg_image = fc.FScale9Image:createWithBatchUIFrame("nobatch/shengli_biaotikuang.png",cc.rect(233,30,5,5))
    shibai_bg_image:setSize(cc.size(578,87))
    shibai_bg_image:setAnchorPoint(cc.p(0.5,0.5))
    shibai_bottom_panel:appendComponent(shibai_bg_image)
    shibai_bg_image:setPositionInContainer(cc.p(327,84.5))
    table_shibai["shibai_bg_image"] = shibai_bg_image

    local line_left = fc.FExtensionsImage:create()
    line_left:setImage("batch_ui/sheng_shengli.png")
    line_left:setSize(cc.size(27,73))
    line_left:setAnchorPoint(cc.p(0.5,0.5))
    shibai_bottom_panel:appendComponent(line_left)
    line_left:setPositionInContainer(cc.p(182.5,36.5))
    table_shibai["line_left"] = line_left

    local line_right = fc.FExtensionsImage:create()
    line_right:setImage("batch_ui/sheng_shengli.png")
    line_right:setSize(cc.size(27,73))
    line_right:setAnchorPoint(cc.p(0.5,0.5))
    shibai_bottom_panel:appendComponent(line_right)
    line_right:setPositionInContainer(cc.p(488.5,36.5))
    table_shibai["line_right"] = line_right

    local sui1 = fc.FExtensionsImage:create()
    sui1:setImage("batch_ui/sui_shengli.png")
    sui1:setSize(cc.size(80,179))
    sui1:setAnchorPoint(cc.p(0.5,0.5))
    shibai_bottom_panel:appendComponent(sui1)
    sui1:setPositionInContainer(cc.p(86,175.5))
    table_shibai["sui1"] = sui1

    local sui2 = fc.FExtensionsImage:create()
    sui2:setImage("batch_ui/sui_shengli.png")
    sui2:setSize(cc.size(80,179))
    sui2:setFlipType(2)
    sui2:setAnchorPoint(cc.p(0.5,0.5))
    shibai_bottom_panel:appendComponent(sui2)
    sui2:setPositionInContainer(cc.p(574,175.5))
    table_shibai["sui2"] = sui2

    local shibai_yuanbao_image = fc.FExtensionsImage:create()
    shibai_yuanbao_image:setImage("batch_ui/yuanbao_da.png")
    shibai_yuanbao_image:setSize(cc.size(58,43))
    shibai_yuanbao_image:setAnchorPoint(cc.p(0.5,0.5))
    shibai_bottom_panel:appendComponent(shibai_yuanbao_image)
    shibai_yuanbao_image:setPositionInContainer(cc.p(198,166.5))
    table_shibai["shibai_yuanbao_image"] = shibai_yuanbao_image

    local shibai_exp_image = fc.FExtensionsImage:create()
    shibai_exp_image:setImage("batch_ui/exp.png")
    shibai_exp_image:setSize(cc.size(71,42))
    shibai_exp_image:setAnchorPoint(cc.p(0.5,0.5))
    shibai_bottom_panel:appendComponent(shibai_exp_image)
    shibai_exp_image:setPositionInContainer(cc.p(392.5,166))
    table_shibai["shibai_exp_image"] = shibai_exp_image

    local shibai_yuanbao_num_label = fc.FLabel:createBMFont()
    shibai_yuanbao_num_label:setSize(cc.size(80,30))
    shibai_yuanbao_num_label:setAnchorPoint(cc.p(0.5,0.5))
    shibai_yuanbao_num_label:setFontSize(21)
    shibai_yuanbao_num_label:setString("+99999")
    shibai_yuanbao_num_label:setColor(cc.c3b(137,32,18))
    shibai_bottom_panel:appendComponent(shibai_yuanbao_num_label)
    shibai_yuanbao_num_label:setPositionInContainer(cc.p(272,168))
    table_shibai["shibai_yuanbao_num_label"] = shibai_yuanbao_num_label

    local shibai_exp_num_label = fc.FLabel:createBMFont()
    shibai_exp_num_label:setSize(cc.size(80,30))
    shibai_exp_num_label:setAnchorPoint(cc.p(0.5,0.5))
    shibai_exp_num_label:setFontSize(21)
    shibai_exp_num_label:setString("+99999")
    shibai_exp_num_label:setColor(cc.c3b(137,32,18))
    shibai_bottom_panel:appendComponent(shibai_exp_num_label)
    shibai_exp_num_label:setPositionInContainer(cc.p(475,168))
    table_shibai["shibai_exp_num_label"] = shibai_exp_num_label

    local shibai_word_label = fc.FLabel:createBMFont()
    shibai_word_label:setSize(cc.size(330,60))
    shibai_word_label:setWidth(330)
    shibai_word_label:setAnchorPoint(cc.p(0.5,0.5))
    shibai_word_label:setFontSize(20)
    local strT = g_game.g_dictConfigManager:getLanTextById(288)
    shibai_word_label:setString(strT)
    shibai_word_label:setColor(cc.c3b(137,32,18))
    shibai_bottom_panel:appendComponent(shibai_word_label)
    shibai_word_label:setPositionInContainer(cc.p(337,236))
    table_shibai["shibai_word_label"] = shibai_word_label

    local shibai_paibingbuzhen_button = fc.FScaleButton:create()
    shibai_paibingbuzhen_button:setSize(cc.size(100,100))
    shibai_paibingbuzhen_button:setAnchorPoint(cc.p(0.5,0.5))
    shibai_paibingbuzhen_button:setButtonImage("batch_ui/paibingbuzhen_anniu.png")
    shibai_bottom_panel:appendComponent(shibai_paibingbuzhen_button)
    shibai_paibingbuzhen_button:setPositionInContainer(cc.p(204,339))
    table_shibai["shibai_paibingbuzhen_button"] = shibai_paibingbuzhen_button

    local shibai_zhaomu_button = fc.FScaleButton:create()
    shibai_zhaomu_button:setSize(cc.size(100,100))
    shibai_zhaomu_button:setAnchorPoint(cc.p(0.5,0.5))
    shibai_zhaomu_button:setButtonImage("batch_ui/kejuxuanjiang_anniu.png")
    shibai_bottom_panel:appendComponent(shibai_zhaomu_button)
    shibai_zhaomu_button:setPositionInContainer(cc.p(330,339))
    table_shibai["shibai_zhaomu_button"] = shibai_zhaomu_button

    local shibai_queding_button = fc.FScaleButton:create()
    shibai_queding_button:setSize(cc.size(144,53))
    shibai_queding_button:setAnchorPoint(cc.p(0.5,0.5))
    shibai_queding_button:setButtonImage("batch_ui/putonganniu1_up.png")
    shibai_bottom_panel:appendComponent(shibai_queding_button)
    shibai_queding_button:setPositionInContainer(cc.p(327,443.5))
    table_shibai["shibai_queding_button"] = shibai_queding_button

    local shibai_que = fc.FShaderExtensionsImage:create(0)
    shibai_que:setAnchorPoint(cc.p(0.5,0.5))
    shibai_que:setImage("batch_ui/que_uizi.png")
    shibai_que:setSize(cc.size(32,32))
    shibai_queding_button:appendComponent(shibai_que)
    shibai_que:setPositionInContainer(cc.p(54,26))
    table_shibai["shibai_que"] = shibai_que

    local shibai_ding = fc.FShaderExtensionsImage:create(0)
    shibai_ding:setAnchorPoint(cc.p(0.5,0.5))
    shibai_ding:setImage("batch_ui/ding_uizi.png")
    shibai_ding:setSize(cc.size(32,32))
    shibai_queding_button:appendComponent(shibai_ding)
    shibai_ding:setPositionInContainer(cc.p(90,26))
    table_shibai["shibai_ding"] = shibai_ding

    local shibai_equipLvup_button = fc.FScaleButton:create()
    shibai_equipLvup_button:setSize(cc.size(100,100))
    shibai_equipLvup_button:setAnchorPoint(cc.p(0.5,0.5))
    shibai_equipLvup_button:setButtonImage("batch_ui/zhuangbeishengji_anniu.png")
    shibai_bottom_panel:appendComponent(shibai_equipLvup_button)
    shibai_equipLvup_button:setPositionInContainer(cc.p(458,339))
    table_shibai["shibai_equipLvup_button"] = shibai_equipLvup_button

    return table_shibai

end

