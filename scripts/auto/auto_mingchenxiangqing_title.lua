function createmingchenxiangqing_title()

    local table_mingchenxiangqing_title = {}

    local mingchenxiangqing_title = fc.FContainerPanel:create()
    mingchenxiangqing_title:setSize(cc.size(960,640))
    table_mingchenxiangqing_title["mingchenxiangqing_title"] = mingchenxiangqing_title

    local xiangqing_bg_image = fc.FScale9Image:createWithBatchUIFrame("batch_ui/ditu_lan.png",cc.rect(2,2,2,2))
    xiangqing_bg_image:setSize(cc.size(960,640))
    xiangqing_bg_image:setAnchorPoint(cc.p(0.5,0.5))
    mingchenxiangqing_title:appendComponent(xiangqing_bg_image)
    xiangqing_bg_image:setPositionInContainer(cc.p(480,320))
    table_mingchenxiangqing_title["xiangqing_bg_image"] = xiangqing_bg_image

    local xiangqing_biaotidiwen_image = fc.FExtensionsImage:create()
    xiangqing_biaotidiwen_image:setImage("nobatch/title_mingchen_.png")
    xiangqing_biaotidiwen_image:setSize(cc.size(483,67))
    xiangqing_biaotidiwen_image:setAnchorPoint(cc.p(0.5,0.5))
    mingchenxiangqing_title:appendComponent(xiangqing_biaotidiwen_image)
    xiangqing_biaotidiwen_image:setPositionInContainer(cc.p(241.5,33.5))
    table_mingchenxiangqing_title["xiangqing_biaotidiwen_image"] = xiangqing_biaotidiwen_image

    local xiangqing_biaotidiwen_image2 = fc.FExtensionsImage:create()
    xiangqing_biaotidiwen_image2:setImage("nobatch/title_mingchen_.png")
    xiangqing_biaotidiwen_image2:setSize(cc.size(483,67))
    xiangqing_biaotidiwen_image2:setFlipType(2)
    xiangqing_biaotidiwen_image2:setAnchorPoint(cc.p(0.5,0.5))
    mingchenxiangqing_title:appendComponent(xiangqing_biaotidiwen_image2)
    xiangqing_biaotidiwen_image2:setPositionInContainer(cc.p(718.5,33.5))
    table_mingchenxiangqing_title["xiangqing_biaotidiwen_image2"] = xiangqing_biaotidiwen_image2

    local diwen_left = fc.FExtensionsImage:create()
    diwen_left:setImage("nobatch/banzidikuang_tongyong.png")
    diwen_left:setSize(cc.size(220,163))
    diwen_left:setAnchorPoint(cc.p(0.5,0.5))
    mingchenxiangqing_title:appendComponent(diwen_left)
    diwen_left:setPositionInContainer(cc.p(110,148.5))
    table_mingchenxiangqing_title["diwen_left"] = diwen_left

    local diwen_right = fc.FExtensionsImage:create()
    diwen_right:setImage("nobatch/banzidikuang_tongyong.png")
    diwen_right:setSize(cc.size(220,163))
    diwen_right:setFlipType(2)
    diwen_right:setAnchorPoint(cc.p(0.5,0.5))
    mingchenxiangqing_title:appendComponent(diwen_right)
    diwen_right:setPositionInContainer(cc.p(850,148.5))
    table_mingchenxiangqing_title["diwen_right"] = diwen_right

    local diwen_leftbottom = fc.FExtensionsImage:create()
    diwen_leftbottom:setImage("nobatch/banzidikuang_tongyong.png")
    diwen_leftbottom:setSize(cc.size(220,163))
    diwen_leftbottom:setFlipType(4)
    diwen_leftbottom:setAnchorPoint(cc.p(0.5,0.5))
    mingchenxiangqing_title:appendComponent(diwen_leftbottom)
    diwen_leftbottom:setPositionInContainer(cc.p(110,558.5))
    table_mingchenxiangqing_title["diwen_leftbottom"] = diwen_leftbottom

    local diwen_rightbottom = fc.FExtensionsImage:create()
    diwen_rightbottom:setImage("nobatch/banzidikuang_tongyong.png")
    diwen_rightbottom:setSize(cc.size(220,163))
    diwen_rightbottom:setFlipType(8)
    diwen_rightbottom:setAnchorPoint(cc.p(0.5,0.5))
    mingchenxiangqing_title:appendComponent(diwen_rightbottom)
    diwen_rightbottom:setPositionInContainer(cc.p(850,558.5))
    table_mingchenxiangqing_title["diwen_rightbottom"] = diwen_rightbottom

    local lian_left = fc.FExtensionsImage:create()
    lian_left:setImage("batch_ui/title_mingchen_2.png")
    lian_left:setSize(cc.size(62,121))
    lian_left:setAnchorPoint(cc.p(0.5,0.5))
    mingchenxiangqing_title:appendComponent(lian_left)
    lian_left:setPositionInContainer(cc.p(31,60.5))
    table_mingchenxiangqing_title["lian_left"] = lian_left

    local lian_right = fc.FExtensionsImage:create()
    lian_right:setImage("batch_ui/title_mingchen_2.png")
    lian_right:setSize(cc.size(62,121))
    lian_right:setFlipType(2)
    lian_right:setAnchorPoint(cc.p(0.5,0.5))
    mingchenxiangqing_title:appendComponent(lian_right)
    lian_right:setPositionInContainer(cc.p(929,60.5))
    table_mingchenxiangqing_title["lian_right"] = lian_right

    local xiangqing_close_button = fc.FScaleButton:create()
    xiangqing_close_button:setSize(cc.size(52,52))
    xiangqing_close_button:setAnchorPoint(cc.p(0.5,0.5))
    xiangqing_close_button:setButtonImage("batch_ui/guanbi_up.png")
    mingchenxiangqing_title:appendComponent(xiangqing_close_button)
    xiangqing_close_button:setPositionInContainer(cc.p(934,32))
    table_mingchenxiangqing_title["xiangqing_close_button"] = xiangqing_close_button

    local chen = fc.FExtensionsImage:create()
    chen:setImage("batch_ui/chen.png")
    chen:setSize(cc.size(40,40))
    chen:setAnchorPoint(cc.p(0.5,0.5))
    mingchenxiangqing_title:appendComponent(chen)
    chen:setPositionInContainer(cc.p(451,36))
    table_mingchenxiangqing_title["chen"] = chen

    local ming = fc.FExtensionsImage:create()
    ming:setImage("batch_ui/ming.png")
    ming:setSize(cc.size(40,40))
    ming:setAnchorPoint(cc.p(0.5,0.5))
    mingchenxiangqing_title:appendComponent(ming)
    ming:setPositionInContainer(cc.p(380,36))
    table_mingchenxiangqing_title["ming"] = ming

    local xiang = fc.FExtensionsImage:create()
    xiang:setImage("batch_ui/xiang.png")
    xiang:setSize(cc.size(40,40))
    xiang:setAnchorPoint(cc.p(0.5,0.5))
    mingchenxiangqing_title:appendComponent(xiang)
    xiang:setPositionInContainer(cc.p(521,36))
    table_mingchenxiangqing_title["xiang"] = xiang

    local qing = fc.FExtensionsImage:create()
    qing:setImage("batch_ui/qing.png")
    qing:setSize(cc.size(40,40))
    qing:setAnchorPoint(cc.p(0.5,0.5))
    mingchenxiangqing_title:appendComponent(qing)
    qing:setPositionInContainer(cc.p(592,37))
    table_mingchenxiangqing_title["qing"] = qing

    return table_mingchenxiangqing_title

end

