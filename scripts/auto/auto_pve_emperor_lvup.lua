function createpve_emperor_lvup()

    local table_pve_emperor_lvup = {}

    local pve_emperor_lvup = fc.FContainerPanel:create()
    pve_emperor_lvup:setSize(cc.size(960,640))
    table_pve_emperor_lvup["pve_emperor_lvup"] = pve_emperor_lvup

    local bg_panel = fc.FContainerPanel:create()
    bg_panel:setSize(cc.size(540,543))
    bg_panel:setAnchorPoint(cc.p(0.5,0.5))
    pve_emperor_lvup:appendComponent(bg_panel)
    bg_panel:setPositionInContainer(cc.p(480,319.5))
    table_pve_emperor_lvup["bg_panel"] = bg_panel

    local bg_image_left = fc.FExtensionsImage:create()
    bg_image_left:setImage("nobatch/huangdishengji.png")
    bg_image_left:setSize(cc.size(270,543))
    bg_image_left:setAnchorPoint(cc.p(0.5,0.5))
    bg_panel:appendComponent(bg_image_left)
    bg_image_left:setPositionInContainer(cc.p(135,271.5))
    table_pve_emperor_lvup["bg_image_left"] = bg_image_left

    local bg_image_right = fc.FExtensionsImage:create()
    bg_image_right:setImage("nobatch/huangdishengji.png")
    bg_image_right:setSize(cc.size(270,543))
    bg_image_right:setFlipType(2)
    bg_image_right:setAnchorPoint(cc.p(0.5,0.5))
    bg_panel:appendComponent(bg_image_right)
    bg_image_right:setPositionInContainer(cc.p(405,271.5))
    table_pve_emperor_lvup["bg_image_right"] = bg_image_right

    local gongxi_Shengji = fc.FExtensionsImage:create()
    gongxi_Shengji:setImage("nobatch/gongxihuangshangninshengjile_shengji.png")
    gongxi_Shengji:setSize(cc.size(312,45))
    gongxi_Shengji:setAnchorPoint(cc.p(0.5,0.5))
    bg_panel:appendComponent(gongxi_Shengji)
    gongxi_Shengji:setPositionInContainer(cc.p(280,174.5))
    table_pve_emperor_lvup["gongxi_Shengji"] = gongxi_Shengji

    local qianwang_text_btn = fc.FTextButton:create()
    qianwang_text_btn:setSize(cc.size(144,51))
    qianwang_text_btn:setAnchorPoint(cc.p(0.5,0.5))
    qianwang_text_btn:setTextButtonImage("batch_ui/goumai_anniu.png","batch_ui/goumai_anniu.png","batch_ui/goumai_anniu.png")
    qianwang_text_btn:setText("立即前往",cc.c3b(255,255,255))
    qianwang_text_btn:setSelectActionEnbaled(true)
    bg_panel:appendComponent(qianwang_text_btn)
    qianwang_text_btn:setPositionInContainer(cc.p(280,400.5))
    table_pve_emperor_lvup["qianwang_text_btn"] = qianwang_text_btn

    local lv_label = fc.FLabel:createBMFont()
    lv_label:setSize(cc.size(60,30))
    lv_label:setAnchorPoint(cc.p(0.5,0.5))
    lv_label:setFontSize(20)
    if LANGUAGE_TYPE == 3 then
    	 lv_label:setString("等級：")
    else
    	 lv_label:setString("等级：")
    end
    lv_label:setColor(cc.c3b(148,74,14))
    bg_panel:appendComponent(lv_label)
    lv_label:setPositionInContainer(cc.p(168,215))
    table_pve_emperor_lvup["lv_label"] = lv_label

    local lv_detail = fc.FLabel:createBMFont()
    lv_detail:setSize(cc.size(80,30))
    lv_detail:setAnchorPoint(cc.p(0.5,0.5))
    lv_detail:setFontSize(20)
    lv_detail:setString("1→5")
    lv_detail:setColor(cc.c3b(148,74,14))
    bg_panel:appendComponent(lv_detail)
    lv_detail:setPositionInContainer(cc.p(241,215))
    table_pve_emperor_lvup["lv_detail"] = lv_detail

    local liangcao_label = fc.FLabel:createBMFont()
    liangcao_label:setSize(cc.size(60,30))
    liangcao_label:setAnchorPoint(cc.p(0.5,0.5))
    liangcao_label:setFontSize(20)
    if LANGUAGE_TYPE == 3 then
	    liangcao_label:setString("糧草：")
    else
	    liangcao_label:setString("粮草：")
    end
    liangcao_label:setColor(cc.c3b(148,74,14))
    bg_panel:appendComponent(liangcao_label)
    liangcao_label:setPositionInContainer(cc.p(321,215))
    table_pve_emperor_lvup["liangcao_label"] = liangcao_label

    local liangcao_detail = fc.FLabel:createBMFont()
    liangcao_detail:setSize(cc.size(60,30))
    liangcao_detail:setAnchorPoint(cc.p(0.5,0.5))
    liangcao_detail:setFontSize(20)
    liangcao_detail:setString("+100")
    liangcao_detail:setColor(cc.c3b(148,74,14))
    bg_panel:appendComponent(liangcao_detail)
    liangcao_detail:setPositionInContainer(cc.p(384,215))
    table_pve_emperor_lvup["liangcao_detail"] = liangcao_detail

    local junling_label = fc.FLabel:createBMFont()
    junling_label:setSize(cc.size(60,30))
    junling_label:setAnchorPoint(cc.p(0.5,0.5))
    junling_label:setFontSize(20)
     if LANGUAGE_TYPE == 3 then
     	 junling_label:setString("軍令：")
     else
     	 junling_label:setString("军令：")
     end
    junling_label:setColor(cc.c3b(148,74,14))
    bg_panel:appendComponent(junling_label)
    junling_label:setPositionInContainer(cc.p(168,250))
    table_pve_emperor_lvup["junling_label"] = junling_label

    local junling_detail = fc.FLabel:createBMFont()
    junling_detail:setSize(cc.size(60,30))
    junling_detail:setAnchorPoint(cc.p(0.5,0.5))
    junling_detail:setFontSize(20)
    junling_detail:setString("+50")
    junling_detail:setColor(cc.c3b(148,74,14))
    bg_panel:appendComponent(junling_detail)
    junling_detail:setPositionInContainer(cc.p(231,250))
    table_pve_emperor_lvup["junling_detail"] = junling_detail

    local jingli_label = fc.FLabel:createBMFont()
    jingli_label:setSize(cc.size(60,30))
    jingli_label:setAnchorPoint(cc.p(0.5,0.5))
    jingli_label:setFontSize(20)
	jingli_label:setString("精力：")
    jingli_label:setColor(cc.c3b(148,74,14))
    bg_panel:appendComponent(jingli_label)
    jingli_label:setPositionInContainer(cc.p(321,249))
    table_pve_emperor_lvup["jingli_label"] = jingli_label

    local jingli_detail = fc.FLabel:createBMFont()
    jingli_detail:setSize(cc.size(60,30))
    jingli_detail:setAnchorPoint(cc.p(0.5,0.5))
    jingli_detail:setFontSize(20)
    jingli_detail:setString("+5")
    jingli_detail:setColor(cc.c3b(148,74,14))
    bg_panel:appendComponent(jingli_detail)
    jingli_detail:setPositionInContainer(cc.p(384,249))
    table_pve_emperor_lvup["jingli_detail"] = jingli_detail

    local mingchen_label = fc.FLabel:createBMFont()
    mingchen_label:setSize(cc.size(120,30))
    mingchen_label:setAnchorPoint(cc.p(0.5,0.5))
    mingchen_label:setFontSize(20)
    if LANGUAGE_TYPE == 3 then
    	mingchen_label:setString("可上陣名臣數：")
    else
    	mingchen_label:setString("可上阵名臣数：")
    end
    mingchen_label:setColor(cc.c3b(148,74,14))
    bg_panel:appendComponent(mingchen_label)
    mingchen_label:setPositionInContainer(cc.p(232,285))
    table_pve_emperor_lvup["mingchen_label"] = mingchen_label

    local mingchen_detail = fc.FLabel:createBMFont()
    mingchen_detail:setSize(cc.size(60,30))
    mingchen_detail:setAnchorPoint(cc.p(0.5,0.5))
    mingchen_detail:setFontSize(20)
    mingchen_detail:setString("2→4")
    mingchen_detail:setColor(cc.c3b(148,74,14))
    bg_panel:appendComponent(mingchen_detail)
    mingchen_detail:setPositionInContainer(cc.p(332,285))
    table_pve_emperor_lvup["mingchen_detail"] = mingchen_detail

    local tip_label = fc.FLabel:createBMFont()
    tip_label:setSize(cc.size(200,30))
    tip_label:setAnchorPoint(cc.p(0.5,0.5))
    tip_label:setFontSize(20)
    tip_label:setString("名臣阵容有变化，点此立即前往")
    tip_label:setColor(cc.c3b(255,14,14))
    bg_panel:appendComponent(tip_label)
    tip_label:setPositionInContainer(cc.p(280,340))
    table_pve_emperor_lvup["tip_label"] = tip_label

    local yes_btn = fc.FTextButton:create()
    yes_btn:setSize(cc.size(144,51))
    yes_btn:setAnchorPoint(cc.p(0.5,0.5))
    yes_btn:setTextButtonImage("batch_ui/goumai_anniu.png","batch_ui/goumai_anniu.png","batch_ui/goumai_anniu.png")
    if LANGUAGE_TYPE == 3 then
    	yes_btn:setText("確  定",cc.c3b(255,255,255))
    else
    	yes_btn:setText("确  定",cc.c3b(255,255,255))
    end
    yes_btn:setSelectActionEnbaled(true)
    bg_panel:appendComponent(yes_btn)
    yes_btn:setPositionInContainer(cc.p(280,400.5))
    table_pve_emperor_lvup["yes_btn"] = yes_btn

    return table_pve_emperor_lvup

end

