function createzouzang_buzu_pop()

    local table_zouzang_buzu_pop = {}

    local zouzang_buzu_pop = fc.FContainerPanel:create()
    zouzang_buzu_pop:setSize(cc.size(960,640))
    table_zouzang_buzu_pop["zouzang_buzu_pop"] = zouzang_buzu_pop

    local zb_panel_bg = fc.FContainerPanel:create()
    zb_panel_bg:setSize(cc.size(534,500))
    zb_panel_bg:setAnchorPoint(cc.p(0.5,0.5))
    zouzang_buzu_pop:appendComponent(zb_panel_bg)
    zb_panel_bg:setPositionInContainer(cc.p(480,320))
    table_zouzang_buzu_pop["zb_panel_bg"] = zb_panel_bg

    local zb_image_bg_lu = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shengzhi_ditu.png",cc.rect(40,63,4,4))
    zb_image_bg_lu:setSize(cc.size(432,460))
    zb_image_bg_lu:setAnchorPoint(cc.p(0.5,0.5))
    zb_panel_bg:appendComponent(zb_image_bg_lu)
    zb_image_bg_lu:setPositionInContainer(cc.p(267,250))
    table_zouzang_buzu_pop["zb_image_bg_lu"] = zb_image_bg_lu

    local zb_image_bg_up = fc.FExtensionsImage:create()
    zb_image_bg_up:setImage("nobatch/shengzhi_zhou.png")
    zb_image_bg_up:setSize(cc.size(52,534))
    zb_image_bg_up:setRotation(90)
    zb_image_bg_up:setAnchorPoint(cc.p(0.5,0.5))
    zb_panel_bg:appendComponent(zb_image_bg_up)
    zb_image_bg_up:setPositionInContainer(cc.p(267,26))
    table_zouzang_buzu_pop["zb_image_bg_up"] = zb_image_bg_up

    local zb_image_bg_bottom = fc.FExtensionsImage:create()
    zb_image_bg_bottom:setImage("nobatch/shengzhi_zhou.png")
    zb_image_bg_bottom:setSize(cc.size(52,534))
    zb_image_bg_bottom:setRotation(90)
    zb_image_bg_bottom:setAnchorPoint(cc.p(0.5,0.5))
    zb_panel_bg:appendComponent(zb_image_bg_bottom)
    zb_image_bg_bottom:setPositionInContainer(cc.p(267,474))
    table_zouzang_buzu_pop["zb_image_bg_bottom"] = zb_image_bg_bottom

    local zb_title_bg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/xingjikuang_tangquanxinggong.png",cc.rect(72,17,2,2))
    zb_title_bg:setSize(cc.size(280,50))
    zb_title_bg:setAnchorPoint(cc.p(0.5,0.5))
    zb_panel_bg:appendComponent(zb_title_bg)
    zb_title_bg:setPositionInContainer(cc.p(263,25))
    table_zouzang_buzu_pop["zb_title_bg"] = zb_title_bg

    local zb_close_btn = fc.FTextButton:create()
    zb_close_btn:setSize(cc.size(41,45))
    zb_close_btn:setAnchorPoint(cc.p(0.5,0.5))
    zb_close_btn:setTextButtonImage("batch_ui/guanbi_anniu2.png","batch_ui/guanbi_anniu2.png","batch_ui/guanbi_anniu2.png")
    zb_close_btn:setSelectActionEnbaled(true)
    zb_panel_bg:appendComponent(zb_close_btn)
    zb_close_btn:setPositionInContainer(cc.p(501.5,29.5))
    table_zouzang_buzu_pop["zb_close_btn"] = zb_close_btn

    local zb_title_label = fc.FLabel:createBMFont()
    zb_title_label:setSize(cc.size(200,30))
    zb_title_label:setAnchorPoint(cc.p(0.5,0.5))
    zb_title_label:setFontSize(24)
    if LANGUAGE_TYPE == 3 then
    	zb_title_label:setString("可批閱奏章不足")
    else
    	zb_title_label:setString("可批阅奏章不足")
    end
    zb_title_label:setColor(cc.c3b(255,255,255))
    zb_panel_bg:appendComponent(zb_title_label)
    zb_title_label:setPositionInContainer(cc.p(263,25))
    table_zouzang_buzu_pop["zb_title_label"] = zb_title_label

    local zb_rectbg1 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongditu2_huodong.png",cc.rect(1,1,1,1))
    zb_rectbg1:setSize(cc.size(384,400))
    zb_rectbg1:setAnchorPoint(cc.p(0.5,0.5))
    zb_panel_bg:appendComponent(zb_rectbg1)
    zb_rectbg1:setPositionInContainer(cc.p(267,251))
    table_zouzang_buzu_pop["zb_rectbg1"] = zb_rectbg1

    local zb_rectbg2 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongbiankuang2_ciguan.png",cc.rect(44,15,1,1))
    zb_rectbg2:setSize(cc.size(384,400))
    zb_rectbg2:setAnchorPoint(cc.p(0.5,0.5))
    zb_panel_bg:appendComponent(zb_rectbg2)
    zb_rectbg2:setPositionInContainer(cc.p(267,251))
    table_zouzang_buzu_pop["zb_rectbg2"] = zb_rectbg2

    local zb_content1 = fc.FLabel:createBMFont()
    zb_content1:setSize(cc.size(370,30))
    zb_content1:setAnchorPoint(cc.p(0.5,0.5))
    zb_content1:setFontSize(21)
    if LANGUAGE_TYPE == 3 then
    	zb_content1:setString("啟稟皇上，加急奏章需要100")
    else
    	zb_content1:setString("启禀皇上，加急奏章需要100")
    end
    zb_content1:setColor(cc.c3b(0,0,0))
    zb_panel_bg:appendComponent(zb_content1)
    zb_content1:setPositionInContainer(cc.p(265,94))
    table_zouzang_buzu_pop["zb_content1"] = zb_content1

    local zb_content2 = fc.FLabel:createBMFont()
    zb_content2:setSize(cc.size(370,30))
    zb_content2:setAnchorPoint(cc.p(0.5,0.5))
    zb_content2:setFontSize(21)
    if LANGUAGE_TYPE == 3 then
   		 zb_content2:setString("車馬費打點各地驛站，是否撥款？")    
    else
   		 zb_content2:setString("车马费打点各地驿站，是否拨款？")
    end
    zb_content2:setColor(cc.c3b(0,0,0))
    zb_panel_bg:appendComponent(zb_content2)
    zb_content2:setPositionInContainer(cc.p(269,126))
    table_zouzang_buzu_pop["zb_content2"] = zb_content2

    local zb_content3 = fc.FLabel:createBMFont()
    zb_content3:setSize(cc.size(250,30))
    zb_content3:setAnchorPoint(cc.p(0.5,0.5))
    zb_content3:setFontSize(21)
    zb_content3:setString("")
    zb_content3:setColor(cc.c3b(0,0,0))
    zb_panel_bg:appendComponent(zb_content3)
    zb_content3:setPositionInContainer(cc.p(269,216))
    table_zouzang_buzu_pop["zb_content3"] = zb_content3

    local zb_content4 = fc.FLabel:createBMFont()
    zb_content4:setSize(cc.size(250,30))
    zb_content4:setAnchorPoint(cc.p(0.5,0.5))
    zb_content4:setFontSize(21)
    if LANGUAGE_TYPE == 3 then
    	zb_content4:setString("VIP等級越高，次數越多。")
    else
    	zb_content4:setString("VIP等级越高，次数越多。")
    end
    zb_content4:setColor(cc.c3b(0, 0, 0))
    zb_panel_bg:appendComponent(zb_content4)
    zb_content4:setPositionInContainer(cc.p(269,249))
    table_zouzang_buzu_pop["zb_content4"] = zb_content4

    local yuanbao1 = fc.FExtensionsImage:create()
    yuanbao1:setImage("batch_ui/yuanbao.png")
    yuanbao1:setSize(cc.size(58,40))
    yuanbao1:setAnchorPoint(cc.p(0.5,0.5))
    zb_panel_bg:appendComponent(yuanbao1)
    yuanbao1:setPositionInContainer(cc.p(427,98))
    table_zouzang_buzu_pop["yuanbao1"] = yuanbao1

    local zb_cancel_btn = fc.FScaleButton:create()
    zb_cancel_btn:setSize(cc.size(144,53))
    zb_cancel_btn:setAnchorPoint(cc.p(0.5,0.5))
    zb_cancel_btn:setButtonImage("batch_ui/putonganniu1_up.png")
    zb_panel_bg:appendComponent(zb_cancel_btn)
    zb_cancel_btn:setPositionInContainer(cc.p(357,377.5))
    table_zouzang_buzu_pop["zb_cancel_btn"] = zb_cancel_btn

    local guan = fc.FShaderExtensionsImage:create(0)
    guan:setAnchorPoint(cc.p(0.5,0.5))
    guan:setImage("batch_ui/guan_uizi.png")
    guan:setSize(cc.size(32,32))
    zb_cancel_btn:appendComponent(guan)
    guan:setPositionInContainer(cc.p(43,26))
    table_zouzang_buzu_pop["guan"] = guan

    local bi = fc.FShaderExtensionsImage:create(0)
    bi:setAnchorPoint(cc.p(0.5,0.5))
    bi:setImage("batch_ui/bi_uizi.png")
    bi:setSize(cc.size(32,32))
    zb_cancel_btn:appendComponent(bi)
    bi:setPositionInContainer(cc.p(98,26))
    table_zouzang_buzu_pop["bi"] = bi

    local chongzhi = fc.FScaleButton:create()
    chongzhi:setSize(cc.size(146,53))
    chongzhi:setAnchorPoint(cc.p(0.5,0.5))
    chongzhi:setButtonImage("batch_ui/teshuanniu.png")
    zb_panel_bg:appendComponent(chongzhi)
    chongzhi:setPositionInContainer(cc.p(180,377.5))
    table_zouzang_buzu_pop["chongzhi"] = chongzhi

    local chong = fc.FExtensionsImage:create()
    chong:setImage("batch_ui/chong_uizi.png")
    chong:setSize(cc.size(32,32))
    chong:setAnchorPoint(cc.p(0.5,0.5))
    chongzhi:appendComponent(chong)
    chong:setPositionInContainer(cc.p(42,26))
    table_zouzang_buzu_pop["chong"] = chong

    local zhi = fc.FExtensionsImage:create()
    zhi:setImage("batch_ui/zhi_uizi.png")
    zhi:setSize(cc.size(32,32))
    zhi:setAnchorPoint(cc.p(0.5,0.5))
    chongzhi:appendComponent(zhi)
    zhi:setPositionInContainer(cc.p(104,26))
    table_zouzang_buzu_pop["zhi"] = zhi

    local zb_confirm_btn = fc.FScaleButton:create()
    zb_confirm_btn:setSize(cc.size(144,53))
    zb_confirm_btn:setAnchorPoint(cc.p(0.5,0.5))
    zb_confirm_btn:setButtonImage("batch_ui/putonganniu1_up.png")
    zb_panel_bg:appendComponent(zb_confirm_btn)
    zb_confirm_btn:setPositionInContainer(cc.p(180,377.5))
    table_zouzang_buzu_pop["zb_confirm_btn"] = zb_confirm_btn

    local que_ui = fc.FShaderExtensionsImage:create(0)
    que_ui:setAnchorPoint(cc.p(0.5,0.5))
    que_ui:setImage("batch_ui/gou_uizi.png")
    que_ui:setSize(cc.size(32,32))
    zb_confirm_btn:appendComponent(que_ui)
    que_ui:setPositionInContainer(cc.p(43,26))
    table_zouzang_buzu_pop["que_ui"] = que_ui

    local ding_ui = fc.FShaderExtensionsImage:create(0)
    ding_ui:setAnchorPoint(cc.p(0.5,0.5))
    ding_ui:setImage("batch_ui/mai_uizi.png")
    ding_ui:setSize(cc.size(32,32))
    zb_confirm_btn:appendComponent(ding_ui)
    ding_ui:setPositionInContainer(cc.p(101,26))
    table_zouzang_buzu_pop["ding_ui"] = ding_ui

    return table_zouzang_buzu_pop

end

