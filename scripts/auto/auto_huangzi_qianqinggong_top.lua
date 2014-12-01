function createhuangzi_qianqinggong_top()

    local table_huangzi_qianqinggong_top = {}

    local huangzi_qianqinggong_top = fc.FContainerPanel:create()
    huangzi_qianqinggong_top:setSize(cc.size(960,640))
    table_huangzi_qianqinggong_top["huangzi_qianqinggong_top"] = huangzi_qianqinggong_top

    local qqg_bg_image = fc.FScale9Image:createWithBatchUIFrame("batch_ui/ditu_lan.png",cc.rect(2,2,2,2))
    qqg_bg_image:setSize(cc.size(960,640))
    qqg_bg_image:setAnchorPoint(cc.p(0.5,0.5))
    huangzi_qianqinggong_top:appendComponent(qqg_bg_image)
    qqg_bg_image:setPositionInContainer(cc.p(480,320))
    table_huangzi_qianqinggong_top["qqg_bg_image"] = qqg_bg_image

    local qqg_biaoti_image2 = fc.FExtensionsImage:create()
    qqg_biaoti_image2:setImage("nobatch/title_mingchen_.png")
    qqg_biaoti_image2:setSize(cc.size(483,67))
    qqg_biaoti_image2:setFlipType(2)
    qqg_biaoti_image2:setAnchorPoint(cc.p(0.5,0.5))
    huangzi_qianqinggong_top:appendComponent(qqg_biaoti_image2)
    qqg_biaoti_image2:setPositionInContainer(cc.p(718.5,33.5))
    table_huangzi_qianqinggong_top["qqg_biaoti_image2"] = qqg_biaoti_image2

    local qqg_biaoti_image = fc.FExtensionsImage:create()
    qqg_biaoti_image:setImage("nobatch/title_mingchen_.png")
    qqg_biaoti_image:setSize(cc.size(483,67))
    qqg_biaoti_image:setAnchorPoint(cc.p(0.5,0.5))
    huangzi_qianqinggong_top:appendComponent(qqg_biaoti_image)
    qqg_biaoti_image:setPositionInContainer(cc.p(241.5,33.5))
    table_huangzi_qianqinggong_top["qqg_biaoti_image"] = qqg_biaoti_image

    local wen_l = fc.FExtensionsImage:create()
    wen_l:setImage("nobatch/banzidikuang_tongyong.png")
    wen_l:setSize(cc.size(220,163))
    wen_l:setAnchorPoint(cc.p(0.5,0.5))
    huangzi_qianqinggong_top:appendComponent(wen_l)
    wen_l:setPositionInContainer(cc.p(110,148.5))
    table_huangzi_qianqinggong_top["wen_l"] = wen_l

    local lian_left = fc.FExtensionsImage:create()
    lian_left:setImage("batch_ui/title_mingchen_2.png")
    lian_left:setSize(cc.size(62,121))
    lian_left:setAnchorPoint(cc.p(0.5,0.5))
    huangzi_qianqinggong_top:appendComponent(lian_left)
    lian_left:setPositionInContainer(cc.p(31,60.5))
    table_huangzi_qianqinggong_top["lian_left"] = lian_left

    local wen_r = fc.FExtensionsImage:create()
    wen_r:setImage("nobatch/banzidikuang_tongyong.png")
    wen_r:setSize(cc.size(220,163))
    wen_r:setFlipType(2)
    wen_r:setAnchorPoint(cc.p(0.5,0.5))
    huangzi_qianqinggong_top:appendComponent(wen_r)
    wen_r:setPositionInContainer(cc.p(850,148.5))
    table_huangzi_qianqinggong_top["wen_r"] = wen_r

    local lian_right = fc.FExtensionsImage:create()
    lian_right:setImage("batch_ui/title_mingchen_2.png")
    lian_right:setSize(cc.size(62,121))
    lian_right:setFlipType(2)
    lian_right:setAnchorPoint(cc.p(0.5,0.5))
    huangzi_qianqinggong_top:appendComponent(lian_right)
    lian_right:setPositionInContainer(cc.p(929,60.5))
    table_huangzi_qianqinggong_top["lian_right"] = lian_right

    local qqg_close_button = fc.FScaleButton:create()
    qqg_close_button:setSize(cc.size(52,52))
    qqg_close_button:setAnchorPoint(cc.p(0.5,0.5))
    qqg_close_button:setButtonImage("batch_ui/guanbi_up.png")
    huangzi_qianqinggong_top:appendComponent(qqg_close_button)
    qqg_close_button:setPositionInContainer(cc.p(934,33))
    table_huangzi_qianqinggong_top["qqg_close_button"] = qqg_close_button

    local wen_lb = fc.FExtensionsImage:create()
    wen_lb:setImage("nobatch/banzidikuang_tongyong.png")
    wen_lb:setSize(cc.size(220,163))
    wen_lb:setFlipType(4)
    wen_lb:setAnchorPoint(cc.p(0.5,0.5))
    huangzi_qianqinggong_top:appendComponent(wen_lb)
    wen_lb:setPositionInContainer(cc.p(110,558.5))
    table_huangzi_qianqinggong_top["wen_lb"] = wen_lb

    local wen_rb = fc.FExtensionsImage:create()
    wen_rb:setImage("nobatch/banzidikuang_tongyong.png")
    wen_rb:setSize(cc.size(220,163))
    wen_rb:setFlipType(8)
    wen_rb:setAnchorPoint(cc.p(0.5,0.5))
    huangzi_qianqinggong_top:appendComponent(wen_rb)
    wen_rb:setPositionInContainer(cc.p(850,558.5))
    table_huangzi_qianqinggong_top["wen_rb"] = wen_rb

    local qqg_yang = fc.FExtensionsImage:create()
    qqg_yang:setImage("batch_ui/yang.png")
    qqg_yang:setSize(cc.size(40,40))
    qqg_yang:setAnchorPoint(cc.p(0.5,0.5))
    huangzi_qianqinggong_top:appendComponent(qqg_yang)
    qqg_yang:setPositionInContainer(cc.p(424,35))
    table_huangzi_qianqinggong_top["qqg_yang"] = qqg_yang

    local qqg_xin = fc.FExtensionsImage:create()
    qqg_xin:setImage("batch_ui/xin (2).png")
    qqg_xin:setSize(cc.size(40,40))
    qqg_xin:setAnchorPoint(cc.p(0.5,0.5))
    huangzi_qianqinggong_top:appendComponent(qqg_xin)
    qqg_xin:setPositionInContainer(cc.p(480,35))
    table_huangzi_qianqinggong_top["qqg_xin"] = qqg_xin

    local qqg_dian = fc.FExtensionsImage:create()
    qqg_dian:setImage("batch_ui/dian (2).png")
    qqg_dian:setSize(cc.size(40,40))
    qqg_dian:setAnchorPoint(cc.p(0.5,0.5))
    huangzi_qianqinggong_top:appendComponent(qqg_dian)
    qqg_dian:setPositionInContainer(cc.p(536,35))
    table_huangzi_qianqinggong_top["qqg_dian"] = qqg_dian

    return table_huangzi_qianqinggong_top

end

