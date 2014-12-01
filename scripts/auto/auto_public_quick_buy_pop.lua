function createpublic_quick_buy_pop()

    local table_public_quick_buy_pop = {}

    local public_quick_buy_pop = fc.FContainerPanel:create()
    public_quick_buy_pop:setSize(cc.size(960,640))
    table_public_quick_buy_pop["public_quick_buy_pop"] = public_quick_buy_pop

    local pqbp_bottom_panel = fc.FContainerPanel:create()
    pqbp_bottom_panel:setSize(cc.size(534,400))
    pqbp_bottom_panel:setAnchorPoint(cc.p(0.5,0.5))
    public_quick_buy_pop:appendComponent(pqbp_bottom_panel)
    pqbp_bottom_panel:setPositionInContainer(cc.p(480,320))
    table_public_quick_buy_pop["pqbp_bottom_panel"] = pqbp_bottom_panel

    local pqbp_wen_la = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shengzhi_ditu.png",cc.rect(40,63,4,4))
    pqbp_wen_la:setSize(cc.size(412,350))
    pqbp_wen_la:setAnchorPoint(cc.p(0.5,0.5))
    pqbp_bottom_panel:appendComponent(pqbp_wen_la)
    pqbp_wen_la:setPositionInContainer(cc.p(267,201))
    table_public_quick_buy_pop["pqbp_wen_la"] = pqbp_wen_la

    local pqbp_wen_zhou = fc.FExtensionsImage:create()
    pqbp_wen_zhou:setImage("nobatch/shengzhi_zhou.png")
    pqbp_wen_zhou:setSize(cc.size(52,534))
    pqbp_wen_zhou:setRotation(90)
    pqbp_wen_zhou:setAnchorPoint(cc.p(0.5,0.5))
    pqbp_bottom_panel:appendComponent(pqbp_wen_zhou)
    pqbp_wen_zhou:setPositionInContainer(cc.p(267,26))
    table_public_quick_buy_pop["pqbp_wen_zhou"] = pqbp_wen_zhou

    local pqbp_wen_zhou = fc.FExtensionsImage:create()
    pqbp_wen_zhou:setImage("nobatch/shengzhi_zhou.png")
    pqbp_wen_zhou:setSize(cc.size(52,534))
    pqbp_wen_zhou:setRotation(90)
    pqbp_wen_zhou:setAnchorPoint(cc.p(0.5,0.5))
    pqbp_bottom_panel:appendComponent(pqbp_wen_zhou)
    pqbp_wen_zhou:setPositionInContainer(cc.p(267,373))
    table_public_quick_buy_pop["pqbp_wen_zhou"] = pqbp_wen_zhou

    local pqbp_title_bg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/xingjikuang_tangquanxinggong.png",cc.rect(72,17,2,2))
    pqbp_title_bg:setSize(cc.size(260,50))
    pqbp_title_bg:setAnchorPoint(cc.p(0.5,0.5))
    pqbp_title_bg:setScaleY(-1)
    pqbp_bottom_panel:appendComponent(pqbp_title_bg)
    pqbp_title_bg:setPositionInContainer(cc.p(267,25))
    table_public_quick_buy_pop["pqbp_title_bg"] = pqbp_title_bg

    local pqbp_di_kuang1 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongditu2_huodong.png",cc.rect(1,1,1,1))
    pqbp_di_kuang1:setSize(cc.size(384,302))
    pqbp_di_kuang1:setAnchorPoint(cc.p(0.5,0.5))
    pqbp_bottom_panel:appendComponent(pqbp_di_kuang1)
    pqbp_di_kuang1:setPositionInContainer(cc.p(267,201))
    table_public_quick_buy_pop["pqbp_di_kuang1"] = pqbp_di_kuang1

    local pqbp_di_kuang = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongbiankuang2_ciguan.png",cc.rect(44,15,1,1))
    pqbp_di_kuang:setSize(cc.size(384,302))
    pqbp_di_kuang:setAnchorPoint(cc.p(0.5,0.5))
    pqbp_bottom_panel:appendComponent(pqbp_di_kuang)
    pqbp_di_kuang:setPositionInContainer(cc.p(267,201))
    table_public_quick_buy_pop["pqbp_di_kuang"] = pqbp_di_kuang

    local pqbp_label1 = fc.FLabel:createBMFont()
    pqbp_label1:setSize(cc.size(190,30))
    pqbp_label1:setAnchorPoint(cc.p(0.5,0.5))
    pqbp_label1:setFontSize(20)
    pqbp_label1:setString("使用某某可回复6点粮草")
    pqbp_label1:setColor(cc.c3b(91,24,6))
    pqbp_bottom_panel:appendComponent(pqbp_label1)
    pqbp_label1:setPositionInContainer(cc.p(267,111))
    table_public_quick_buy_pop["pqbp_label1"] = pqbp_label1

    local pqbp_label2 = fc.FLabel:createBMFont()
    pqbp_label2:setSize(cc.size(180,30))
    pqbp_label2:setAnchorPoint(cc.p(0.5,0.5))
    pqbp_label2:setFontSize(20)
    pqbp_label2:setString("使用某某可回复6点粮草")
    pqbp_label2:setColor(cc.c3b(91,24,6))
    pqbp_bottom_panel:appendComponent(pqbp_label2)
    pqbp_label2:setPositionInContainer(cc.p(267,151))
    table_public_quick_buy_pop["pqbp_label2"] = pqbp_label2

    local pqbp_label3 = fc.FLabel:createBMFont()
    pqbp_label3:setSize(cc.size(220,30))
    pqbp_label3:setAnchorPoint(cc.p(0.5,0.5))
    pqbp_label3:setFontSize(20)
    if LANGUAGE_TYPE == 3 then
	    pqbp_label3:setString("vip等級越高，可使用次數越多")
    else
	    pqbp_label3:setString("VIP等级越高，可使用次数越多")
    end
    pqbp_label3:setColor(cc.c3b(206,53,0))
    pqbp_bottom_panel:appendComponent(pqbp_label3)
    pqbp_label3:setPositionInContainer(cc.p(267,191))
    table_public_quick_buy_pop["pqbp_label3"] = pqbp_label3

    local pqbg_content_di = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongditu_huodong.png",cc.rect(3,3,2,2))
    pqbg_content_di:setSize(cc.size(380,69))
    pqbg_content_di:setAnchorPoint(cc.p(0.5,0.5))
    pqbp_bottom_panel:appendComponent(pqbg_content_di)
    pqbg_content_di:setPositionInContainer(cc.p(267,247.5))
    table_public_quick_buy_pop["pqbg_content_di"] = pqbg_content_di

    local jinshou_image = fc.FExtensionsImage:create()
    jinshou_image:setImage("batch_ui/xianjia_vip.png")
    jinshou_image:setSize(cc.size(70,50))
    jinshou_image:setAnchorPoint(cc.p(0.5,0.5))
    pqbp_bottom_panel:appendComponent(jinshou_image)
    jinshou_image:setPositionInContainer(cc.p(207,247))
    table_public_quick_buy_pop["jinshou_image"] = jinshou_image

    local yuanbao_image = fc.FExtensionsImage:create()
    yuanbao_image:setImage("batch_ui/yuanbao2_shangcheng.png")
    yuanbao_image:setSize(cc.size(45,32))
    yuanbao_image:setAnchorPoint(cc.p(0.5,0.5))
    pqbp_bottom_panel:appendComponent(yuanbao_image)
    yuanbao_image:setPositionInContainer(cc.p(267.5,248))
    table_public_quick_buy_pop["yuanbao_image"] = yuanbao_image

    local jinshou_label = fc.FLabel:createBMFont()
    jinshou_label:setSize(cc.size(50,30))
    jinshou_label:setAnchorPoint(cc.p(0.5,0.5))
    jinshou_label:setFontSize(20)
    if LANGUAGE_TYPE == 3 then
    	jinshou_label:setString("僅售")
    else
    	jinshou_label:setString("仅售")
    end
    jinshou_label:setColor(cc.c3b(255,255,255))
    pqbp_bottom_panel:appendComponent(jinshou_label)
    jinshou_label:setPositionInContainer(cc.p(207,245))
    table_public_quick_buy_pop["jinshou_label"] = jinshou_label

    local buy_and_use_btn = fc.FScaleButton:create()
    buy_and_use_btn:setSize(cc.size(144,53))
    buy_and_use_btn:setAnchorPoint(cc.p(0.5,0.5))
    buy_and_use_btn:setButtonImage("batch_ui/putonganniu1_up.png")
    pqbp_bottom_panel:appendComponent(buy_and_use_btn)
    buy_and_use_btn:setPositionInContainer(cc.p(356,316.5))
    table_public_quick_buy_pop["buy_and_use_btn"] = buy_and_use_btn

    local gou_ui = fc.FExtensionsImage:create()
    gou_ui:setImage("batch_ui/gou_uizi.png")
    gou_ui:setSize(cc.size(32,32))
    gou_ui:setAnchorPoint(cc.p(0.5,0.5))
    buy_and_use_btn:appendComponent(gou_ui)
    gou_ui:setPositionInContainer(cc.p(26,26))
    table_public_quick_buy_pop["gou_ui"] = gou_ui

    local mai_ui = fc.FExtensionsImage:create()
    mai_ui:setImage("batch_ui/mai_uizi.png")
    mai_ui:setSize(cc.size(32,32))
    mai_ui:setAnchorPoint(cc.p(0.5,0.5))
    buy_and_use_btn:appendComponent(mai_ui)
    mai_ui:setPositionInContainer(cc.p(49,26))
    table_public_quick_buy_pop["mai_ui"] = mai_ui

    local bing_ui = fc.FExtensionsImage:create()
    bing_ui:setImage("batch_ui/bing2_uizi.png")
    bing_ui:setSize(cc.size(32,32))
    bing_ui:setAnchorPoint(cc.p(0.5,0.5))
    buy_and_use_btn:appendComponent(bing_ui)
    bing_ui:setPositionInContainer(cc.p(72,26))
    table_public_quick_buy_pop["bing_ui"] = bing_ui

    local shi_ui = fc.FExtensionsImage:create()
    shi_ui:setImage("batch_ui/shi2_uizi.png")
    shi_ui:setSize(cc.size(32,32))
    shi_ui:setAnchorPoint(cc.p(0.5,0.5))
    buy_and_use_btn:appendComponent(shi_ui)
    shi_ui:setPositionInContainer(cc.p(95,26))
    table_public_quick_buy_pop["shi_ui"] = shi_ui

    local yong_ui = fc.FExtensionsImage:create()
    yong_ui:setImage("batch_ui/yong_uizi.png")
    yong_ui:setSize(cc.size(32,32))
    yong_ui:setAnchorPoint(cc.p(0.5,0.5))
    buy_and_use_btn:appendComponent(yong_ui)
    yong_ui:setPositionInContainer(cc.p(118,26))
    table_public_quick_buy_pop["yong_ui"] = yong_ui

    local close_btn1 = fc.FScaleButton:create()
    close_btn1:setSize(cc.size(144,53))
    close_btn1:setAnchorPoint(cc.p(0.5,0.5))
    close_btn1:setButtonImage("batch_ui/putonganniu1_up.png")
    pqbp_bottom_panel:appendComponent(close_btn1)
    close_btn1:setPositionInContainer(cc.p(178,316.5))
    table_public_quick_buy_pop["close_btn1"] = close_btn1

    local guan_ui = fc.FExtensionsImage:create()
    guan_ui:setImage("batch_ui/guan_uizi.png")
    guan_ui:setSize(cc.size(32,32))
    guan_ui:setAnchorPoint(cc.p(0.5,0.5))
    close_btn1:appendComponent(guan_ui)
    guan_ui:setPositionInContainer(cc.p(49,26))
    table_public_quick_buy_pop["guan_ui"] = guan_ui

    local bi_ui = fc.FExtensionsImage:create()
    bi_ui:setImage("batch_ui/bi_uizi.png")
    bi_ui:setSize(cc.size(32,32))
    bi_ui:setAnchorPoint(cc.p(0.5,0.5))
    close_btn1:appendComponent(bi_ui)
    bi_ui:setPositionInContainer(cc.p(95,26))
    table_public_quick_buy_pop["bi_ui"] = bi_ui

    local pqbp_tile_label = fc.FLabel:createBMFont()
    pqbp_tile_label:setSize(cc.size(100,30))
    pqbp_tile_label:setAnchorPoint(cc.p(0.5,0.5))
    pqbp_tile_label:setFontSize(20)
     if LANGUAGE_TYPE == 3 then
     	 pqbp_tile_label:setString("糧草不足")
     else
     	 pqbp_tile_label:setString("粮草不足")
     end
   
    pqbp_tile_label:setColor(cc.c3b(91,24,6))
    pqbp_bottom_panel:appendComponent(pqbp_tile_label)
    pqbp_tile_label:setPositionInContainer(cc.p(267,71))
    table_public_quick_buy_pop["pqbp_tile_label"] = pqbp_tile_label

    local scji_ti = fc.FExtensionsImage:create()
    scji_ti:setImage("batch_ui/ti2_uizi.png")
    scji_ti:setSize(cc.size(32,32))
    scji_ti:setAnchorPoint(cc.p(0.5,0.5))
    pqbp_bottom_panel:appendComponent(scji_ti)
    scji_ti:setPositionInContainer(cc.p(233,26))
    table_public_quick_buy_pop["scji_ti"] = scji_ti

    local scji_shi = fc.FExtensionsImage:create()
    scji_shi:setImage("batch_ui/shi4_uizi.png")
    scji_shi:setSize(cc.size(32,32))
    scji_shi:setAnchorPoint(cc.p(0.5,0.5))
    pqbp_bottom_panel:appendComponent(scji_shi)
    scji_shi:setPositionInContainer(cc.p(301,26))
    table_public_quick_buy_pop["scji_shi"] = scji_shi

    local pqbp_num_di = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shuruwenzi.png",cc.rect(11,9,47,7))
    pqbp_num_di:setSize(cc.size(60,28))
    pqbp_num_di:setAnchorPoint(cc.p(0.5,0.5))
    pqbp_bottom_panel:appendComponent(pqbp_num_di)
    pqbp_num_di:setPositionInContainer(cc.p(324,249))
    table_public_quick_buy_pop["pqbp_num_di"] = pqbp_num_di

    local yuanbao_num = fc.FLabel:createBMFont()
    yuanbao_num:setSize(cc.size(50,30))
    yuanbao_num:setAnchorPoint(cc.p(0.5,0.5))
    yuanbao_num:setFontSize(20)
    yuanbao_num:setString("99")
    yuanbao_num:setColor(cc.c3b(139,255,240))
    pqbp_bottom_panel:appendComponent(yuanbao_num)
    yuanbao_num:setPositionInContainer(cc.p(324,249))
    table_public_quick_buy_pop["yuanbao_num"] = yuanbao_num

    return table_public_quick_buy_pop

end

