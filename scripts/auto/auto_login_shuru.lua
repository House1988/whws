function createlogin_shuru()

    local table_login_shuru = {}

    local login_shuru = fc.FContainerPanel:create()
    login_shuru:setSize(cc.size(548,264))
    table_login_shuru["login_shuru"] = login_shuru

    local shengzhi_rb = fc.FExtensionsImage:create()
    shengzhi_rb:setImage("nobatch/shengzhi2.png")
    shengzhi_rb:setSize(cc.size(250,111))
    shengzhi_rb:setFlipType(4)
    shengzhi_rb:setAnchorPoint(cc.p(0.5,0.5))
    login_shuru:appendComponent(shengzhi_rb)
    shengzhi_rb:setPositionInContainer(cc.p(399,187.5))
    table_login_shuru["shengzhi_rb"] = shengzhi_rb

    local shengzhi_ra = fc.FExtensionsImage:create()
    shengzhi_ra:setImage("nobatch/shengzhi2.png")
    shengzhi_ra:setSize(cc.size(250,111))
    shengzhi_ra:setAnchorPoint(cc.p(0.5,0.5))
    login_shuru:appendComponent(shengzhi_ra)
    shengzhi_ra:setPositionInContainer(cc.p(399,76.5))
    table_login_shuru["shengzhi_ra"] = shengzhi_ra

    local shengzhi_lb = fc.FExtensionsImage:create()
    shengzhi_lb:setImage("nobatch/shengzhi2.png")
    shengzhi_lb:setSize(cc.size(250,111))
    shengzhi_lb:setFlipType(8)
    shengzhi_lb:setAnchorPoint(cc.p(0.5,0.5))
    login_shuru:appendComponent(shengzhi_lb)
    shengzhi_lb:setPositionInContainer(cc.p(149,187.5))
    table_login_shuru["shengzhi_lb"] = shengzhi_lb

    local shengzhi_la = fc.FExtensionsImage:create()
    shengzhi_la:setImage("nobatch/shengzhi2.png")
    shengzhi_la:setSize(cc.size(250,111))
    shengzhi_la:setFlipType(2)
    shengzhi_la:setAnchorPoint(cc.p(0.5,0.5))
    login_shuru:appendComponent(shengzhi_la)
    shengzhi_la:setPositionInContainer(cc.p(149,76.5))
    table_login_shuru["shengzhi_la"] = shengzhi_la

    local login_shuru_start_button = fc.FButton:create()
    login_shuru_start_button:setSize(cc.size(268,67))
    login_shuru_start_button:setAnchorPoint(cc.p(0.5,0.5))
    login_shuru_start_button:setButtonImage("batch_ui/kaishiyouxi_up.png","batch_ui/kaishiyouxi_down.png","batch_ui/kaishiyouxi_up.png")
    login_shuru:appendComponent(login_shuru_start_button)
    login_shuru_start_button:setPositionInContainer(cc.p(253,189.5))
    table_login_shuru["login_shuru_start_button"] = login_shuru_start_button

    local login_shuru_fuwuqi_bg = fc.FButton:create()
    login_shuru_fuwuqi_bg:setSize(cc.size(367,46))
    login_shuru_fuwuqi_bg:setAnchorPoint(cc.p(0.5,0.5))
    login_shuru_fuwuqi_bg:setButtonImage("batch_ui/wenzishurukuang_denglu.png","batch_ui/wenzishurukuang_denglu.png","batch_ui/wenzishurukuang_denglu.png")
    login_shuru:appendComponent(login_shuru_fuwuqi_bg)
    login_shuru_fuwuqi_bg:setPositionInContainer(cc.p(246.5,76))
    table_login_shuru["login_shuru_fuwuqi_bg"] = login_shuru_fuwuqi_bg

    local login_shuru_zhanghao_button = fc.FButton:create()
    login_shuru_zhanghao_button:setSize(cc.size(367,46))
    login_shuru_zhanghao_button:setAnchorPoint(cc.p(0.5,0.5))
    login_shuru_zhanghao_button:setButtonImage("batch_ui/wenzishurukuang_denglu.png","batch_ui/wenzishurukuang_denglu.png","batch_ui/wenzishurukuang_denglu.png")
    login_shuru:appendComponent(login_shuru_zhanghao_button)
    login_shuru_zhanghao_button:setPositionInContainer(cc.p(246.5,128))
    table_login_shuru["login_shuru_zhanghao_button"] = login_shuru_zhanghao_button

    local login_shuru_zhanghao_label = fc.FLabel:createBMFont()
    login_shuru_zhanghao_label:setSize(cc.size(80,30))
    login_shuru_zhanghao_label:setAnchorPoint(cc.p(0.5,0.5))
    login_shuru_zhanghao_label:setFontSize(20)
    login_shuru_zhanghao_label:setString("账号：")
    login_shuru_zhanghao_label:setColor(cc.c3b(95,54,34))
    login_shuru:appendComponent(login_shuru_zhanghao_label)
    login_shuru_zhanghao_label:setPositionInContainer(cc.p(115,124))
    table_login_shuru["login_shuru_zhanghao_label"] = login_shuru_zhanghao_label

    local user_name = fc.FLabel:createSystemFont()
    user_name:setSize(cc.size(100,30))
    user_name:setAnchorPoint(cc.p(0.5,0.5))
    user_name:setFontSize(20)
    user_name:setString("")
    user_name:setColor(cc.c3b(95,54,34))
    login_shuru:appendComponent(user_name)
    user_name:setPositionInContainer(cc.p(275,125))
    table_login_shuru["user_name"] = user_name

    local login_cur_server_label = fc.FLabel:createBMFont()
    login_cur_server_label:setSize(cc.size(100,30))
    login_cur_server_label:setAnchorPoint(cc.p(0.5,0.5))
    login_cur_server_label:setFontSize(20)
    login_cur_server_label:setString("")
    login_cur_server_label:setColor(cc.c3b(95,54,34))
    login_shuru:appendComponent(login_cur_server_label)
    login_cur_server_label:setPositionInContainer(cc.p(247,71))
    table_login_shuru["login_cur_server_label"] = login_cur_server_label

    local change_area_label = fc.FLabel:createBMFont()
    change_area_label:setSize(cc.size(60,50))
    change_area_label:setAnchorPoint(cc.p(0.5,0.5))
    change_area_label:setFontSize(20)
    change_area_label:setString("点击\n换区")
    change_area_label:setColor(cc.c3b(95,54,34))
    login_shuru:appendComponent(change_area_label)
    change_area_label:setPositionInContainer(cc.p(465,75))
    table_login_shuru["change_area_label"] = change_area_label

    local login_shuru_bian1_image = fc.FExtensionsImage:create()
    login_shuru_bian1_image:setImage("nobatch/shengzhi_zhou.png")
    login_shuru_bian1_image:setSize(cc.size(39,262))
    login_shuru_bian1_image:setAnchorPoint(cc.p(0.5,0.5))
    login_shuru:appendComponent(login_shuru_bian1_image)
    login_shuru_bian1_image:setPositionInContainer(cc.p(19.5,131))
    table_login_shuru["login_shuru_bian1_image"] = login_shuru_bian1_image

    local login_shuru_bian2_image = fc.FExtensionsImage:create()
    login_shuru_bian2_image:setImage("nobatch/shengzhi_zhou.png")
    login_shuru_bian2_image:setSize(cc.size(39,262))
    login_shuru_bian2_image:setAnchorPoint(cc.p(0.5,0.5))
    login_shuru:appendComponent(login_shuru_bian2_image)
    login_shuru_bian2_image:setPositionInContainer(cc.p(527.5,132))
    table_login_shuru["login_shuru_bian2_image"] = login_shuru_bian2_image

    return table_login_shuru

end

