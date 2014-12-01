function createtujian_ui()

    local table_tujian_ui = {}

    local tujian_ui = fc.FContainerPanel:create()
    tujian_ui:setSize(cc.size(960,640))
    table_tujian_ui["tujian_ui"] = tujian_ui

    local tj_bg_image = fc.FScale9Image:createWithBatchUIFrame("batch_ui/ditu_lan.png",cc.rect(2,2,2,2))
    tj_bg_image:setSize(cc.size(960,640))
    tj_bg_image:setAnchorPoint(cc.p(0.5,0.5))
    tujian_ui:appendComponent(tj_bg_image)
    tj_bg_image:setPositionInContainer(cc.p(480,320))
    table_tujian_ui["tj_bg_image"] = tj_bg_image

    local tj_biaoti_image2 = fc.FExtensionsImage:create()
    tj_biaoti_image2:setImage("nobatch/title_mingchen_.png")
    tj_biaoti_image2:setSize(cc.size(483,67))
    tj_biaoti_image2:setFlipType(2)
    tj_biaoti_image2:setAnchorPoint(cc.p(0.5,0.5))
    tujian_ui:appendComponent(tj_biaoti_image2)
    tj_biaoti_image2:setPositionInContainer(cc.p(718.5,33.5))
    table_tujian_ui["tj_biaoti_image2"] = tj_biaoti_image2

    local tj_biaoti_image = fc.FExtensionsImage:create()
    tj_biaoti_image:setImage("nobatch/title_mingchen_.png")
    tj_biaoti_image:setSize(cc.size(483,67))
    tj_biaoti_image:setAnchorPoint(cc.p(0.5,0.5))
    tujian_ui:appendComponent(tj_biaoti_image)
    tj_biaoti_image:setPositionInContainer(cc.p(241.5,33.5))
    table_tujian_ui["tj_biaoti_image"] = tj_biaoti_image

    local wen_l = fc.FExtensionsImage:create()
    wen_l:setImage("nobatch/banzidikuang_tongyong.png")
    wen_l:setSize(cc.size(220,163))
    wen_l:setAnchorPoint(cc.p(0.5,0.5))
    tujian_ui:appendComponent(wen_l)
    wen_l:setPositionInContainer(cc.p(110,148.5))
    table_tujian_ui["wen_l"] = wen_l

    local wen_r = fc.FExtensionsImage:create()
    wen_r:setImage("nobatch/banzidikuang_tongyong.png")
    wen_r:setSize(cc.size(220,163))
    wen_r:setFlipType(2)
    wen_r:setAnchorPoint(cc.p(0.5,0.5))
    tujian_ui:appendComponent(wen_r)
    wen_r:setPositionInContainer(cc.p(850,148.5))
    table_tujian_ui["wen_r"] = wen_r

    local tj_card_title_bg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/xingjikuang_paibingbuzhen.png",cc.rect(72,0,2,42))
    tj_card_title_bg:setSize(cc.size(886,42))
    tj_card_title_bg:setAnchorPoint(cc.p(0.5,0.5))
    tujian_ui:appendComponent(tj_card_title_bg)
    tj_card_title_bg:setPositionInContainer(cc.p(477,88))
    table_tujian_ui["tj_card_title_bg"] = tj_card_title_bg

    local lian_left = fc.FExtensionsImage:create()
    lian_left:setImage("batch_ui/title_mingchen_2.png")
    lian_left:setSize(cc.size(62,121))
    lian_left:setAnchorPoint(cc.p(0.5,0.5))
    tujian_ui:appendComponent(lian_left)
    lian_left:setPositionInContainer(cc.p(31,60.5))
    table_tujian_ui["lian_left"] = lian_left

    local lian_right = fc.FExtensionsImage:create()
    lian_right:setImage("batch_ui/title_mingchen_2.png")
    lian_right:setSize(cc.size(62,121))
    lian_right:setFlipType(2)
    lian_right:setAnchorPoint(cc.p(0.5,0.5))
    tujian_ui:appendComponent(lian_right)
    lian_right:setPositionInContainer(cc.p(929,60.5))
    table_tujian_ui["lian_right"] = lian_right

    local wen_lb = fc.FExtensionsImage:create()
    wen_lb:setImage("nobatch/banzidikuang_tongyong.png")
    wen_lb:setSize(cc.size(220,163))
    wen_lb:setFlipType(4)
    wen_lb:setAnchorPoint(cc.p(0.5,0.5))
    tujian_ui:appendComponent(wen_lb)
    wen_lb:setPositionInContainer(cc.p(110,558.5))
    table_tujian_ui["wen_lb"] = wen_lb

    local wen_rb = fc.FExtensionsImage:create()
    wen_rb:setImage("nobatch/banzidikuang_tongyong.png")
    wen_rb:setSize(cc.size(220,163))
    wen_rb:setFlipType(8)
    wen_rb:setAnchorPoint(cc.p(0.5,0.5))
    tujian_ui:appendComponent(wen_rb)
    wen_rb:setPositionInContainer(cc.p(850,558.5))
    table_tujian_ui["wen_rb"] = wen_rb

    local tj_table_bg2 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongditu2_ciguan.png",cc.rect(2,2,4,4))
    tj_table_bg2:setSize(cc.size(886,506))
    tj_table_bg2:setAnchorPoint(cc.p(0.5,0.5))
    tujian_ui:appendComponent(tj_table_bg2)
    tj_table_bg2:setPositionInContainer(cc.p(480,363))
    table_tujian_ui["tj_table_bg2"] = tj_table_bg2

    local tj_table_bg3 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongditu_huodong.png",cc.rect(2,2,4,4))
    tj_table_bg3:setSize(cc.size(840,506))
    tj_table_bg3:setAnchorPoint(cc.p(0.5,0.5))
    tujian_ui:appendComponent(tj_table_bg3)
    tj_table_bg3:setPositionInContainer(cc.p(480,363))
    table_tujian_ui["tj_table_bg3"] = tj_table_bg3

    local tj_table_bg1 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongbiankuang2_ciguan.png",cc.rect(43,15,2,2))
    tj_table_bg1:setSize(cc.size(886,506))
    tj_table_bg1:setAnchorPoint(cc.p(0.5,0.5))
    tujian_ui:appendComponent(tj_table_bg1)
    tj_table_bg1:setPositionInContainer(cc.p(480,363))
    table_tujian_ui["tj_table_bg1"] = tj_table_bg1

    local tj_jindu_lbl = fc.FLabel:createBMFont()
    tj_jindu_lbl:setSize(cc.size(146,25))
    tj_jindu_lbl:setAnchorPoint(cc.p(0.5,0.5))
    tj_jindu_lbl:setFontSize(21)
    if LANGUAGE_TYPE == 3 then
	    tj_jindu_lbl:setString("名臣收集進度")    
    else
    	tj_jindu_lbl:setString("名臣收集进度")
    end
    tj_jindu_lbl:setColor(cc.c3b(0,255,255))
    tujian_ui:appendComponent(tj_jindu_lbl)
    tj_jindu_lbl:setPositionInContainer(cc.p(378,82.5))
    table_tujian_ui["tj_jindu_lbl"] = tj_jindu_lbl

    local tj_card_count_lbl = fc.FLabel:createBMFont()
    tj_card_count_lbl:setSize(cc.size(111,25))
    tj_card_count_lbl:setAnchorPoint(cc.p(0.5,0.5))
    tj_card_count_lbl:setFontSize(21)
    tj_card_count_lbl:setString("50/100")
    tj_card_count_lbl:setColor(cc.c3b(0,255,255))
    tujian_ui:appendComponent(tj_card_count_lbl)
    tj_card_count_lbl:setPositionInContainer(cc.p(550.5,82.5))
    table_tujian_ui["tj_card_count_lbl"] = tj_card_count_lbl

    local stoptouch_panel = fc.FContainerPanel:create()
    stoptouch_panel:setSize(cc.size(960,109))
    stoptouch_panel:setAnchorPoint(cc.p(0.5,0.5))
    tujian_ui:appendComponent(stoptouch_panel)
    stoptouch_panel:setPositionInContainer(cc.p(480,54.5))
   	stoptouch_panel:setStopTouchEvent(true)
    table_tujian_ui["stoptouch_panel"] = stoptouch_panel

    local tj_close_button = fc.FScaleButton:create()
    tj_close_button:setSize(cc.size(52,52))
    tj_close_button:setAnchorPoint(cc.p(0.5,0.5))
    tj_close_button:setButtonImage("batch_ui/guanbi_up.png")
    tujian_ui:appendComponent(tj_close_button)
    tj_close_button:setPositionInContainer(cc.p(931,33))
    table_tujian_ui["tj_close_button"] = tj_close_button

    local tj_junxieku = fc.FContainerPanel:create()
    tj_junxieku:setSize(cc.size(159,45))
    tj_junxieku:setAnchorPoint(cc.p(0.5,0.5))
    tujian_ui:appendComponent(tj_junxieku)
    tj_junxieku:setPositionInContainer(cc.p(493.5,36.5))
    table_tujian_ui["tj_junxieku"] = tj_junxieku

    local tj_junxieku_btn = fc.FRadioButton:create()
    tj_junxieku_btn:setRadioButtonImage("batch_ui/qieyeanniu_down1.png","batch_ui/qieyeanniu_up1.png")
    tj_junxieku_btn:setSize(cc.size(159,45))
    tj_junxieku_btn:setAnchorPoint(cc.p(0.5,0.5))
    tj_junxieku:appendComponent(tj_junxieku_btn)
    tj_junxieku_btn:setPositionInContainer(cc.p(79.5,22.5))
    table_tujian_ui["tj_junxieku_btn"] = tj_junxieku_btn

    local tj_xie = fc.FExtensionsImage:create()
    tj_xie:setImage("batch_ui/xie_uizi (2).png")
    tj_xie:setSize(cc.size(32,32))
    tj_xie:setAnchorPoint(cc.p(0.5,0.5))
    tj_junxieku:appendComponent(tj_xie)
    tj_xie:setPositionInContainer(cc.p(80,22))
    table_tujian_ui["tj_xie"] = tj_xie

    local tj_jun = fc.FExtensionsImage:create()
    tj_jun:setImage("batch_ui/jun_uizi.png")
    tj_jun:setSize(cc.size(32,32))
    tj_jun:setAnchorPoint(cc.p(0.5,0.5))
    tj_junxieku:appendComponent(tj_jun)
    tj_jun:setPositionInContainer(cc.p(48,22))
    table_tujian_ui["tj_jun"] = tj_jun

    local tj_ku = fc.FExtensionsImage:create()
    tj_ku:setImage("batch_ui/ku_uizi.png")
    tj_ku:setSize(cc.size(32,32))
    tj_ku:setAnchorPoint(cc.p(0.5,0.5))
    tj_junxieku:appendComponent(tj_ku)
    tj_ku:setPositionInContainer(cc.p(112,22))
    table_tujian_ui["tj_ku"] = tj_ku

    local tj_wenyuange = fc.FContainerPanel:create()
    tj_wenyuange:setSize(cc.size(159,45))
    tj_wenyuange:setAnchorPoint(cc.p(0.5,0.5))
    tujian_ui:appendComponent(tj_wenyuange)
    tj_wenyuange:setPositionInContainer(cc.p(662.5,36.5))
    table_tujian_ui["tj_wenyuange"] = tj_wenyuange

    local tj_wenyuange_btn = fc.FRadioButton:create()
    tj_wenyuange_btn:setRadioButtonImage("batch_ui/qieyeanniu_down1.png","batch_ui/qieyeanniu_up1.png")
    tj_wenyuange_btn:setSize(cc.size(159,45))
    tj_wenyuange_btn:setAnchorPoint(cc.p(0.5,0.5))
    tj_wenyuange:appendComponent(tj_wenyuange_btn)
    tj_wenyuange_btn:setPositionInContainer(cc.p(79.5,22.5))
    table_tujian_ui["tj_wenyuange_btn"] = tj_wenyuange_btn

    local tj_yuan = fc.FExtensionsImage:create()
    tj_yuan:setImage("batch_ui/yuan_uizi (2).png")
    tj_yuan:setSize(cc.size(32,32))
    tj_yuan:setAnchorPoint(cc.p(0.5,0.5))
    tj_wenyuange:appendComponent(tj_yuan)
    tj_yuan:setPositionInContainer(cc.p(80,22))
    table_tujian_ui["tj_yuan"] = tj_yuan

    local tj_wen = fc.FExtensionsImage:create()
    tj_wen:setImage("batch_ui/wen_uizi.png")
    tj_wen:setSize(cc.size(32,32))
    tj_wen:setAnchorPoint(cc.p(0.5,0.5))
    tj_wenyuange:appendComponent(tj_wen)
    tj_wen:setPositionInContainer(cc.p(48,22))
    table_tujian_ui["tj_wen"] = tj_wen

    local tj_ge2 = fc.FExtensionsImage:create()
    tj_ge2:setImage("batch_ui/ge1_uizi.png")
    tj_ge2:setSize(cc.size(32,32))
    tj_ge2:setAnchorPoint(cc.p(0.5,0.5))
    tj_wenyuange:appendComponent(tj_ge2)
    tj_ge2:setPositionInContainer(cc.p(112,22))
    table_tujian_ui["tj_ge2"] = tj_ge2

    local tj_lingyange = fc.FContainerPanel:create()
    tj_lingyange:setSize(cc.size(159,45))
    tj_lingyange:setAnchorPoint(cc.p(0.5,0.5))
    tujian_ui:appendComponent(tj_lingyange)
    tj_lingyange:setPositionInContainer(cc.p(155.5,36.5))
    table_tujian_ui["tj_lingyange"] = tj_lingyange

    local tj_lingyange_btn = fc.FRadioButton:create()
    tj_lingyange_btn:setRadioButtonImage("batch_ui/qieyeanniu_down1.png","batch_ui/qieyeanniu_up1.png")
    tj_lingyange_btn:setSize(cc.size(159,45))
    tj_lingyange_btn:setAnchorPoint(cc.p(0.5,0.5))
    tj_lingyange:appendComponent(tj_lingyange_btn)
    tj_lingyange_btn:setPositionInContainer(cc.p(79.5,22.5))
    table_tujian_ui["tj_lingyange_btn"] = tj_lingyange_btn

    local tj_yan = fc.FExtensionsImage:create()
    tj_yan:setImage("batch_ui/yan_uizi (2).png")
    tj_yan:setSize(cc.size(32,32))
    tj_yan:setAnchorPoint(cc.p(0.5,0.5))
    tj_lingyange:appendComponent(tj_yan)
    tj_yan:setPositionInContainer(cc.p(80,22))
    table_tujian_ui["tj_yan"] = tj_yan

    local tj_ling = fc.FExtensionsImage:create()
    tj_ling:setImage("batch_ui/ling_uizi (2).png")
    tj_ling:setSize(cc.size(32,32))
    tj_ling:setAnchorPoint(cc.p(0.5,0.5))
    tj_lingyange:appendComponent(tj_ling)
    tj_ling:setPositionInContainer(cc.p(48,22))
    table_tujian_ui["tj_ling"] = tj_ling

    local tj_ge1 = fc.FExtensionsImage:create()
    tj_ge1:setImage("batch_ui/ge1_uizi.png")
    tj_ge1:setSize(cc.size(32,32))
    tj_ge1:setAnchorPoint(cc.p(0.5,0.5))
    tj_lingyange:appendComponent(tj_ge1)
    tj_ge1:setPositionInContainer(cc.p(112,22))
    table_tujian_ui["tj_ge1"] = tj_ge1

    local tj_tonguquetai = fc.FContainerPanel:create()
    tj_tonguquetai:setSize(cc.size(159,45))
    tj_tonguquetai:setAnchorPoint(cc.p(0.5,0.5))
    tujian_ui:appendComponent(tj_tonguquetai)
    tj_tonguquetai:setPositionInContainer(cc.p(324.5,36.5))
    table_tujian_ui["tj_tonguquetai"] = tj_tonguquetai

    local tj_tongquetai_btn = fc.FRadioButton:create()
    tj_tongquetai_btn:setRadioButtonImage("batch_ui/qieyeanniu_down1.png","batch_ui/qieyeanniu_up1.png")
    tj_tongquetai_btn:setSize(cc.size(159,45))
    tj_tongquetai_btn:setAnchorPoint(cc.p(0.5,0.5))
    tj_tonguquetai:appendComponent(tj_tongquetai_btn)
    tj_tongquetai_btn:setPositionInContainer(cc.p(79.5,22.5))
    table_tujian_ui["tj_tongquetai_btn"] = tj_tongquetai_btn

    local tj_que = fc.FExtensionsImage:create()
    tj_que:setImage("batch_ui/que_uizi (2).png")
    tj_que:setSize(cc.size(32,32))
    tj_que:setAnchorPoint(cc.p(0.5,0.5))
    tj_tonguquetai:appendComponent(tj_que)
    tj_que:setPositionInContainer(cc.p(80,22))
    table_tujian_ui["tj_que"] = tj_que

    local tj_tong = fc.FExtensionsImage:create()
    tj_tong:setImage("batch_ui/tong_uizi (2).png")
    tj_tong:setSize(cc.size(32,32))
    tj_tong:setAnchorPoint(cc.p(0.5,0.5))
    tj_tonguquetai:appendComponent(tj_tong)
    tj_tong:setPositionInContainer(cc.p(48,22))
    table_tujian_ui["tj_tong"] = tj_tong

    local tj_tai = fc.FExtensionsImage:create()
    tj_tai:setImage("batch_ui/tai_uizi (2).png")
    tj_tai:setSize(cc.size(32,32))
    tj_tai:setAnchorPoint(cc.p(0.5,0.5))
    tj_tonguquetai:appendComponent(tj_tai)
    tj_tai:setPositionInContainer(cc.p(112,22))
    table_tujian_ui["tj_tai"] = tj_tai

    return table_tujian_ui

end

