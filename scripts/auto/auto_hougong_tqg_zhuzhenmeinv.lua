function createhougong_tqg_zhuzhenmeinv()

    local table_hougong_tqg_zhuzhenmeinv = {}

    local hougong_tqg_zhuzhenmeinv = fc.FContainerPanel:create()
    hougong_tqg_zhuzhenmeinv:setSize(cc.size(960,160))
    table_hougong_tqg_zhuzhenmeinv["hougong_tqg_zhuzhenmeinv"] = hougong_tqg_zhuzhenmeinv

    local bg_scale9 = fc.FExtensionsImage:create()
    bg_scale9:setImage("batch_ui/tuopan1_tangquanxinggong.png")
    bg_scale9:setSize(cc.size(170,160))
    bg_scale9:setAnchorPoint(cc.p(0.5,0.5))
    hougong_tqg_zhuzhenmeinv:appendComponent(bg_scale9)
    bg_scale9:setPositionInContainer(cc.p(85,80))
    table_hougong_tqg_zhuzhenmeinv["bg_scale9"] = bg_scale9

    local bg_scale9 = fc.FExtensionsImage:create()
    bg_scale9:setImage("batch_ui/tuopan1_tangquanxinggong.png")
    bg_scale9:setSize(cc.size(170,160))
    bg_scale9:setAnchorPoint(cc.p(0.5,0.5))
    hougong_tqg_zhuzhenmeinv:appendComponent(bg_scale9)
    bg_scale9:setPositionInContainer(cc.p(195,80))
    table_hougong_tqg_zhuzhenmeinv["bg_scale9"] = bg_scale9

    local bg_scale9 = fc.FExtensionsImage:create()
    bg_scale9:setImage("batch_ui/tuopan1_tangquanxinggong.png")
    bg_scale9:setSize(cc.size(170,160))
    bg_scale9:setAnchorPoint(cc.p(0.5,0.5))
    hougong_tqg_zhuzhenmeinv:appendComponent(bg_scale9)
    bg_scale9:setPositionInContainer(cc.p(365,80))
    table_hougong_tqg_zhuzhenmeinv["bg_scale9"] = bg_scale9

    local bg_scale9 = fc.FExtensionsImage:create()
    bg_scale9:setImage("batch_ui/tuopan1_tangquanxinggong.png")
    bg_scale9:setSize(cc.size(170,160))
    bg_scale9:setAnchorPoint(cc.p(0.5,0.5))
    hougong_tqg_zhuzhenmeinv:appendComponent(bg_scale9)
    bg_scale9:setPositionInContainer(cc.p(535,80))
    table_hougong_tqg_zhuzhenmeinv["bg_scale9"] = bg_scale9

    local bg_scale9 = fc.FExtensionsImage:create()
    bg_scale9:setImage("batch_ui/tuopan1_tangquanxinggong.png")
    bg_scale9:setSize(cc.size(170,160))
    bg_scale9:setAnchorPoint(cc.p(0.5,0.5))
    hougong_tqg_zhuzhenmeinv:appendComponent(bg_scale9)
    bg_scale9:setPositionInContainer(cc.p(705,80))
    table_hougong_tqg_zhuzhenmeinv["bg_scale9"] = bg_scale9

    local bg_scale9 = fc.FExtensionsImage:create()
    bg_scale9:setImage("batch_ui/tuopan1_tangquanxinggong.png")
    bg_scale9:setSize(cc.size(170,160))
    bg_scale9:setAnchorPoint(cc.p(0.5,0.5))
    hougong_tqg_zhuzhenmeinv:appendComponent(bg_scale9)
    bg_scale9:setPositionInContainer(cc.p(875,80))
    table_hougong_tqg_zhuzhenmeinv["bg_scale9"] = bg_scale9

    local hg_tqg_zzmv_ng_scale9 = fc.FScale9Image:createWithBatchUIFrame("nobatch/tuopan2_tangquanxinggong.png",cc.rect(190,0,2,143))
    hg_tqg_zzmv_ng_scale9:setSize(cc.size(960,160))
    hg_tqg_zzmv_ng_scale9:setAnchorPoint(cc.p(0.5,0.5))
    hougong_tqg_zhuzhenmeinv:appendComponent(hg_tqg_zzmv_ng_scale9)
    hg_tqg_zzmv_ng_scale9:setPositionInContainer(cc.p(480,80))
    table_hougong_tqg_zhuzhenmeinv["hg_tqg_zzmv_ng_scale9"] = hg_tqg_zzmv_ng_scale9

    local hg_tqg_zzmv_jiacheng_button = fc.FScaleButton:create()
    hg_tqg_zzmv_jiacheng_button:setSize(cc.size(65,124))
    hg_tqg_zzmv_jiacheng_button:setAnchorPoint(cc.p(0.5,0.5))
    hg_tqg_zzmv_jiacheng_button:setButtonImage("batch_ui/huanzhen2_anniu.png")
    hougong_tqg_zhuzhenmeinv:appendComponent(hg_tqg_zzmv_jiacheng_button)
    hg_tqg_zzmv_jiacheng_button:setPositionInContainer(cc.p(927.5,80))
    table_hougong_tqg_zhuzhenmeinv["hg_tqg_zzmv_jiacheng_button"] = hg_tqg_zzmv_jiacheng_button

    local zong = fc.FExtensionsImage:create()
    zong:setImage("batch_ui/zong_uizi.png")
    zong:setSize(cc.size(32,32))
    zong:setAnchorPoint(cc.p(0.5,0.5))
    hg_tqg_zzmv_jiacheng_button:appendComponent(zong)
    zong:setPositionInContainer(cc.p(49,30))
    table_hougong_tqg_zhuzhenmeinv["zong"] = zong

    local jia = fc.FExtensionsImage:create()
    jia:setImage("batch_ui/jia_uizi.png")
    jia:setSize(cc.size(32,32))
    jia:setAnchorPoint(cc.p(0.5,0.5))
    hg_tqg_zzmv_jiacheng_button:appendComponent(jia)
    jia:setPositionInContainer(cc.p(49,62))
    table_hougong_tqg_zhuzhenmeinv["jia"] = jia

    local cheng = fc.FExtensionsImage:create()
    cheng:setImage("batch_ui/cheng_uizi.png")
    cheng:setSize(cc.size(32,32))
    cheng:setAnchorPoint(cc.p(0.5,0.5))
    hg_tqg_zzmv_jiacheng_button:appendComponent(cheng)
    cheng:setPositionInContainer(cc.p(49,94))
    table_hougong_tqg_zhuzhenmeinv["cheng"] = cheng

    local fei = fc.FExtensionsImage:create()
    fei:setImage("batch_ui/fei_anniu.png")
    fei:setSize(cc.size(98,85))
    fei:setAnchorPoint(cc.p(0.5,0.5))
    hougong_tqg_zhuzhenmeinv:appendComponent(fei)
    fei:setPositionInContainer(cc.p(75,78.5))
    table_hougong_tqg_zhuzhenmeinv["fei"] = fei

    return table_hougong_tqg_zhuzhenmeinv

end

