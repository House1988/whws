function createmingchenxuanze_middle()

    local table_mingchenxuanze_middle = {}

    local mingchenxuanze_middle = fc.FContainerPanel:create()
    mingchenxuanze_middle:setSize(cc.size(960,640))
    table_mingchenxuanze_middle["mingchenxuanze_middle"] = mingchenxuanze_middle

    local xuanze_container_panel1 = fc.FContainerPanel:create()
    xuanze_container_panel1:setSize(cc.size(38,60))
    xuanze_container_panel1:setAnchorPoint(cc.p(0.5,0.5))
    mingchenxuanze_middle:appendComponent(xuanze_container_panel1)
    xuanze_container_panel1:setPositionInContainer(cc.p(21,325))
    table_mingchenxuanze_middle["xuanze_container_panel1"] = xuanze_container_panel1

    local xuanze_pre_page_button = fc.FScaleButton:create()
    xuanze_pre_page_button:setSize(cc.size(38,60))
    xuanze_pre_page_button:setAnchorPoint(cc.p(0.5,0.5))
    xuanze_pre_page_button:setButtonImage("batch_ui/jiantou2.png")
    xuanze_container_panel1:appendComponent(xuanze_pre_page_button)
    xuanze_pre_page_button:setPositionInContainer(cc.p(19,30))
    table_mingchenxuanze_middle["xuanze_pre_page_button"] = xuanze_pre_page_button

    local xuanze_container_panel2 = fc.FContainerPanel:create()
    xuanze_container_panel2:setSize(cc.size(38,60))
    xuanze_container_panel2:setAnchorPoint(cc.p(0.5,0.5))
    mingchenxuanze_middle:appendComponent(xuanze_container_panel2)
    xuanze_container_panel2:setPositionInContainer(cc.p(936,325))
    table_mingchenxuanze_middle["xuanze_container_panel2"] = xuanze_container_panel2

    local xuanze_back_page_button = fc.FScaleButton:create()
    xuanze_back_page_button:setSize(cc.size(38,60))
    xuanze_back_page_button:setAnchorPoint(cc.p(0.5,0.5))
    xuanze_back_page_button:setButtonImage("batch_ui/jiantou2.png")
    xuanze_back_page_button:setScaleX(-1)
    xuanze_container_panel2:appendComponent(xuanze_back_page_button)
    xuanze_back_page_button:setPositionInContainer(cc.p(19,30))
    table_mingchenxuanze_middle["xuanze_back_page_button"] = xuanze_back_page_button

    return table_mingchenxuanze_middle

end

