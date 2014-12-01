function createhougong_jiaoyu()

    local table_hougong_jiaoyu = {}

    local hougong_jiaoyu = fc.FContainerPanel:create()
    hougong_jiaoyu:setSize(cc.size(960,640))
    table_hougong_jiaoyu["hougong_jiaoyu"] = hougong_jiaoyu

    local hougong_jiaoyu_bottom = fc.FContainerPanel:create()
    hougong_jiaoyu_bottom:setSize(cc.size(534,390))
    hougong_jiaoyu_bottom:setAnchorPoint(cc.p(0.5,0.5))
    hougong_jiaoyu:appendComponent(hougong_jiaoyu_bottom)
    hougong_jiaoyu_bottom:setPositionInContainer(cc.p(480,334.5))
    table_hougong_jiaoyu["hougong_jiaoyu_bottom"] = hougong_jiaoyu_bottom

    local hgjy_wen_rb = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shengzhi_ditu.png",cc.rect(40,63,4,4))
    hgjy_wen_rb:setSize(cc.size(412,325))
    hgjy_wen_rb:setAnchorPoint(cc.p(0.5,0.5))
    hougong_jiaoyu_bottom:appendComponent(hgjy_wen_rb)
    hgjy_wen_rb:setPositionInContainer(cc.p(267,193.5))
    table_hougong_jiaoyu["hgjy_wen_rb"] = hgjy_wen_rb

    local hgjy_zhou_u = fc.FExtensionsImage:create()
    hgjy_zhou_u:setImage("nobatch/shengzhi_zhou.png")
    hgjy_zhou_u:setSize(cc.size(52,534))
    hgjy_zhou_u:setRotation(90)
    hgjy_zhou_u:setAnchorPoint(cc.p(0.5,0.5))
    hougong_jiaoyu_bottom:appendComponent(hgjy_zhou_u)
    hgjy_zhou_u:setPositionInContainer(cc.p(267,26))
    table_hougong_jiaoyu["hgjy_zhou_u"] = hgjy_zhou_u

    local hgjy_zhou_d = fc.FExtensionsImage:create()
    hgjy_zhou_d:setImage("nobatch/shengzhi_zhou.png")
    hgjy_zhou_d:setSize(cc.size(52,534))
    hgjy_zhou_d:setRotation(90)
    hgjy_zhou_d:setAnchorPoint(cc.p(0.5,0.5))
    hougong_jiaoyu_bottom:appendComponent(hgjy_zhou_d)
    hgjy_zhou_d:setPositionInContainer(cc.p(267,364))
    table_hougong_jiaoyu["hgjy_zhou_d"] = hgjy_zhou_d

    local title_bg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/xingjikuang_tangquanxinggong.png",cc.rect(72,17,2,2))
    title_bg:setSize(cc.size(260,50))
    title_bg:setAnchorPoint(cc.p(0.5,0.5))
    title_bg:setScaleY(-1)
    hougong_jiaoyu_bottom:appendComponent(title_bg)
    title_bg:setPositionInContainer(cc.p(267,25))
    table_hougong_jiaoyu["title_bg"] = title_bg

    local title_gong = fc.FExtensionsImage:create()
    title_gong:setImage("batch_ui/gong6.png")
    title_gong:setSize(cc.size(59,59))
    title_gong:setAnchorPoint(cc.p(0.5,0.5))
    hougong_jiaoyu_bottom:appendComponent(title_gong)
    title_gong:setPositionInContainer(cc.p(183.5,22.5))
    table_hougong_jiaoyu["title_gong"] = title_gong

    local title_xi = fc.FExtensionsImage:create()
    title_xi:setImage("batch_ui/xi.png")
    title_xi:setSize(cc.size(59,59))
    title_xi:setAnchorPoint(cc.p(0.5,0.5))
    hougong_jiaoyu_bottom:appendComponent(title_xi)
    title_xi:setPositionInContainer(cc.p(239.5,22.5))
    table_hougong_jiaoyu["title_xi"] = title_xi

    local title_huang = fc.FExtensionsImage:create()
    title_huang:setImage("batch_ui/huang2.png")
    title_huang:setSize(cc.size(59,59))
    title_huang:setAnchorPoint(cc.p(0.5,0.5))
    hougong_jiaoyu_bottom:appendComponent(title_huang)
    title_huang:setPositionInContainer(cc.p(295.5,22.5))
    table_hougong_jiaoyu["title_huang"] = title_huang

    local title_shang = fc.FExtensionsImage:create()
    title_shang:setImage("batch_ui/shang1.png")
    title_shang:setSize(cc.size(59,59))
    title_shang:setAnchorPoint(cc.p(0.5,0.5))
    hougong_jiaoyu_bottom:appendComponent(title_shang)
    title_shang:setPositionInContainer(cc.p(351.5,22.5))
    table_hougong_jiaoyu["title_shang"] = title_shang

    local hyyx_label_di = fc.FExtensionsImage:create()
    hyyx_label_di:setImage("batch_ui/shuruwenzi.png")
    hyyx_label_di:setSize(cc.size(60,20))
    hyyx_label_di:setAnchorPoint(cc.p(0.5,0.5))
    hougong_jiaoyu_bottom:appendComponent(hyyx_label_di)
    hyyx_label_di:setPositionInContainer(cc.p(267,223))
    table_hougong_jiaoyu["hyyx_label_di"] = hyyx_label_di

    local hgjy_rect_111 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongditu2_huodong.png",cc.rect(1,1,1,1))
    hgjy_rect_111:setSize(cc.size(384,292))
    hgjy_rect_111:setAnchorPoint(cc.p(0.5,0.5))
    hougong_jiaoyu_bottom:appendComponent(hgjy_rect_111)
    hgjy_rect_111:setPositionInContainer(cc.p(267,196))
    table_hougong_jiaoyu["hgjy_rect_111"] = hgjy_rect_111

    local hgjy_rect_222 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongbiankuang2_ciguan.png",cc.rect(44,15,1,1))
    hgjy_rect_222:setSize(cc.size(384,292))
    hgjy_rect_222:setAnchorPoint(cc.p(0.5,0.5))
    hougong_jiaoyu_bottom:appendComponent(hgjy_rect_222)
    hgjy_rect_222:setPositionInContainer(cc.p(267,195))
    table_hougong_jiaoyu["hgjy_rect_222"] = hgjy_rect_222

    local hgjy_title_label = fc.FLabel:createBMFont()
    hgjy_title_label:setSize(cc.size(120,30))
    hgjy_title_label:setAnchorPoint(cc.p(0.5,0.5))
    hgjy_title_label:setFontSize(24)
    if LANGUAGE_TYPE == 3 then
    	 hgjy_title_label:setString("娘娘獲得")
    else
    	 hgjy_title_label:setString("娘娘获得")
    end
    hgjy_title_label:setColor(cc.c3b(206,53,0))
    hougong_jiaoyu_bottom:appendComponent(hgjy_title_label)
    hgjy_title_label:setPositionInContainer(cc.p(267,72))
    table_hougong_jiaoyu["hgjy_title_label"] = hgjy_title_label

    local hgjy_queding_btn = fc.FScaleButton:create()
    hgjy_queding_btn:setSize(cc.size(144,53))
    hgjy_queding_btn:setAnchorPoint(cc.p(0.5,0.5))
    hgjy_queding_btn:setButtonImage("batch_ui/putonganniu1_up.png")
    hougong_jiaoyu_bottom:appendComponent(hgjy_queding_btn)
    hgjy_queding_btn:setPositionInContainer(cc.p(267,290.5))
    table_hougong_jiaoyu["hgjy_queding_btn"] = hgjy_queding_btn

    local hgjy_que_ui = fc.FShaderExtensionsImage:create(0)
    hgjy_que_ui:setAnchorPoint(cc.p(0.5,0.5))
    hgjy_que_ui:setImage("batch_ui/que_uizi.png")
    hgjy_que_ui:setSize(cc.size(32,32))
    hgjy_queding_btn:appendComponent(hgjy_que_ui)
    hgjy_que_ui:setPositionInContainer(cc.p(44,26))
    table_hougong_jiaoyu["hgjy_que_ui"] = hgjy_que_ui

    local hgjy_ding_ui = fc.FShaderExtensionsImage:create(0)
    hgjy_ding_ui:setAnchorPoint(cc.p(0.5,0.5))
    hgjy_ding_ui:setImage("batch_ui/ding_uizi.png")
    hgjy_ding_ui:setSize(cc.size(32,32))
    hgjy_queding_btn:appendComponent(hgjy_ding_ui)
    hgjy_ding_ui:setPositionInContainer(cc.p(97,26))
    table_hougong_jiaoyu["hgjy_ding_ui"] = hgjy_ding_ui

    local hgjy_mid_di = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongditu_huodong.png",cc.rect(3,3,2,2))
    hgjy_mid_di:setSize(cc.size(380,150))
    hgjy_mid_di:setAnchorPoint(cc.p(0.5,0.5))
    hougong_jiaoyu_bottom:appendComponent(hgjy_mid_di)
    hgjy_mid_di:setPositionInContainer(cc.p(267,173))
    table_hougong_jiaoyu["hgjy_mid_di"] = hgjy_mid_di

    local xueshi_image = fc.FExtensionsImage:create()
    xueshi_image:setImage("batch_ui/xueshi_biankuang.png")
    xueshi_image:setSize(cc.size(150,131))
    xueshi_image:setAnchorPoint(cc.p(0.5,0.5))
    hougong_jiaoyu_bottom:appendComponent(xueshi_image)
    xueshi_image:setPositionInContainer(cc.p(267,157.5))
    table_hougong_jiaoyu["xueshi_image"] = xueshi_image

    local hyjb_di = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shuruwenzi.png",cc.rect(11,9,47,7))
    hyjb_di:setSize(cc.size(80,25))
    hyjb_di:setAnchorPoint(cc.p(0.5,0.5))
    hougong_jiaoyu_bottom:appendComponent(hyjb_di)
    hyjb_di:setPositionInContainer(cc.p(268,232.5))
    table_hougong_jiaoyu["hyjb_di"] = hyjb_di

    local hyyx_num_jiaoyu = fc.FLabel:createBMFont()
    hyyx_num_jiaoyu:setSize(cc.size(80,25))
    hyyx_num_jiaoyu:setAnchorPoint(cc.p(0.5,0.5))
    hyyx_num_jiaoyu:setFontSize(20)
    hyyx_num_jiaoyu:setString("11")
    hyyx_num_jiaoyu:setColor(cc.c3b(139,255,240))
    hougong_jiaoyu_bottom:appendComponent(hyyx_num_jiaoyu)
    hyyx_num_jiaoyu:setPositionInContainer(cc.p(267,229.5))
    table_hougong_jiaoyu["hyyx_num_jiaoyu"] = hyyx_num_jiaoyu

    return table_hougong_jiaoyu

end

