function createopen_service_gift()

    local table_open_service_gift = {}

    local open_service_gift = fc.FContainerPanel:create()
    open_service_gift:setSize(cc.size(960,640))
    table_open_service_gift["open_service_gift"] = open_service_gift

    local os_bg1 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/jiangli_diut.png",cc.rect(4,4,2,2))
    os_bg1:setSize(cc.size(550,525))
    os_bg1:setAnchorPoint(cc.p(0.5,0.5))
    open_service_gift:appendComponent(os_bg1)
    os_bg1:setPositionInContainer(cc.p(480,345.5))
    table_open_service_gift["os_bg1"] = os_bg1

    local os_page_panel = fc.FContainerPanel:create()
    os_page_panel:setSize(cc.size(516,525))
    os_page_panel:setAnchorPoint(cc.p(0.5,0.5))
    open_service_gift:appendComponent(os_page_panel)
    os_page_panel:setPositionInContainer(cc.p(480,347.5))
    table_open_service_gift["os_page_panel"] = os_page_panel

    local os_door_bg = fc.FScale9Image:createWithBatchUIFrame("nobatch/benguanjiangli_kuang.png",cc.rect(105,112,4,4))
    os_door_bg:setSize(cc.size(606,612))
    os_door_bg:setAnchorPoint(cc.p(0.5,0.5))
    open_service_gift:appendComponent(os_door_bg)
    os_door_bg:setPositionInContainer(cc.p(480,320))
    table_open_service_gift["os_door_bg"] = os_door_bg

    local os_kai = fc.FExtensionsImage:create()
    os_kai:setImage("batch_ui/qian(1).png")
    os_kai:setSize(cc.size(59,59))
    os_kai:setAnchorPoint(cc.p(0.5,0.5))
    open_service_gift:appendComponent(os_kai)
    os_kai:setPositionInContainer(cc.p(394.5,54.5))
    table_open_service_gift["os_kai"] = os_kai

    local os_fu = fc.FExtensionsImage:create()
    os_fu:setImage("batch_ui/dao.png")
    os_fu:setSize(cc.size(59,59))
    os_fu:setAnchorPoint(cc.p(0.5,0.5))
    open_service_gift:appendComponent(os_fu)
    os_fu:setPositionInContainer(cc.p(454.5,54.5))
    table_open_service_gift["os_fu"] = os_fu

    local os_you = fc.FExtensionsImage:create()
    os_you:setImage("batch_ui/you1.png")
    os_you:setSize(cc.size(56,56))
    os_you:setAnchorPoint(cc.p(0.5,0.5))
    open_service_gift:appendComponent(os_you)
    os_you:setPositionInContainer(cc.p(515,56))
    table_open_service_gift["os_you"] = os_you

    local os_li = fc.FExtensionsImage:create()
    os_li:setImage("batch_ui/li3.png")
    os_li:setSize(cc.size(59,59))
    os_li:setAnchorPoint(cc.p(0.5,0.5))
    open_service_gift:appendComponent(os_li)
    os_li:setPositionInContainer(cc.p(574.5,61.5))
    table_open_service_gift["os_li"] = os_li

    local os_close_btn = fc.FScaleButton:create()
    os_close_btn:setSize(cc.size(44,45))
    os_close_btn:setAnchorPoint(cc.p(0.5,0.5))
    os_close_btn:setButtonImage("batch_ui/libaoduihuan_guanbijian.png")
    open_service_gift:appendComponent(os_close_btn)
    os_close_btn:setPositionInContainer(cc.p(688,61.5))
    table_open_service_gift["os_close_btn"] = os_close_btn

    return table_open_service_gift

end

