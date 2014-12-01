function createhougong_huaiyunjibao()

    local table_hougong_huaiyunjibao = {}

    local hougong_huaiyunjibao = fc.FContainerPanel:create()
    hougong_huaiyunjibao:setSize(cc.size(960,640))
    table_hougong_huaiyunjibao["hougong_huaiyunjibao"] = hougong_huaiyunjibao

    local hg_hy_bottom_panel = fc.FContainerPanel:create()
    hg_hy_bottom_panel:setSize(cc.size(534,550))
    hg_hy_bottom_panel:setAnchorPoint(cc.p(0.5,0.5))
    hougong_huaiyunjibao:appendComponent(hg_hy_bottom_panel)
    hg_hy_bottom_panel:setPositionInContainer(cc.p(480,320))
    table_hougong_huaiyunjibao["hg_hy_bottom_panel"] = hg_hy_bottom_panel

    local hg_wen_la = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shengzhi_ditu.png",cc.rect(40,63,4,4))
    hg_wen_la:setSize(cc.size(412,500))
    hg_wen_la:setAnchorPoint(cc.p(0.5,0.5))
    hg_hy_bottom_panel:appendComponent(hg_wen_la)
    hg_wen_la:setPositionInContainer(cc.p(267,275))
    table_hougong_huaiyunjibao["hg_wen_la"] = hg_wen_la

    local zhou_u = fc.FExtensionsImage:create()
    zhou_u:setImage("nobatch/shengzhi_zhou.png")
    zhou_u:setSize(cc.size(52,534))
    zhou_u:setRotation(90)
    zhou_u:setAnchorPoint(cc.p(0.5,0.5))
    hg_hy_bottom_panel:appendComponent(zhou_u)
    zhou_u:setPositionInContainer(cc.p(267,26))
    table_hougong_huaiyunjibao["zhou_u"] = zhou_u

    local zhou_d = fc.FExtensionsImage:create()
    zhou_d:setImage("nobatch/shengzhi_zhou.png")
    zhou_d:setSize(cc.size(52,534))
    zhou_d:setRotation(90)
    zhou_d:setAnchorPoint(cc.p(0.5,0.5))
    hg_hy_bottom_panel:appendComponent(zhou_d)
    zhou_d:setPositionInContainer(cc.p(267,524))
    table_hougong_huaiyunjibao["zhou_d"] = zhou_d

    local title_di = fc.FScale9Image:createWithBatchUIFrame("batch_ui/xingjikuang_tangquanxinggong.png",cc.rect(72,17,2,2))
    title_di:setSize(cc.size(260,50))
    title_di:setAnchorPoint(cc.p(0.5,0.5))
    title_di:setScaleY(-1)
    hg_hy_bottom_panel:appendComponent(title_di)
    title_di:setPositionInContainer(cc.p(277,25))
    table_hougong_huaiyunjibao["title_di"] = title_di

    local hyjb_rect111 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongditu2_huodong.png",cc.rect(1,1,1,1))
    hyjb_rect111:setSize(cc.size(384,454))
    hyjb_rect111:setAnchorPoint(cc.p(0.5,0.5))
    hg_hy_bottom_panel:appendComponent(hyjb_rect111)
    hyjb_rect111:setPositionInContainer(cc.p(267,275))
    table_hougong_huaiyunjibao["hyjb_rect111"] = hyjb_rect111

    local hyjb_di1 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongbiankuang2_ciguan.png",cc.rect(44,15,1,1))
    hyjb_di1:setSize(cc.size(384,454))
    hyjb_di1:setAnchorPoint(cc.p(0.5,0.5))
    hg_hy_bottom_panel:appendComponent(hyjb_di1)
    hyjb_di1:setPositionInContainer(cc.p(267,275))
    table_hougong_huaiyunjibao["hyjb_di1"] = hyjb_di1

    local hyjb_di2 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongditu_huodong.png",cc.rect(3,3,2,2))
    hyjb_di2:setSize(cc.size(380,119))
    hyjb_di2:setAnchorPoint(cc.p(0.5,0.5))
    hg_hy_bottom_panel:appendComponent(hyjb_di2)
    hyjb_di2:setPositionInContainer(cc.p(267,181.5))
    table_hougong_huaiyunjibao["hyjb_di2"] = hyjb_di2

    local hyjb_di3 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongditu_huodong.png",cc.rect(3,3,2,2))
    hyjb_di3:setSize(cc.size(380,100))
    hyjb_di3:setAnchorPoint(cc.p(0.5,0.5))
    hg_hy_bottom_panel:appendComponent(hyjb_di3)
    hyjb_di3:setPositionInContainer(cc.p(267,335))
    table_hougong_huaiyunjibao["hyjb_di3"] = hyjb_di3

    local hg_hy_huangzi_bg_image = fc.FExtensionsImage:create()
    hg_hy_huangzi_bg_image:setImage("nobatch/bornPrince.png")
    hg_hy_huangzi_bg_image:setSize(cc.size(140,100))
    hg_hy_huangzi_bg_image:setAnchorPoint(cc.p(0.5,0.5))
    hg_hy_bottom_panel:appendComponent(hg_hy_huangzi_bg_image)
    hg_hy_huangzi_bg_image:setPositionInContainer(cc.p(267,182))
    table_hougong_huaiyunjibao["hg_hy_huangzi_bg_image"] = hg_hy_huangzi_bg_image

    local hg_gongxi_word_label = fc.FLabel:createBMFont()
    hg_gongxi_word_label:setSize(cc.size(280,72))
    hg_gongxi_word_label:setWidth(280)
    hg_gongxi_word_label:setAnchorPoint(cc.p(0.5,0.5))
    hg_gongxi_word_label:setFontSize(20)
    hg_gongxi_word_label:setString("吾皇万岁!步才太步院传来喜步：步贵妃娘娘顺利诞下7斤6两皇子一名:")
    hg_gongxi_word_label:setColor(cc.c3b(91,24,6))
    hg_hy_bottom_panel:appendComponent(hg_gongxi_word_label)
    hg_gongxi_word_label:setPositionInContainer(cc.p(267,84))
    table_hougong_huaiyunjibao["hg_gongxi_word_label"] = hg_gongxi_word_label

    local hg_hy_qiming_label = fc.FLabel:createBMFont()
    hg_hy_qiming_label:setSize(cc.size(250,40))
    hg_hy_qiming_label:setAnchorPoint(cc.p(0.5,0.5))
    hg_hy_qiming_label:setFontSize(20)
    if LANGUAGE_TYPE == 3 then
    	hg_hy_qiming_label:setString("皇上，小阿哥叫什麼好呢？")    
    else
   	 	hg_hy_qiming_label:setString("皇上，小阿哥叫什么好呢？")
    end
    hg_hy_qiming_label:setColor(cc.c3b(91,24,6))
    hg_hy_bottom_panel:appendComponent(hg_hy_qiming_label)
    hg_hy_qiming_label:setPositionInContainer(cc.p(267,307))
    table_hougong_huaiyunjibao["hg_hy_qiming_label"] = hg_hy_qiming_label

    local hg_hy_shuru_input_bg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shuruwenzi.png",cc.rect(11,9,47,7))
    hg_hy_shuru_input_bg:setSize(cc.size(216,48))
    hg_hy_shuru_input_bg:setAnchorPoint(cc.p(0.5,0.5))
    hg_hy_bottom_panel:appendComponent(hg_hy_shuru_input_bg)
    hg_hy_shuru_input_bg:setPositionInContainer(cc.p(267,359))
    table_hougong_huaiyunjibao["hg_hy_shuru_input_bg"] = hg_hy_shuru_input_bg

    local hg_hy_shuru_input = fc.FInput:create()
    hg_hy_shuru_input:setSizeAndBackgroundImage(cc.size(216,46),"","","",false)
    hg_hy_shuru_input:setAnchorPoint(cc.p(0.5,0.5))
    hg_hy_shuru_input:setTouchEnabled(true)
    hg_hy_shuru_input:setFontSize(20)
    hg_hy_bottom_panel:appendComponent(hg_hy_shuru_input)
    hg_hy_shuru_input:setPositionInContainer(cc.p(268,356))
    table_hougong_huaiyunjibao["hg_hy_shuru_input"] = hg_hy_shuru_input

    local hg_hy_queding_button = fc.FScaleButton:create()
    hg_hy_queding_button:setSize(cc.size(144,53))
    hg_hy_queding_button:setAnchorPoint(cc.p(0.5,0.5))
    hg_hy_queding_button:setButtonImage("batch_ui/putonganniu1_up.png")
    hg_hy_bottom_panel:appendComponent(hg_hy_queding_button)
    hg_hy_queding_button:setPositionInContainer(cc.p(267,426.5))
    table_hougong_huaiyunjibao["hg_hy_queding_button"] = hg_hy_queding_button

    local hyjb_label_que = fc.FShaderExtensionsImage:create(0)
    hyjb_label_que:setAnchorPoint(cc.p(0.5,0.5))
    hyjb_label_que:setImage("batch_ui/que_uizi.png")
    hyjb_label_que:setSize(cc.size(32,32))
    hg_hy_queding_button:appendComponent(hyjb_label_que)
    hyjb_label_que:setPositionInContainer(cc.p(45,26))
    table_hougong_huaiyunjibao["hyjb_label_que"] = hyjb_label_que

    local hyjb_label_ren = fc.FShaderExtensionsImage:create(0)
    hyjb_label_ren:setAnchorPoint(cc.p(0.5,0.5))
    hyjb_label_ren:setImage("batch_ui/ding_uizi.png")
    hyjb_label_ren:setSize(cc.size(32,32))
    hg_hy_queding_button:appendComponent(hyjb_label_ren)
    hyjb_label_ren:setPositionInContainer(cc.p(98,26))
    table_hougong_huaiyunjibao["hyjb_label_ren"] = hyjb_label_ren

    local xing_dark = fc.FExtensionsImage:create()
    xing_dark:setImage("batch_ui/xingxing_dark.png")
    xing_dark:setSize(cc.size(20,19))
    xing_dark:setAnchorPoint(cc.p(0.5,0.5))
    hg_hy_bottom_panel:appendComponent(xing_dark)
    xing_dark:setPositionInContainer(cc.p(205,260.5))
    table_hougong_huaiyunjibao["xing_dark"] = xing_dark

    local xing_dark = fc.FExtensionsImage:create()
    xing_dark:setImage("batch_ui/xingxing_dark.png")
    xing_dark:setSize(cc.size(20,19))
    xing_dark:setAnchorPoint(cc.p(0.5,0.5))
    hg_hy_bottom_panel:appendComponent(xing_dark)
    xing_dark:setPositionInContainer(cc.p(236,260.5))
    table_hougong_huaiyunjibao["xing_dark"] = xing_dark

    local xing_dark = fc.FExtensionsImage:create()
    xing_dark:setImage("batch_ui/xingxing_dark.png")
    xing_dark:setSize(cc.size(20,19))
    xing_dark:setAnchorPoint(cc.p(0.5,0.5))
    hg_hy_bottom_panel:appendComponent(xing_dark)
    xing_dark:setPositionInContainer(cc.p(267,260.5))
    table_hougong_huaiyunjibao["xing_dark"] = xing_dark

    local xing_dark = fc.FExtensionsImage:create()
    xing_dark:setImage("batch_ui/xingxing_dark.png")
    xing_dark:setSize(cc.size(20,19))
    xing_dark:setAnchorPoint(cc.p(0.5,0.5))
    hg_hy_bottom_panel:appendComponent(xing_dark)
    xing_dark:setPositionInContainer(cc.p(298,260.5))
    table_hougong_huaiyunjibao["xing_dark"] = xing_dark

    local xing_dark = fc.FExtensionsImage:create()
    xing_dark:setImage("batch_ui/xingxing_dark.png")
    xing_dark:setSize(cc.size(20,19))
    xing_dark:setAnchorPoint(cc.p(0.5,0.5))
    hg_hy_bottom_panel:appendComponent(xing_dark)
    xing_dark:setPositionInContainer(cc.p(329,260.5))
    table_hougong_huaiyunjibao["xing_dark"] = xing_dark

    local star1 = fc.FExtensionsImage:create()
    star1:setImage("batch_ui/xingxing.png")
    star1:setSize(cc.size(20,19))
    star1:setAnchorPoint(cc.p(0.5,0.5))
    hg_hy_bottom_panel:appendComponent(star1)
    star1:setPositionInContainer(cc.p(205,260.5))
    table_hougong_huaiyunjibao["star1"] = star1

    local star2 = fc.FExtensionsImage:create()
    star2:setImage("batch_ui/xingxing.png")
    star2:setSize(cc.size(20,19))
    star2:setAnchorPoint(cc.p(0.5,0.5))
    hg_hy_bottom_panel:appendComponent(star2)
    star2:setPositionInContainer(cc.p(236,260.5))
    table_hougong_huaiyunjibao["star2"] = star2

    local star3 = fc.FExtensionsImage:create()
    star3:setImage("batch_ui/xingxing.png")
    star3:setSize(cc.size(20,19))
    star3:setAnchorPoint(cc.p(0.5,0.5))
    hg_hy_bottom_panel:appendComponent(star3)
    star3:setPositionInContainer(cc.p(267,260.5))
    table_hougong_huaiyunjibao["star3"] = star3

    local star4 = fc.FExtensionsImage:create()
    star4:setImage("batch_ui/xingxing.png")
    star4:setSize(cc.size(20,19))
    star4:setAnchorPoint(cc.p(0.5,0.5))
    hg_hy_bottom_panel:appendComponent(star4)
    star4:setPositionInContainer(cc.p(298,260.5))
    table_hougong_huaiyunjibao["star4"] = star4

    local star5 = fc.FExtensionsImage:create()
    star5:setImage("batch_ui/xingxing.png")
    star5:setSize(cc.size(20,19))
    star5:setAnchorPoint(cc.p(0.5,0.5))
    hg_hy_bottom_panel:appendComponent(star5)
    star5:setPositionInContainer(cc.p(329,260.5))
    table_hougong_huaiyunjibao["star5"] = star5

    local hg_ji_ui = fc.FExtensionsImage:create()
    hg_ji_ui:setImage("batch_ui/ji8_uizi.png")
    hg_ji_ui:setSize(cc.size(32,32))
    hg_ji_ui:setAnchorPoint(cc.p(0.5,0.5))
    hg_hy_bottom_panel:appendComponent(hg_ji_ui)
    hg_ji_ui:setPositionInContainer(cc.p(242,25))
    table_hougong_huaiyunjibao["hg_ji_ui"] = hg_ji_ui

    local hg_bao_ui = fc.FExtensionsImage:create()
    hg_bao_ui:setImage("batch_ui/bao2_uizi.png")
    hg_bao_ui:setSize(cc.size(32,32))
    hg_bao_ui:setAnchorPoint(cc.p(0.5,0.5))
    hg_hy_bottom_panel:appendComponent(hg_bao_ui)
    hg_bao_ui:setPositionInContainer(cc.p(304,25))
    table_hougong_huaiyunjibao["hg_bao_ui"] = hg_bao_ui

    return table_hougong_huaiyunjibao

end

