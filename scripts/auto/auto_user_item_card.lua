function createuser_item_card()

    local table_user_item_card = {}

    local user_item_card = fc.FContainerPanel:create()
    user_item_card:setSize(cc.size(251,520))
    table_user_item_card["user_item_card"] = user_item_card

    local card_select = fc.FScale9Image:createWithBatchUIFrame("batch_ui/xuanzhongkuang_beibao.png",cc.rect(124,45,2,2))
    card_select:setSize(cc.size(251,540))
    card_select:setAnchorPoint(cc.p(0.5,0.5))
    user_item_card:appendComponent(card_select)
    card_select:setPositionInContainer(cc.p(125.5,270))
    table_user_item_card["card_select"] = card_select

    local user_item_bg = fc.FScale9Image:createWithBatchUIFrame("nobatch/daoju_dikuang_beibao.png",cc.rect(92,103,5,5))
    user_item_bg:setSize(cc.size(215,500))
    user_item_bg:setAnchorPoint(cc.p(0.5,0.5))
    user_item_card:appendComponent(user_item_bg)
    user_item_bg:setPositionInContainer(cc.p(125.5,268))
    table_user_item_card["user_item_bg"] = user_item_bg

    local card_head_bg = fc.FExtensionsImage:create()
    card_head_bg:setImage("batch_ui/teshutouxiangkuang.png")
    card_head_bg:setSize(cc.size(172,172))
    card_head_bg:setAnchorPoint(cc.p(0.5,0.5))
    user_item_card:appendComponent(card_head_bg)
    card_head_bg:setPositionInContainer(cc.p(124,161))
    table_user_item_card["card_head_bg"] = card_head_bg

    local item_name = fc.FLabel:createBMFont()
    item_name:setSize(cc.size(100,40))
    item_name:setAnchorPoint(cc.p(0.5,0.5))
    item_name:setFontSize(32)
    item_name:setString("鸦片")
    item_name:setColor(cc.c3b(254,254,216))
    user_item_card:appendComponent(item_name)
    item_name:setPositionInContainer(cc.p(126,39))
    table_user_item_card["item_name"] = item_name

    local des_bg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/daoju_dikuang2_beibao.png",cc.rect(20,20,3,3))
    des_bg:setSize(cc.size(166,125))
    des_bg:setAnchorPoint(cc.p(0.5,0.5))
    user_item_card:appendComponent(des_bg)
    des_bg:setPositionInContainer(cc.p(126,313.5))
    table_user_item_card["des_bg"] = des_bg

    local des_label = fc.FLabel:createBMFont()
    des_label:setSize(cc.size(160,30))
    des_label:setWidth(150)
    des_label:setAnchorPoint(cc.p(0.5,0.5))
    des_label:setFontSize(20)
    des_label:setString("步兵步兵步兵步兵步兵步兵步兵步兵步兵步兵步兵步兵")
    des_label:setColor(cc.c3b(111,70,20))
    user_item_card:appendComponent(des_label)
    des_label:setPositionInContainer(cc.p(127,301))
    table_user_item_card["des_label"] = des_label

    local num_bg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/daoju_dikuang3_beibao.png",cc.rect(86,14,2,2))
    num_bg:setSize(cc.size(193,69))
    num_bg:setAnchorPoint(cc.p(0.5,0.5))
    user_item_card:appendComponent(num_bg)
    num_bg:setPositionInContainer(cc.p(123.5,412.5))
    table_user_item_card["num_bg"] = num_bg

    local num_label = fc.FLabel:createBMFont()
    num_label:setSize(cc.size(160,30))
    num_label:setWidth(160)
    num_label:setAnchorPoint(cc.p(0.5,0.5))
    num_label:setFontSize(20)
    num_label:setString("步兵步兵")
    num_label:setColor(cc.c3b(111,70,20))
    user_item_card:appendComponent(num_label)
    num_label:setPositionInContainer(cc.p(122,408))
    table_user_item_card["num_label"] = num_label

    local level_label = fc.FLabel:createBMFont()
    level_label:setSize(cc.size(160,30))
    level_label:setWidth(0)
    level_label:setAnchorPoint(cc.p(0.5,0.5))
    level_label:setFontSize(20)
    level_label:setString("步兵步兵步兵步兵步兵步兵步兵步兵步兵步兵步兵步兵")
    level_label:setColor(cc.c3b(111,70,20))
    user_item_card:appendComponent(level_label)
    level_label:setPositionInContainer(cc.p(127,261))
    table_user_item_card["level_label"] = level_label

    local star_label = fc.FLabel:createBMFont()
    star_label:setSize(cc.size(160,30))
    star_label:setWidth(0)
    star_label:setAnchorPoint(cc.p(0.5,0.5))
    star_label:setFontSize(20)
    star_label:setString("星级 :")
    star_label:setColor(cc.c3b(111,70,20))
    user_item_card:appendComponent(star_label)
    star_label:setPositionInContainer(cc.p(127,301))
    table_user_item_card["star_label"] = star_label

    local yinliang_label = fc.FLabel:createBMFont()
    yinliang_label:setSize(cc.size(160,30))
    yinliang_label:setWidth(0)
    yinliang_label:setAnchorPoint(cc.p(0.5,0.5))
    yinliang_label:setFontSize(20)
    if LANGUAGE_TYPE == 3 then
    	yinliang_label:setString("星級 :")
    else
    	yinliang_label:setString("星级 :")
    end
    
    yinliang_label:setColor(cc.c3b(111,70,20))
    user_item_card:appendComponent(yinliang_label)
    yinliang_label:setPositionInContainer(cc.p(127,344))
    table_user_item_card["yinliang_label"] = yinliang_label

    local star1 = fc.FExtensionsImage:create()
    star1:setImage("batch_ui/xingxing.png")
    star1:setSize(cc.size(25,27))
    star1:setAnchorPoint(cc.p(0.5,0.5))
    user_item_card:appendComponent(star1)
    star1:setPositionInContainer(cc.p(105.5,306.5))
    table_user_item_card["star1"] = star1

    local star2 = fc.FExtensionsImage:create()
    star2:setImage("batch_ui/xingxing.png")
    star2:setSize(cc.size(25,27))
    star2:setAnchorPoint(cc.p(0.5,0.5))
    user_item_card:appendComponent(star2)
    star2:setPositionInContainer(cc.p(126.5,306.5))
    table_user_item_card["star2"] = star2

    local star3 = fc.FExtensionsImage:create()
    star3:setImage("batch_ui/xingxing.png")
    star3:setSize(cc.size(25,27))
    star3:setAnchorPoint(cc.p(0.5,0.5))
    user_item_card:appendComponent(star3)
    star3:setPositionInContainer(cc.p(147.5,306.5))
    table_user_item_card["star3"] = star3

    local star4 = fc.FExtensionsImage:create()
    star4:setImage("batch_ui/xingxing.png")
    star4:setSize(cc.size(25,27))
    star4:setAnchorPoint(cc.p(0.5,0.5))
    user_item_card:appendComponent(star4)
    star4:setPositionInContainer(cc.p(169.5,306.5))
    table_user_item_card["star4"] = star4

    local star5 = fc.FExtensionsImage:create()
    star5:setImage("batch_ui/xingxing.png")
    star5:setSize(cc.size(25,27))
    star5:setAnchorPoint(cc.p(0.5,0.5))
    user_item_card:appendComponent(star5)
    star5:setPositionInContainer(cc.p(190.5,306.5))
    table_user_item_card["star5"] = star5

    local frame = fc.FExtensionsImage:create()
    frame:setImage("batch_ui/baipinzhi_kuang.png")
    frame:setSize(cc.size(104,104))
    frame:setAnchorPoint(cc.p(0.5,0.5))
    user_item_card:appendComponent(frame)
    frame:setPositionInContainer(cc.p(124,161))
    table_user_item_card["frame"] = frame

    local item = fc.FExtensionsImage:create()
    item:setAnchorPoint(cc.p(0.5,0.5))
    user_item_card:appendComponent(item)
    item:setPositionInContainer(cc.p(124,161))
    table_user_item_card["item"] = item

    return table_user_item_card

end

