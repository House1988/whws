function createpublic_settings()

    local table_public_settings = {}

    local public_settings = fc.FContainerPanel:create()
    public_settings:setSize(cc.size(960,640))
    table_public_settings["public_settings"] = public_settings

    local pp3_bottom = fc.FContainerPanel:create()
    pp3_bottom:setSize(cc.size(534,408))
    pp3_bottom:setAnchorPoint(cc.p(0.5,0.5))
    public_settings:appendComponent(pp3_bottom)
    pp3_bottom:setPositionInContainer(cc.p(480,274.5))
    table_public_settings["pp3_bottom"] = pp3_bottom

    local pp3wen_la = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shengzhi_ditu.png",cc.rect(40,63,4,4))
    pp3wen_la:setSize(cc.size(412,350))
    pp3wen_la:setAnchorPoint(cc.p(0.5,0.5))
    pp3_bottom:appendComponent(pp3wen_la)
    pp3wen_la:setPositionInContainer(cc.p(267,204))
    table_public_settings["pp3wen_la"] = pp3wen_la

    local pp3zhou_up = fc.FExtensionsImage:create()
    pp3zhou_up:setImage("nobatch/shengzhi_zhou.png")
    pp3zhou_up:setSize(cc.size(52,534))
    pp3zhou_up:setRotation(90)
    pp3zhou_up:setAnchorPoint(cc.p(0.5,0.5))
    pp3_bottom:appendComponent(pp3zhou_up)
    pp3zhou_up:setPositionInContainer(cc.p(267,26))
    table_public_settings["pp3zhou_up"] = pp3zhou_up

    local pp3zhou_down = fc.FExtensionsImage:create()
    pp3zhou_down:setImage("nobatch/shengzhi_zhou.png")
    pp3zhou_down:setSize(cc.size(52,534))
    pp3zhou_down:setRotation(90)
    pp3zhou_down:setAnchorPoint(cc.p(0.5,0.5))
    pp3_bottom:appendComponent(pp3zhou_down)
    pp3zhou_down:setPositionInContainer(cc.p(267,383))
    table_public_settings["pp3zhou_down"] = pp3zhou_down

    local pp3_title_bg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/zongjiachengdikuang_tangquanxinggong.png",cc.rect(75,0,6,29))
    pp3_title_bg:setSize(cc.size(240,45))
    pp3_title_bg:setAnchorPoint(cc.p(0.5,0.5))
    pp3_bottom:appendComponent(pp3_title_bg)
    pp3_title_bg:setPositionInContainer(cc.p(267,27.5))
    table_public_settings["pp3_title_bg"] = pp3_title_bg

    local pp3_rect_1 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongditu2_huodong.png",cc.rect(1,1,1,1))
    pp3_rect_1:setSize(cc.size(384,310))
    pp3_rect_1:setAnchorPoint(cc.p(0.5,0.5))
    pp3_bottom:appendComponent(pp3_rect_1)
    pp3_rect_1:setPositionInContainer(cc.p(267,205))
    table_public_settings["pp3_rect_1"] = pp3_rect_1

    local pp3_rect_2 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongbiankuang2_ciguan.png",cc.rect(44,15,1,1))
    pp3_rect_2:setSize(cc.size(384,310))
    pp3_rect_2:setAnchorPoint(cc.p(0.5,0.5))
    pp3_bottom:appendComponent(pp3_rect_2)
    pp3_rect_2:setPositionInContainer(cc.p(267,205))
    table_public_settings["pp3_rect_2"] = pp3_rect_2

    local yes_btn = fc.FScaleButton:create()
    yes_btn:setSize(cc.size(144,53))
    yes_btn:setAnchorPoint(cc.p(0.5,0.5))
    yes_btn:setButtonImage("batch_ui/putonganniu1_up.png")
    pp3_bottom:appendComponent(yes_btn)
    yes_btn:setPositionInContainer(cc.p(365,305.5))
    table_public_settings["yes_btn"] = yes_btn

    local pp3_que = fc.FExtensionsImage:create()
    pp3_que:setImage("batch_ui/que_uizi.png")
    pp3_que:setSize(cc.size(32,32))
    pp3_que:setAnchorPoint(cc.p(0.5,0.5))
    yes_btn:appendComponent(pp3_que)
    pp3_que:setPositionInContainer(cc.p(48,26))
    table_public_settings["pp3_que"] = pp3_que

    local pp3_ding = fc.FExtensionsImage:create()
    pp3_ding:setImage("batch_ui/ding_uizi.png")
    pp3_ding:setSize(cc.size(32,32))
    pp3_ding:setAnchorPoint(cc.p(0.5,0.5))
    yes_btn:appendComponent(pp3_ding)
    pp3_ding:setPositionInContainer(cc.p(96,26))
    table_public_settings["pp3_ding"] = pp3_ding

    local no_btn = fc.FScaleButton:create()
    no_btn:setSize(cc.size(144,53))
    no_btn:setAnchorPoint(cc.p(0.5,0.5))
    no_btn:setButtonImage("batch_ui/putonganniu1_up.png")
    pp3_bottom:appendComponent(no_btn)
    no_btn:setPositionInContainer(cc.p(169,305.5))
    table_public_settings["no_btn"] = no_btn

    local pp3_qu = fc.FExtensionsImage:create()
    pp3_qu:setImage("batch_ui/qu_uizi.png")
    pp3_qu:setSize(cc.size(32,32))
    pp3_qu:setAnchorPoint(cc.p(0.5,0.5))
    no_btn:appendComponent(pp3_qu)
    pp3_qu:setPositionInContainer(cc.p(46,26))
    table_public_settings["pp3_qu"] = pp3_qu

    local pp3_xiao = fc.FExtensionsImage:create()
    pp3_xiao:setImage("batch_ui/xiao_uizi.png")
    pp3_xiao:setSize(cc.size(32,32))
    pp3_xiao:setAnchorPoint(cc.p(0.5,0.5))
    no_btn:appendComponent(pp3_xiao)
    pp3_xiao:setPositionInContainer(cc.p(98,26))
    table_public_settings["pp3_xiao"] = pp3_xiao

    local ppp3_ti = fc.FExtensionsImage:create()
    ppp3_ti:setImage("batch_ui/she_uizi.png")
    ppp3_ti:setSize(cc.size(32,32))
    ppp3_ti:setAnchorPoint(cc.p(0.5,0.5))
    pp3_bottom:appendComponent(ppp3_ti)
    ppp3_ti:setPositionInContainer(cc.p(233,27))
    table_public_settings["ppp3_ti"] = ppp3_ti

    local ppp3_shi = fc.FExtensionsImage:create()
    ppp3_shi:setImage("batch_ui/zhi_uizi (3).png")
    ppp3_shi:setSize(cc.size(32,32))
    ppp3_shi:setAnchorPoint(cc.p(0.5,0.5))
    pp3_bottom:appendComponent(ppp3_shi)
    ppp3_shi:setPositionInContainer(cc.p(301,28))
    table_public_settings["ppp3_shi"] = ppp3_shi

    local rect111 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongditu_huodong.png",cc.rect(3,3,2,2))
    rect111:setSize(cc.size(380,50))
    rect111:setAnchorPoint(cc.p(0.5,0.5))
    pp3_bottom:appendComponent(rect111)
    rect111:setPositionInContainer(cc.p(267,140))
    table_public_settings["rect111"] = rect111

    local rect222 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongditu_huodong.png",cc.rect(3,3,2,2))
    rect222:setSize(cc.size(380,50))
    rect222:setAnchorPoint(cc.p(0.5,0.5))
    pp3_bottom:appendComponent(rect222)
    rect222:setPositionInContainer(cc.p(267,190))
    table_public_settings["rect222"] = rect222

    local pp3_label3 = fc.FLabel:createBMFont()
    pp3_label3:setSize(cc.size(60,30))
    pp3_label3:setAnchorPoint(cc.p(0.5,0.5))
    pp3_label3:setFontSize(20)
    pp3_label3:setString("音  效")
    pp3_label3:setColor(cc.c3b(106,68,19))
    pp3_bottom:appendComponent(pp3_label3)
    pp3_label3:setPositionInContainer(cc.p(201,190))
    table_public_settings["pp3_label3"] = pp3_label3

    local pp3_label2 = fc.FLabel:createBMFont()
    pp3_label2:setSize(cc.size(60,30))
    pp3_label2:setAnchorPoint(cc.p(0.5,0.5))
    pp3_label2:setFontSize(20)
    pp3_label2:setString("音  乐")
    pp3_label2:setColor(cc.c3b(106,68,19))
    pp3_bottom:appendComponent(pp3_label2)
    pp3_label2:setPositionInContainer(cc.p(202,140))
    table_public_settings["pp3_label2"] = pp3_label2

    local panel1 = fc.FContainerPanel:create()
    panel1:setSize(cc.size(96,25))
    panel1:setAnchorPoint(cc.p(0.5,0.5))
    pp3_bottom:appendComponent(panel1)
    panel1:setPositionInContainer(cc.p(322,142.5))
    table_public_settings["panel1"] = panel1

    local btn_music = fc.FExtensionsImage:create()
    btn_music:setImage("batch_ui/setting_off.png")
    btn_music:setSize(cc.size(96,25))
    btn_music:setAnchorPoint(cc.p(0.5,0.5))
    pp3_bottom:appendComponent(btn_music)
    btn_music:setPositionInContainer(cc.p(322,142.5))
    table_public_settings["btn_music"] = btn_music

    local panel2 = fc.FContainerPanel:create()
    panel2:setSize(cc.size(96,25))
    panel2:setAnchorPoint(cc.p(0.5,0.5))
    pp3_bottom:appendComponent(panel2)
    panel2:setPositionInContainer(cc.p(322,192.5))
    table_public_settings["panel2"] = panel2

    local btn_effect = fc.FExtensionsImage:create()
    btn_effect:setImage("batch_ui/setting_on.png")
    btn_effect:setSize(cc.size(96,25))
    btn_effect:setAnchorPoint(cc.p(0.5,0.5))
    pp3_bottom:appendComponent(btn_effect)
    btn_effect:setPositionInContainer(cc.p(322,192.5))
    table_public_settings["btn_effect"] = btn_effect

    local fastlogin_button = fc.FTextButton:create()
    fastlogin_button:setSize(cc.size(144,51))
    fastlogin_button:setAnchorPoint(cc.p(0.5,0.5))
    fastlogin_button:setTextButtonImage("batch_ui/goumai_anniu.png","batch_ui/goumai_anniu.png","batch_ui/goumai_anniu.png")
    fastlogin_button:setText("綁定帳號",cc.c3b(255,255,255))
    fastlogin_button:setSelectActionEnbaled(true)
    fastlogin_button:setVisible(false)
    pp3_bottom:appendComponent(fastlogin_button)
    fastlogin_button:setPositionInContainer(cc.p(266,252))
    table_public_settings["fastlogin_button"] = fastlogin_button

    return table_public_settings

end

