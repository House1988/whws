function createlogin_choose_type()

    local table_login_choose_type = {}

    local login_choose_type = fc.FContainerPanel:create()
    login_choose_type:setSize(cc.size(960,640))
    table_login_choose_type["login_choose_type"] = login_choose_type

    local lct_blue_bg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/xialaxuanzhong.png",cc.rect(10,10,10,10))
    lct_blue_bg:setSize(cc.size(462,246))
    lct_blue_bg:setAnchorPoint(cc.p(0.5,0.5))
    login_choose_type:appendComponent(lct_blue_bg)
    lct_blue_bg:setPositionInContainer(cc.p(480,447))
    table_login_choose_type["lct_blue_bg"] = lct_blue_bg

    local lct_choose_type_bg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/denglu_shurukuang.png",cc.rect(15,11,5,5))
    lct_choose_type_bg:setSize(cc.size(204,34))
    lct_choose_type_bg:setAnchorPoint(cc.p(0.5,0.5))
    login_choose_type:appendComponent(lct_choose_type_bg)
    lct_choose_type_bg:setPositionInContainer(cc.p(480,359))
    table_login_choose_type["lct_choose_type_bg"] = lct_choose_type_bg

    local lct_facebook_btn = fc.FScaleButton:create()
    lct_facebook_btn:setSize(cc.size(86,88))
    lct_facebook_btn:setAnchorPoint(cc.p(0.5,0.5))
    lct_facebook_btn:setButtonImage("batch_ui/facebook_da.png")
    login_choose_type:appendComponent(lct_facebook_btn)
    lct_facebook_btn:setPositionInContainer(cc.p(372,434))
    table_login_choose_type["lct_facebook_btn"] = lct_facebook_btn

    local lct_facebook_label = fc.FLabel:createBMFont()
    lct_facebook_label:setSize(cc.size(140,30))
    lct_facebook_label:setAnchorPoint(cc.p(0.5,0.5))
    lct_facebook_label:setFontSize(20)
    lct_facebook_label:setString("登錄")
    lct_facebook_label:setColor(cc.c3b(255,255,255))
    login_choose_type:appendComponent(lct_facebook_label)
    lct_facebook_label:setPositionInContainer(cc.p(373,502))
    table_login_choose_type["lct_facebook_label"] = lct_facebook_label

    local lct_google_label = fc.FLabel:createBMFont()
    lct_google_label:setSize(cc.size(140,30))
    lct_google_label:setAnchorPoint(cc.p(0.5,0.5))
    lct_google_label:setFontSize(20)
    lct_google_label:setString("登錄")
    lct_google_label:setColor(cc.c3b(255,255,255))
    login_choose_type:appendComponent(lct_google_label)
    lct_google_label:setPositionInContainer(cc.p(584,502))
    table_login_choose_type["lct_google_label"] = lct_google_label

    local lct_google_btn = fc.FScaleButton:create()
    lct_google_btn:setSize(cc.size(86,88))
    lct_google_btn:setAnchorPoint(cc.p(0.5,0.5))
    lct_google_btn:setButtonImage("batch_ui/google_da.png")
    login_choose_type:appendComponent(lct_google_btn)
    lct_google_btn:setPositionInContainer(cc.p(585,434))
    table_login_choose_type["lct_google_btn"] = lct_google_btn

    local lct_choose_type_title = fc.FLabel:createSystemFont()
    lct_choose_type_title:setSize(cc.size(150,30))
    lct_choose_type_title:setAnchorPoint(cc.p(0.5,0.5))
    lct_choose_type_title:setFontSize(20)
    lct_choose_type_title:setString("選擇登錄方式")
    lct_choose_type_title:setColor(cc.c3b(250,255,165))
    login_choose_type:appendComponent(lct_choose_type_title)
    lct_choose_type_title:setPositionInContainer(cc.p(480,354))
    table_login_choose_type["lct_choose_type_title"] = lct_choose_type_title

    local lct_bottom_line = fc.FScale9Image:createWithBatchUIFrame("batch_ui/line5.png",cc.rect(2,0,4,2))
    lct_bottom_line:setSize(cc.size(462,2))
    lct_bottom_line:setAnchorPoint(cc.p(0.5,0.5))
    login_choose_type:appendComponent(lct_bottom_line)
    lct_bottom_line:setPositionInContainer(cc.p(480,526))
    table_login_choose_type["lct_bottom_line"] = lct_bottom_line


    local jld_nh_fastlogin_button = fc.FTextButton:create()
    jld_nh_fastlogin_button:setSize(cc.size(144,42))
    jld_nh_fastlogin_button:setAnchorPoint(cc.p(0.5,0.5))
    jld_nh_fastlogin_button:setTextButtonImage("batch_ui/goumai_anniu.png","batch_ui/goumai_anniu.png","batch_ui/goumai_anniu.png")
    jld_nh_fastlogin_button:setText("遊客登錄",cc.c3b(255,255,255))
    jld_nh_fastlogin_button:setSelectActionEnbaled(true)
    jld_nh_fastlogin_button:setVisible(false)
    login_choose_type:appendComponent(jld_nh_fastlogin_button)
    jld_nh_fastlogin_button:setPositionInContainer(cc.p(480,552))
    table_login_choose_type["jld_nh_fastlogin_button"] = jld_nh_fastlogin_button

    return table_login_choose_type

end

