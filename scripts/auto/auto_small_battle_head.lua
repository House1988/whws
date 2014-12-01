function createsmall_battle_head()

    local table_small_battle_head = {}

    local small_battle_head = fc.FContainerPanel:create()
    small_battle_head:setSize(cc.size(112,243))
    table_small_battle_head["small_battle_head"] = small_battle_head

    local button_container = fc.FContainerPanel:create()
    button_container:setSize(cc.size(110,67))
    button_container:setAnchorPoint(cc.p(0.5,0.5))
    small_battle_head:appendComponent(button_container)
    button_container:setPositionInContainer(cc.p(55,208.5))
    table_small_battle_head["button_container"] = button_container

    local button_goumaikaizhen = fc.FScaleButton:create()
    button_goumaikaizhen:setSize(cc.size(102,67))
    button_goumaikaizhen:setAnchorPoint(cc.p(0.5,0.5))
    button_goumaikaizhen:setButtonImage("batch_ui/goumaikaizhan_anniu.png")
    button_container:appendComponent(button_goumaikaizhen)
    button_goumaikaizhen:setPositionInContainer(cc.p(55,33.5))
    table_small_battle_head["button_goumaikaizhen"] = button_goumaikaizhen

    local button_kaizhan = fc.FScaleButton:create()
    button_kaizhan:setSize(cc.size(102,67))
    button_kaizhan:setAnchorPoint(cc.p(0.5,0.5))
    button_kaizhan:setButtonImage("batch_ui/kaizhan_anniu1.png")
    button_container:appendComponent(button_kaizhan)
    button_kaizhan:setPositionInContainer(cc.p(55,33.5))
    table_small_battle_head["button_kaizhan"] = button_kaizhan

    local button_label_attack_num = fc.FLabel:createBMFont()
    button_label_attack_num:setSize(cc.size(50,23))
    button_label_attack_num:setAnchorPoint(cc.p(0.5,0.5))
    button_label_attack_num:setFontSize(20)
    button_label_attack_num:setString("(1/5)")
    button_label_attack_num:setColor(cc.c3b(206,53,0))
    button_container:appendComponent(button_label_attack_num)
    button_label_attack_num:setPositionInContainer(cc.p(72,48.5))
    table_small_battle_head["button_label_attack_num"] = button_label_attack_num

    local stage_container = fc.FContainerPanel:create()
    stage_container:setSize(cc.size(110,176))
    stage_container:setAnchorPoint(cc.p(0.5,0.5))
    small_battle_head:appendComponent(stage_container)
    stage_container:setPositionInContainer(cc.p(58.5,89))
    table_small_battle_head["stage_container"] = stage_container

    local wenzi_di2 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/zuhemingchengdikuang2.png",cc.rect(11,9,3,3))
    wenzi_di2:setSize(cc.size(97,38))
    wenzi_di2:setAnchorPoint(cc.p(0.5,0.5))
    stage_container:appendComponent(wenzi_di2)
    wenzi_di2:setPositionInContainer(cc.p(54.5,26))
    table_small_battle_head["wenzi_di2"] = wenzi_di2

    local wenzi_di = fc.FScale9Image:createWithBatchUIFrame("batch_ui/zuhemingchengdikuang.png",cc.rect(11,9,3,3))
    wenzi_di:setSize(cc.size(97,38))
    wenzi_di:setAnchorPoint(cc.p(0.5,0.5))
    stage_container:appendComponent(wenzi_di)
    wenzi_di:setPositionInContainer(cc.p(54.5,26))
    table_small_battle_head["wenzi_di"] = wenzi_di

    local stage_name_label = fc.FLabel:createBMFont()
    stage_name_label:setSize(cc.size(97,21))
    stage_name_label:setAnchorPoint(cc.p(0.5,0.5))
    stage_name_label:setFontSize(20)
    stage_name_label:setString("关卡五个字")
    stage_name_label:setColor(cc.c3b(255,255,255))
    stage_container:appendComponent(stage_name_label)
    stage_name_label:setPositionInContainer(cc.p(55.5,25.5))
    table_small_battle_head["stage_name_label"] = stage_name_label

    local bottom_normal_bg = fc.FExtensionsImage:create()
    bottom_normal_bg:setImage("stage/normal.png")
    bottom_normal_bg:setSize(cc.size(104,104))
    bottom_normal_bg:setAnchorPoint(cc.p(0.5,0.5))
    stage_container:appendComponent(bottom_normal_bg)
    bottom_normal_bg:setPositionInContainer(cc.p(55,110))
    table_small_battle_head["bottom_normal_bg"] = bottom_normal_bg

    local bottom_boss1_bg = fc.FExtensionsImage:create()
    bottom_boss1_bg:setImage("stage/small_boss.png")
    bottom_boss1_bg:setSize(cc.size(110,110))
    bottom_boss1_bg:setAnchorPoint(cc.p(0.5,0.5))
    stage_container:appendComponent(bottom_boss1_bg)
    bottom_boss1_bg:setPositionInContainer(cc.p(55,110))
    table_small_battle_head["bottom_boss1_bg"] = bottom_boss1_bg

    local bottom_boss2_bg = fc.FExtensionsImage:create()
    bottom_boss2_bg:setImage("stage/big_boss.png")
    bottom_boss2_bg:setSize(cc.size(110,132))
    bottom_boss2_bg:setAnchorPoint(cc.p(0.5,0.5))
    stage_container:appendComponent(bottom_boss2_bg)
    bottom_boss2_bg:setPositionInContainer(cc.p(56,110))
    table_small_battle_head["bottom_boss2_bg"] = bottom_boss2_bg

    local stage_unopen_image = fc.FExtensionsImage:create()
    stage_unopen_image:setImage("batch_ui/zhuangbei4_weikaiqi.png")
    stage_unopen_image:setSize(cc.size(90,90))
    stage_unopen_image:setAnchorPoint(cc.p(0.5,0.5))
    stage_container:appendComponent(stage_unopen_image)
    stage_unopen_image:setPositionInContainer(cc.p(55,110))
    table_small_battle_head["stage_unopen_image"] = stage_unopen_image

    local stage_weikaiqi_image = fc.FExtensionsImage:create()
    stage_weikaiqi_image:setImage("batch_ui/jinengkuang_weikaiqi.png")
    stage_weikaiqi_image:setSize(cc.size(76,27))
    stage_weikaiqi_image:setAnchorPoint(cc.p(0.5,0.5))
    stage_container:appendComponent(stage_weikaiqi_image)
    stage_weikaiqi_image:setPositionInContainer(cc.p(54,84.5))
    table_small_battle_head["stage_weikaiqi_image"] = stage_weikaiqi_image

    local stage_open_image = fc.FShaderExtensionsImage:create(0)
    stage_open_image:setAnchorPoint(cc.p(0.5,0.5))
    stage_container:appendComponent(stage_open_image)
    stage_open_image:setPositionInContainer(cc.p(55,110))
    table_small_battle_head["stage_open_image"] = stage_open_image
    
    local star_bg = fc.FExtensionsImage:create()
    star_bg:setImage("batch_ui/xingxingdiwen.png")
    star_bg:setSize(cc.size(90,26))
    star_bg:setAnchorPoint(cc.p(0.5,0.5))
    stage_container:appendComponent(star_bg)
    star_bg:setPositionInContainer(cc.p(56,78))
    table_small_battle_head["star_bg"] = star_bg

    local star_dark1 = fc.FExtensionsImage:create()
    star_dark1:setImage("batch_ui/xingxing_dark.png")
    star_dark1:setSize(cc.size(20,19))
    star_dark1:setAnchorPoint(cc.p(0.5,0.5))
    stage_container:appendComponent(star_dark1)
    star_dark1:setPositionInContainer(cc.p(33,77.5))
    table_small_battle_head["star_dark1"] = star_dark1

    local star1 = fc.FExtensionsImage:create()
    star1:setImage("batch_ui/xingxing.png")
    star1:setSize(cc.size(20,19))
    star1:setAnchorPoint(cc.p(0.5,0.5))
    stage_container:appendComponent(star1)
    star1:setPositionInContainer(cc.p(32,77.5))
    table_small_battle_head["star1"] = star1

    local star_dark2 = fc.FExtensionsImage:create()
    star_dark2:setImage("batch_ui/xingxing_dark.png")
    star_dark2:setSize(cc.size(20,19))
    star_dark2:setAnchorPoint(cc.p(0.5,0.5))
    stage_container:appendComponent(star_dark2)
    star_dark2:setPositionInContainer(cc.p(53,77.5))
    table_small_battle_head["star_dark2"] = star_dark2

    local star2 = fc.FExtensionsImage:create()
    star2:setImage("batch_ui/xingxing.png")
    star2:setSize(cc.size(20,19))
    star2:setAnchorPoint(cc.p(0.5,0.5))
    stage_container:appendComponent(star2)
    star2:setPositionInContainer(cc.p(54,77.5))
    table_small_battle_head["star2"] = star2

    local star_dark3 = fc.FExtensionsImage:create()
    star_dark3:setImage("batch_ui/xingxing_dark.png")
    star_dark3:setSize(cc.size(20,19))
    star_dark3:setAnchorPoint(cc.p(0.5,0.5))
    stage_container:appendComponent(star_dark3)
    star_dark3:setPositionInContainer(cc.p(75,77.5))
    table_small_battle_head["star_dark3"] = star_dark3

    local star3 = fc.FExtensionsImage:create()
    star3:setImage("batch_ui/xingxing.png")
    star3:setSize(cc.size(20,19))
    star3:setAnchorPoint(cc.p(0.5,0.5))
    stage_container:appendComponent(star3)
    star3:setPositionInContainer(cc.p(76,77.5))
    table_small_battle_head["star3"] = star3

    return table_small_battle_head

end

