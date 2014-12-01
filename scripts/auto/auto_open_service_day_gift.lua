function createopen_service_day_gift()

    local table_open_service_day_gift = {}

    local open_service_day_gift = fc.FContainerPanel:create()
    open_service_day_gift:setSize(cc.size(516,175))
    table_open_service_day_gift["open_service_day_gift"] = open_service_day_gift

    local od_bg3 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongditu2_ciguan.png",cc.rect(3,3,2,2))
    od_bg3:setSize(cc.size(516,36))
    od_bg3:setAnchorPoint(cc.p(0.5,0.5))
    open_service_day_gift:appendComponent(od_bg3)
    od_bg3:setPositionInContainer(cc.p(258,153))
    table_open_service_day_gift["od_bg3"] = od_bg3

    local od_bg2 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongditu1_ciguan.png",cc.rect(3,3,2,2))
    od_bg2:setSize(cc.size(516,89))
    od_bg2:setAnchorPoint(cc.p(0.5,0.5))
    open_service_day_gift:appendComponent(od_bg2)
    od_bg2:setPositionInContainer(cc.p(258,90.5))
    table_open_service_day_gift["od_bg2"] = od_bg2

    local od_bg1 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongditu2_ciguan.png",cc.rect(3,3,2,2))
    od_bg1:setSize(cc.size(516,40))
    od_bg1:setAnchorPoint(cc.p(0.5,0.5))
    open_service_day_gift:appendComponent(od_bg1)
    od_bg1:setPositionInContainer(cc.p(258,26))
    table_open_service_day_gift["od_bg1"] = od_bg1

    local od_bg4 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongbiankuang2_ciguan.png",cc.rect(43,15,2,2))
    od_bg4:setSize(cc.size(516,166))
    od_bg4:setAnchorPoint(cc.p(0.5,0.5))
    open_service_day_gift:appendComponent(od_bg4)
    od_bg4:setPositionInContainer(cc.p(258,89))
    table_open_service_day_gift["od_bg4"] = od_bg4

    local od_title_bg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/zongjiachengdikuang_tangquanxinggong.png",cc.rect(65,13,6,3))
    od_title_bg:setSize(cc.size(485,29))
    od_title_bg:setAnchorPoint(cc.p(0.5,0.5))
    open_service_day_gift:appendComponent(od_title_bg)
    od_title_bg:setPositionInContainer(cc.p(258.5,29.5))
    table_open_service_day_gift["od_title_bg"] = od_title_bg

    local od_title_lbl = fc.FLabel:createBMFont()
    od_title_lbl:setSize(cc.size(165,25))
    od_title_lbl:setAnchorPoint(cc.p(0.5,0.5))
    od_title_lbl:setFontSize(21)
    od_title_lbl:setString("登录第二天")
    od_title_lbl:setColor(cc.c3b(226,223,145))
    open_service_day_gift:appendComponent(od_title_lbl)
    od_title_lbl:setPositionInContainer(cc.p(258.5,24.5))
    table_open_service_day_gift["od_title_lbl"] = od_title_lbl

    local od_already_accept = fc.FExtensionsImage:create()
    od_already_accept:setImage("batch_ui/yilingqu_huodong.png")
    od_already_accept:setSize(cc.size(114,81))
    od_already_accept:setAnchorPoint(cc.p(0.5,0.5))
    open_service_day_gift:appendComponent(od_already_accept)
    od_already_accept:setPositionInContainer(cc.p(431,94.5))
    table_open_service_day_gift["od_already_accept"] = od_already_accept

    local od_accept_btn = fc.FScaleButton:create()
    od_accept_btn:setSize(cc.size(146,53))
    od_accept_btn:setAnchorPoint(cc.p(0.5,0.5))
    od_accept_btn:setButtonImage("batch_ui/teshuanniu.png")
    open_service_day_gift:appendComponent(od_accept_btn)
    od_accept_btn:setPositionInContainer(cc.p(431,94.5))
    table_open_service_day_gift["od_accept_btn"] = od_accept_btn

    local od_ling = fc.FShaderExtensionsImage:create(0)
    od_ling:setAnchorPoint(cc.p(0.5,0.5))
    od_ling:setImage("batch_ui/ling_uizi.png")
    od_ling:setSize(cc.size(32,32))
    od_accept_btn:appendComponent(od_ling)
    od_ling:setPositionInContainer(cc.p(46,26))
    table_open_service_day_gift["od_ling"] = od_ling

    local od_qu = fc.FShaderExtensionsImage:create(0)
    od_qu:setAnchorPoint(cc.p(0.5,0.5))
    od_qu:setImage("batch_ui/qu_uizi.png")
    od_qu:setSize(cc.size(32,32))
    od_accept_btn:appendComponent(od_qu)
    od_qu:setPositionInContainer(cc.p(100,26))
    table_open_service_day_gift["od_qu"] = od_qu

    return table_open_service_day_gift

end

