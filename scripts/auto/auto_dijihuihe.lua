function createdijihuihe()

    local table_dijihuihe = {}

    local dijihuihe = fc.FContainerPanel:create()
    dijihuihe:setSize(cc.size(960,640))
    table_dijihuihe["dijihuihe"] = dijihuihe

    local huihe_diwen_image = fc.FExtensionsImage:create()
    huihe_diwen_image:setImage("nobatch/diyihuihe_diwen.png")
    huihe_diwen_image:setSize(cc.size(708,95))
    huihe_diwen_image:setAnchorPoint(cc.p(0.5,0.5))
    dijihuihe:appendComponent(huihe_diwen_image)
    huihe_diwen_image:setPositionInContainer(cc.p(450,357.5))
    table_dijihuihe["huihe_diwen_image"] = huihe_diwen_image

    local di_word_image = fc.FExtensionsImage:create()
    di_word_image:setImage("batch_ui/di_huihe.png")
    di_word_image:setSize(cc.size(162,194))
    di_word_image:setAnchorPoint(cc.p(0.5,0.5))
    dijihuihe:appendComponent(di_word_image)
    di_word_image:setPositionInContainer(cc.p(189,314))
    table_dijihuihe["di_word_image"] = di_word_image

    local ji_word_image = fc.FExtensionsImage:create()
    ji_word_image:setImage("batch_ui/yi_huihe.png")
    ji_word_image:setSize(cc.size(178,78))
    ji_word_image:setAnchorPoint(cc.p(0.5,0.5))
    dijihuihe:appendComponent(ji_word_image)
    ji_word_image:setPositionInContainer(cc.p(347,315))
    table_dijihuihe["ji_word_image"] = ji_word_image

    local hui_word_image = fc.FExtensionsImage:create()
    hui_word_image:setImage("batch_ui/hui_huihe.png")
    hui_word_image:setSize(cc.size(172,122))
    hui_word_image:setAnchorPoint(cc.p(0.5,0.5))
    dijihuihe:appendComponent(hui_word_image)
    hui_word_image:setPositionInContainer(cc.p(508,321))
    table_dijihuihe["hui_word_image"] = hui_word_image

    local he_word_image = fc.FExtensionsImage:create()
    he_word_image:setImage("batch_ui/he_huihe.png")
    he_word_image:setSize(cc.size(202,174))
    he_word_image:setAnchorPoint(cc.p(0.5,0.5))
    dijihuihe:appendComponent(he_word_image)
    he_word_image:setPositionInContainer(cc.p(691,309))
    table_dijihuihe["he_word_image"] = he_word_image

    return table_dijihuihe

end

