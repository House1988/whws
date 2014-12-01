function createbirth_tip_popup()

    local table_birth_tip_popup = {}

    local birth_tip_popup = fc.FContainerPanel:create()
    birth_tip_popup:setSize(cc.size(960,640))
    table_birth_tip_popup["birth_tip_popup"] = birth_tip_popup

    local pop_bottom_panel = fc.FContainerPanel:create()
    pop_bottom_panel:setSize(cc.size(570,404))
    pop_bottom_panel:setAnchorPoint(cc.p(0.5,0.5))
    birth_tip_popup:appendComponent(pop_bottom_panel)
    pop_bottom_panel:setPositionInContainer(cc.p(480,320))
    table_birth_tip_popup["pop_bottom_panel"] = pop_bottom_panel

    local btp_wen_la = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shengzhi_ditu.png",cc.rect(12,38,62,58))
    btp_wen_la:setSize(cc.size(443,350))
    btp_wen_la:setAnchorPoint(cc.p(0.5,0.5))
    pop_bottom_panel:appendComponent(btp_wen_la)
    btp_wen_la:setPositionInContainer(cc.p(285.5,202))
    table_birth_tip_popup["btp_wen_la"] = btp_wen_la

    local btp_dikuang1 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongditu2_huodong.png",cc.rect(1,1,1,1))
    btp_dikuang1:setSize(cc.size(386,294))
    btp_dikuang1:setAnchorPoint(cc.p(0.5,0.5))
    pop_bottom_panel:appendComponent(btp_dikuang1)
    btp_dikuang1:setPositionInContainer(cc.p(285,202))
    table_birth_tip_popup["btp_dikuang1"] = btp_dikuang1

    local btp_dikuang = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongbiankuang2_ciguan.png",cc.rect(44,15,1,1))
    btp_dikuang:setSize(cc.size(386,294))
    btp_dikuang:setAnchorPoint(cc.p(0.5,0.5))
    pop_bottom_panel:appendComponent(btp_dikuang)
    btp_dikuang:setPositionInContainer(cc.p(285,202))
    table_birth_tip_popup["btp_dikuang"] = btp_dikuang

    local btp_bling_panel = fc.FContainerPanel:create()
    btp_bling_panel:setSize(cc.size(162,112))
    btp_bling_panel:setAnchorPoint(cc.p(0.5,0.5))
    pop_bottom_panel:appendComponent(btp_bling_panel)
    btp_bling_panel:setPositionInContainer(cc.p(285,186))
    table_birth_tip_popup["btp_bling_panel"] = btp_bling_panel

    local btp_bling1 = fc.FExtensionsImage:create()
    btp_bling1:setImage("nobatch/bulingbuling.png")
    btp_bling1:setSize(cc.size(162,56))
    btp_bling1:setAnchorPoint(cc.p(0.5,0.5))
    btp_bling_panel:appendComponent(btp_bling1)
    btp_bling1:setPositionInContainer(cc.p(81,28))
    table_birth_tip_popup["btp_bling1"] = btp_bling1

    local btp_bling2 = fc.FExtensionsImage:create()
    btp_bling2:setImage("nobatch/bulingbuling.png")
    btp_bling2:setSize(cc.size(162,56))
    btp_bling2:setFlipType(4)
    btp_bling2:setAnchorPoint(cc.p(0.5,0.5))
    btp_bling_panel:appendComponent(btp_bling2)
    btp_bling2:setPositionInContainer(cc.p(81,84))
    table_birth_tip_popup["btp_bling2"] = btp_bling2

    local btp_content = fc.FLabel:createBMFont()
    btp_content:setSize(cc.size(380,24))
    btp_content:setWidth(380)
    btp_content:setAnchorPoint(cc.p(0.5,0.5))
    btp_content:setFontSize(20)
    if LANGUAGE_TYPE == 3 then
   	 	 btp_content:setString("皇子還在孕育中，距離分娩還有：")    
    else
   		 btp_content:setString("皇子还在孕育中，距离分娩还有：")
    end
    btp_content:setColor(cc.c3b(91,24,6))
    pop_bottom_panel:appendComponent(btp_content)
    btp_content:setPositionInContainer(cc.p(285,95))
    table_birth_tip_popup["btp_content"] = btp_content

    local btp_zhou_down = fc.FExtensionsImage:create()
    btp_zhou_down:setImage("nobatch/shengzhi_zhou.png")
    btp_zhou_down:setSize(cc.size(47,570))
    btp_zhou_down:setRotation(90)
    btp_zhou_down:setAnchorPoint(cc.p(0.5,0.5))
    pop_bottom_panel:appendComponent(btp_zhou_down)
    btp_zhou_down:setPositionInContainer(cc.p(285,368.5))
    table_birth_tip_popup["btp_zhou_down"] = btp_zhou_down

    local btp_zhou_up = fc.FExtensionsImage:create()
    btp_zhou_up:setImage("nobatch/shengzhi_zhou.png")
    btp_zhou_up:setSize(cc.size(47,570))
    btp_zhou_up:setRotation(90)
    btp_zhou_up:setAnchorPoint(cc.p(0.5,0.5))
    pop_bottom_panel:appendComponent(btp_zhou_up)
    btp_zhou_up:setPositionInContainer(cc.p(285,37.5))
    table_birth_tip_popup["btp_zhou_up"] = btp_zhou_up

    local btp_title_bg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/xingjikuang_tangquanxinggong.png",cc.rect(72,17,2,2))
    btp_title_bg:setSize(cc.size(288,40))
    btp_title_bg:setAnchorPoint(cc.p(0.5,0.5))
    btp_title_bg:setScaleY(-1)
    pop_bottom_panel:appendComponent(btp_title_bg)
    btp_title_bg:setPositionInContainer(cc.p(285,36))
    table_birth_tip_popup["btp_title_bg"] = btp_title_bg

    local btp_ti = fc.FExtensionsImage:create()
    btp_ti:setImage("batch_ui/ti2_uizi.png")
    btp_ti:setSize(cc.size(32,32))
    btp_ti:setAnchorPoint(cc.p(0.5,0.5))
    pop_bottom_panel:appendComponent(btp_ti)
    btp_ti:setPositionInContainer(cc.p(249,36))
    table_birth_tip_popup["btp_ti"] = btp_ti

    local btp_shi = fc.FExtensionsImage:create()
    btp_shi:setImage("batch_ui/shi4_uizi.png")
    btp_shi:setSize(cc.size(32,32))
    btp_shi:setAnchorPoint(cc.p(0.5,0.5))
    pop_bottom_panel:appendComponent(btp_shi)
    btp_shi:setPositionInContainer(cc.p(321,36))
    table_birth_tip_popup["btp_shi"] = btp_shi

    local btp_close_btn = fc.FScaleButton:create()
    btp_close_btn:setSize(cc.size(41,45))
    btp_close_btn:setAnchorPoint(cc.p(0.5,0.5))
    btp_close_btn:setButtonImage("batch_ui/guanbi_anniu2.png")
    pop_bottom_panel:appendComponent(btp_close_btn)
    btp_close_btn:setPositionInContainer(cc.p(529.5,36.5))
    table_birth_tip_popup["btp_close_btn"] = btp_close_btn

    local btp_time_label = fc.FLabel:createBMFont()
    btp_time_label:setSize(cc.size(169,24))
    btp_time_label:setAnchorPoint(cc.p(0.5,0.5))
    btp_time_label:setFontSize(20)
    btp_time_label:setString("00:00:00")
    btp_time_label:setColor(cc.c3b(91,24,6))
    pop_bottom_panel:appendComponent(btp_time_label)
    btp_time_label:setPositionInContainer(cc.p(284.5,127))
    table_birth_tip_popup["btp_time_label"] = btp_time_label

    local btp_buy_panel = fc.FContainerPanel:create()
    btp_buy_panel:setSize(cc.size(570,162))
    btp_buy_panel:setAnchorPoint(cc.p(0.5,0.5))
    pop_bottom_panel:appendComponent(btp_buy_panel)
    btp_buy_panel:setPositionInContainer(cc.p(285,239))
    table_birth_tip_popup["btp_buy_panel"] = btp_buy_panel

    local btp_left_btn = fc.FScaleButton:create()
    btp_left_btn:setSize(cc.size(144,53))
    btp_left_btn:setAnchorPoint(cc.p(0.5,0.5))
    btp_left_btn:setButtonImage("batch_ui/putonganniu1_up.png")
    btp_buy_panel:appendComponent(btp_left_btn)
    btp_left_btn:setPositionInContainer(cc.p(198,135.5))
    table_birth_tip_popup["btp_left_btn"] = btp_left_btn

    local btp_qu = fc.FShaderExtensionsImage:create(0)
    btp_qu:setAnchorPoint(cc.p(0.5,0.5))
    btp_qu:setImage("batch_ui/qu_uizi.png")
    btp_qu:setSize(cc.size(32,32))
    btp_left_btn:appendComponent(btp_qu)
    btp_qu:setPositionInContainer(cc.p(50,26))
    table_birth_tip_popup["btp_qu"] = btp_qu

    local btp_xiao = fc.FShaderExtensionsImage:create(0)
    btp_xiao:setAnchorPoint(cc.p(0.5,0.5))
    btp_xiao:setImage("batch_ui/xiao_uizi.png")
    btp_xiao:setSize(cc.size(32,32))
    btp_left_btn:appendComponent(btp_xiao)
    btp_xiao:setPositionInContainer(cc.p(94,26))
    table_birth_tip_popup["btp_xiao"] = btp_xiao

    local btp_wenzi_di = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongditu_huodong.png",cc.rect(3,3,2,2))
    btp_wenzi_di:setSize(cc.size(380,82))
    btp_wenzi_di:setAnchorPoint(cc.p(0.5,0.5))
    btp_buy_panel:appendComponent(btp_wenzi_di)
    btp_wenzi_di:setPositionInContainer(cc.p(285,41))
    table_birth_tip_popup["btp_wenzi_di"] = btp_wenzi_di

    local btp_right_btn = fc.FScaleButton:create()
    btp_right_btn:setSize(cc.size(144,53))
    btp_right_btn:setAnchorPoint(cc.p(0.5,0.5))
    btp_right_btn:setButtonImage("batch_ui/teshuanniu.png")
    btp_buy_panel:appendComponent(btp_right_btn)
    btp_right_btn:setPositionInContainer(cc.p(372,135.5))
    table_birth_tip_popup["btp_right_btn"] = btp_right_btn

    local btp_cui = fc.FShaderExtensionsImage:create(0)
    btp_cui:setAnchorPoint(cc.p(0.5,0.5))
    btp_cui:setImage("batch_ui/chui.png")
    btp_cui:setSize(cc.size(32,32))
    btp_right_btn:appendComponent(btp_cui)
    btp_cui:setPositionInContainer(cc.p(50,26))
    table_birth_tip_popup["btp_cui"] = btp_cui

    local btp_sheng = fc.FShaderExtensionsImage:create(0)
    btp_sheng:setAnchorPoint(cc.p(0.5,0.5))
    btp_sheng:setImage("batch_ui/sheng_uizi2.png")
    btp_sheng:setSize(cc.size(32,32))
    btp_right_btn:appendComponent(btp_sheng)
    btp_sheng:setPositionInContainer(cc.p(94,26))
    table_birth_tip_popup["btp_sheng"] = btp_sheng

    local btp_yuanbao_img = fc.FExtensionsImage:create()
    btp_yuanbao_img:setImage("batch_ui/yuanbao.png")
    btp_yuanbao_img:setSize(cc.size(58,43))
    btp_yuanbao_img:setAnchorPoint(cc.p(0.5,0.5))
    btp_buy_panel:appendComponent(btp_yuanbao_img)
    btp_yuanbao_img:setPositionInContainer(cc.p(183,43.5))
    table_birth_tip_popup["btp_yuanbao_img"] = btp_yuanbao_img

    local btp_price_bg = fc.FExtensionsImage:create()
    btp_price_bg:setImage("batch_ui/shuruwenzi.png")
    btp_price_bg:setSize(cc.size(76,23))
    btp_price_bg:setAnchorPoint(cc.p(0.5,0.5))
    btp_buy_panel:appendComponent(btp_price_bg)
    btp_price_bg:setPositionInContainer(cc.p(248,43.5))
    table_birth_tip_popup["btp_price_bg"] = btp_price_bg

    local btp_price_label = fc.FLabel:createBMFont()
    btp_price_label:setSize(cc.size(100,24))
    btp_price_label:setAnchorPoint(cc.p(0.5,0.5))
    btp_price_label:setFontSize(20)
    btp_price_label:setString("500")
    btp_price_label:setColor(cc.c3b(0,255,255))
    btp_buy_panel:appendComponent(btp_price_label)
    btp_price_label:setPositionInContainer(cc.p(247,40))
    table_birth_tip_popup["btp_price_label"] = btp_price_label

    local btp_content1 = fc.FLabel:createBMFont()
    btp_content1:setSize(cc.size(100,24))
    btp_content1:setAnchorPoint(cc.p(0.5,0.5))
    btp_content1:setFontSize(20)
     if LANGUAGE_TYPE == 3 then
   	 	 btp_content1:setString("花費")   
    else
   		 btp_content1:setString("花费")
    end
    btp_content1:setColor(cc.c3b(91,24,6))
    btp_content1:setAlignment(2)
    btp_buy_panel:appendComponent(btp_content1)
    btp_content1:setPositionInContainer(cc.p(104,37))
    table_birth_tip_popup["btp_content1"] = btp_content1

    local btp_content2 = fc.FLabel:createBMFont()
    btp_content2:setSize(cc.size(169,24))
    btp_content2:setAnchorPoint(cc.p(0.5,0.5))
    btp_content2:setFontSize(20)
    if LANGUAGE_TYPE == 3 then
   	 	 btp_content2:setString("，可讓太醫催生")  
    else
   		 btp_content2:setString("，可让太医催生")
    end
    
    btp_content2:setColor(cc.c3b(91,24,6))
    btp_content2:setAlignment(0)
    btp_buy_panel:appendComponent(btp_content2)
    btp_content2:setPositionInContainer(cc.p(377.5,37))
    table_birth_tip_popup["btp_content2"] = btp_content2

    local btp_confirm_btn = fc.FScaleButton:create()
    btp_confirm_btn:setSize(cc.size(144,53))
    btp_confirm_btn:setAnchorPoint(cc.p(0.5,0.5))
    btp_confirm_btn:setButtonImage("batch_ui/putonganniu1_up.png")
    pop_bottom_panel:appendComponent(btp_confirm_btn)
    btp_confirm_btn:setPositionInContainer(cc.p(285,281.5))
    table_birth_tip_popup["btp_confirm_btn"] = btp_confirm_btn

    local btp_que = fc.FShaderExtensionsImage:create(0)
    btp_que:setAnchorPoint(cc.p(0.5,0.5))
    btp_que:setImage("batch_ui/que_uizi.png")
    btp_que:setSize(cc.size(32,32))
    btp_confirm_btn:appendComponent(btp_que)
    btp_que:setPositionInContainer(cc.p(50,26))
    table_birth_tip_popup["btp_que"] = btp_que

    local btp_ding = fc.FShaderExtensionsImage:create(0)
    btp_ding:setAnchorPoint(cc.p(0.5,0.5))
    btp_ding:setImage("batch_ui/ding_uizi.png")
    btp_ding:setSize(cc.size(32,32))
    btp_confirm_btn:appendComponent(btp_ding)
    btp_ding:setPositionInContainer(cc.p(94,26))
    table_birth_tip_popup["btp_ding"] = btp_ding

    return table_birth_tip_popup

end

