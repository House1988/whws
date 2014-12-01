function createlogin()

    local table_login = {}

    local login = fc.FContainerPanel:create()
    login:setSize(cc.size(960,640))
    table_login["login"] = login

    local login_bg_image = fc.FExtensionsImage:create()
    login_bg_image:setAnchorPoint(cc.p(0.5,0.5))
    login:appendComponent(login_bg_image)
    login_bg_image:setPositionInContainer(cc.p(480,320))
    table_login["login_bg_image"] = login_bg_image

    local login_biankuang1_image = fc.FExtensionsImage:create()
    login_biankuang1_image:setImage("batch_ui/biankuang_denglu.png")
    login_biankuang1_image:setSize(cc.size(640,44))
    login_biankuang1_image:setAnchorPoint(cc.p(0.5,0.5))
    login:appendComponent(login_biankuang1_image)
    login_biankuang1_image:setPositionInContainer(cc.p(160,22))
    table_login["login_biankuang1_image"] = login_biankuang1_image

    local login_biankuang2_image = fc.FExtensionsImage:create()
    login_biankuang2_image:setImage("batch_ui/biankuang_denglu.png")
    login_biankuang2_image:setSize(cc.size(640,44))
    login_biankuang2_image:setFlipType(2)
    login_biankuang2_image:setAnchorPoint(cc.p(0.5,0.5))
    login:appendComponent(login_biankuang2_image)
    login_biankuang2_image:setPositionInContainer(cc.p(800,22))
    table_login["login_biankuang2_image"] = login_biankuang2_image

    local login_biankuang3_image = fc.FExtensionsImage:create()
    login_biankuang3_image:setImage("batch_ui/biankuang_denglu.png")
    login_biankuang3_image:setSize(cc.size(640,44))
    login_biankuang3_image:setAnchorPoint(cc.p(0.5,0.5))
    login:appendComponent(login_biankuang3_image)
    login_biankuang3_image:setPositionInContainer(cc.p(160,618))
    table_login["login_biankuang3_image"] = login_biankuang3_image

    local login_biankuang4_image = fc.FExtensionsImage:create()
    login_biankuang4_image:setImage("batch_ui/biankuang_denglu.png")
    login_biankuang4_image:setSize(cc.size(640,44))
    login_biankuang4_image:setFlipType(2)
    login_biankuang4_image:setAnchorPoint(cc.p(0.5,0.5))
    login:appendComponent(login_biankuang4_image)
    login_biankuang4_image:setPositionInContainer(cc.p(800,618))
    table_login["login_biankuang4_image"] = login_biankuang4_image

    return table_login

end

