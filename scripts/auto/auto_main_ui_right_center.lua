function createmain_ui_right_center()

    local table_main_ui_right_center = {}

    local main_ui_right_center = fc.FContainerPanel:create()
    main_ui_right_center:setSize(cc.size(960,640))
    table_main_ui_right_center["main_ui_right_center"] = main_ui_right_center

    local button_buzhen = fc.FScaleButton:create()
    button_buzhen:setSize(cc.size(82,82))
    button_buzhen:setAnchorPoint(cc.p(0.5,0.5))
    button_buzhen:setButtonImage("batch_ui/gongnenganniu_up.png")
    button_buzhen:setIconImage("batch_ui/buzhen_anniu.png",cc.p(41,41))
    main_ui_right_center:appendComponent(button_buzhen)
    button_buzhen:setPositionInContainer(cc.p(919,173))
    table_main_ui_right_center["button_buzhen"] = button_buzhen

    local button_beibao = fc.FScaleButton:create()
    button_beibao:setSize(cc.size(82,82))
    button_beibao:setAnchorPoint(cc.p(0.5,0.5))
    button_beibao:setButtonImage("batch_ui/gongnenganniu_up.png")
    button_beibao:setIconImage("batch_ui/guoku_anniu.png",cc.p(38,41))
    main_ui_right_center:appendComponent(button_beibao)
    button_beibao:setPositionInContainer(cc.p(919,270))
    table_main_ui_right_center["button_beibao"] = button_beibao

    local button_jingjichang = fc.FScaleButton:create()
    button_jingjichang:setSize(cc.size(82,82))
    button_jingjichang:setAnchorPoint(cc.p(0.5,0.5))
    button_jingjichang:setButtonImage("batch_ui/gongnenganniu_up.png")
    button_jingjichang:setIconImage("batch_ui/baye_anniu.png",cc.p(41,41))
    main_ui_right_center:appendComponent(button_jingjichang)
    button_jingjichang:setPositionInContainer(cc.p(919,368))
    table_main_ui_right_center["button_jingjichang"] = button_jingjichang

    local button_leaderboard = fc.FScaleButton:create()
    button_leaderboard:setSize(cc.size(82,82))
    button_leaderboard:setAnchorPoint(cc.p(0.5,0.5))
    button_leaderboard:setButtonImage("batch_ui/gongnenganniu_up.png")
    button_leaderboard:setIconImage("batch_ui/diwangbang.png",cc.p(41,41))
    main_ui_right_center:appendComponent(button_leaderboard)
    button_leaderboard:setPositionInContainer(cc.p(919,465))
    table_main_ui_right_center["button_leaderboard"] = button_leaderboard

    return table_main_ui_right_center

end

