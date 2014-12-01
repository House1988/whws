function createmonth_card_day_gift()

    local table_month_card_day_gift = {}

    local month_card_day_gift = fc.FContainerPanel:create()
    month_card_day_gift:setSize(cc.size(412,152))
    table_month_card_day_gift["month_card_day_gift"] = month_card_day_gift

    local mcd_bg1 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongditu2_huodong.png",cc.rect(3,3,2,2))
    mcd_bg1:setSize(cc.size(412,152))
    mcd_bg1:setAnchorPoint(cc.p(0.5,0.5))
    month_card_day_gift:appendComponent(mcd_bg1)
    mcd_bg1:setPositionInContainer(cc.p(206,76))
    table_month_card_day_gift["mcd_bg1"] = mcd_bg1

    local mcd_bg2 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongbiankuang2_ciguan.png",cc.rect(43,15,2,2))
    mcd_bg2:setSize(cc.size(412,152))
    mcd_bg2:setAnchorPoint(cc.p(0.5,0.5))
    month_card_day_gift:appendComponent(mcd_bg2)
    mcd_bg2:setPositionInContainer(cc.p(206,76))
    table_month_card_day_gift["mcd_bg2"] = mcd_bg2

    local mcd_title_bg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/zongjiachengdikuang_tangquanxinggong.png",cc.rect(65,0,6,29))
    mcd_title_bg:setSize(cc.size(205,29))
    mcd_title_bg:setAnchorPoint(cc.p(0.5,0.5))
    mcd_title_bg:setScaleY(-1)
    month_card_day_gift:appendComponent(mcd_title_bg)
    mcd_title_bg:setPositionInContainer(cc.p(206.5,14.5))
    table_month_card_day_gift["mcd_title_bg"] = mcd_title_bg

    local mcd_title_lbl = fc.FLabel:createBMFont()
    mcd_title_lbl:setSize(cc.size(110,25))
    mcd_title_lbl:setAnchorPoint(cc.p(0.5,0.5))
    mcd_title_lbl:setFontSize(21)
    mcd_title_lbl:setString("第二天")
    mcd_title_lbl:setColor(cc.c3b(255,255,0))
    month_card_day_gift:appendComponent(mcd_title_lbl)
    mcd_title_lbl:setPositionInContainer(cc.p(206,10.5))
    table_month_card_day_gift["mcd_title_lbl"] = mcd_title_lbl

    local mcd_already_accept = fc.FExtensionsImage:create()
    mcd_already_accept:setImage("batch_ui/yilingqu_huodong.png")
    mcd_already_accept:setSize(cc.size(114,81))
    mcd_already_accept:setAnchorPoint(cc.p(0.5,0.5))
    month_card_day_gift:appendComponent(mcd_already_accept)
    mcd_already_accept:setPositionInContainer(cc.p(332,80.5))
    table_month_card_day_gift["mcd_already_accept"] = mcd_already_accept

    local mcd_accept_btn = fc.FScaleButton:create()
    mcd_accept_btn:setSize(cc.size(144,51))
    mcd_accept_btn:setAnchorPoint(cc.p(0.5,0.5))
    mcd_accept_btn:setButtonImage("batch_ui/goumai_anniu.png")
    month_card_day_gift:appendComponent(mcd_accept_btn)
    mcd_accept_btn:setPositionInContainer(cc.p(334,83.5))
    table_month_card_day_gift["mcd_accept_btn"] = mcd_accept_btn

    local mcd_ling = fc.FShaderExtensionsImage:create(0)
    mcd_ling:setAnchorPoint(cc.p(0.5,0.5))
    mcd_ling:setImage("batch_ui/ling_uizi.png")
    mcd_ling:setSize(cc.size(32,32))
    mcd_accept_btn:appendComponent(mcd_ling)
    mcd_ling:setPositionInContainer(cc.p(50,22))
    table_month_card_day_gift["mcd_ling"] = mcd_ling

    local mcd_qu = fc.FShaderExtensionsImage:create(0)
    mcd_qu:setAnchorPoint(cc.p(0.5,0.5))
    mcd_qu:setImage("batch_ui/qu_uizi.png")
    mcd_qu:setSize(cc.size(32,32))
    mcd_accept_btn:appendComponent(mcd_qu)
    mcd_qu:setPositionInContainer(cc.p(89,22))
    table_month_card_day_gift["mcd_qu"] = mcd_qu

    return table_month_card_day_gift

end

