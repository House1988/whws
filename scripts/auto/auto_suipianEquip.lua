function createsuipianEquip()

    local table_suipianEquip = {}

    local suipianEquip = fc.FContainerPanel:create()
    suipianEquip:setSize(cc.size(251,458))
    table_suipianEquip["suipianEquip"] = suipianEquip

    local highLight = fc.FScale9Image:createWithBatchUIFrame("batch_ui/xuanzhongkuang_beibao.png",cc.rect(124,45,2,2))
    highLight:setSize(cc.size(251,470))
    highLight:setAnchorPoint(cc.p(0.5,0.5))
    suipianEquip:appendComponent(highLight)
    highLight:setPositionInContainer(cc.p(125.5,223))
    table_suipianEquip["highLight"] = highLight

    local user_item_bg = fc.FScale9Image:createWithBatchUIFrame("nobatch/daoju_dikuang_beibao.png",cc.rect(92,103,5,5))
    user_item_bg:setSize(cc.size(215,435))
    user_item_bg:setAnchorPoint(cc.p(0.5,0.5))
    suipianEquip:appendComponent(user_item_bg)
    user_item_bg:setPositionInContainer(cc.p(125.5,222.5))
    table_suipianEquip["user_item_bg"] = user_item_bg

    local card_head_bg = fc.FExtensionsImage:create()
    card_head_bg:setImage("batch_ui/teshutouxiangkuang.png")
    card_head_bg:setSize(cc.size(172,172))
    card_head_bg:setAnchorPoint(cc.p(0.5,0.5))
    suipianEquip:appendComponent(card_head_bg)
    card_head_bg:setPositionInContainer(cc.p(124,161))
    table_suipianEquip["card_head_bg"] = card_head_bg

    local name = fc.FLabel:createBMFont()
    name:setSize(cc.size(100,40))
    name:setAnchorPoint(cc.p(0.5,0.5))
    name:setFontSize(32)
    name:setString("鸦片")
    name:setColor(cc.c3b(254,254,216))
    suipianEquip:appendComponent(name)
    name:setPositionInContainer(cc.p(126,22))
    table_suipianEquip["name"] = name

    local des_bg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/daoju_dikuang3_beibao.png",cc.rect(86,14,2,2))
    des_bg:setSize(cc.size(193,100))
    des_bg:setAnchorPoint(cc.p(0.5,0.5))
    suipianEquip:appendComponent(des_bg)
    des_bg:setPositionInContainer(cc.p(124.5,316))
    table_suipianEquip["des_bg"] = des_bg

    local number = fc.FLabel:createBMFont()
    number:setSize(cc.size(160,30))
    number:setWidth(150)
    number:setAnchorPoint(cc.p(0.5,0.5))
    number:setFontSize(20)
    number:setString("步兵步兵步兵步兵步兵步兵步兵步兵步兵步兵步兵步兵")
    number:setColor(cc.c3b(111,70,20))
    suipianEquip:appendComponent(number)
    number:setPositionInContainer(cc.p(165,294))
    table_suipianEquip["number"] = number

    local cost = fc.FLabel:createBMFont()
    cost:setSize(cc.size(160,30))
    cost:setWidth(0)
    cost:setAnchorPoint(cc.p(0.5,0.5))
    cost:setFontSize(20)
    cost:setString("星级 :")
    cost:setColor(cc.c3b(111,70,20))
    suipianEquip:appendComponent(cost)
    cost:setPositionInContainer(cc.p(209,334))
    table_suipianEquip["cost"] = cost

    local star1 = fc.FExtensionsImage:create()
    star1:setImage("batch_ui/xingxing.png")
    star1:setSize(cc.size(25,27))
    star1:setAnchorPoint(cc.p(0.5,0.5))
    suipianEquip:appendComponent(star1)
    star1:setPositionInContainer(cc.p(59.5,245.5))
    table_suipianEquip["star1"] = star1

    local star2 = fc.FExtensionsImage:create()
    star2:setImage("batch_ui/xingxing.png")
    star2:setSize(cc.size(25,27))
    star2:setAnchorPoint(cc.p(0.5,0.5))
    suipianEquip:appendComponent(star2)
    star2:setPositionInContainer(cc.p(91.5,245.5))
    table_suipianEquip["star2"] = star2

    local star3 = fc.FExtensionsImage:create()
    star3:setImage("batch_ui/xingxing.png")
    star3:setSize(cc.size(25,27))
    star3:setAnchorPoint(cc.p(0.5,0.5))
    suipianEquip:appendComponent(star3)
    star3:setPositionInContainer(cc.p(123.5,245.5))
    table_suipianEquip["star3"] = star3

    local star4 = fc.FExtensionsImage:create()
    star4:setImage("batch_ui/xingxing.png")
    star4:setSize(cc.size(25,27))
    star4:setAnchorPoint(cc.p(0.5,0.5))
    suipianEquip:appendComponent(star4)
    star4:setPositionInContainer(cc.p(155.5,245.5))
    table_suipianEquip["star4"] = star4

    local star5 = fc.FExtensionsImage:create()
    star5:setImage("batch_ui/xingxing.png")
    star5:setSize(cc.size(25,27))
    star5:setAnchorPoint(cc.p(0.5,0.5))
    suipianEquip:appendComponent(star5)
    star5:setPositionInContainer(cc.p(187.5,245.5))
    table_suipianEquip["star5"] = star5

    local frame = fc.FExtensionsImage:create()
    frame:setImage("batch_ui/baipinzhi_kuang.png")
    frame:setSize(cc.size(104,104))
    frame:setAnchorPoint(cc.p(0.5,0.5))
    suipianEquip:appendComponent(frame)
    frame:setPositionInContainer(cc.p(124,161))
    table_suipianEquip["frame"] = frame

    local image = fc.FExtensionsImage:create()
    image:setAnchorPoint(cc.p(0.5,0.5))
    suipianEquip:appendComponent(image)
    image:setPositionInContainer(cc.p(124,161))
    table_suipianEquip["image"] = image

    local suipianIcon = fc.FExtensionsImage:create()
    suipianIcon:setImage("batch_ui/suipian_junjichu.png")
    suipianIcon:setSize(cc.size(70,55))
    suipianIcon:setAnchorPoint(cc.p(0.5,0.5))
    suipianEquip:appendComponent(suipianIcon)
    suipianIcon:setPositionInContainer(cc.p(176,195.5))
    table_suipianEquip["suipianIcon"] = suipianIcon

    local shuliang = fc.FLabel:createBMFont()
    shuliang:setSize(cc.size(50,30))
    shuliang:setAnchorPoint(cc.p(0.5,0.5))
    shuliang:setFontSize(20)
    shuliang:setString("数量：")
    shuliang:setColor(cc.c3b(106,68,19))
    suipianEquip:appendComponent(shuliang)
    shuliang:setPositionInContainer(cc.p(72,294))
    table_suipianEquip["shuliang"] = shuliang

    local xiaohao = fc.FLabel:createBMFont()
    xiaohao:setSize(cc.size(50,30))
    xiaohao:setAnchorPoint(cc.p(0.5,0.5))
    xiaohao:setFontSize(20)
    xiaohao:setString("消耗：")
    xiaohao:setColor(cc.c3b(106,68,19))
    suipianEquip:appendComponent(xiaohao)
    xiaohao:setPositionInContainer(cc.p(72,334))
    table_suipianEquip["xiaohao"] = xiaohao

    local yinliang = fc.FExtensionsImage:create()
    yinliang:setImage("batch_ui/yinliang_tubiao.png")
    yinliang:setSize(cc.size(29,24))
    yinliang:setAnchorPoint(cc.p(0.5,0.5))
    suipianEquip:appendComponent(yinliang)
    yinliang:setPositionInContainer(cc.p(112.5,338))
    table_suipianEquip["yinliang"] = yinliang

    return table_suipianEquip

end

