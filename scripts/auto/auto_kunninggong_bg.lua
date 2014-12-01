function createkunninggong_bg()

    local table_kunninggong_bg = {}

    local kunninggong_bg = fc.FContainerPanel:create()
    kunninggong_bg:setSize(cc.size(960,580))
    table_kunninggong_bg["kunninggong_bg"] = kunninggong_bg

    local title_list_bg = fc.FExtensionsImage:create()
    title_list_bg:setImage("nobatch/diwen2_tangquanxinggong.png")
    title_list_bg:setSize(cc.size(210,540))
    title_list_bg:setAnchorPoint(cc.p(0.5,0.5))
    kunninggong_bg:appendComponent(title_list_bg)
    title_list_bg:setPositionInContainer(cc.p(110,282))
    table_kunninggong_bg["title_list_bg"] = title_list_bg

    local top_bar = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongbiankuang3_ciguan.png",cc.rect(40,0,2,13))
    top_bar:setSize(cc.size(215,13))
    top_bar:setAnchorPoint(cc.p(0.5,0.5))
    kunninggong_bg:appendComponent(top_bar)
    top_bar:setPositionInContainer(cc.p(107.5,6.5))
    table_kunninggong_bg["top_bar"] = top_bar

    local bottom_bar = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongbiankuang3_ciguan.png",cc.rect(40,0,2,13))
    bottom_bar:setSize(cc.size(215,13))
    bottom_bar:setAnchorPoint(cc.p(0.5,0.5))
    bottom_bar:setScaleY(-1)
    kunninggong_bg:appendComponent(bottom_bar)
    bottom_bar:setPositionInContainer(cc.p(107.5,558.5))
    table_kunninggong_bg["bottom_bar"] = bottom_bar

    local con_lt = fc.FExtensionsImage:create()
    con_lt:setImage("batch_ui/tongyongbiankuang4_tangquanxinggong.png")
    con_lt:setSize(cc.size(25,27))
    con_lt:setFlipType(2)
    con_lt:setAnchorPoint(cc.p(0.5,0.5))
    kunninggong_bg:appendComponent(con_lt)
    con_lt:setPositionInContainer(cc.p(17.5,26.5))
    table_kunninggong_bg["con_lt"] = con_lt

    local con_lb = fc.FExtensionsImage:create()
    con_lb:setImage("batch_ui/tongyongbiankuang4_tangquanxinggong.png")
    con_lb:setSize(cc.size(25,27))
    con_lb:setFlipType(8)
    con_lb:setAnchorPoint(cc.p(0.5,0.5))
    kunninggong_bg:appendComponent(con_lb)
    con_lb:setPositionInContainer(cc.p(17.5,551.5))
    table_kunninggong_bg["con_lb"] = con_lb

    local con_rt = fc.FExtensionsImage:create()
    con_rt:setImage("batch_ui/tongyongbiankuang4_tangquanxinggong.png")
    con_rt:setSize(cc.size(25,27))
    con_rt:setAnchorPoint(cc.p(0.5,0.5))
    kunninggong_bg:appendComponent(con_rt)
    con_rt:setPositionInContainer(cc.p(202.5,26.5))
    table_kunninggong_bg["con_rt"] = con_rt

    local con_rb = fc.FExtensionsImage:create()
    con_rb:setImage("batch_ui/tongyongbiankuang4_tangquanxinggong.png")
    con_rb:setSize(cc.size(25,27))
    con_rb:setFlipType(4)
    con_rb:setAnchorPoint(cc.p(0.5,0.5))
    kunninggong_bg:appendComponent(con_rb)
    con_rb:setPositionInContainer(cc.p(202.5,551.5))
    table_kunninggong_bg["con_rb"] = con_rb

    local shutiao = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tangquanxinggongbar_tangquanxinggong.png",cc.rect(0,56,25,2))
    shutiao:setSize(cc.size(25,565))
    shutiao:setAnchorPoint(cc.p(0.5,0.5))
    kunninggong_bg:appendComponent(shutiao)
    shutiao:setPositionInContainer(cc.p(2.5,282.5))
    table_kunninggong_bg["shutiao"] = shutiao

    local shutiao = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tangquanxinggongbar_tangquanxinggong.png",cc.rect(0,56,25,2))
    shutiao:setSize(cc.size(25,565))
    shutiao:setAnchorPoint(cc.p(0.5,0.5))
    kunninggong_bg:appendComponent(shutiao)
    shutiao:setPositionInContainer(cc.p(217.5,282.5))
    table_kunninggong_bg["shutiao"] = shutiao

    local con_lb = fc.FExtensionsImage:create()
    con_lb:setImage("batch_ui/tongyongbiankuang4_tangquanxinggong.png")
    con_lb:setSize(cc.size(25,27))
    con_lb:setFlipType(8)
    con_lb:setAnchorPoint(cc.p(0.5,0.5))
    kunninggong_bg:appendComponent(con_lb)
    con_lb:setPositionInContainer(cc.p(232.5,26.5))
    table_kunninggong_bg["con_lb"] = con_lb

    local con_lb = fc.FExtensionsImage:create()
    con_lb:setImage("batch_ui/tongyongbiankuang4_tangquanxinggong.png")
    con_lb:setSize(cc.size(25,27))
    con_lb:setFlipType(8)
    con_lb:setAnchorPoint(cc.p(0.5,0.5))
    kunninggong_bg:appendComponent(con_lb)
    con_lb:setPositionInContainer(cc.p(232.5,551.5))
    table_kunninggong_bg["con_lb"] = con_lb

    return table_kunninggong_bg

end

