function createlogin_xuanfu_tiao()

    local table_login_xuanfu_tiao = {}

    local login_xuanfu_tiao = fc.FContainerPanel:create()
    login_xuanfu_tiao:setSize(cc.size(357,40))
    table_login_xuanfu_tiao["login_xuanfu_tiao"] = login_xuanfu_tiao

    local login_xf_t_weixuanzhong = fc.FExtensionsImage:create()
    login_xf_t_weixuanzhong:setImage("batch_ui/xuanzefuwuqi_dikuang2_denglu.png")
    login_xf_t_weixuanzhong:setSize(cc.size(357,40))
    login_xf_t_weixuanzhong:setAnchorPoint(cc.p(0.5,0.5))
    login_xuanfu_tiao:appendComponent(login_xf_t_weixuanzhong)
    login_xf_t_weixuanzhong:setPositionInContainer(cc.p(178.5,20))
    table_login_xuanfu_tiao["login_xf_t_weixuanzhong"] = login_xf_t_weixuanzhong

    local login_xf_t_xuanzhong = fc.FExtensionsImage:create()
    login_xf_t_xuanzhong:setImage("batch_ui/xuanzefuwuqi_xuanzhongkuang_denglu.png")
    login_xf_t_xuanzhong:setSize(cc.size(357,40))
    login_xf_t_xuanzhong:setAnchorPoint(cc.p(0.5,0.5))
    login_xuanfu_tiao:appendComponent(login_xf_t_xuanzhong)
    login_xf_t_xuanzhong:setPositionInContainer(cc.p(178.5,20))
    table_login_xuanfu_tiao["login_xf_t_xuanzhong"] = login_xf_t_xuanzhong

    local login_xf_t_fuwuqi_name = fc.FLabel:createBMFont()
    login_xf_t_fuwuqi_name:setSize(cc.size(140,30))
    login_xf_t_fuwuqi_name:setAnchorPoint(cc.p(0.5,0.5))
    login_xf_t_fuwuqi_name:setFontSize(20)
    login_xf_t_fuwuqi_name:setString("6区-福星高照")
    login_xf_t_fuwuqi_name:setColor(cc.c3b(95,54,34))
    login_xuanfu_tiao:appendComponent(login_xf_t_fuwuqi_name)
    login_xf_t_fuwuqi_name:setPositionInContainer(cc.p(134,16))
    table_login_xuanfu_tiao["login_xf_t_fuwuqi_name"] = login_xf_t_fuwuqi_name

    local login_xf_t_fuwuqi_state = fc.FLabel:createBMFont()
    login_xf_t_fuwuqi_state:setSize(cc.size(90,30))
    login_xf_t_fuwuqi_state:setAnchorPoint(cc.p(0.5,0.5))
    login_xf_t_fuwuqi_state:setFontSize(20)
    login_xf_t_fuwuqi_state:setString("【新服】")
    login_xf_t_fuwuqi_state:setColor(cc.c3b(55,87,251))
    login_xuanfu_tiao:appendComponent(login_xf_t_fuwuqi_state)
    login_xf_t_fuwuqi_state:setPositionInContainer(cc.p(249,16))
    table_login_xuanfu_tiao["login_xf_t_fuwuqi_state"] = login_xf_t_fuwuqi_state

    return table_login_xuanfu_tiao

end

