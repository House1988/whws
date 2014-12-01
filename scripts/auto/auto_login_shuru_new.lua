function createlogin_shuru_new()

    local table_login_shuru_new = {}

    local login_shuru_new = fc.FContainerPanel:create()
    login_shuru_new:setSize(cc.size(530,291))
    table_login_shuru_new["login_shuru_new"] = login_shuru_new

    local shengzhi_la = fc.FExtensionsImage:create()
    shengzhi_la:setImage("batch_ui/denglu_juanzhouditu.png")
    shengzhi_la:setSize(cc.size(490,222))
    shengzhi_la:setAnchorPoint(cc.p(0.5,0.5))
    login_shuru_new:appendComponent(shengzhi_la)
    shengzhi_la:setPositionInContainer(cc.p(265,146))
    table_login_shuru_new["shengzhi_la"] = shengzhi_la

    local juanzhou_rect = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongbiankuang2_ciguan.png",cc.rect(43,15,2,2))
    juanzhou_rect:setSize(cc.size(490,222))
    juanzhou_rect:setAnchorPoint(cc.p(0.5,0.5))
    login_shuru_new:appendComponent(juanzhou_rect)
    juanzhou_rect:setPositionInContainer(cc.p(265,146))
    table_login_shuru_new["juanzhou_rect"] = juanzhou_rect

    local login_shuru_bian1_image = fc.FExtensionsImage:create()
    login_shuru_bian1_image:setImage("nobatch/shengzhi_zhou.png")
    login_shuru_bian1_image:setSize(cc.size(33,291))
    login_shuru_bian1_image:setAnchorPoint(cc.p(0.5,0.5))
    login_shuru_new:appendComponent(login_shuru_bian1_image)
    login_shuru_bian1_image:setPositionInContainer(cc.p(16.5,145.5))
    table_login_shuru_new["login_shuru_bian1_image"] = login_shuru_bian1_image

    local login_shuru_bian2_image = fc.FExtensionsImage:create()
    login_shuru_bian2_image:setImage("nobatch/shengzhi_zhou.png")
    login_shuru_bian2_image:setSize(cc.size(33,291))
    login_shuru_bian2_image:setAnchorPoint(cc.p(0.5,0.5))
    login_shuru_new:appendComponent(login_shuru_bian2_image)
    login_shuru_bian2_image:setPositionInContainer(cc.p(513.5,145.5))
    table_login_shuru_new["login_shuru_bian2_image"] = login_shuru_bian2_image

    local login_shuru_start_button = fc.FScaleButton:create()
    login_shuru_start_button:setSize(cc.size(216,57))
    login_shuru_start_button:setAnchorPoint(cc.p(0.5,0.5))
    login_shuru_start_button:setButtonImage("batch_ui/denglu_kaishiyouxi.png")
    login_shuru_new:appendComponent(login_shuru_start_button)
    login_shuru_start_button:setPositionInContainer(cc.p(266,270.5))
    table_login_shuru_new["login_shuru_start_button"] = login_shuru_start_button

    local login_shuru_fuwuqi_bg = fc.FContainerPanel:create()
    login_shuru_fuwuqi_bg:setSize(cc.size(369,42))
    login_shuru_fuwuqi_bg:setAnchorPoint(cc.p(0.5,0.5))
    login_shuru_new:appendComponent(login_shuru_fuwuqi_bg)
    login_shuru_fuwuqi_bg:setPositionInContainer(cc.p(264.5,104))
    table_login_shuru_new["login_shuru_fuwuqi_bg"] = login_shuru_fuwuqi_bg

    local login_shuru_di_img1 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/denglu_shurukuang.png",cc.rect(15,11,5,5))
    login_shuru_di_img1:setSize(cc.size(369,42))
    login_shuru_di_img1:setAnchorPoint(cc.p(0.5,0.5))
    login_shuru_fuwuqi_bg:appendComponent(login_shuru_di_img1)
    login_shuru_di_img1:setPositionInContainer(cc.p(184.5,21))
    table_login_shuru_new["login_shuru_di_img1"] = login_shuru_di_img1

    local login_cur_server_label = fc.FLabel:createBMFont()
    login_cur_server_label:setSize(cc.size(100,30))
    login_cur_server_label:setAnchorPoint(cc.p(0.5,0.5))
    login_cur_server_label:setFontSize(20)
    login_cur_server_label:setString("")
    login_cur_server_label:setColor(cc.c3b(250,255,165))
    login_cur_server_label:setAlignment(0)
    login_shuru_new:appendComponent(login_cur_server_label)
    login_cur_server_label:setPositionInContainer(cc.p(166,104))
    table_login_shuru_new["login_cur_server_label"] = login_cur_server_label

    local server_flag = fc.FExtensionsImage:create()
    server_flag:setImage("batch_ui/fuwuqitubiao_xin.png")
    server_flag:setSize(cc.size(32,41))
    server_flag:setAnchorPoint(cc.p(0.5,0.5))
    login_shuru_new:appendComponent(server_flag)
    server_flag:setPositionInContainer(cc.p(310,105.5))
    table_login_shuru_new["server_flag"] = server_flag

    local change_area_label = fc.FLabel:createBMFont()
    change_area_label:setSize(cc.size(90,30))
    change_area_label:setAnchorPoint(cc.p(0.5,0.5))
    change_area_label:setFontSize(20)
    change_area_label:setString("点击换区")
    change_area_label:setColor(cc.c3b(254,255,232))
    login_shuru_new:appendComponent(change_area_label)
    change_area_label:setPositionInContainer(cc.p(387,104))
    table_login_shuru_new["change_area_label"] = change_area_label

    local login_shuru_zhanghao_button = fc.FContainerPanel:create()
    login_shuru_zhanghao_button:setSize(cc.size(369,42))
    login_shuru_zhanghao_button:setAnchorPoint(cc.p(0.5,0.5))
    login_shuru_new:appendComponent(login_shuru_zhanghao_button)
    login_shuru_zhanghao_button:setPositionInContainer(cc.p(264.5,176))
    table_login_shuru_new["login_shuru_zhanghao_button"] = login_shuru_zhanghao_button

    local login_shuru_di_img2 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/denglu_shurukuang.png",cc.rect(15,11,5,5))
    login_shuru_di_img2:setSize(cc.size(369,42))
    login_shuru_di_img2:setAnchorPoint(cc.p(0.5,0.5))
    login_shuru_zhanghao_button:appendComponent(login_shuru_di_img2)
    login_shuru_di_img2:setPositionInContainer(cc.p(184.5,21))
    table_login_shuru_new["login_shuru_di_img2"] = login_shuru_di_img2

    local user_name = fc.FLabel:createSystemFont()
    user_name:setSize(cc.size(100,30))
    user_name:setAnchorPoint(cc.p(0.5,0.5))
    user_name:setFontSize(20)
    user_name:setString("")
    user_name:setColor(cc.c3b(250,255,165))
    login_shuru_new:appendComponent(user_name)
    user_name:setPositionInContainer(cc.p(264,176))
    table_login_shuru_new["user_name"] = user_name

    local user_id_type_flag = fc.FExtensionsImage:create()
    user_id_type_flag:setImage("batch_ui/goole.png")
    user_id_type_flag:setSize(cc.size(38,38))
    user_id_type_flag:setAnchorPoint(cc.p(0.5,0.5))
    login_shuru_new:appendComponent(user_id_type_flag)
    user_id_type_flag:setPositionInContainer(cc.p(118,176))
    table_login_shuru_new["user_id_type_flag"] = user_id_type_flag

    local choose_another_user_panel = fc.FContainerPanel:create()
    choose_another_user_panel:setSize(cc.size(369,40))
    choose_another_user_panel:setAnchorPoint(cc.p(0.5,0.5))
    login_shuru_new:appendComponent(choose_another_user_panel)
    choose_another_user_panel:setPositionInContainer(cc.p(264.5,216))
    table_login_shuru_new["choose_another_user_panel"] = choose_another_user_panel

    local choose_another_di2 = fc.FExtensionsImage:create()
    choose_another_di2:setImage("batch_ui/xuanzefuwuqi_dikuang2_denglu.png")
    choose_another_di2:setSize(cc.size(360,40))
    choose_another_di2:setAnchorPoint(cc.p(0.5,0.5))
    choose_another_user_panel:appendComponent(choose_another_di2)
    choose_another_di2:setPositionInContainer(cc.p(185,20))
    table_login_shuru_new["choose_another_di2"] = choose_another_di2

    local change_id_label = fc.FLabel:createBMFont()
    change_id_label:setSize(cc.size(130,30))
    change_id_label:setAnchorPoint(cc.p(0.5,0.5))
    change_id_label:setFontSize(22)
    change_id_label:setString("使用其他賬號登陸")
    change_id_label:setColor(cc.c3b(0,255,0))
    choose_another_user_panel:appendComponent(change_id_label)
    change_id_label:setPositionInContainer(cc.p(183,18))
    table_login_shuru_new["change_id_label"] = change_id_label

    return table_login_shuru_new

end

