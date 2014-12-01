function createsaodang_popup()

    local table_saodang_popup = {}

    local saodang_popup = fc.FContainerPanel:create()
    saodang_popup:setSize(cc.size(960,640))
    table_saodang_popup["saodang_popup"] = saodang_popup

    local saodang_wen_bottom = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shengzhi_ditu.png",cc.rect(40,63,4,4))
    saodang_wen_bottom:setSize(cc.size(452,333))
    saodang_wen_bottom:setAnchorPoint(cc.p(0.5,0.5))
    saodang_popup:appendComponent(saodang_wen_bottom)
    saodang_wen_bottom:setPositionInContainer(cc.p(500,340.5))
    table_saodang_popup["saodang_wen_bottom"] = saodang_wen_bottom

    local saodang_pop_zhou = fc.FExtensionsImage:create()
    saodang_pop_zhou:setImage("nobatch/shengzhi_zhou.png")
    saodang_pop_zhou:setSize(cc.size(52,574))
    saodang_pop_zhou:setRotation(90)
    saodang_pop_zhou:setAnchorPoint(cc.p(0.5,0.5))
    saodang_popup:appendComponent(saodang_pop_zhou)
    saodang_pop_zhou:setPositionInContainer(cc.p(500,165))
    table_saodang_popup["saodang_pop_zhou"] = saodang_pop_zhou

    local saodang_pop_zhou = fc.FExtensionsImage:create()
    saodang_pop_zhou:setImage("nobatch/shengzhi_zhou.png")
    saodang_pop_zhou:setSize(cc.size(52,574))
    saodang_pop_zhou:setRotation(90)
    saodang_pop_zhou:setAnchorPoint(cc.p(0.5,0.5))
    saodang_popup:appendComponent(saodang_pop_zhou)
    saodang_pop_zhou:setPositionInContainer(cc.p(502,514))
    table_saodang_popup["saodang_pop_zhou"] = saodang_pop_zhou

    local saodang_rect1 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongditu2_huodong.png",cc.rect(1,1,1,1))
    saodang_rect1:setSize(cc.size(424,298))
    saodang_rect1:setAnchorPoint(cc.p(0.5,0.5))
    saodang_popup:appendComponent(saodang_rect1)
    saodang_rect1:setPositionInContainer(cc.p(500,339))
    table_saodang_popup["saodang_rect1"] = saodang_rect1

    local saodang_rect2 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongbiankuang2_ciguan.png",cc.rect(44,15,1,1))
    saodang_rect2:setSize(cc.size(424,298))
    saodang_rect2:setAnchorPoint(cc.p(0.5,0.5))
    saodang_popup:appendComponent(saodang_rect2)
    saodang_rect2:setPositionInContainer(cc.p(500,339))
    table_saodang_popup["saodang_rect2"] = saodang_rect2

    local saodang_rect3 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongditu_huodong.png",cc.rect(3,3,2,2))
    saodang_rect3:setSize(cc.size(419,140))
    saodang_rect3:setAnchorPoint(cc.p(0.5,0.5))
    saodang_popup:appendComponent(saodang_rect3)
    saodang_rect3:setPositionInContainer(cc.p(499.5,327))
    table_saodang_popup["saodang_rect3"] = saodang_rect3

    local saodang_title = fc.FScale9Image:createWithBatchUIFrame("batch_ui/xingjikuang_tangquanxinggong.png",cc.rect(72,17,2,2))
    saodang_title:setSize(cc.size(260,50))
    saodang_title:setAnchorPoint(cc.p(0.5,0.5))
    saodang_popup:appendComponent(saodang_title)
    saodang_title:setPositionInContainer(cc.p(502,165))
    table_saodang_popup["saodang_title"] = saodang_title

    local saodang_sao = fc.FExtensionsImage:create()
    saodang_sao:setImage("batch_ui/sao_uizi.png")
    saodang_sao:setSize(cc.size(32,32))
    saodang_sao:setAnchorPoint(cc.p(0.5,0.5))
    saodang_popup:appendComponent(saodang_sao)
    saodang_sao:setPositionInContainer(cc.p(468,165))
    table_saodang_popup["saodang_sao"] = saodang_sao

    local saodang_dang = fc.FExtensionsImage:create()
    saodang_dang:setImage("batch_ui/dang_uizi.png")
    saodang_dang:setSize(cc.size(32,32))
    saodang_dang:setAnchorPoint(cc.p(0.5,0.5))
    saodang_popup:appendComponent(saodang_dang)
    saodang_dang:setPositionInContainer(cc.p(532,165))
    table_saodang_popup["saodang_dang"] = saodang_dang

    local saodang_stage_label = fc.FLabel:createBMFont()
    saodang_stage_label:setSize(cc.size(120,30))
    saodang_stage_label:setAnchorPoint(cc.p(0.5,0.5))
    saodang_stage_label:setFontSize(20)
    saodang_stage_label:setString("步兵步兵步")
    saodang_stage_label:setColor(cc.c3b(255,0,0))
    saodang_popup:appendComponent(saodang_stage_label)
    saodang_stage_label:setPositionInContainer(cc.p(454,228))
    table_saodang_popup["saodang_stage_label"] = saodang_stage_label

    local saodang_label = fc.FLabel:createBMFont()
    saodang_label:setSize(cc.size(60,30))
    saodang_label:setAnchorPoint(cc.p(0.5,0.5))
    saodang_label:setFontSize(20)
    if LANGUAGE_TYPE == 3 then
	    saodang_label:setString("掃蕩")    
    else
    	saodang_label:setString("扫荡")
    end
    saodang_label:setColor(cc.c3b(91,24,6))
    saodang_popup:appendComponent(saodang_label)
    saodang_label:setPositionInContainer(cc.p(362,228))
    table_saodang_popup["saodang_label"] = saodang_label

    local saodang_guanka_label = fc.FLabel:createBMFont()
    saodang_guanka_label:setSize(cc.size(60,30))
    saodang_guanka_label:setAnchorPoint(cc.p(0.5,0.5))
    saodang_guanka_label:setFontSize(20)
     if LANGUAGE_TYPE == 3 then
     	 saodang_guanka_label:setString("關卡")
     else
     	 saodang_guanka_label:setString("关卡")
     end	
    saodang_guanka_label:setColor(cc.c3b(91,24,6))
    saodang_popup:appendComponent(saodang_guanka_label)
    saodang_guanka_label:setPositionInContainer(cc.p(546,228))
    table_saodang_popup["saodang_guanka_label"] = saodang_guanka_label

    local saodang_label_di = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shuruwenzi.png",cc.rect(11,9,47,7))
    saodang_label_di:setSize(cc.size(50,28))
    saodang_label_di:setAnchorPoint(cc.p(0.5,0.5))
    saodang_popup:appendComponent(saodang_label_di)
    saodang_label_di:setPositionInContainer(cc.p(601,229))
    table_saodang_popup["saodang_label_di"] = saodang_label_di

    local saodang_num = fc.FLabel:createBMFont()
    saodang_num:setSize(cc.size(40,30))
    saodang_num:setAnchorPoint(cc.p(0.5,0.5))
    saodang_num:setFontSize(20)
    saodang_num:setString("10")
    saodang_num:setColor(cc.c3b(0,255,0))
    saodang_popup:appendComponent(saodang_num)
    saodang_num:setPositionInContainer(cc.p(601,227))
    table_saodang_popup["saodang_num"] = saodang_num

    local saodang_ci = fc.FLabel:createBMFont()
    saodang_ci:setSize(cc.size(40,30))
    saodang_ci:setAnchorPoint(cc.p(0.5,0.5))
    saodang_ci:setFontSize(20)
    saodang_ci:setString("次")
    saodang_ci:setColor(cc.c3b(91,24,6))
    saodang_popup:appendComponent(saodang_ci)
    saodang_ci:setPositionInContainer(cc.p(643,228))
    table_saodang_popup["saodang_ci"] = saodang_ci

    local ui_ben = fc.FExtensionsImage:create()
    ui_ben:setImage("batch_ui/ben_uizi.png")
    ui_ben:setSize(cc.size(32,32))
    ui_ben:setAnchorPoint(cc.p(0.5,0.5))
    saodang_popup:appendComponent(ui_ben)
    ui_ben:setPositionInContainer(cc.p(383,324))
    table_saodang_popup["ui_ben"] = ui_ben

    local ui_ci = fc.FExtensionsImage:create()
    ui_ci:setImage("batch_ui/ci_uizi (2).png")
    ui_ci:setSize(cc.size(32,32))
    ui_ci:setAnchorPoint(cc.p(0.5,0.5))
    saodang_popup:appendComponent(ui_ci)
    ui_ci:setPositionInContainer(cc.p(412,324))
    table_saodang_popup["ui_ci"] = ui_ci

    local ui_xiao = fc.FExtensionsImage:create()
    ui_xiao:setImage("batch_ui/xiao_uizi.png")
    ui_xiao:setSize(cc.size(32,32))
    ui_xiao:setAnchorPoint(cc.p(0.5,0.5))
    saodang_popup:appendComponent(ui_xiao)
    ui_xiao:setPositionInContainer(cc.p(440,324))
    table_saodang_popup["ui_xiao"] = ui_xiao

    local ui_hao = fc.FExtensionsImage:create()
    ui_hao:setImage("batch_ui/hao_uizi (2).png")
    ui_hao:setSize(cc.size(32,32))
    ui_hao:setAnchorPoint(cc.p(0.5,0.5))
    saodang_popup:appendComponent(ui_hao)
    ui_hao:setPositionInContainer(cc.p(469,324))
    table_saodang_popup["ui_hao"] = ui_hao

    local ui_liang = fc.FExtensionsImage:create()
    ui_liang:setImage("batch_ui/liang_uizi (2).png")
    ui_liang:setSize(cc.size(32,32))
    ui_liang:setAnchorPoint(cc.p(0.5,0.5))
    saodang_popup:appendComponent(ui_liang)
    ui_liang:setPositionInContainer(cc.p(497,324))
    table_saodang_popup["ui_liang"] = ui_liang

    local ui_cao = fc.FExtensionsImage:create()
    ui_cao:setImage("batch_ui/cao_uizi.png")
    ui_cao:setSize(cc.size(32,32))
    ui_cao:setAnchorPoint(cc.p(0.5,0.5))
    saodang_popup:appendComponent(ui_cao)
    ui_cao:setPositionInContainer(cc.p(525,324))
    table_saodang_popup["ui_cao"] = ui_cao

    local saodang_di2 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shuruwenzi.png",cc.rect(11,9,47,7))
    saodang_di2:setSize(cc.size(80,28))
    saodang_di2:setAnchorPoint(cc.p(0.5,0.5))
    saodang_popup:appendComponent(saodang_di2)
    saodang_di2:setPositionInContainer(cc.p(592,324))
    table_saodang_popup["saodang_di2"] = saodang_di2

    local saodang_liangcao_num = fc.FLabel:createBMFont()
    saodang_liangcao_num:setSize(cc.size(80,30))
    saodang_liangcao_num:setAnchorPoint(cc.p(0.5,0.5))
    saodang_liangcao_num:setFontSize(20)
    saodang_liangcao_num:setString("10")
    saodang_liangcao_num:setColor(cc.c3b(0,255,255))
    saodang_popup:appendComponent(saodang_liangcao_num)
    saodang_liangcao_num:setPositionInContainer(cc.p(592,322))
    table_saodang_popup["saodang_liangcao_num"] = saodang_liangcao_num

    local btn_saodang = fc.FScaleButton:create()
    btn_saodang:setSize(cc.size(144,53))
    btn_saodang:setAnchorPoint(cc.p(0.5,0.5))
    btn_saodang:setButtonImage("batch_ui/putonganniu1_up.png")
    saodang_popup:appendComponent(btn_saodang)
    btn_saodang:setPositionInContainer(cc.p(502,439.5))
    table_saodang_popup["btn_saodang"] = btn_saodang

    local ui_kai = fc.FExtensionsImage:create()
    ui_kai:setImage("batch_ui/kai_uizi.png")
    ui_kai:setSize(cc.size(32,32))
    ui_kai:setAnchorPoint(cc.p(0.5,0.5))
    btn_saodang:appendComponent(ui_kai)
    ui_kai:setPositionInContainer(cc.p(32,25))
    table_saodang_popup["ui_kai"] = ui_kai

    local ui_shi = fc.FExtensionsImage:create()
    ui_shi:setImage("batch_ui/shi_uizi.png")
    ui_shi:setSize(cc.size(32,32))
    ui_shi:setAnchorPoint(cc.p(0.5,0.5))
    btn_saodang:appendComponent(ui_shi)
    ui_shi:setPositionInContainer(cc.p(60,26))
    table_saodang_popup["ui_shi"] = ui_shi

    local ui_sao = fc.FExtensionsImage:create()
    ui_sao:setImage("batch_ui/sao_uizi.png")
    ui_sao:setSize(cc.size(32,32))
    ui_sao:setAnchorPoint(cc.p(0.5,0.5))
    btn_saodang:appendComponent(ui_sao)
    ui_sao:setPositionInContainer(cc.p(87,25))
    table_saodang_popup["ui_sao"] = ui_sao

    local ui_dang = fc.FExtensionsImage:create()
    ui_dang:setImage("batch_ui/dang_uizi.png")
    ui_dang:setSize(cc.size(32,32))
    ui_dang:setAnchorPoint(cc.p(0.5,0.5))
    btn_saodang:appendComponent(ui_dang)
    ui_dang:setPositionInContainer(cc.p(112,27))
    table_saodang_popup["ui_dang"] = ui_dang

    local btn_close = fc.FScaleButton:create()
    btn_close:setSize(cc.size(41,45))
    btn_close:setAnchorPoint(cc.p(0.5,0.5))
    btn_close:setButtonImage("batch_ui/guanbi_anniu2.png")
    saodang_popup:appendComponent(btn_close)
    btn_close:setPositionInContainer(cc.p(732.5,163.5))
    table_saodang_popup["btn_close"] = btn_close

    return table_saodang_popup

end

