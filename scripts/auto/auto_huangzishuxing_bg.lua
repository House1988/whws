function createhuangzishuxing_bg()

    local table_huangzishuxing_bg = {}

    local huangzishuxing_bg = fc.FContainerPanel:create()
    huangzishuxing_bg:setSize(cc.size(960,640))
    table_huangzishuxing_bg["huangzishuxing_bg"] = huangzishuxing_bg

    local hzsx_bg_image = fc.FScale9Image:createWithBatchUIFrame("batch_ui/ditu_lan.png",cc.rect(2,2,1,1))
    hzsx_bg_image:setSize(cc.size(960,640))
    hzsx_bg_image:setAnchorPoint(cc.p(0.5,0.5))
    huangzishuxing_bg:appendComponent(hzsx_bg_image)
    hzsx_bg_image:setPositionInContainer(cc.p(480,320))
    table_huangzishuxing_bg["hzsx_bg_image"] = hzsx_bg_image

    local hzsx_title_bg_image = fc.FExtensionsImage:create()
    hzsx_title_bg_image:setImage("nobatch/title_mingchen_.png")
    hzsx_title_bg_image:setSize(cc.size(483,67))
    hzsx_title_bg_image:setAnchorPoint(cc.p(0.5,0.5))
    huangzishuxing_bg:appendComponent(hzsx_title_bg_image)
    hzsx_title_bg_image:setPositionInContainer(cc.p(241.5,33.5))
    table_huangzishuxing_bg["hzsx_title_bg_image"] = hzsx_title_bg_image

    local hzsx_title_bg_image2 = fc.FExtensionsImage:create()
    hzsx_title_bg_image2:setImage("nobatch/title_mingchen_.png")
    hzsx_title_bg_image2:setSize(cc.size(483,67))
    hzsx_title_bg_image2:setFlipType(2)
    hzsx_title_bg_image2:setAnchorPoint(cc.p(0.5,0.5))
    huangzishuxing_bg:appendComponent(hzsx_title_bg_image2)
    hzsx_title_bg_image2:setPositionInContainer(cc.p(718.5,33.5))
    table_huangzishuxing_bg["hzsx_title_bg_image2"] = hzsx_title_bg_image2

    local hzsx_title_image = fc.FContainerPanel:create()
    hzsx_title_image:setSize(cc.size(205,35))
    hzsx_title_image:setAnchorPoint(cc.p(0.5,0.5))
    huangzishuxing_bg:appendComponent(hzsx_title_image)
    hzsx_title_image:setPositionInContainer(cc.p(474.5,36))
    table_huangzishuxing_bg["hzsx_title_image"] = hzsx_title_image

    local huang = fc.FExtensionsImage:create()
    huang:setImage("batch_ui/huang.png")
    huang:setSize(cc.size(40,40))
    huang:setAnchorPoint(cc.p(0.5,0.5))
    hzsx_title_image:appendComponent(huang)
    huang:setPositionInContainer(cc.p(20,20))
    table_huangzishuxing_bg["huang"] = huang

    local zi = fc.FExtensionsImage:create()
    zi:setImage("batch_ui/zi.png")
    zi:setSize(cc.size(40,40))
    zi:setAnchorPoint(cc.p(0.5,0.5))
    hzsx_title_image:appendComponent(zi)
    zi:setPositionInContainer(cc.p(75,20))
    table_huangzishuxing_bg["zi"] = zi

    local shu = fc.FExtensionsImage:create()
    shu:setImage("batch_ui/shu.png")
    shu:setSize(cc.size(40,40))
    shu:setAnchorPoint(cc.p(0.5,0.5))
    hzsx_title_image:appendComponent(shu)
    shu:setPositionInContainer(cc.p(130,20))
    table_huangzishuxing_bg["shu"] = shu

    local xing = fc.FExtensionsImage:create()
    xing:setImage("batch_ui/xing.png")
    xing:setSize(cc.size(40,40))
    xing:setAnchorPoint(cc.p(0.5,0.5))
    hzsx_title_image:appendComponent(xing)
    xing:setPositionInContainer(cc.p(185,20))
    table_huangzishuxing_bg["xing"] = xing

    local lian_left = fc.FExtensionsImage:create()
    lian_left:setImage("batch_ui/title_mingchen_2.png")
    lian_left:setSize(cc.size(62,121))
    lian_left:setAnchorPoint(cc.p(0.5,0.5))
    huangzishuxing_bg:appendComponent(lian_left)
    lian_left:setPositionInContainer(cc.p(31,60.5))
    table_huangzishuxing_bg["lian_left"] = lian_left

    local lian_right = fc.FExtensionsImage:create()
    lian_right:setImage("batch_ui/title_mingchen_2.png")
    lian_right:setSize(cc.size(62,121))
    lian_right:setFlipType(2)
    lian_right:setAnchorPoint(cc.p(0.5,0.5))
    huangzishuxing_bg:appendComponent(lian_right)
    lian_right:setPositionInContainer(cc.p(929,60.5))
    table_huangzishuxing_bg["lian_right"] = lian_right

    local hzsx_title_close_button = fc.FScaleButton:create()
    hzsx_title_close_button:setSize(cc.size(52,52))
    hzsx_title_close_button:setAnchorPoint(cc.p(0.5,0.5))
    hzsx_title_close_button:setButtonImage("batch_ui/guanbi_up.png")
    huangzishuxing_bg:appendComponent(hzsx_title_close_button)
    hzsx_title_close_button:setPositionInContainer(cc.p(933,32))
    table_huangzishuxing_bg["hzsx_title_close_button"] = hzsx_title_close_button

    return table_huangzishuxing_bg

end

