function createuser_equip_bag_panel()

    local table_user_equip_bag_panel = {}

    local user_equip_bag_panel = fc.FContainerPanel:create()
    user_equip_bag_panel:setSize(cc.size(960,640))
    table_user_equip_bag_panel["user_equip_bag_panel"] = user_equip_bag_panel

    local user_equip_bag_bg = fc.FExtensionsImage:create()
    user_equip_bag_bg:setAnchorPoint(cc.p(0.5,0.5))
    user_equip_bag_panel:appendComponent(user_equip_bag_bg)
    user_equip_bag_bg:setPositionInContainer(cc.p(480,320))
    table_user_equip_bag_panel["user_equip_bag_bg"] = user_equip_bag_bg

    local user_top_bar = fc.FExtensionsImage:create()
    user_top_bar:setImage("nobatch/title_mingchen_.png")
    user_top_bar:setSize(cc.size(483,67))
    user_top_bar:setAnchorPoint(cc.p(0.5,0.5))
    user_equip_bag_panel:appendComponent(user_top_bar)
    user_top_bar:setPositionInContainer(cc.p(241.5,33.5))
    table_user_equip_bag_panel["user_top_bar"] = user_top_bar

    local user_top_bar2 = fc.FExtensionsImage:create()
    user_top_bar2:setImage("nobatch/title_mingchen_.png")
    user_top_bar2:setSize(cc.size(483,67))
    user_top_bar2:setFlipType(2)
    user_top_bar2:setAnchorPoint(cc.p(0.5,0.5))
    user_equip_bag_panel:appendComponent(user_top_bar2)
    user_top_bar2:setPositionInContainer(cc.p(721.5,33.5))
    table_user_equip_bag_panel["user_top_bar2"] = user_top_bar2

    local weapon_btn = fc.FRadioButton:create()
    weapon_btn:setRadioButtonImage("batch_ui/qieyeanniu_down1.png","batch_ui/qieyeanniu_up1.png")
    weapon_btn:setSize(cc.size(159,45))
    weapon_btn:setAnchorPoint(cc.p(0.5,0.5))
    user_equip_bag_panel:appendComponent(weapon_btn)
    weapon_btn:setPositionInContainer(cc.p(207.5,33.5))
    table_user_equip_bag_panel["weapon_btn"] = weapon_btn

    local defense_btn = fc.FRadioButton:create()
    defense_btn:setRadioButtonImage("batch_ui/qieyeanniu_down1.png","batch_ui/qieyeanniu_up1.png")
    defense_btn:setSize(cc.size(159,45))
    defense_btn:setAnchorPoint(cc.p(0.5,0.5))
    user_equip_bag_panel:appendComponent(defense_btn)
    defense_btn:setPositionInContainer(cc.p(387.5,33.5))
    table_user_equip_bag_panel["defense_btn"] = defense_btn

    local item_btn = fc.FRadioButton:create()
    item_btn:setRadioButtonImage("batch_ui/qieyeanniu_down1.png","batch_ui/qieyeanniu_up1.png")
    item_btn:setSize(cc.size(159,45))
    item_btn:setAnchorPoint(cc.p(0.5,0.5))
    user_equip_bag_panel:appendComponent(item_btn)
    item_btn:setPositionInContainer(cc.p(568.5,33.5))
    table_user_equip_bag_panel["item_btn"] = item_btn

    local close_btn = fc.FScaleButton:create()
    close_btn:setSize(cc.size(59,59))
    close_btn:setAnchorPoint(cc.p(0.5,0.5))
    close_btn:setButtonImage("batch_ui/guanbi_up.png")
    user_equip_bag_panel:appendComponent(close_btn)
    close_btn:setPositionInContainer(cc.p(927.5,29.5))
    table_user_equip_bag_panel["close_btn"] = close_btn

    local piece_btn = fc.FRadioButton:create()
    piece_btn:setRadioButtonImage("batch_ui/qieyeanniu_down1.png","batch_ui/qieyeanniu_up1.png")
    piece_btn:setSize(cc.size(159,45))
    piece_btn:setAnchorPoint(cc.p(0.5,0.5))
    user_equip_bag_panel:appendComponent(piece_btn)
    piece_btn:setPositionInContainer(cc.p(748.5,33.5))
    table_user_equip_bag_panel["piece_btn"] = piece_btn

    local wuqi_label = fc.FContainerPanel:create()
    wuqi_label:setSize(cc.size(80,30))
    wuqi_label:setAnchorPoint(cc.p(0.5,0.5))
    user_equip_bag_panel:appendComponent(wuqi_label)
    wuqi_label:setPositionInContainer(cc.p(208,33))
    table_user_equip_bag_panel["wuqi_label"] = wuqi_label

    local wu = fc.FExtensionsImage:create()
    wu:setImage("batch_ui/wu1_uizi.png")
    wu:setSize(cc.size(32,32))
    wu:setAnchorPoint(cc.p(0.5,0.5))
    wuqi_label:appendComponent(wu)
    wu:setPositionInContainer(cc.p(16,16))
    table_user_equip_bag_panel["wu"] = wu

    local qi = fc.FExtensionsImage:create()
    qi:setImage("batch_ui/qi2_uizi.png")
    qi:setSize(cc.size(32,32))
    qi:setAnchorPoint(cc.p(0.5,0.5))
    wuqi_label:appendComponent(qi)
    qi:setPositionInContainer(cc.p(64,16))
    table_user_equip_bag_panel["qi"] = qi

    local daoju_label = fc.FContainerPanel:create()
    daoju_label:setSize(cc.size(80,30))
    daoju_label:setAnchorPoint(cc.p(0.5,0.5))
    user_equip_bag_panel:appendComponent(daoju_label)
    daoju_label:setPositionInContainer(cc.p(568,33))
    table_user_equip_bag_panel["daoju_label"] = daoju_label

    local dao = fc.FExtensionsImage:create()
    dao:setImage("batch_ui/dao_uizi.png")
    dao:setSize(cc.size(32,32))
    dao:setAnchorPoint(cc.p(0.5,0.5))
    daoju_label:appendComponent(dao)
    dao:setPositionInContainer(cc.p(16,16))
    table_user_equip_bag_panel["dao"] = dao

    local ju = fc.FExtensionsImage:create()
    ju:setImage("batch_ui/ju1_uizi.png")
    ju:setSize(cc.size(32,32))
    ju:setAnchorPoint(cc.p(0.5,0.5))
    daoju_label:appendComponent(ju)
    ju:setPositionInContainer(cc.p(64,16))
    table_user_equip_bag_panel["ju"] = ju

    local suipian_label = fc.FContainerPanel:create()
    suipian_label:setSize(cc.size(80,30))
    suipian_label:setAnchorPoint(cc.p(0.5,0.5))
    user_equip_bag_panel:appendComponent(suipian_label)
    suipian_label:setPositionInContainer(cc.p(748,33))
    table_user_equip_bag_panel["suipian_label"] = suipian_label

    local sui = fc.FExtensionsImage:create()
    sui:setImage("batch_ui/sui_uizi.png")
    sui:setSize(cc.size(32,32))
    sui:setAnchorPoint(cc.p(0.5,0.5))
    suipian_label:appendComponent(sui)
    sui:setPositionInContainer(cc.p(16,16))
    table_user_equip_bag_panel["sui"] = sui

    local pian = fc.FExtensionsImage:create()
    pian:setImage("batch_ui/pian_uizi.png")
    pian:setSize(cc.size(32,32))
    pian:setAnchorPoint(cc.p(0.5,0.5))
    suipian_label:appendComponent(pian)
    pian:setPositionInContainer(cc.p(64,16))
    table_user_equip_bag_panel["pian"] = pian

    local fangju_label = fc.FContainerPanel:create()
    fangju_label:setSize(cc.size(80,30))
    fangju_label:setAnchorPoint(cc.p(0.5,0.5))
    user_equip_bag_panel:appendComponent(fangju_label)
    fangju_label:setPositionInContainer(cc.p(388,33))
    table_user_equip_bag_panel["fangju_label"] = fangju_label

    local ju = fc.FExtensionsImage:create()
    ju:setImage("batch_ui/ju1_uizi.png")
    ju:setSize(cc.size(32,32))
    ju:setAnchorPoint(cc.p(0.5,0.5))
    fangju_label:appendComponent(ju)
    ju:setPositionInContainer(cc.p(64,16))
    table_user_equip_bag_panel["ju"] = ju

    local fang = fc.FExtensionsImage:create()
    fang:setImage("batch_ui/fang2_uizi .png")
    fang:setSize(cc.size(32,32))
    fang:setAnchorPoint(cc.p(0.5,0.5))
    fangju_label:appendComponent(fang)
    fang:setPositionInContainer(cc.p(16,16))
    table_user_equip_bag_panel["fang"] = fang

    local title = fc.FContainerPanel:create()
    title:setSize(cc.size(202,41))
    title:setAnchorPoint(cc.p(0.5,0.5))
    user_equip_bag_panel:appendComponent(title)
    title:setPositionInContainer(cc.p(479.5,33.5))
    table_user_equip_bag_panel["title"] = title

    local zhuang = fc.FExtensionsImage:create()
    zhuang:setImage("batch_ui/zhuang.png")
    zhuang:setSize(cc.size(40,40))
    zhuang:setAnchorPoint(cc.p(0.5,0.5))
    title:appendComponent(zhuang)
    zhuang:setPositionInContainer(cc.p(20,20))
    table_user_equip_bag_panel["zhuang"] = zhuang

    local bei = fc.FExtensionsImage:create()
    bei:setImage("batch_ui/bei.png")
    bei:setSize(cc.size(40,40))
    bei:setAnchorPoint(cc.p(0.5,0.5))
    title:appendComponent(bei)
    bei:setPositionInContainer(cc.p(74,20))
    table_user_equip_bag_panel["bei"] = bei

    local xuan = fc.FExtensionsImage:create()
    xuan:setImage("batch_ui/xuan.png")
    xuan:setSize(cc.size(40,40))
    xuan:setAnchorPoint(cc.p(0.5,0.5))
    title:appendComponent(xuan)
    xuan:setPositionInContainer(cc.p(129,20))
    table_user_equip_bag_panel["xuan"] = xuan

    local ze = fc.FExtensionsImage:create()
    ze:setImage("batch_ui/ze.png")
    ze:setSize(cc.size(40,40))
    ze:setAnchorPoint(cc.p(0.5,0.5))
    title:appendComponent(ze)
    ze:setPositionInContainer(cc.p(183,20))
    table_user_equip_bag_panel["ze"] = ze

    local bingfa_title = fc.FContainerPanel:create()
    bingfa_title:setSize(cc.size(202,41))
    bingfa_title:setAnchorPoint(cc.p(0.5,0.5))
    user_equip_bag_panel:appendComponent(bingfa_title)
    bingfa_title:setPositionInContainer(cc.p(479.5,33.5))
    table_user_equip_bag_panel["bingfa_title"] = bingfa_title

    local xuan = fc.FExtensionsImage:create()
    xuan:setImage("batch_ui/xuan.png")
    xuan:setSize(cc.size(40,40))
    xuan:setAnchorPoint(cc.p(0.5,0.5))
    bingfa_title:appendComponent(xuan)
    xuan:setPositionInContainer(cc.p(129,20))
    table_user_equip_bag_panel["xuan"] = xuan

    local ze = fc.FExtensionsImage:create()
    ze:setImage("batch_ui/ze.png")
    ze:setSize(cc.size(40,40))
    ze:setAnchorPoint(cc.p(0.5,0.5))
    bingfa_title:appendComponent(ze)
    ze:setPositionInContainer(cc.p(183,20))
    table_user_equip_bag_panel["ze"] = ze

    local bing = fc.FExtensionsImage:create()
    bing:setImage("batch_ui/bing_2.png")
    bing:setSize(cc.size(40,40))
    bing:setAnchorPoint(cc.p(0.5,0.5))
    bingfa_title:appendComponent(bing)
    bing:setPositionInContainer(cc.p(20,20))
    table_user_equip_bag_panel["bing"] = bing

    local fa = fc.FExtensionsImage:create()
    fa:setImage("batch_ui/fa.png")
    fa:setSize(cc.size(40,40))
    fa:setAnchorPoint(cc.p(0.5,0.5))
    bingfa_title:appendComponent(fa)
    fa:setPositionInContainer(cc.p(74,20))
    table_user_equip_bag_panel["fa"] = fa

    return table_user_equip_bag_panel

end

