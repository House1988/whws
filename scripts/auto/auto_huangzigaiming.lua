function createhuangzigaiming()

    local table_huangzigaiming = {}

    local huangzigaiming = fc.FContainerPanel:create()
    huangzigaiming:setSize(cc.size(960,640))
    table_huangzigaiming["huangzigaiming"] = huangzigaiming

    local huangzigaiming_bottom = fc.FContainerPanel:create()
    huangzigaiming_bottom:setSize(cc.size(534,354))
    huangzigaiming_bottom:setAnchorPoint(cc.p(0.5,0.5))
    huangzigaiming:appendComponent(huangzigaiming_bottom)
    huangzigaiming_bottom:setPositionInContainer(cc.p(480,315))
    table_huangzigaiming["huangzigaiming_bottom"] = huangzigaiming_bottom

    local wen_la = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shengzhi_ditu.png",cc.rect(40,63,4,4))
    wen_la:setSize(cc.size(412,293))
    wen_la:setAnchorPoint(cc.p(0.5,0.5))
    huangzigaiming_bottom:appendComponent(wen_la)
    wen_la:setPositionInContainer(cc.p(267,176.5))
    table_huangzigaiming["wen_la"] = wen_la

    local zhou_u = fc.FExtensionsImage:create()
    zhou_u:setImage("nobatch/shengzhi_zhou.png")
    zhou_u:setSize(cc.size(52,534))
    zhou_u:setRotation(90)
    zhou_u:setAnchorPoint(cc.p(0.5,0.5))
    huangzigaiming_bottom:appendComponent(zhou_u)
    zhou_u:setPositionInContainer(cc.p(267,26))
    table_huangzigaiming["zhou_u"] = zhou_u

    local zhou_d = fc.FExtensionsImage:create()
    zhou_d:setImage("nobatch/shengzhi_zhou.png")
    zhou_d:setSize(cc.size(52,534))
    zhou_d:setRotation(90)
    zhou_d:setAnchorPoint(cc.p(0.5,0.5))
    huangzigaiming_bottom:appendComponent(zhou_d)
    zhou_d:setPositionInContainer(cc.p(267,328))
    table_huangzigaiming["zhou_d"] = zhou_d

    local dikuang_rect3 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongditu2_huodong.png",cc.rect(1,1,1,1))
    dikuang_rect3:setSize(cc.size(384,251))
    dikuang_rect3:setAnchorPoint(cc.p(0.5,0.5))
    huangzigaiming_bottom:appendComponent(dikuang_rect3)
    dikuang_rect3:setPositionInContainer(cc.p(267,176.5))
    table_huangzigaiming["dikuang_rect3"] = dikuang_rect3

    local dikuang_rect1 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongbiankuang2_ciguan.png",cc.rect(44,15,1,1))
    dikuang_rect1:setSize(cc.size(384,251))
    dikuang_rect1:setAnchorPoint(cc.p(0.5,0.5))
    huangzigaiming_bottom:appendComponent(dikuang_rect1)
    dikuang_rect1:setPositionInContainer(cc.p(267,176.5))
    table_huangzigaiming["dikuang_rect1"] = dikuang_rect1

    local dikuang_rect2 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongditu_huodong.png",cc.rect(3,3,2,2))
    dikuang_rect2:setSize(cc.size(380,80))
    dikuang_rect2:setAnchorPoint(cc.p(0.5,0.5))
    huangzigaiming_bottom:appendComponent(dikuang_rect2)
    dikuang_rect2:setPositionInContainer(cc.p(267,197))
    table_huangzigaiming["dikuang_rect2"] = dikuang_rect2

    local hzgm_tiwen_label = fc.FLabel:createBMFont()
    hzgm_tiwen_label:setSize(cc.size(290,32))
    hzgm_tiwen_label:setWidth(290)
    hzgm_tiwen_label:setAnchorPoint(cc.p(0.5,0.5))
    hzgm_tiwen_label:setFontSize(20)
    if LANGUAGE_TYPE == 3 then
    	hzgm_tiwen_label:setString("皇上想給阿哥改個什麼名呢？")
    else
    	hzgm_tiwen_label:setString("皇上想给阿哥改个什么名呢？")
    end
    
    hzgm_tiwen_label:setColor(cc.c3b(91,24,6))
    huangzigaiming_bottom:appendComponent(hzgm_tiwen_label)
    hzgm_tiwen_label:setPositionInContainer(cc.p(267,108))
    table_huangzigaiming["hzgm_tiwen_label"] = hzgm_tiwen_label

    local hzgm_input_image = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shuruwenzi.png",cc.rect(11,9,47,7))
    hzgm_input_image:setSize(cc.size(216,48))
    hzgm_input_image:setAnchorPoint(cc.p(0.5,0.5))
    huangzigaiming_bottom:appendComponent(hzgm_input_image)
    hzgm_input_image:setPositionInContainer(cc.p(258,194))
    table_huangzigaiming["hzgm_input_image"] = hzgm_input_image

    local hzgm_input = fc.FInput:create()
    hzgm_input:setSizeAndBackgroundImage(cc.size(196,46),"","","",false)
    hzgm_input:setAnchorPoint(cc.p(0.5,0.5))
    hzgm_input:setTouchEnabled(true)
    hzgm_input:setFontSize(20)
    huangzigaiming_bottom:appendComponent(hzgm_input)
    hzgm_input:setPositionInContainer(cc.p(257,190))
    table_huangzigaiming["hzgm_input"] = hzgm_input

    local hzgm_queding_button = fc.FScaleButton:create()
    hzgm_queding_button:setSize(cc.size(144,53))
    hzgm_queding_button:setAnchorPoint(cc.p(0.5,0.5))
    hzgm_queding_button:setButtonImage("batch_ui/putonganniu1_up.png")
    huangzigaiming_bottom:appendComponent(hzgm_queding_button)
    hzgm_queding_button:setPositionInContainer(cc.p(358,265.5))
    table_huangzigaiming["hzgm_queding_button"] = hzgm_queding_button

    local hzgm_que_ui = fc.FExtensionsImage:create()
    hzgm_que_ui:setImage("batch_ui/que_uizi.png")
    hzgm_que_ui:setSize(cc.size(32,32))
    hzgm_que_ui:setAnchorPoint(cc.p(0.5,0.5))
    hzgm_queding_button:appendComponent(hzgm_que_ui)
    hzgm_que_ui:setPositionInContainer(cc.p(42,26))
    table_huangzigaiming["hzgm_que_ui"] = hzgm_que_ui

    local hzgm_ding_ui = fc.FExtensionsImage:create()
    hzgm_ding_ui:setImage("batch_ui/ding_uizi.png")
    hzgm_ding_ui:setSize(cc.size(32,32))
    hzgm_ding_ui:setAnchorPoint(cc.p(0.5,0.5))
    hzgm_queding_button:appendComponent(hzgm_ding_ui)
    hzgm_ding_ui:setPositionInContainer(cc.p(100,26))
    table_huangzigaiming["hzgm_ding_ui"] = hzgm_ding_ui

    local hzgm_close_button = fc.FScaleButton:create()
    hzgm_close_button:setSize(cc.size(144,53))
    hzgm_close_button:setAnchorPoint(cc.p(0.5,0.5))
    hzgm_close_button:setButtonImage("batch_ui/putonganniu1_up.png")
    huangzigaiming_bottom:appendComponent(hzgm_close_button)
    hzgm_close_button:setPositionInContainer(cc.p(194,265.5))
    table_huangzigaiming["hzgm_close_button"] = hzgm_close_button

    local hzgm_guan_ui = fc.FExtensionsImage:create()
    hzgm_guan_ui:setImage("batch_ui/guan_uizi.png")
    hzgm_guan_ui:setSize(cc.size(32,32))
    hzgm_guan_ui:setAnchorPoint(cc.p(0.5,0.5))
    hzgm_close_button:appendComponent(hzgm_guan_ui)
    hzgm_guan_ui:setPositionInContainer(cc.p(44,26))
    table_huangzigaiming["hzgm_guan_ui"] = hzgm_guan_ui

    local hzgm_bi_ui = fc.FExtensionsImage:create()
    hzgm_bi_ui:setImage("batch_ui/bi_uizi.png")
    hzgm_bi_ui:setSize(cc.size(32,32))
    hzgm_bi_ui:setAnchorPoint(cc.p(0.5,0.5))
    hzgm_close_button:appendComponent(hzgm_bi_ui)
    hzgm_bi_ui:setPositionInContainer(cc.p(100,26))
    table_huangzigaiming["hzgm_bi_ui"] = hzgm_bi_ui

    local hzgm_title_bg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/xingjikuang_tangquanxinggong.png",cc.rect(70,0,6,42))
    hzgm_title_bg:setSize(cc.size(260,42))
    hzgm_title_bg:setAnchorPoint(cc.p(0.5,0.5))
    hzgm_title_bg:setScaleY(-1)
    huangzigaiming_bottom:appendComponent(hzgm_title_bg)
    hzgm_title_bg:setPositionInContainer(cc.p(265,27))
    table_huangzigaiming["hzgm_title_bg"] = hzgm_title_bg

    local hzgm_gai_ui = fc.FExtensionsImage:create()
    hzgm_gai_ui:setImage("batch_ui/gai_uizi.png")
    hzgm_gai_ui:setSize(cc.size(32,32))
    hzgm_gai_ui:setAnchorPoint(cc.p(0.5,0.5))
    huangzigaiming_bottom:appendComponent(hzgm_gai_ui)
    hzgm_gai_ui:setPositionInContainer(cc.p(241,26))
    table_huangzigaiming["hzgm_gai_ui"] = hzgm_gai_ui

    local hzgm_ming_ui = fc.FExtensionsImage:create()
    hzgm_ming_ui:setImage("batch_ui/ming_uizi.png")
    hzgm_ming_ui:setSize(cc.size(32,32))
    hzgm_ming_ui:setAnchorPoint(cc.p(0.5,0.5))
    huangzigaiming_bottom:appendComponent(hzgm_ming_ui)
    hzgm_ming_ui:setPositionInContainer(cc.p(293,26))
    table_huangzigaiming["hzgm_ming_ui"] = hzgm_ming_ui

    return table_huangzigaiming

end

