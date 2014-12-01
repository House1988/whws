function createhougong_tishi()

    local table_hougong_tishi = {}

    local hougong_tishi = fc.FContainerPanel:create()
    hougong_tishi:setSize(cc.size(960,640))
    table_hougong_tishi["hougong_tishi"] = hougong_tishi

    local hg_tishi_bottom_panel = fc.FContainerPanel:create()
    hg_tishi_bottom_panel:setSize(cc.size(534,354))
    hg_tishi_bottom_panel:setAnchorPoint(cc.p(0.5,0.5))
    hougong_tishi:appendComponent(hg_tishi_bottom_panel)
    hg_tishi_bottom_panel:setPositionInContainer(cc.p(480,317.5))
    table_hougong_tishi["hg_tishi_bottom_panel"] = hg_tishi_bottom_panel

    local hg_wen_la = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shengzhi_ditu.png",cc.rect(40,63,4,4))
    hg_wen_la:setSize(cc.size(412,290))
    hg_wen_la:setAnchorPoint(cc.p(0.5,0.5))
    hg_tishi_bottom_panel:appendComponent(hg_wen_la)
    hg_wen_la:setPositionInContainer(cc.p(267,181))
    table_hougong_tishi["hg_wen_la"] = hg_wen_la

    local hg_zhou_u = fc.FExtensionsImage:create()
    hg_zhou_u:setImage("nobatch/shengzhi_zhou.png")
    hg_zhou_u:setSize(cc.size(52,534))
    hg_zhou_u:setRotation(90)
    hg_zhou_u:setAnchorPoint(cc.p(0.5,0.5))
    hg_tishi_bottom_panel:appendComponent(hg_zhou_u)
    hg_zhou_u:setPositionInContainer(cc.p(267,26))
    table_hougong_tishi["hg_zhou_u"] = hg_zhou_u

    local hg_zhou_d = fc.FExtensionsImage:create()
    hg_zhou_d:setImage("nobatch/shengzhi_zhou.png")
    hg_zhou_d:setSize(cc.size(52,534))
    hg_zhou_d:setRotation(90)
    hg_zhou_d:setAnchorPoint(cc.p(0.5,0.5))
    hg_tishi_bottom_panel:appendComponent(hg_zhou_d)
    hg_zhou_d:setPositionInContainer(cc.p(267,329))
    table_hougong_tishi["hg_zhou_d"] = hg_zhou_d

    local hg_tishi_close_button = fc.FScaleButton:create()
    hg_tishi_close_button:setSize(cc.size(35,35))
    hg_tishi_close_button:setAnchorPoint(cc.p(0.5,0.5))
    hg_tishi_close_button:setButtonImage("batch_ui/guanbi_anniu2.png")
    hg_tishi_bottom_panel:appendComponent(hg_tishi_close_button)
    hg_tishi_close_button:setPositionInContainer(cc.p(493.5,25.5))
    table_hougong_tishi["hg_tishi_close_button"] = hg_tishi_close_button

    local hg_ui_rect111 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongditu2_huodong.png",cc.rect(1,1,1,1))
    hg_ui_rect111:setSize(cc.size(384,251))
    hg_ui_rect111:setAnchorPoint(cc.p(0.5,0.5))
    hg_tishi_bottom_panel:appendComponent(hg_ui_rect111)
    hg_ui_rect111:setPositionInContainer(cc.p(267,177.5))
    table_hougong_tishi["hg_ui_rect111"] = hg_ui_rect111

    local hg_ditu1 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongbiankuang2_ciguan.png",cc.rect(44,15,1,1))
    hg_ditu1:setSize(cc.size(384,251))
    hg_ditu1:setAnchorPoint(cc.p(0.5,0.5))
    hg_tishi_bottom_panel:appendComponent(hg_ditu1)
    hg_ditu1:setPositionInContainer(cc.p(267,177.5))
    table_hougong_tishi["hg_ditu1"] = hg_ditu1

    local hg_ditu2 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongditu_huodong.png",cc.rect(3,3,2,2))
    hg_ditu2:setSize(cc.size(380,100))
    hg_ditu2:setAnchorPoint(cc.p(0.5,0.5))
    hg_tishi_bottom_panel:appendComponent(hg_ditu2)
    hg_ditu2:setPositionInContainer(cc.p(267,181))
    table_hougong_tishi["hg_ditu2"] = hg_ditu2

    local hg_tishi_word_label = fc.FLabel:createBMFont()
    hg_tishi_word_label:setSize(cc.size(250,80))
    hg_tishi_word_label:setWidth(260)
    hg_tishi_word_label:setAnchorPoint(cc.p(0.5,0.5))
    hg_tishi_word_label:setFontSize(20)
    if LANGUAGE_TYPE == 3 then
    	hg_tishi_word_label:setString("3星級以上卡牌較為稀有，確定要犧牲掉嗎？")    
    else
  	    hg_tishi_word_label:setString("3星级以上卡牌较为稀有，确定要牺牲掉吗？")
    end
    hg_tishi_word_label:setColor(cc.c3b(106,68,19))
    hg_tishi_bottom_panel:appendComponent(hg_tishi_word_label)
    hg_tishi_word_label:setPositionInContainer(cc.p(267,94))
    table_hougong_tishi["hg_tishi_word_label"] = hg_tishi_word_label

    local hg_tishi_check_box = fc.FCheckBox:create()
    hg_tishi_check_box:setCheckBoxImage("batch_ui/xuanzhong_meinv.png","batch_ui/xuanzhong_meinv.png","batch_ui/xuanzhong_meinv.png","batch_ui/xuanzhonggou.png","batch_ui/xuanzhonggou.png")
    hg_tishi_check_box:setSize(cc.size(51,51))
    hg_tishi_check_box:setAnchorPoint(cc.p(0.5,0.5))
    hg_tishi_bottom_panel:appendComponent(hg_tishi_check_box)
    hg_tishi_check_box:setPositionInContainer(cc.p(171.5,177.5))
    table_hougong_tishi["hg_tishi_check_box"] = hg_tishi_check_box

    local hg_tishi_label2 = fc.FLabel:createBMFont()
    hg_tishi_label2:setSize(cc.size(180,30))
    hg_tishi_label2:setAnchorPoint(cc.p(0.5,0.5))
    hg_tishi_label2:setFontSize(20)
    if LANGUAGE_TYPE == 3 then
    	hg_tishi_label2:setString("本次登陸不再提示")
    else
    	hg_tishi_label2:setString("本次登陆不再提示")
    end
    hg_tishi_label2:setColor(cc.c3b(91,24,6))
    hg_tishi_bottom_panel:appendComponent(hg_tishi_label2)
    hg_tishi_label2:setPositionInContainer(cc.p(298,175))
    table_hougong_tishi["hg_tishi_label2"] = hg_tishi_label2

    local hg_tishi_queding_button = fc.FScaleButton:create()
    hg_tishi_queding_button:setSize(cc.size(144,53))
    hg_tishi_queding_button:setAnchorPoint(cc.p(0.5,0.5))
    hg_tishi_queding_button:setButtonImage("batch_ui/putonganniu1_up.png")
    hg_tishi_bottom_panel:appendComponent(hg_tishi_queding_button)
    hg_tishi_queding_button:setPositionInContainer(cc.p(170,267.5))
    table_hougong_tishi["hg_tishi_queding_button"] = hg_tishi_queding_button

    local hg_que_ui = fc.FShaderExtensionsImage:create(0)
    hg_que_ui:setAnchorPoint(cc.p(0.5,0.5))
    hg_que_ui:setImage("batch_ui/que_uizi.png")
    hg_que_ui:setSize(cc.size(32,32))
    hg_tishi_queding_button:appendComponent(hg_que_ui)
    hg_que_ui:setPositionInContainer(cc.p(41,26))
    table_hougong_tishi["hg_que_ui"] = hg_que_ui

    local hg_ding_ui = fc.FShaderExtensionsImage:create(0)
    hg_ding_ui:setAnchorPoint(cc.p(0.5,0.5))
    hg_ding_ui:setImage("batch_ui/ding_uizi.png")
    hg_ding_ui:setSize(cc.size(32,32))
    hg_tishi_queding_button:appendComponent(hg_ding_ui)
    hg_ding_ui:setPositionInContainer(cc.p(100,26))
    table_hougong_tishi["hg_ding_ui"] = hg_ding_ui

    local hg_tishi_quxiao_button = fc.FScaleButton:create()
    hg_tishi_quxiao_button:setSize(cc.size(144,53))
    hg_tishi_quxiao_button:setAnchorPoint(cc.p(0.5,0.5))
    hg_tishi_quxiao_button:setButtonImage("batch_ui/putonganniu1_up.png")
    hg_tishi_bottom_panel:appendComponent(hg_tishi_quxiao_button)
    hg_tishi_quxiao_button:setPositionInContainer(cc.p(364,267.5))
    table_hougong_tishi["hg_tishi_quxiao_button"] = hg_tishi_quxiao_button

    local hg_qu_ui = fc.FShaderExtensionsImage:create(0)
    hg_qu_ui:setAnchorPoint(cc.p(0.5,0.5))
    hg_qu_ui:setImage("batch_ui/qu_uizi.png")
    hg_qu_ui:setSize(cc.size(32,32))
    hg_tishi_quxiao_button:appendComponent(hg_qu_ui)
    hg_qu_ui:setPositionInContainer(cc.p(42,26))
    table_hougong_tishi["hg_qu_ui"] = hg_qu_ui

    local hg_xiao_ui = fc.FShaderExtensionsImage:create(0)
    hg_xiao_ui:setAnchorPoint(cc.p(0.5,0.5))
    hg_xiao_ui:setImage("batch_ui/xiao_uizi.png")
    hg_xiao_ui:setSize(cc.size(32,32))
    hg_tishi_quxiao_button:appendComponent(hg_xiao_ui)
    hg_xiao_ui:setPositionInContainer(cc.p(100,26))
    table_hougong_tishi["hg_xiao_ui"] = hg_xiao_ui

    local hg_tishi_bg_title = fc.FScale9Image:createWithBatchUIFrame("batch_ui/xingjikuang_tangquanxinggong.png",cc.rect(72,17,2,2))
    hg_tishi_bg_title:setSize(cc.size(260,50))
    hg_tishi_bg_title:setAnchorPoint(cc.p(0.5,0.5))
    hg_tishi_bg_title:setScaleY(-1)
    hg_tishi_bottom_panel:appendComponent(hg_tishi_bg_title)
    hg_tishi_bg_title:setPositionInContainer(cc.p(267,25))
    table_hougong_tishi["hg_tishi_bg_title"] = hg_tishi_bg_title

    local hg_ti_ui = fc.FExtensionsImage:create()
    hg_ti_ui:setImage("batch_ui/ti2_uizi.png")
    hg_ti_ui:setSize(cc.size(32,32))
    hg_ti_ui:setAnchorPoint(cc.p(0.5,0.5))
    hg_tishi_bottom_panel:appendComponent(hg_ti_ui)
    hg_ti_ui:setPositionInContainer(cc.p(224,24))
    table_hougong_tishi["hg_ti_ui"] = hg_ti_ui

    local hg_shi_ui = fc.FExtensionsImage:create()
    hg_shi_ui:setImage("batch_ui/shi4_uizi.png")
    hg_shi_ui:setSize(cc.size(32,32))
    hg_shi_ui:setAnchorPoint(cc.p(0.5,0.5))
    hg_tishi_bottom_panel:appendComponent(hg_shi_ui)
    hg_shi_ui:setPositionInContainer(cc.p(296,24))
    table_hougong_tishi["hg_shi_ui"] = hg_shi_ui

    return table_hougong_tishi

end

