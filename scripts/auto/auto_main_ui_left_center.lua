function createmain_ui_left_center()

    local table_main_ui_left_center = {}

    local main_ui_left_center = fc.FContainerPanel:create()
    main_ui_left_center:setSize(cc.size(960,640))
    table_main_ui_left_center["main_ui_left_center"] = main_ui_left_center

    local button_shouchong_reward = fc.FScaleButton:create()
    button_shouchong_reward:setSize(cc.size(84,94))
    button_shouchong_reward:setAnchorPoint(cc.p(0.5,0.5))
    button_shouchong_reward:setButtonImage("batch_ui/gongnenganniu_up.png")
    main_ui_left_center:appendComponent(button_shouchong_reward)
    button_shouchong_reward:setPositionInContainer(cc.p(60,350))
    table_main_ui_left_center["button_shouchong_reward"] = button_shouchong_reward

    local button_open_service_gift = fc.FScaleButton:create()
    button_open_service_gift:setSize(cc.size(85,86))
    button_open_service_gift:setAnchorPoint(cc.p(0.5,0.5))
    button_open_service_gift:setButtonImage("batch_ui/gongnenganniu_up.png")
    button_open_service_gift:setIconImage("batch_ui/qiandaoyouli.png",cc.p(41,41))
    main_ui_left_center:appendComponent(button_open_service_gift)
    button_open_service_gift:setPositionInContainer(cc.p(60.5,447))
    table_main_ui_left_center["button_open_service_gift"] = button_open_service_gift

    local button_keju = fc.FScaleButton:create()
    button_keju:setSize(cc.size(82,82))
    button_keju:setAnchorPoint(cc.p(0.5,0.5))
    button_keju:setButtonImage("batch_ui/gongnenganniu_up.png")
    button_keju:setIconImage("batch_ui/keju.png",cc.p(44,41))
    main_ui_left_center:appendComponent(button_keju)
    button_keju:setPositionInContainer(cc.p(59,166))
    table_main_ui_left_center["button_keju"] = button_keju

    local button_xuanxiu = fc.FScaleButton:create()
    button_xuanxiu:setSize(cc.size(82,82))
    button_xuanxiu:setAnchorPoint(cc.p(0.5,0.5))
    button_xuanxiu:setButtonImage("batch_ui/gongnenganniu_up.png")
    button_xuanxiu:setIconImage("batch_ui/xuanxiu.png",cc.p(41,41))
    main_ui_left_center:appendComponent(button_xuanxiu)
    button_xuanxiu:setPositionInContainer(cc.p(59,259))
    table_main_ui_left_center["button_xuanxiu"] = button_xuanxiu

    local pos1 = fc.FContainerPanel:create()
    pos1:setSize(cc.size(82,82))
    pos1:setAnchorPoint(cc.p(0.5,0.5))
    main_ui_left_center:appendComponent(pos1)
    pos1:setPositionInContainer(cc.p(59,352))
    table_main_ui_left_center["pos1"] = pos1

    local pos2 = fc.FContainerPanel:create()
    pos2:setSize(cc.size(82,82))
    pos2:setAnchorPoint(cc.p(0.5,0.5))
    main_ui_left_center:appendComponent(pos2)
    pos2:setPositionInContainer(cc.p(59,446))
    table_main_ui_left_center["pos2"] = pos2

    local pos3 = fc.FContainerPanel:create()
    pos3:setSize(cc.size(82,82))
    pos3:setAnchorPoint(cc.p(0.5,0.5))
    main_ui_left_center:appendComponent(pos3)
    pos3:setPositionInContainer(cc.p(59,539))
    table_main_ui_left_center["pos3"] = pos3

    local button_qiandao = fc.FScaleButton:create()
    button_qiandao:setSize(cc.size(82,82))
    button_qiandao:setAnchorPoint(cc.p(0.5,0.5))
    button_qiandao:setButtonImage("batch_ui/gongnenganniu_up.png")
    button_qiandao:setIconImage("batch_ui/haohuaqiandao.png",cc.p(41,41))
    main_ui_left_center:appendComponent(button_qiandao)
    button_qiandao:setPositionInContainer(cc.p(59,539))
    table_main_ui_left_center["button_qiandao"] = button_qiandao

    return table_main_ui_left_center

end

