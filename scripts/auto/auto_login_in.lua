function createlogin_in()

    local table_login_in = {}

    local login_in = fc.FContainerPanel:create()
    login_in:setSize(cc.size(960,640))
    table_login_in["login_in"] = login_in

    local login_in_bg_image = fc.FExtensionsImage:create()
    login_in_bg_image:setImage("batch_ui/login_background.png")
    login_in_bg_image:setSize(cc.size(960,640))
    login_in_bg_image:setAnchorPoint(cc.p(0.5,0.5))
    login_in:appendComponent(login_in_bg_image)
    login_in_bg_image:setPositionInContainer(cc.p(480,320))
    table_login_in["login_in_bg_image"] = login_in_bg_image

    local board_panel = fc.FContainerPanel:create()
    board_panel:setSize(cc.size(600,400))
    board_panel:setAnchorPoint(cc.p(0.5,0.5))
    login_in:appendComponent(board_panel)
    board_panel:setPositionInContainer(cc.p(400,390))
    table_login_in["board_panel"] = board_panel

    local board_image = fc.FScale9Image:createWithBatchUIFrame("batch_ui/login_board.png",cc.rect(38,39,77,79))
    board_image:setSize(cc.size(600,400))
    board_image:setAnchorPoint(cc.p(0.5,0.5))
    board_panel:appendComponent(board_image)
    board_image:setPositionInContainer(cc.p(300,200))
    table_login_in["board_image"] = board_image

    local user_id_image = fc.FExtensionsImage:create()
    user_id_image:setImage("batch_ui/user_number.png")
    user_id_image:setSize(cc.size(139,57))
    user_id_image:setAnchorPoint(cc.p(0.5,0.5))
    board_panel:appendComponent(user_id_image)
    user_id_image:setPositionInContainer(cc.p(120.5,88.5))
    table_login_in["user_id_image"] = user_id_image

    local user_password_image = fc.FExtensionsImage:create()
    user_password_image:setImage("batch_ui/code.png")
    user_password_image:setSize(cc.size(139,57))
    user_password_image:setAnchorPoint(cc.p(0.5,0.5))
    board_panel:appendComponent(user_password_image)
    user_password_image:setPositionInContainer(cc.p(120.5,168.5))
    table_login_in["user_password_image"] = user_password_image

    local user_id_input = fc.FInput:create()
    user_id_input:setSizeAndBackgroundImage(cc.size(284,68),"batch_ui/user_number_rect.png","batch_ui/user_number_rect.png","batch_ui/user_number_rect.png",false)
    user_id_input:setAnchorPoint(cc.p(0.5,0.5))
    user_id_input:setTouchEnabled(true)
    user_id_input:setFontSize(18)
    board_panel:appendComponent(user_id_input)
    user_id_input:setPositionInContainer(cc.p(382,90))
    table_login_in["user_id_input"] = user_id_input

    local user_password_input = fc.FInput:create()
    user_password_input:setSizeAndBackgroundImage(cc.size(284,68),"batch_ui/user_number_rect.png","batch_ui/user_number_rect.png","batch_ui/user_number_rect.png",false)
    user_password_input:setAnchorPoint(cc.p(0.5,0.5))
    user_password_input:setTouchEnabled(true)
    user_password_input:setFontSize(18)
    board_panel:appendComponent(user_password_input)
    user_password_input:setPositionInContainer(cc.p(382,168))
    table_login_in["user_password_input"] = user_password_input

    local regist_textimage_button = fc.FScaleButton:create()
    regist_textimage_button:setSize(cc.size(195,58))
    regist_textimage_button:setAnchorPoint(cc.p(0.5,0.5))
    regist_textimage_button:setButtonImage("batch_ui/button_normal.png")
    regist_textimage_button:setTextImage("batch_ui/register_normal.png",cc.p(98,29))
    board_panel:appendComponent(regist_textimage_button)
    regist_textimage_button:setPositionInContainer(cc.p(148.5,271))
    table_login_in["regist_textimage_button"] = regist_textimage_button

    local login_teximage_button = fc.FScaleButton:create()
    login_teximage_button:setSize(cc.size(195,58))
    login_teximage_button:setAnchorPoint(cc.p(0.5,0.5))
    login_teximage_button:setButtonImage("batch_ui/button_normal.png")
    login_teximage_button:setTextImage("batch_ui/login_normal.png",cc.p(98,29))
    board_panel:appendComponent(login_teximage_button)
    login_teximage_button:setPositionInContainer(cc.p(412.5,271))
    table_login_in["login_teximage_button"] = login_teximage_button

    local chenyuanyuan_image = fc.FExtensionsImage:create()
    chenyuanyuan_image:setImage("batch_ui/name_chenyuanyuan.png")
    chenyuanyuan_image:setSize(cc.size(91,402))
    chenyuanyuan_image:setAnchorPoint(cc.p(0.5,0.5))
    login_in:appendComponent(chenyuanyuan_image)
    chenyuanyuan_image:setPositionInContainer(cc.p(914.5,304))
    table_login_in["chenyuanyuan_image"] = chenyuanyuan_image

    return table_login_in

end

