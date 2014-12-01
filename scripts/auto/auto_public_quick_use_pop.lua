function createpublic_quick_use_pop()

    local table_public_quick_use_pop = {}

    local public_quick_use_pop = fc.FContainerPanel:create()
    public_quick_use_pop:setSize(cc.size(960,640))
    table_public_quick_use_pop["public_quick_use_pop"] = public_quick_use_pop

    local pqup_bottom_panel = fc.FContainerPanel:create()
    pqup_bottom_panel:setSize(cc.size(534,402))
    pqup_bottom_panel:setAnchorPoint(cc.p(0.5,0.5))
    public_quick_use_pop:appendComponent(pqup_bottom_panel)
    pqup_bottom_panel:setPositionInContainer(cc.p(480,319.5))
    table_public_quick_use_pop["pqup_bottom_panel"] = pqup_bottom_panel

    local pqup_wen_la = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shengzhi_ditu.png",cc.rect(40,63,4,4))
    pqup_wen_la:setSize(cc.size(412,350))
    pqup_wen_la:setAnchorPoint(cc.p(0.5,0.5))
    pqup_bottom_panel:appendComponent(pqup_wen_la)
    pqup_wen_la:setPositionInContainer(cc.p(267,201))
    table_public_quick_use_pop["pqup_wen_la"] = pqup_wen_la

    local pqup_wen_zhou = fc.FExtensionsImage:create()
    pqup_wen_zhou:setImage("nobatch/shengzhi_zhou.png")
    pqup_wen_zhou:setSize(cc.size(52,534))
    pqup_wen_zhou:setRotation(90)
    pqup_wen_zhou:setAnchorPoint(cc.p(0.5,0.5))
    pqup_bottom_panel:appendComponent(pqup_wen_zhou)
    pqup_wen_zhou:setPositionInContainer(cc.p(267,26))
    table_public_quick_use_pop["pqup_wen_zhou"] = pqup_wen_zhou

    local pqup_title_bg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/xingjikuang_tangquanxinggong.png",cc.rect(72,17,2,2))
    pqup_title_bg:setSize(cc.size(260,50))
    pqup_title_bg:setAnchorPoint(cc.p(0.5,0.5))
    pqup_title_bg:setScaleY(-1)
    pqup_bottom_panel:appendComponent(pqup_title_bg)
    pqup_title_bg:setPositionInContainer(cc.p(267,25))
    table_public_quick_use_pop["pqup_title_bg"] = pqup_title_bg

    local pqup_wen_zhou = fc.FExtensionsImage:create()
    pqup_wen_zhou:setImage("nobatch/shengzhi_zhou.png")
    pqup_wen_zhou:setSize(cc.size(52,534))
    pqup_wen_zhou:setRotation(90)
    pqup_wen_zhou:setAnchorPoint(cc.p(0.5,0.5))
    pqup_bottom_panel:appendComponent(pqup_wen_zhou)
    pqup_wen_zhou:setPositionInContainer(cc.p(267,377))
    table_public_quick_use_pop["pqup_wen_zhou"] = pqup_wen_zhou

    local pqup_di_kuang1 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongditu2_huodong.png",cc.rect(1,1,1,1))
    pqup_di_kuang1:setSize(cc.size(384,302))
    pqup_di_kuang1:setAnchorPoint(cc.p(0.5,0.5))
    pqup_bottom_panel:appendComponent(pqup_di_kuang1)
    pqup_di_kuang1:setPositionInContainer(cc.p(267,201))
    table_public_quick_use_pop["pqup_di_kuang1"] = pqup_di_kuang1

    local pqup_di_kuang = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongbiankuang2_ciguan.png",cc.rect(44,15,1,1))
    pqup_di_kuang:setSize(cc.size(384,302))
    pqup_di_kuang:setAnchorPoint(cc.p(0.5,0.5))
    pqup_bottom_panel:appendComponent(pqup_di_kuang)
    pqup_di_kuang:setPositionInContainer(cc.p(267,201))
    table_public_quick_use_pop["pqup_di_kuang"] = pqup_di_kuang

    local use_btn = fc.FScaleButton:create()
    use_btn:setSize(cc.size(144,53))
    use_btn:setAnchorPoint(cc.p(0.5,0.5))
    use_btn:setButtonImage("batch_ui/putonganniu1_up.png")
    pqup_bottom_panel:appendComponent(use_btn)
    use_btn:setPositionInContainer(cc.p(352,298.5))
    table_public_quick_use_pop["use_btn"] = use_btn

    local pqup_shi = fc.FShaderExtensionsImage:create(0)
    pqup_shi:setAnchorPoint(cc.p(0.5,0.5))
    pqup_shi:setImage("batch_ui/shi2_uizi.png")
    pqup_shi:setSize(cc.size(32,32))
    use_btn:appendComponent(pqup_shi)
    pqup_shi:setPositionInContainer(cc.p(54,26))
    table_public_quick_use_pop["pqup_shi"] = pqup_shi

    local pqup_yong = fc.FShaderExtensionsImage:create(0)
    pqup_yong:setAnchorPoint(cc.p(0.5,0.5))
    pqup_yong:setImage("batch_ui/yong_uizi.png")
    pqup_yong:setSize(cc.size(32,32))
    use_btn:appendComponent(pqup_yong)
    pqup_yong:setPositionInContainer(cc.p(94,26))
    table_public_quick_use_pop["pqup_yong"] = pqup_yong

    local pqup_tip_label1 = fc.FLabel:createBMFont()
    pqup_tip_label1:setSize(cc.size(180,30))
    pqup_tip_label1:setAnchorPoint(cc.p(0.5,0.5))
    pqup_tip_label1:setFontSize(20)
    pqup_tip_label1:setString("使用某某可回复6点粮草")
    pqup_tip_label1:setColor(cc.c3b(106,68,19))
    pqup_bottom_panel:appendComponent(pqup_tip_label1)
    pqup_tip_label1:setPositionInContainer(cc.p(267,76))
    table_public_quick_use_pop["pqup_tip_label1"] = pqup_tip_label1

    local pqup_tip_label2 = fc.FLabel:createBMFont()
    pqup_tip_label2:setSize(cc.size(220,30))
    pqup_tip_label2:setAnchorPoint(cc.p(0.5,0.5))
    pqup_tip_label2:setFontSize(20)
    if LANGUAGE_TYPE == 3 then
	   pqup_tip_label2:setString("vip等級越高，每日可使用次數越多")
    else
	   pqup_tip_label2:setString("VIP等级越高，每日可使用次数越多")
    end
    pqup_tip_label2:setColor(cc.c3b(206,53,0))
    pqup_bottom_panel:appendComponent(pqup_tip_label2)
    pqup_tip_label2:setPositionInContainer(cc.p(267,116))
    table_public_quick_use_pop["pqup_tip_label2"] = pqup_tip_label2

    local pqup_label_di1 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongditu_huodong.png",cc.rect(3,3,2,2))
    pqup_label_di1:setSize(cc.size(380,49))
    pqup_label_di1:setAnchorPoint(cc.p(0.5,0.5))
    pqup_bottom_panel:appendComponent(pqup_label_di1)
    pqup_label_di1:setPositionInContainer(cc.p(267,173.5))
    table_public_quick_use_pop["pqup_label_di1"] = pqup_label_di1

    local pqup_label_di2 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongditu_huodong.png",cc.rect(3,3,2,2))
    pqup_label_di2:setSize(cc.size(380,49))
    pqup_label_di2:setAnchorPoint(cc.p(0.5,0.5))
    pqup_bottom_panel:appendComponent(pqup_label_di2)
    pqup_label_di2:setPositionInContainer(cc.p(267,222.5))
    table_public_quick_use_pop["pqup_label_di2"] = pqup_label_di2

    local own_num_label = fc.FLabel:createBMFont()
    own_num_label:setSize(cc.size(120,30))
    own_num_label:setAnchorPoint(cc.p(0.5,0.5))
    own_num_label:setFontSize(20)
    own_num_label:setString("拥有某某的个数：")
    own_num_label:setColor(cc.c3b(106,68,19))
    pqup_bottom_panel:appendComponent(own_num_label)
    own_num_label:setPositionInContainer(cc.p(213,169))
    table_public_quick_use_pop["own_num_label"] = own_num_label

    local left_num_label = fc.FLabel:createBMFont()
    left_num_label:setSize(cc.size(150,30))
    left_num_label:setAnchorPoint(cc.p(0.5,0.5))
    left_num_label:setFontSize(20)
    if LANGUAGE_TYPE == 3 then
    	left_num_label:setString("今日剩餘使用次數：")
    else	
    	left_num_label:setString("今日剩余使用次数：")
    end
    left_num_label:setColor(cc.c3b(106,68,19))
    pqup_bottom_panel:appendComponent(left_num_label)
    left_num_label:setPositionInContainer(cc.p(212,224))
    table_public_quick_use_pop["left_num_label"] = left_num_label

    local pqup_num_di = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shuruwenzi.png",cc.rect(11,9,47,7))
    pqup_num_di:setSize(cc.size(60,28))
    pqup_num_di:setAnchorPoint(cc.p(0.5,0.5))
    pqup_bottom_panel:appendComponent(pqup_num_di)
    pqup_num_di:setPositionInContainer(cc.p(360,172))
    table_public_quick_use_pop["pqup_num_di"] = pqup_num_di

    local pqup_num_di = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shuruwenzi.png",cc.rect(11,9,47,7))
    pqup_num_di:setSize(cc.size(60,28))
    pqup_num_di:setAnchorPoint(cc.p(0.5,0.5))
    pqup_bottom_panel:appendComponent(pqup_num_di)
    pqup_num_di:setPositionInContainer(cc.p(360,227))
    table_public_quick_use_pop["pqup_num_di"] = pqup_num_di

    local own_num = fc.FLabel:createBMFont()
    own_num:setSize(cc.size(50,30))
    own_num:setAnchorPoint(cc.p(0.5,0.5))
    own_num:setFontSize(20)
    own_num:setString("99")
    own_num:setColor(cc.c3b(255,255,255))
    pqup_bottom_panel:appendComponent(own_num)
    own_num:setPositionInContainer(cc.p(360,169))
    table_public_quick_use_pop["own_num"] = own_num

    local left_num = fc.FLabel:createBMFont()
    left_num:setSize(cc.size(50,30))
    left_num:setAnchorPoint(cc.p(0.5,0.5))
    left_num:setFontSize(20)
    left_num:setString("999")
    left_num:setColor(cc.c3b(255,255,255))
    pqup_bottom_panel:appendComponent(left_num)
    left_num:setPositionInContainer(cc.p(359,224))
    table_public_quick_use_pop["left_num"] = left_num

    local close_btn2 = fc.FScaleButton:create()
    close_btn2:setSize(cc.size(144,53))
    close_btn2:setAnchorPoint(cc.p(0.5,0.5))
    close_btn2:setButtonImage("batch_ui/putonganniu1_up.png")
    pqup_bottom_panel:appendComponent(close_btn2)
    close_btn2:setPositionInContainer(cc.p(182,298.5))
    table_public_quick_use_pop["close_btn2"] = close_btn2

    local pqup_guan = fc.FShaderExtensionsImage:create(0)
    pqup_guan:setAnchorPoint(cc.p(0.5,0.5))
    pqup_guan:setImage("batch_ui/guan_uizi.png")
    pqup_guan:setSize(cc.size(32,32))
    close_btn2:appendComponent(pqup_guan)
    pqup_guan:setPositionInContainer(cc.p(54,26))
    table_public_quick_use_pop["pqup_guan"] = pqup_guan

    local pqup_bi = fc.FShaderExtensionsImage:create(0)
    pqup_bi:setAnchorPoint(cc.p(0.5,0.5))
    pqup_bi:setImage("batch_ui/bi_uizi.png")
    pqup_bi:setSize(cc.size(32,32))
    close_btn2:appendComponent(pqup_bi)
    pqup_bi:setPositionInContainer(cc.p(90,26))
    table_public_quick_use_pop["pqup_bi"] = pqup_bi

    local pqup_ti = fc.FExtensionsImage:create()
    pqup_ti:setImage("batch_ui/ti2_uizi.png")
    pqup_ti:setSize(cc.size(32,32))
    pqup_ti:setAnchorPoint(cc.p(0.5,0.5))
    pqup_bottom_panel:appendComponent(pqup_ti)
    pqup_ti:setPositionInContainer(cc.p(238,24))
    table_public_quick_use_pop["pqup_ti"] = pqup_ti

    local pqup_shi1 = fc.FExtensionsImage:create()
    pqup_shi1:setImage("batch_ui/shi4_uizi.png")
    pqup_shi1:setSize(cc.size(32,32))
    pqup_shi1:setAnchorPoint(cc.p(0.5,0.5))
    pqup_bottom_panel:appendComponent(pqup_shi1)
    pqup_shi1:setPositionInContainer(cc.p(296,24))
    table_public_quick_use_pop["pqup_shi1"] = pqup_shi1

    return table_public_quick_use_pop

end

