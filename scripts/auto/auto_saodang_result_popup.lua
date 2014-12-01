function createsaodang_result_popup()

    local table_saodang_result_popup = {}

    local saodang_result_popup = fc.FContainerPanel:create()
    saodang_result_popup:setSize(cc.size(960,640))
    table_saodang_result_popup["saodang_result_popup"] = saodang_result_popup

    local sr_bg1 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shengzhi_ditu.png",cc.rect(40,63,4,4))
    sr_bg1:setSize(cc.size(590,480))
    sr_bg1:setAnchorPoint(cc.p(0.5,0.5))
    saodang_result_popup:appendComponent(sr_bg1)
    sr_bg1:setPositionInContainer(cc.p(483,320))
    table_saodang_result_popup["sr_bg1"] = sr_bg1

    local saodang_result_zhou = fc.FExtensionsImage:create()
    saodang_result_zhou:setImage("nobatch/shengzhi_zhou.png")
    saodang_result_zhou:setSize(cc.size(52,750))
    saodang_result_zhou:setRotation(90)
    saodang_result_zhou:setAnchorPoint(cc.p(0.5,0.5))
    saodang_result_popup:appendComponent(saodang_result_zhou)
    saodang_result_zhou:setPositionInContainer(cc.p(480,74))
    table_saodang_result_popup["saodang_result_zhou"] = saodang_result_zhou

    local saodang_result_zhou = fc.FExtensionsImage:create()
    saodang_result_zhou:setImage("nobatch/shengzhi_zhou.png")
    saodang_result_zhou:setSize(cc.size(52,750))
    saodang_result_zhou:setRotation(90)
    saodang_result_zhou:setAnchorPoint(cc.p(0.5,0.5))
    saodang_result_popup:appendComponent(saodang_result_zhou)
    saodang_result_zhou:setPositionInContainer(cc.p(480,564))
    table_saodang_result_popup["saodang_result_zhou"] = saodang_result_zhou

    local sr_bg3 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongditu2_huodong.png",cc.rect(1,1,1,1))
    sr_bg3:setSize(cc.size(545,445))
    sr_bg3:setAnchorPoint(cc.p(0.5,0.5))
    saodang_result_popup:appendComponent(sr_bg3)
    sr_bg3:setPositionInContainer(cc.p(482.5,320.5))
    table_saodang_result_popup["sr_bg3"] = sr_bg3

    local sr_bg2 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongbiankuang2_ciguan.png",cc.rect(44,15,1,1))
    sr_bg2:setSize(cc.size(545,445))
    sr_bg2:setAnchorPoint(cc.p(0.5,0.5))
    saodang_result_popup:appendComponent(sr_bg2)
    sr_bg2:setPositionInContainer(cc.p(482.5,320.5))
    table_saodang_result_popup["sr_bg2"] = sr_bg2

    local sr_bg4 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongditu_huodong.png",cc.rect(3,3,2,2))
    sr_bg4:setSize(cc.size(540,300))
    sr_bg4:setAnchorPoint(cc.p(0.5,0.5))
    saodang_result_popup:appendComponent(sr_bg4)
    sr_bg4:setPositionInContainer(cc.p(482,318))
    table_saodang_result_popup["sr_bg4"] = sr_bg4

    local sr_queding_btn = fc.FScaleButton:create()
    sr_queding_btn:setSize(cc.size(144,53))
    sr_queding_btn:setAnchorPoint(cc.p(0.5,0.5))
    sr_queding_btn:setButtonImage("batch_ui/putonganniu1_up.png")
    saodang_result_popup:appendComponent(sr_queding_btn)
    sr_queding_btn:setPositionInContainer(cc.p(480,500.5))
    table_saodang_result_popup["sr_queding_btn"] = sr_queding_btn

    local ui_que = fc.FShaderExtensionsImage:create(0)
    ui_que:setAnchorPoint(cc.p(0.5,0.5))
    ui_que:setImage("batch_ui/que_uizi.png")
    ui_que:setSize(cc.size(32,32))
    sr_queding_btn:appendComponent(ui_que)
    ui_que:setPositionInContainer(cc.p(51,25))
    table_saodang_result_popup["ui_que"] = ui_que

    local ui_ding = fc.FShaderExtensionsImage:create(0)
    ui_ding:setAnchorPoint(cc.p(0.5,0.5))
    ui_ding:setImage("batch_ui/ding_uizi.png")
    ui_ding:setSize(cc.size(32,32))
    sr_queding_btn:appendComponent(ui_ding)
    ui_ding:setPositionInContainer(cc.p(93,25))
    table_saodang_result_popup["ui_ding"] = ui_ding

    local sr_title = fc.FScale9Image:createWithBatchUIFrame("batch_ui/xingjikuang_tangquanxinggong.png",cc.rect(72,17,2,2))
    sr_title:setSize(cc.size(260,50))
    sr_title:setAnchorPoint(cc.p(0.5,0.5))
    saodang_result_popup:appendComponent(sr_title)
    sr_title:setPositionInContainer(cc.p(480,73))
    table_saodang_result_popup["sr_title"] = sr_title

    local uii_sao = fc.FExtensionsImage:create()
    uii_sao:setImage("batch_ui/sao_uizi.png")
    uii_sao:setSize(cc.size(32,32))
    uii_sao:setAnchorPoint(cc.p(0.5,0.5))
    saodang_result_popup:appendComponent(uii_sao)
    uii_sao:setPositionInContainer(cc.p(448,72))
    table_saodang_result_popup["uii_sao"] = uii_sao

    local uii_dang = fc.FExtensionsImage:create()
    uii_dang:setImage("batch_ui/dang_uizi.png")
    uii_dang:setSize(cc.size(32,32))
    uii_dang:setAnchorPoint(cc.p(0.5,0.5))
    saodang_result_popup:appendComponent(uii_dang)
    uii_dang:setPositionInContainer(cc.p(512,72))
    table_saodang_result_popup["uii_dang"] = uii_dang

    local sr_title_zi = fc.FLabel:createBMFont()
    sr_title_zi:setSize(cc.size(150,25))
    sr_title_zi:setAnchorPoint(cc.p(0.5,0.5))
    sr_title_zi:setFontSize(20)
    if LANGUAGE_TYPE == 3 then
    	sr_title_zi:setString("本次掃蕩共獲得:")    
    else
    	sr_title_zi:setString("本次扫荡共获得:")
    end
    sr_title_zi:setColor(cc.c3b(91,24,6))
    saodang_result_popup:appendComponent(sr_title_zi)
    sr_title_zi:setPositionInContainer(cc.p(490,122.5))
    table_saodang_result_popup["sr_title_zi"] = sr_title_zi

    local sr_label_di = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shuruwenzi.png",cc.rect(11,9,47,7))
    sr_label_di:setSize(cc.size(80,25))
    sr_label_di:setAnchorPoint(cc.p(0.5,0.5))
    saodang_result_popup:appendComponent(sr_label_di)
    sr_label_di:setPositionInContainer(cc.p(423,150.5))
    table_saodang_result_popup["sr_label_di"] = sr_label_di

    local sr_yuanbao = fc.FExtensionsImage:create()
    sr_yuanbao:setImage("batch_ui/yinliangDouble.png")
    sr_yuanbao:setSize(cc.size(54,42))
    sr_yuanbao:setAnchorPoint(cc.p(0.5,0.5))
    saodang_result_popup:appendComponent(sr_yuanbao)
    sr_yuanbao:setPositionInContainer(cc.p(356,149))
    table_saodang_result_popup["sr_yuanbao"] = sr_yuanbao

    local sr_exp = fc.FExtensionsImage:create()
    sr_exp:setImage("batch_ui/exp.png")
    sr_exp:setSize(cc.size(71,42))
    sr_exp:setAnchorPoint(cc.p(0.5,0.5))
    saodang_result_popup:appendComponent(sr_exp)
    sr_exp:setPositionInContainer(cc.p(538.5,151))
    table_saodang_result_popup["sr_exp"] = sr_exp

    local sr_yinliang_num = fc.FLabel:createBMFont()
    sr_yinliang_num:setSize(cc.size(60,25))
    sr_yinliang_num:setAnchorPoint(cc.p(0.5,0.5))
    sr_yinliang_num:setFontSize(20)
    sr_yinliang_num:setString("10")
    sr_yinliang_num:setColor(cc.c3b(0,255,255))
    saodang_result_popup:appendComponent(sr_yinliang_num)
    sr_yinliang_num:setPositionInContainer(cc.p(425,148.5))
    table_saodang_result_popup["sr_yinliang_num"] = sr_yinliang_num

    local sr_label_di2 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shuruwenzi.png",cc.rect(11,9,47,7))
    sr_label_di2:setSize(cc.size(80,25))
    sr_label_di2:setAnchorPoint(cc.p(0.5,0.5))
    saodang_result_popup:appendComponent(sr_label_di2)
    sr_label_di2:setPositionInContainer(cc.p(609,150.5))
    table_saodang_result_popup["sr_label_di2"] = sr_label_di2

    local sr_exp_num = fc.FLabel:createBMFont()
    sr_exp_num:setSize(cc.size(60,25))
    sr_exp_num:setAnchorPoint(cc.p(0.5,0.5))
    sr_exp_num:setFontSize(20)
    sr_exp_num:setString("10")
    sr_exp_num:setColor(cc.c3b(0,255,255))
    saodang_result_popup:appendComponent(sr_exp_num)
    sr_exp_num:setPositionInContainer(cc.p(609,148.5))
    table_saodang_result_popup["sr_exp_num"] = sr_exp_num

    return table_saodang_result_popup

end

