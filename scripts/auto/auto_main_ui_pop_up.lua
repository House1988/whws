function createmain_ui_pop_up()

    local table_main_ui_pop_up = {}

    local main_ui_pop_up = fc.FContainerPanel:create()
    main_ui_pop_up:setSize(cc.size(643,211))
    table_main_ui_pop_up["main_ui_pop_up"] = main_ui_pop_up

    local button_xiaoxi = fc.FScaleButton:create()
    button_xiaoxi:setSize(cc.size(96,96))
    button_xiaoxi:setAnchorPoint(cc.p(0.5,0.5))
    button_xiaoxi:setButtonImage("batch_ui/gongnenganniu_up.png")
    button_xiaoxi:setIconImage("batch_ui/xiaoxi_anniu.png",cc.p(48,43))
    main_ui_pop_up:appendComponent(button_xiaoxi)
    button_xiaoxi:setPositionInContainer(cc.p(368,161))
    table_main_ui_pop_up["button_xiaoxi"] = button_xiaoxi

    local button_gonggao = fc.FScaleButton:create()
    button_gonggao:setSize(cc.size(96,96))
    button_gonggao:setAnchorPoint(cc.p(0.5,0.5))
    button_gonggao:setButtonImage("batch_ui/gongnenganniu_up.png")
    button_gonggao:setIconImage("batch_ui/gonggao_anniu.png",cc.p(48,44))
    main_ui_pop_up:appendComponent(button_gonggao)
    button_gonggao:setPositionInContainer(cc.p(154,161))
    table_main_ui_pop_up["button_gonggao"] = button_gonggao

    local button_pp = fc.FScaleButton:create()
    button_pp:setSize(cc.size(96,96))
    button_pp:setAnchorPoint(cc.p(0.5,0.5))
    button_pp:setButtonImage("batch_ui/gongnenganniu_up.png")
    button_pp:setIconImage("batch_ui/yonghuzhongxin_anniu.png",cc.p(48,48))
    main_ui_pop_up:appendComponent(button_pp)
    button_pp:setPositionInContainer(cc.p(48,162))
    table_main_ui_pop_up["button_pp"] = button_pp

    local button_luntan = fc.FScaleButton:create()
    button_luntan:setSize(cc.size(96,96))
    button_luntan:setAnchorPoint(cc.p(0.5,0.5))
    button_luntan:setButtonImage("batch_ui/gongnenganniu_up.png")
    button_luntan:setIconImage("batch_ui/luntan.png",cc.p(48,52))
    main_ui_pop_up:appendComponent(button_luntan)
    button_luntan:setPositionInContainer(cc.p(48,162))
    table_main_ui_pop_up["button_luntan"] = button_luntan

    local button_vip = fc.FScaleButton:create()
    button_vip:setSize(cc.size(96,96))
    button_vip:setAnchorPoint(cc.p(0.5,0.5))
    button_vip:setButtonImage("batch_ui/gongnenganniu_up.png")
    button_vip:setIconImage("batch_ui/vip_anniu.png",cc.p(48,48))
    main_ui_pop_up:appendComponent(button_vip)
    button_vip:setPositionInContainer(cc.p(261,161))
    table_main_ui_pop_up["button_vip"] = button_vip

    local button_exchange_reward = fc.FScaleButton:create()
    button_exchange_reward:setSize(cc.size(96,96))
    button_exchange_reward:setAnchorPoint(cc.p(0.5,0.5))
    button_exchange_reward:setButtonImage("batch_ui/gongnenganniu_up.png")
    button_exchange_reward:setIconImage("batch_ui/jiangli.png",cc.p(41,36))
    main_ui_pop_up:appendComponent(button_exchange_reward)
    button_exchange_reward:setPositionInContainer(cc.p(474,161))
    table_main_ui_pop_up["button_exchange_reward"] = button_exchange_reward

    local button_tujian = fc.FScaleButton:create()
    button_tujian:setSize(cc.size(96,96))
    button_tujian:setAnchorPoint(cc.p(0.5,0.5))
    button_tujian:setButtonImage("batch_ui/gongnenganniu_up.png")
    button_tujian:setIconImage("batch_ui/tujian.png",cc.p(52,40))
    main_ui_pop_up:appendComponent(button_tujian)
    button_tujian:setPositionInContainer(cc.p(580,161))
    table_main_ui_pop_up["button_tujian"] = button_tujian

    local button_setting = fc.FScaleButton:create()
    button_setting:setSize(cc.size(96,96))
    button_setting:setAnchorPoint(cc.p(0.5,0.5))
    button_setting:setButtonImage("batch_ui/gongnenganniu_up.png")
    button_setting:setIconImage("batch_ui/shezhi.png",cc.p(48,48))
    main_ui_pop_up:appendComponent(button_setting)
    button_setting:setPositionInContainer(cc.p(580,55))
    table_main_ui_pop_up["button_setting"] = button_setting

    return table_main_ui_pop_up

end

