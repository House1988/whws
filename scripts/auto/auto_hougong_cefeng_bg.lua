function createhougong_cefeng_bg()

    local table_hougong_cefeng_bg = {}

    local hougong_cefeng_bg = fc.FContainerPanel:create()
    hougong_cefeng_bg:setSize(cc.size(960,640))
    table_hougong_cefeng_bg["hougong_cefeng_bg"] = hougong_cefeng_bg

    local hg_cf_bg_scale9 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/banzidikuangmeinv2_tongyong.png",cc.rect(2,2,1,1))
    hg_cf_bg_scale9:setSize(cc.size(960,640))
    hg_cf_bg_scale9:setAnchorPoint(cc.p(0.5,0.5))
    hougong_cefeng_bg:appendComponent(hg_cf_bg_scale9)
    hg_cf_bg_scale9:setPositionInContainer(cc.p(480,320))
    table_hougong_cefeng_bg["hg_cf_bg_scale9"] = hg_cf_bg_scale9

    local tiao_l = fc.FExtensionsImage:create()
    tiao_l:setImage("nobatch/title_hougong.png")
    tiao_l:setSize(cc.size(480,67))
    tiao_l:setAnchorPoint(cc.p(0.5,0.5))
    hougong_cefeng_bg:appendComponent(tiao_l)
    tiao_l:setPositionInContainer(cc.p(240,33.5))
    table_hougong_cefeng_bg["tiao_l"] = tiao_l

    local tiao_r = fc.FExtensionsImage:create()
    tiao_r:setImage("nobatch/title_hougong.png")
    tiao_r:setSize(cc.size(480,67))
    tiao_r:setFlipType(2)
    tiao_r:setAnchorPoint(cc.p(0.5,0.5))
    hougong_cefeng_bg:appendComponent(tiao_r)
    tiao_r:setPositionInContainer(cc.p(720,33.5))
    table_hougong_cefeng_bg["tiao_r"] = tiao_r

    local wen_l = fc.FExtensionsImage:create()
    wen_l:setImage("nobatch/banzidikuangmeinv_tongyong.png")
    wen_l:setSize(cc.size(220,163))
    wen_l:setAnchorPoint(cc.p(0.5,0.5))
    hougong_cefeng_bg:appendComponent(wen_l)
    wen_l:setPositionInContainer(cc.p(110,148.5))
    table_hougong_cefeng_bg["wen_l"] = wen_l

    local wen_r = fc.FExtensionsImage:create()
    wen_r:setImage("nobatch/banzidikuangmeinv_tongyong.png")
    wen_r:setSize(cc.size(220,163))
    wen_r:setFlipType(2)
    wen_r:setAnchorPoint(cc.p(0.5,0.5))
    hougong_cefeng_bg:appendComponent(wen_r)
    wen_r:setPositionInContainer(cc.p(850,148.5))
    table_hougong_cefeng_bg["wen_r"] = wen_r

    local wen_lb = fc.FExtensionsImage:create()
    wen_lb:setImage("nobatch/banzidikuangmeinv_tongyong.png")
    wen_lb:setSize(cc.size(220,163))
    wen_lb:setFlipType(4)
    wen_lb:setAnchorPoint(cc.p(0.5,0.5))
    hougong_cefeng_bg:appendComponent(wen_lb)
    wen_lb:setPositionInContainer(cc.p(110,558.5))
    table_hougong_cefeng_bg["wen_lb"] = wen_lb

    local wen_rb = fc.FExtensionsImage:create()
    wen_rb:setImage("nobatch/banzidikuangmeinv_tongyong.png")
    wen_rb:setSize(cc.size(220,163))
    wen_rb:setFlipType(8)
    wen_rb:setAnchorPoint(cc.p(0.5,0.5))
    hougong_cefeng_bg:appendComponent(wen_rb)
    wen_rb:setPositionInContainer(cc.p(850,558.5))
    table_hougong_cefeng_bg["wen_rb"] = wen_rb

    local lian_l = fc.FExtensionsImage:create()
    lian_l:setImage("batch_ui/title_mingchen_2.png")
    lian_l:setSize(cc.size(62,121))
    lian_l:setAnchorPoint(cc.p(0.5,0.5))
    hougong_cefeng_bg:appendComponent(lian_l)
    lian_l:setPositionInContainer(cc.p(31,68.5))
    table_hougong_cefeng_bg["lian_l"] = lian_l

    local lian_r = fc.FExtensionsImage:create()
    lian_r:setImage("batch_ui/title_mingchen_2.png")
    lian_r:setSize(cc.size(62,121))
    lian_r:setFlipType(2)
    lian_r:setAnchorPoint(cc.p(0.5,0.5))
    hougong_cefeng_bg:appendComponent(lian_r)
    lian_r:setPositionInContainer(cc.p(929,68.5))
    table_hougong_cefeng_bg["lian_r"] = lian_r

    local hg_cf_close_button = fc.FScaleButton:create()
    hg_cf_close_button:setSize(cc.size(52,52))
    hg_cf_close_button:setAnchorPoint(cc.p(0.5,0.5))
    hg_cf_close_button:setButtonImage("batch_ui/guanbi_up.png")
    hougong_cefeng_bg:appendComponent(hg_cf_close_button)
    hg_cf_close_button:setPositionInContainer(cc.p(934,35))
    table_hougong_cefeng_bg["hg_cf_close_button"] = hg_cf_close_button

    local hg_cf_contaier_list = fc.FContainerList:create(2)
    hg_cf_contaier_list:setSize(cc.size(856,469))
    hg_cf_contaier_list:setAnchorPoint(cc.p(0.5,0.5))
    hougong_cefeng_bg:appendComponent(hg_cf_contaier_list)
    hg_cf_contaier_list:setPositionInContainer(cc.p(479,336.5))
    table_hougong_cefeng_bg["hg_cf_contaier_list"] = hg_cf_contaier_list

    local title = fc.FContainerPanel:create()
    title:setSize(cc.size(206,34))
    title:setAnchorPoint(cc.p(0.5,0.5))
    hougong_cefeng_bg:appendComponent(title)
    title:setPositionInContainer(cc.p(480,40))
    table_hougong_cefeng_bg["title"] = title

    local fei = fc.FExtensionsImage:create()
    fei:setImage("batch_ui/fei.png")
    fei:setSize(cc.size(40,40))
    fei:setAnchorPoint(cc.p(0.5,0.5))
    title:appendComponent(fei)
    fei:setPositionInContainer(cc.p(20,20))
    table_hougong_cefeng_bg["fei"] = fei

    local wei = fc.FExtensionsImage:create()
    wei:setImage("batch_ui/wei.png")
    wei:setSize(cc.size(40,40))
    wei:setAnchorPoint(cc.p(0.5,0.5))
    title:appendComponent(wei)
    wei:setPositionInContainer(cc.p(75,20))
    table_hougong_cefeng_bg["wei"] = wei

    local hcb_ce = fc.FShaderExtensionsImage:create(0)
    hcb_ce:setAnchorPoint(cc.p(0.5,0.5))
    hcb_ce:setImage("batch_ui/ce.png")
    hcb_ce:setSize(cc.size(40,40))
    title:appendComponent(hcb_ce)
    hcb_ce:setPositionInContainer(cc.p(131,20))
    table_hougong_cefeng_bg["hcb_ce"] = hcb_ce

    local hcb_feng = fc.FExtensionsImage:create()
    hcb_feng:setImage("batch_ui/feng.png")
    hcb_feng:setSize(cc.size(40,40))
    hcb_feng:setAnchorPoint(cc.p(0.5,0.5))
    title:appendComponent(hcb_feng)
    hcb_feng:setPositionInContainer(cc.p(186,20))
    table_hougong_cefeng_bg["hcb_feng"] = hcb_feng

    return table_hougong_cefeng_bg

end

