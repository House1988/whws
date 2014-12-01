function createmingchenxuanze_title()

    local table_mingchenxuanze_title = {}

    local mingchenxuanze_title = fc.FContainerPanel:create()
    mingchenxuanze_title:setSize(cc.size(960,640))
    table_mingchenxuanze_title["mingchenxuanze_title"] = mingchenxuanze_title

    local xuanze_bg_image = fc.FScale9Image:createWithBatchUIFrame("batch_ui/ditu_lan.png",cc.rect(2,2,2,2))
    xuanze_bg_image:setSize(cc.size(960,640))
    xuanze_bg_image:setAnchorPoint(cc.p(0.5,0.5))
    mingchenxuanze_title:appendComponent(xuanze_bg_image)
    xuanze_bg_image:setPositionInContainer(cc.p(480,320))
    table_mingchenxuanze_title["xuanze_bg_image"] = xuanze_bg_image

    local mingchenxuanze_bg_image = fc.FExtensionsImage:create()
    mingchenxuanze_bg_image:setImage("nobatch/title_mingchen_.png")
    mingchenxuanze_bg_image:setSize(cc.size(483,67))
    mingchenxuanze_bg_image:setAnchorPoint(cc.p(0.5,0.5))
    mingchenxuanze_title:appendComponent(mingchenxuanze_bg_image)
    mingchenxuanze_bg_image:setPositionInContainer(cc.p(241.5,33.5))
    table_mingchenxuanze_title["mingchenxuanze_bg_image"] = mingchenxuanze_bg_image

    local mingchenxuanze_bg_image2 = fc.FExtensionsImage:create()
    mingchenxuanze_bg_image2:setImage("nobatch/title_mingchen_.png")
    mingchenxuanze_bg_image2:setSize(cc.size(483,67))
    mingchenxuanze_bg_image2:setFlipType(2)
    mingchenxuanze_bg_image2:setAnchorPoint(cc.p(0.5,0.5))
    mingchenxuanze_title:appendComponent(mingchenxuanze_bg_image2)
    mingchenxuanze_bg_image2:setPositionInContainer(cc.p(718.5,33.5))
    table_mingchenxuanze_title["mingchenxuanze_bg_image2"] = mingchenxuanze_bg_image2

    local mingchenxuanze_title_image = fc.FContainerPanel:create()
    mingchenxuanze_title_image:setSize(cc.size(205,34))
    mingchenxuanze_title_image:setAnchorPoint(cc.p(0.5,0.5))
    mingchenxuanze_title:appendComponent(mingchenxuanze_title_image)
    mingchenxuanze_title_image:setPositionInContainer(cc.p(480.5,36))
    table_mingchenxuanze_title["mingchenxuanze_title_image"] = mingchenxuanze_title_image

    local ming = fc.FExtensionsImage:create()
    ming:setImage("batch_ui/ming.png")
    ming:setSize(cc.size(40,40))
    ming:setAnchorPoint(cc.p(0.5,0.5))
    mingchenxuanze_title_image:appendComponent(ming)
    ming:setPositionInContainer(cc.p(20,20))
    table_mingchenxuanze_title["ming"] = ming

    local chen = fc.FExtensionsImage:create()
    chen:setImage("batch_ui/chen.png")
    chen:setSize(cc.size(40,40))
    chen:setAnchorPoint(cc.p(0.5,0.5))
    mingchenxuanze_title_image:appendComponent(chen)
    chen:setPositionInContainer(cc.p(75,20))
    table_mingchenxuanze_title["chen"] = chen

    local xuan = fc.FExtensionsImage:create()
    xuan:setImage("batch_ui/xuan.png")
    xuan:setSize(cc.size(40,40))
    xuan:setAnchorPoint(cc.p(0.5,0.5))
    mingchenxuanze_title_image:appendComponent(xuan)
    xuan:setPositionInContainer(cc.p(130,20))
    table_mingchenxuanze_title["xuan"] = xuan

    local ze = fc.FExtensionsImage:create()
    ze:setImage("batch_ui/ze.png")
    ze:setSize(cc.size(40,40))
    ze:setAnchorPoint(cc.p(0.5,0.5))
    mingchenxuanze_title_image:appendComponent(ze)
    ze:setPositionInContainer(cc.p(185,20))
    table_mingchenxuanze_title["ze"] = ze

    local huawen_left = fc.FExtensionsImage:create()
    huawen_left:setImage("nobatch/banzidikuang_tongyong.png")
    huawen_left:setSize(cc.size(220,163))
    huawen_left:setAnchorPoint(cc.p(0.5,0.5))
    mingchenxuanze_title:appendComponent(huawen_left)
    huawen_left:setPositionInContainer(cc.p(110,148.5))
    table_mingchenxuanze_title["huawen_left"] = huawen_left

    local lian_left = fc.FExtensionsImage:create()
    lian_left:setImage("batch_ui/title_mingchen_2.png")
    lian_left:setSize(cc.size(62,121))
    lian_left:setAnchorPoint(cc.p(0.5,0.5))
    mingchenxuanze_title:appendComponent(lian_left)
    lian_left:setPositionInContainer(cc.p(31,60.5))
    table_mingchenxuanze_title["lian_left"] = lian_left

    local huawen_right = fc.FExtensionsImage:create()
    huawen_right:setImage("nobatch/banzidikuang_tongyong.png")
    huawen_right:setSize(cc.size(220,163))
    huawen_right:setFlipType(2)
    huawen_right:setAnchorPoint(cc.p(0.5,0.5))
    mingchenxuanze_title:appendComponent(huawen_right)
    huawen_right:setPositionInContainer(cc.p(850,148.5))
    table_mingchenxuanze_title["huawen_right"] = huawen_right

    local lian_right = fc.FExtensionsImage:create()
    lian_right:setImage("batch_ui/title_mingchen_2.png")
    lian_right:setSize(cc.size(62,121))
    lian_right:setFlipType(2)
    lian_right:setAnchorPoint(cc.p(0.5,0.5))
    mingchenxuanze_title:appendComponent(lian_right)
    lian_right:setPositionInContainer(cc.p(929,60.5))
    table_mingchenxuanze_title["lian_right"] = lian_right

    local mingchenxuanze_close_button = fc.FScaleButton:create()
    mingchenxuanze_close_button:setSize(cc.size(52,52))
    mingchenxuanze_close_button:setAnchorPoint(cc.p(0.5,0.5))
    mingchenxuanze_close_button:setButtonImage("batch_ui/guanbi_up.png")
    mingchenxuanze_title:appendComponent(mingchenxuanze_close_button)
    mingchenxuanze_close_button:setPositionInContainer(cc.p(932,33))
    table_mingchenxuanze_title["mingchenxuanze_close_button"] = mingchenxuanze_close_button

    local huawen_leftbottom = fc.FExtensionsImage:create()
    huawen_leftbottom:setImage("nobatch/banzidikuang_tongyong.png")
    huawen_leftbottom:setSize(cc.size(220,163))
    huawen_leftbottom:setFlipType(4)
    huawen_leftbottom:setAnchorPoint(cc.p(0.5,0.5))
    mingchenxuanze_title:appendComponent(huawen_leftbottom)
    huawen_leftbottom:setPositionInContainer(cc.p(110,558.5))
    table_mingchenxuanze_title["huawen_leftbottom"] = huawen_leftbottom

    local huawen_rightbottom = fc.FExtensionsImage:create()
    huawen_rightbottom:setImage("nobatch/banzidikuang_tongyong.png")
    huawen_rightbottom:setSize(cc.size(220,163))
    huawen_rightbottom:setFlipType(8)
    huawen_rightbottom:setAnchorPoint(cc.p(0.5,0.5))
    mingchenxuanze_title:appendComponent(huawen_rightbottom)
    huawen_rightbottom:setPositionInContainer(cc.p(850,558.5))
    table_mingchenxuanze_title["huawen_rightbottom"] = huawen_rightbottom

    return table_mingchenxuanze_title

end

