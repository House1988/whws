function createmonth_card_gift()

    local table_month_card_gift = {}

    local month_card_gift = fc.FContainerPanel:create()
    month_card_gift:setSize(cc.size(960,640))
    table_month_card_gift["month_card_gift"] = month_card_gift

    local mcg_panel = fc.FContainerPanel:create()
    mcg_panel:setSize(cc.size(534,554))
    mcg_panel:setAnchorPoint(cc.p(0.5,0.5))
    month_card_gift:appendComponent(mcg_panel)
    mcg_panel:setPositionInContainer(cc.p(480,323.5))
    table_month_card_gift["mcg_panel"] = mcg_panel

    local mcg_image_bg_lu = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shengzhi_ditu.png",cc.rect(40,63,4,4))
    mcg_image_bg_lu:setSize(cc.size(412,500))
    mcg_image_bg_lu:setAnchorPoint(cc.p(0.5,0.5))
    mcg_panel:appendComponent(mcg_image_bg_lu)
    mcg_image_bg_lu:setPositionInContainer(cc.p(267,279))
    table_month_card_gift["mcg_image_bg_lu"] = mcg_image_bg_lu

    local mcg_image_bg_up = fc.FExtensionsImage:create()
    mcg_image_bg_up:setImage("nobatch/shengzhi_zhou.png")
    mcg_image_bg_up:setSize(cc.size(52,534))
    mcg_image_bg_up:setRotation(90)
    mcg_image_bg_up:setAnchorPoint(cc.p(0.5,0.5))
    mcg_panel:appendComponent(mcg_image_bg_up)
    mcg_image_bg_up:setPositionInContainer(cc.p(267,26))
    table_month_card_gift["mcg_image_bg_up"] = mcg_image_bg_up

    local mcg_ttitle_bg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/xingjikuang_tangquanxinggong.png",cc.rect(62,0,2,29))
    mcg_ttitle_bg:setSize(cc.size(300,42))
    mcg_ttitle_bg:setAnchorPoint(cc.p(0.5,0.5))
    mcg_panel:appendComponent(mcg_ttitle_bg)
    mcg_ttitle_bg:setPositionInContainer(cc.p(267,26))
    table_month_card_gift["mcg_ttitle_bg"] = mcg_ttitle_bg

    local mcg_image_bg_bottom = fc.FExtensionsImage:create()
    mcg_image_bg_bottom:setImage("nobatch/shengzhi_zhou.png")
    mcg_image_bg_bottom:setSize(cc.size(52,534))
    mcg_image_bg_bottom:setRotation(90)
    mcg_image_bg_bottom:setAnchorPoint(cc.p(0.5,0.5))
    mcg_panel:appendComponent(mcg_image_bg_bottom)
    mcg_image_bg_bottom:setPositionInContainer(cc.p(267,528))
    table_month_card_gift["mcg_image_bg_bottom"] = mcg_image_bg_bottom

    local mcg_yue = fc.FExtensionsImage:create()
    mcg_yue:setImage("batch_ui/yue (2).png")
    mcg_yue:setSize(cc.size(59,59))
    mcg_yue:setAnchorPoint(cc.p(0.5,0.5))
    mcg_panel:appendComponent(mcg_yue)
    mcg_yue:setPositionInContainer(cc.p(178.5,12.5))
    table_month_card_gift["mcg_yue"] = mcg_yue

    local mcg_ka = fc.FExtensionsImage:create()
    mcg_ka:setImage("batch_ui/ka.png")
    mcg_ka:setSize(cc.size(59,59))
    mcg_ka:setAnchorPoint(cc.p(0.5,0.5))
    mcg_panel:appendComponent(mcg_ka)
    mcg_ka:setPositionInContainer(cc.p(237.5,12.5))
    table_month_card_gift["mcg_ka"] = mcg_ka

    local mcg_li = fc.FExtensionsImage:create()
    mcg_li:setImage("batch_ui/li3.png")
    mcg_li:setSize(cc.size(59,59))
    mcg_li:setAnchorPoint(cc.p(0.5,0.5))
    mcg_panel:appendComponent(mcg_li)
    mcg_li:setPositionInContainer(cc.p(296.5,17.5))
    table_month_card_gift["mcg_li"] = mcg_li

    local mcg_bao = fc.FExtensionsImage:create()
    mcg_bao:setImage("batch_ui/bao (3).png")
    mcg_bao:setSize(cc.size(59,59))
    mcg_bao:setAnchorPoint(cc.p(0.5,0.5))
    mcg_panel:appendComponent(mcg_bao)
    mcg_bao:setPositionInContainer(cc.p(355.5,12.5))
    table_month_card_gift["mcg_bao"] = mcg_bao

    local mcg_rect1 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongditu2_huodong.png",cc.rect(1,1,1,1))
    mcg_rect1:setSize(cc.size(412,458))
    mcg_rect1:setAnchorPoint(cc.p(0.5,0.5))
    mcg_panel:appendComponent(mcg_rect1)
    mcg_rect1:setPositionInContainer(cc.p(267,278))
    table_month_card_gift["mcg_rect1"] = mcg_rect1

    local mcg_close = fc.FScaleButton:create()
    mcg_close:setSize(cc.size(41,45))
    mcg_close:setAnchorPoint(cc.p(0.5,0.5))
    mcg_close:setButtonImage("batch_ui/guanbi_anniu2.png")
    mcg_panel:appendComponent(mcg_close)
    mcg_close:setPositionInContainer(cc.p(500.5,24.5))
    table_month_card_gift["mcg_close"] = mcg_close

    return table_month_card_gift

end

