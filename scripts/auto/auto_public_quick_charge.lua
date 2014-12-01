function createpublic_quick_charge()

    local table_public_quick_charge = {}

    local public_quick_charge = fc.FContainerPanel:create()
    public_quick_charge:setSize(cc.size(960,640))
    table_public_quick_charge["public_quick_charge"] = public_quick_charge

    local pqc_wen_bottom = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shengzhi_ditu.png",cc.rect(40,63,4,4))
    pqc_wen_bottom:setSize(cc.size(412,293))
    pqc_wen_bottom:setAnchorPoint(cc.p(0.5,0.5))
    public_quick_charge:appendComponent(pqc_wen_bottom)
    pqc_wen_bottom:setPositionInContainer(cc.p(481,322.5))
    table_public_quick_charge["pqc_wen_bottom"] = pqc_wen_bottom

    local pqc_zhou = fc.FExtensionsImage:create()
    pqc_zhou:setImage("nobatch/shengzhi_zhou.png")
    pqc_zhou:setSize(cc.size(52,534))
    pqc_zhou:setRotation(90)
    pqc_zhou:setAnchorPoint(cc.p(0.5,0.5))
    public_quick_charge:appendComponent(pqc_zhou)
    pqc_zhou:setPositionInContainer(cc.p(480,169))
    table_public_quick_charge["pqc_zhou"] = pqc_zhou

    local pqc_zhou = fc.FExtensionsImage:create()
    pqc_zhou:setImage("nobatch/shengzhi_zhou.png")
    pqc_zhou:setSize(cc.size(52,534))
    pqc_zhou:setRotation(90)
    pqc_zhou:setAnchorPoint(cc.p(0.5,0.5))
    public_quick_charge:appendComponent(pqc_zhou)
    pqc_zhou:setPositionInContainer(cc.p(480,467))
    table_public_quick_charge["pqc_zhou"] = pqc_zhou

    local pqc_rect1 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongditu2_huodong.png",cc.rect(1,1,1,1))
    pqc_rect1:setSize(cc.size(384,251))
    pqc_rect1:setAnchorPoint(cc.p(0.5,0.5))
    public_quick_charge:appendComponent(pqc_rect1)
    pqc_rect1:setPositionInContainer(cc.p(480,318.5))
    table_public_quick_charge["pqc_rect1"] = pqc_rect1

    local pqc_rect2 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongbiankuang2_ciguan.png",cc.rect(44,15,1,1))
    pqc_rect2:setSize(cc.size(384,251))
    pqc_rect2:setAnchorPoint(cc.p(0.5,0.5))
    public_quick_charge:appendComponent(pqc_rect2)
    pqc_rect2:setPositionInContainer(cc.p(480,318.5))
    table_public_quick_charge["pqc_rect2"] = pqc_rect2

    local pqc_rect3 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongditu_huodong.png",cc.rect(3,3,2,2))
    pqc_rect3:setSize(cc.size(380,79))
    pqc_rect3:setAnchorPoint(cc.p(0.5,0.5))
    public_quick_charge:appendComponent(pqc_rect3)
    pqc_rect3:setPositionInContainer(cc.p(479,294.5))
    table_public_quick_charge["pqc_rect3"] = pqc_rect3

    local pqc_title_bg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/xingjikuang_tangquanxinggong.png",cc.rect(72,17,2,2))
    pqc_title_bg:setSize(cc.size(260,50))
    pqc_title_bg:setAnchorPoint(cc.p(0.5,0.5))
    public_quick_charge:appendComponent(pqc_title_bg)
    pqc_title_bg:setPositionInContainer(cc.p(480,169))
    table_public_quick_charge["pqc_title_bg"] = pqc_title_bg

    local pqc_ti = fc.FExtensionsImage:create()
    pqc_ti:setImage("batch_ui/ti2_uizi.png")
    pqc_ti:setSize(cc.size(32,32))
    pqc_ti:setAnchorPoint(cc.p(0.5,0.5))
    public_quick_charge:appendComponent(pqc_ti)
    pqc_ti:setPositionInContainer(cc.p(454,169))
    table_public_quick_charge["pqc_ti"] = pqc_ti

    local pqc_tips = fc.FLabel:createBMFont()
    pqc_tips:setSize(cc.size(380,49))
    pqc_tips:setWidth(380)
    pqc_tips:setAnchorPoint(cc.p(0.5,0.5))
    pqc_tips:setFontSize(20)
    pqc_tips:setString("元宝不足，是否前往充值？")
    pqc_tips:setColor(cc.c3b(91,24,6))
    public_quick_charge:appendComponent(pqc_tips)
    pqc_tips:setPositionInContainer(cc.p(479,294.5))
    table_public_quick_charge["pqc_tips"] = pqc_tips

    local pqc_chongzhi = fc.FScaleButton:create()
    pqc_chongzhi:setSize(cc.size(146,53))
    pqc_chongzhi:setAnchorPoint(cc.p(0.5,0.5))
    pqc_chongzhi:setButtonImage("batch_ui/teshuanniu.png")
    public_quick_charge:appendComponent(pqc_chongzhi)
    pqc_chongzhi:setPositionInContainer(cc.p(575,382.5))
    table_public_quick_charge["pqc_chongzhi"] = pqc_chongzhi

    local pqc_btn_chong = fc.FExtensionsImage:create()
    pqc_btn_chong:setImage("batch_ui/chong_uizi.png")
    pqc_btn_chong:setSize(cc.size(32,32))
    pqc_btn_chong:setAnchorPoint(cc.p(0.5,0.5))
    pqc_chongzhi:appendComponent(pqc_btn_chong)
    pqc_btn_chong:setPositionInContainer(cc.p(45,26))
    table_public_quick_charge["pqc_btn_chong"] = pqc_btn_chong

    local pqc_btn_zhi = fc.FExtensionsImage:create()
    pqc_btn_zhi:setImage("batch_ui/zhi_uizi.png")
    pqc_btn_zhi:setSize(cc.size(32,32))
    pqc_btn_zhi:setAnchorPoint(cc.p(0.5,0.5))
    pqc_chongzhi:appendComponent(pqc_btn_zhi)
    pqc_btn_zhi:setPositionInContainer(cc.p(99,26))
    table_public_quick_charge["pqc_btn_zhi"] = pqc_btn_zhi

    local pqc_guanbi = fc.FScaleButton:create()
    pqc_guanbi:setSize(cc.size(144,53))
    pqc_guanbi:setAnchorPoint(cc.p(0.5,0.5))
    pqc_guanbi:setButtonImage("batch_ui/putonganniu1_up.png")
    public_quick_charge:appendComponent(pqc_guanbi)
    pqc_guanbi:setPositionInContainer(cc.p(386,382.5))
    table_public_quick_charge["pqc_guanbi"] = pqc_guanbi

    local pqc_guan = fc.FExtensionsImage:create()
    pqc_guan:setImage("batch_ui/guan_uizi.png")
    pqc_guan:setSize(cc.size(32,32))
    pqc_guan:setAnchorPoint(cc.p(0.5,0.5))
    pqc_guanbi:appendComponent(pqc_guan)
    pqc_guan:setPositionInContainer(cc.p(46,26))
    table_public_quick_charge["pqc_guan"] = pqc_guan

    local pqc_bi = fc.FExtensionsImage:create()
    pqc_bi:setImage("batch_ui/bi_uizi.png")
    pqc_bi:setSize(cc.size(32,32))
    pqc_bi:setAnchorPoint(cc.p(0.5,0.5))
    pqc_guanbi:appendComponent(pqc_bi)
    pqc_bi:setPositionInContainer(cc.p(98,26))
    table_public_quick_charge["pqc_bi"] = pqc_bi

    local pqc_shi = fc.FExtensionsImage:create()
    pqc_shi:setImage("batch_ui/shi4_uizi.png")
    pqc_shi:setSize(cc.size(32,32))
    pqc_shi:setAnchorPoint(cc.p(0.5,0.5))
    public_quick_charge:appendComponent(pqc_shi)
    pqc_shi:setPositionInContainer(cc.p(506,169))
    table_public_quick_charge["pqc_shi"] = pqc_shi

    return table_public_quick_charge

end

