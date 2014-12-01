function createnanzhengbeitao_title()

    local table_nanzhengbeitao_title = {}

    local nanzhengbeitao_title = fc.FContainerPanel:create()
    nanzhengbeitao_title:setSize(cc.size(960,640))
    table_nanzhengbeitao_title["nanzhengbeitao_title"] = nanzhengbeitao_title

    local nzbt_title__bg_image = fc.FScale9Image:createWithBatchUIFrame("batch_ui/ditu_lan.png",cc.rect(2,2,2,2))
    nzbt_title__bg_image:setSize(cc.size(960,640))
    nzbt_title__bg_image:setAnchorPoint(cc.p(0.5,0.5))
    nanzhengbeitao_title:appendComponent(nzbt_title__bg_image)
    nzbt_title__bg_image:setPositionInContainer(cc.p(480,320))
    table_nanzhengbeitao_title["nzbt_title__bg_image"] = nzbt_title__bg_image

    local nzbt_title_bg_image = fc.FExtensionsImage:create()
    nzbt_title_bg_image:setImage("nobatch/title_mingchen_.png")
    nzbt_title_bg_image:setSize(cc.size(483,67))
    nzbt_title_bg_image:setAnchorPoint(cc.p(0.5,0.5))
    nanzhengbeitao_title:appendComponent(nzbt_title_bg_image)
    nzbt_title_bg_image:setPositionInContainer(cc.p(241.5,33.5))
    table_nanzhengbeitao_title["nzbt_title_bg_image"] = nzbt_title_bg_image

    local nzbt_title_bg_image2 = fc.FExtensionsImage:create()
    nzbt_title_bg_image2:setImage("nobatch/title_mingchen_.png")
    nzbt_title_bg_image2:setSize(cc.size(483,67))
    nzbt_title_bg_image2:setFlipType(2)
    nzbt_title_bg_image2:setAnchorPoint(cc.p(0.5,0.5))
    nanzhengbeitao_title:appendComponent(nzbt_title_bg_image2)
    nzbt_title_bg_image2:setPositionInContainer(cc.p(718.5,33.5))
    table_nanzhengbeitao_title["nzbt_title_bg_image2"] = nzbt_title_bg_image2

    local wen_l = fc.FExtensionsImage:create()
    wen_l:setImage("nobatch/banzidikuang_tongyong.png")
    wen_l:setSize(cc.size(220,163))
    wen_l:setAnchorPoint(cc.p(0.5,0.5))
    nanzhengbeitao_title:appendComponent(wen_l)
    wen_l:setPositionInContainer(cc.p(110,148.5))
    table_nanzhengbeitao_title["wen_l"] = wen_l

    local lian_l = fc.FExtensionsImage:create()
    lian_l:setImage("batch_ui/title_mingchen_2.png")
    lian_l:setSize(cc.size(62,121))
    lian_l:setAnchorPoint(cc.p(0.5,0.5))
    nanzhengbeitao_title:appendComponent(lian_l)
    lian_l:setPositionInContainer(cc.p(31,67.5))
    table_nanzhengbeitao_title["lian_l"] = lian_l

    local wen_r = fc.FExtensionsImage:create()
    wen_r:setImage("nobatch/banzidikuang_tongyong.png")
    wen_r:setSize(cc.size(220,163))
    wen_r:setFlipType(2)
    wen_r:setAnchorPoint(cc.p(0.5,0.5))
    nanzhengbeitao_title:appendComponent(wen_r)
    wen_r:setPositionInContainer(cc.p(850,148.5))
    table_nanzhengbeitao_title["wen_r"] = wen_r

    local lian_r = fc.FExtensionsImage:create()
    lian_r:setImage("batch_ui/title_mingchen_2.png")
    lian_r:setSize(cc.size(62,121))
    lian_r:setFlipType(2)
    lian_r:setAnchorPoint(cc.p(0.5,0.5))
    nanzhengbeitao_title:appendComponent(lian_r)
    lian_r:setPositionInContainer(cc.p(929,67.5))
    table_nanzhengbeitao_title["lian_r"] = lian_r

    local nzbt_title__close_image = fc.FScaleButton:create()
    nzbt_title__close_image:setSize(cc.size(52,52))
    nzbt_title__close_image:setAnchorPoint(cc.p(0.5,0.5))
    nzbt_title__close_image:setButtonImage("batch_ui/guanbi_up.png")
    nanzhengbeitao_title:appendComponent(nzbt_title__close_image)
    nzbt_title__close_image:setPositionInContainer(cc.p(929,34))
    table_nanzhengbeitao_title["nzbt_title__close_image"] = nzbt_title__close_image

    local wen_lb = fc.FExtensionsImage:create()
    wen_lb:setImage("nobatch/banzidikuang_tongyong.png")
    wen_lb:setSize(cc.size(220,163))
    wen_lb:setFlipType(4)
    wen_lb:setAnchorPoint(cc.p(0.5,0.5))
    nanzhengbeitao_title:appendComponent(wen_lb)
    wen_lb:setPositionInContainer(cc.p(110,558.5))
    table_nanzhengbeitao_title["wen_lb"] = wen_lb

    local wen_rb = fc.FExtensionsImage:create()
    wen_rb:setImage("nobatch/banzidikuang_tongyong.png")
    wen_rb:setSize(cc.size(220,163))
    wen_rb:setFlipType(8)
    wen_rb:setAnchorPoint(cc.p(0.5,0.5))
    nanzhengbeitao_title:appendComponent(wen_rb)
    wen_rb:setPositionInContainer(cc.p(850,558.5))
    table_nanzhengbeitao_title["wen_rb"] = wen_rb

    local normal_pve = fc.FRadioButton:create()
    normal_pve:setRadioButtonImage("batch_ui/qieyeanniu_down1.png","batch_ui/qieyeanniu_up1.png")
    normal_pve:setSize(cc.size(159,45))
    normal_pve:setAnchorPoint(cc.p(0.5,0.5))
    nanzhengbeitao_title:appendComponent(normal_pve)
    normal_pve:setPositionInContainer(cc.p(395.5,37.5))
    table_nanzhengbeitao_title["normal_pve"] = normal_pve

    local nzbt_pu = fc.FExtensionsImage:create()
    nzbt_pu:setImage("batch_ui/pu_uizi.png")
    nzbt_pu:setSize(cc.size(32,32))
    nzbt_pu:setAnchorPoint(cc.p(0.5,0.5))
    nanzhengbeitao_title:appendComponent(nzbt_pu)
    nzbt_pu:setPositionInContainer(cc.p(353,38))
    table_nanzhengbeitao_title["nzbt_pu"] = nzbt_pu

    local nzbt_tong = fc.FExtensionsImage:create()
    nzbt_tong:setImage("batch_ui/tong_uizi.png")
    nzbt_tong:setSize(cc.size(32,32))
    nzbt_tong:setAnchorPoint(cc.p(0.5,0.5))
    nanzhengbeitao_title:appendComponent(nzbt_tong)
    nzbt_tong:setPositionInContainer(cc.p(381,38))
    table_nanzhengbeitao_title["nzbt_tong"] = nzbt_tong

    local nzbt_fu = fc.FExtensionsImage:create()
    nzbt_fu:setImage("batch_ui/fu_uizi.png")
    nzbt_fu:setSize(cc.size(32,32))
    nzbt_fu:setAnchorPoint(cc.p(0.5,0.5))
    nanzhengbeitao_title:appendComponent(nzbt_fu)
    nzbt_fu:setPositionInContainer(cc.p(410,38))
    table_nanzhengbeitao_title["nzbt_fu"] = nzbt_fu

    local nzbt_ben = fc.FExtensionsImage:create()
    nzbt_ben:setImage("batch_ui/ben_uizi.png")
    nzbt_ben:setSize(cc.size(32,32))
    nzbt_ben:setAnchorPoint(cc.p(0.5,0.5))
    nanzhengbeitao_title:appendComponent(nzbt_ben)
    nzbt_ben:setPositionInContainer(cc.p(438,38))
    table_nanzhengbeitao_title["nzbt_ben"] = nzbt_ben

    local nzbt_title_r_panel = fc.FContainerPanel:create()
    nzbt_title_r_panel:setSize(cc.size(159,45))
    nzbt_title_r_panel:setAnchorPoint(cc.p(0.5,0.5))
    nanzhengbeitao_title:appendComponent(nzbt_title_r_panel)
    nzbt_title_r_panel:setPositionInContainer(cc.p(559.5,37.5))
    table_nanzhengbeitao_title["nzbt_title_r_panel"] = nzbt_title_r_panel

    local special_pve = fc.FRadioButton:create()
    special_pve:setRadioButtonImage("batch_ui/qieyeanniu_down1.png","batch_ui/qieyeanniu_up1.png")
    special_pve:setSize(cc.size(159,45))
    special_pve:setAnchorPoint(cc.p(0.5,0.5))
    nzbt_title_r_panel:appendComponent(special_pve)
    special_pve:setPositionInContainer(cc.p(79.5,22.5))
    table_nanzhengbeitao_title["special_pve"] = special_pve

    local nzbt_jing = fc.FExtensionsImage:create()
    nzbt_jing:setImage("batch_ui/jing_uizi.png")
    nzbt_jing:setSize(cc.size(32,32))
    nzbt_jing:setAnchorPoint(cc.p(0.5,0.5))
    nzbt_title_r_panel:appendComponent(nzbt_jing)
    nzbt_jing:setPositionInContainer(cc.p(37,23))
    table_nanzhengbeitao_title["nzbt_jing"] = nzbt_jing

    local nzbt_ying = fc.FExtensionsImage:create()
    nzbt_ying:setImage("batch_ui/ying_uizi.png")
    nzbt_ying:setSize(cc.size(32,32))
    nzbt_ying:setAnchorPoint(cc.p(0.5,0.5))
    nzbt_title_r_panel:appendComponent(nzbt_ying)
    nzbt_ying:setPositionInContainer(cc.p(65,23))
    table_nanzhengbeitao_title["nzbt_ying"] = nzbt_ying

    local nzbt_fu = fc.FExtensionsImage:create()
    nzbt_fu:setImage("batch_ui/fu_uizi.png")
    nzbt_fu:setSize(cc.size(32,32))
    nzbt_fu:setAnchorPoint(cc.p(0.5,0.5))
    nzbt_title_r_panel:appendComponent(nzbt_fu)
    nzbt_fu:setPositionInContainer(cc.p(93,23))
    table_nanzhengbeitao_title["nzbt_fu"] = nzbt_fu

    local nzbt_ben = fc.FExtensionsImage:create()
    nzbt_ben:setImage("batch_ui/ben_uizi.png")
    nzbt_ben:setSize(cc.size(32,32))
    nzbt_ben:setAnchorPoint(cc.p(0.5,0.5))
    nzbt_title_r_panel:appendComponent(nzbt_ben)
    nzbt_ben:setPositionInContainer(cc.p(121,23))
    table_nanzhengbeitao_title["nzbt_ben"] = nzbt_ben

    return table_nanzhengbeitao_title

end

