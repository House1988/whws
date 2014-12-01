function createchuxiugong_bg()

    local table_chuxiugong_bg = {}

    local chuxiugong_bg = fc.FContainerPanel:create()
    chuxiugong_bg:setSize(cc.size(946,565))
    table_chuxiugong_bg["chuxiugong_bg"] = chuxiugong_bg

    local cxg_xiangqing_button = fc.FScaleButton:create()
    cxg_xiangqing_button:setSize(cc.size(144,53))
    cxg_xiangqing_button:setAnchorPoint(cc.p(0.5,0.5))
    cxg_xiangqing_button:setButtonImage("batch_ui/putonganniu1_up.png")
    chuxiugong_bg:appendComponent(cxg_xiangqing_button)
    cxg_xiangqing_button:setPositionInContainer(cc.p(281,523.5))
    table_chuxiugong_bg["cxg_xiangqing_button"] = cxg_xiangqing_button

    local cha = fc.FShaderExtensionsImage:create(0)
    cha:setAnchorPoint(cc.p(0.5,0.5))
    cha:setImage("batch_ui/cha_uizi.png")
    cha:setSize(cc.size(32,32))
    cxg_xiangqing_button:appendComponent(cha)
    cha:setPositionInContainer(cc.p(31,26))
    table_chuxiugong_bg["cha"] = cha

    local kan = fc.FShaderExtensionsImage:create(0)
    kan:setAnchorPoint(cc.p(0.5,0.5))
    kan:setImage("batch_ui/kan_uizi.png")
    kan:setSize(cc.size(32,32))
    cxg_xiangqing_button:appendComponent(kan)
    kan:setPositionInContainer(cc.p(57,26))
    table_chuxiugong_bg["kan"] = kan

    local xiang = fc.FShaderExtensionsImage:create(0)
    xiang:setAnchorPoint(cc.p(0.5,0.5))
    xiang:setImage("batch_ui/xiang_uizi.png")
    xiang:setSize(cc.size(32,32))
    cxg_xiangqing_button:appendComponent(xiang)
    xiang:setPositionInContainer(cc.p(84,26))
    table_chuxiugong_bg["xiang"] = xiang

    local qing = fc.FShaderExtensionsImage:create(0)
    qing:setAnchorPoint(cc.p(0.5,0.5))
    qing:setImage("batch_ui/qing_uizi.png")
    qing:setSize(cc.size(32,32))
    cxg_xiangqing_button:appendComponent(qing)
    qing:setPositionInContainer(cc.p(110,26))
    table_chuxiugong_bg["qing"] = qing

    local cxg_gongdou_button = fc.FScaleButton:create()
    cxg_gongdou_button:setSize(cc.size(144,53))
    cxg_gongdou_button:setAnchorPoint(cc.p(0.5,0.5))
    cxg_gongdou_button:setButtonImage("batch_ui/putonganniu1_up.png")
    chuxiugong_bg:appendComponent(cxg_gongdou_button)
    cxg_gongdou_button:setPositionInContainer(cc.p(677,523.5))
    table_chuxiugong_bg["cxg_gongdou_button"] = cxg_gongdou_button

    local gong = fc.FShaderExtensionsImage:create(0)
    gong:setAnchorPoint(cc.p(0.5,0.5))
    gong:setImage("batch_ui/gong_uizi.png")
    gong:setSize(cc.size(32,32))
    cxg_gongdou_button:appendComponent(gong)
    gong:setPositionInContainer(cc.p(44,26))
    table_chuxiugong_bg["gong"] = gong

    local dou = fc.FShaderExtensionsImage:create(0)
    dou:setAnchorPoint(cc.p(0.5,0.5))
    dou:setImage("batch_ui/dou_uizi.png")
    dou:setSize(cc.size(32,32))
    cxg_gongdou_button:appendComponent(dou)
    dou:setPositionInContainer(cc.p(94,26))
    table_chuxiugong_bg["dou"] = dou

    local cxg_cefeng_button = fc.FScaleButton:create()
    cxg_cefeng_button:setSize(cc.size(144,53))
    cxg_cefeng_button:setAnchorPoint(cc.p(0.5,0.5))
    cxg_cefeng_button:setButtonImage("batch_ui/putonganniu1_up.png")
    chuxiugong_bg:appendComponent(cxg_cefeng_button)
    cxg_cefeng_button:setPositionInContainer(cc.p(843,523.5))
    table_chuxiugong_bg["cxg_cefeng_button"] = cxg_cefeng_button

    local ce = fc.FShaderExtensionsImage:create(0)
    ce:setAnchorPoint(cc.p(0.5,0.5))
    ce:setImage("batch_ui/ce_uizi.png")
    ce:setSize(cc.size(32,32))
    cxg_cefeng_button:appendComponent(ce)
    ce:setPositionInContainer(cc.p(48,26))
    table_chuxiugong_bg["ce"] = ce

    local feng = fc.FShaderExtensionsImage:create(0)
    feng:setAnchorPoint(cc.p(0.5,0.5))
    feng:setImage("batch_ui/feng1_uizi.png")
    feng:setSize(cc.size(32,32))
    cxg_cefeng_button:appendComponent(feng)
    feng:setPositionInContainer(cc.p(96,26))
    table_chuxiugong_bg["feng"] = feng

    local cxg_delete_button = fc.FScaleButton:create()
    cxg_delete_button:setSize(cc.size(144,53))
    cxg_delete_button:setAnchorPoint(cc.p(0.5,0.5))
    cxg_delete_button:setButtonImage("batch_ui/putonganniu1_up.png")
    chuxiugong_bg:appendComponent(cxg_delete_button)
    cxg_delete_button:setPositionInContainer(cc.p(113,523.5))
    table_chuxiugong_bg["cxg_delete_button"] = cxg_delete_button

    local qian = fc.FShaderExtensionsImage:create(0)
    qian:setAnchorPoint(cc.p(0.5,0.5))
    qian:setImage("batch_ui/qian3_uizi.png")
    qian:setSize(cc.size(32,32))
    cxg_delete_button:appendComponent(qian)
    qian:setPositionInContainer(cc.p(44,26))
    table_chuxiugong_bg["qian"] = qian

    local san = fc.FShaderExtensionsImage:create(0)
    san:setAnchorPoint(cc.p(0.5,0.5))
    san:setImage("batch_ui/san_uizi.png")
    san:setSize(cc.size(32,32))
    cxg_delete_button:appendComponent(san)
    san:setPositionInContainer(cc.p(96,26))
    table_chuxiugong_bg["san"] = san

    local pagebg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shuruwenzi.png",cc.rect(11,9,47,7))
    pagebg:setSize(cc.size(100,30))
    pagebg:setAnchorPoint(cc.p(0.5,0.5))
    chuxiugong_bg:appendComponent(pagebg)
    pagebg:setPositionInContainer(cc.p(480,527))
    table_chuxiugong_bg["pagebg"] = pagebg

    local pageText = fc.FLabel:createSystemFont()
    pageText:setSize(cc.size(100,25))
    pageText:setAnchorPoint(cc.p(0.5,0.5))
    pageText:setFontSize(20)
    pageText:setString("")
    pageText:setColor(cc.c3b(255, 255, 255))
    chuxiugong_bg:appendComponent(pageText)
    pageText:setPositionInContainer(cc.p(480,522.5))
    table_chuxiugong_bg["pageText"] = pageText

    return table_chuxiugong_bg

end

