function createzouzhang_reward_popup()

    local table_zouzhang_reward_popup = {}

    local zouzhang_reward_popup = fc.FContainerPanel:create()
    zouzhang_reward_popup:setSize(cc.size(566,303))
    table_zouzhang_reward_popup["zouzhang_reward_popup"] = zouzhang_reward_popup

    local zouzhang_reward1scale9 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/zouzhe_1.png",cc.rect(101,41,5,5))
    zouzhang_reward1scale9:setSize(cc.size(167,303))
    zouzhang_reward1scale9:setAnchorPoint(cc.p(0.5,0.5))
    zouzhang_reward_popup:appendComponent(zouzhang_reward1scale9)
    zouzhang_reward1scale9:setPositionInContainer(cc.p(86.5,151.5))
    table_zouzhang_reward_popup["zouzhang_reward1scale9"] = zouzhang_reward1scale9

    local zouzhang_reward3scale9 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/zouzhe_2.png",cc.rect(24,42,5,5))
    zouzhang_reward3scale9:setSize(cc.size(118,292))
    zouzhang_reward3scale9:setAnchorPoint(cc.p(0.5,0.5))
    zouzhang_reward_popup:appendComponent(zouzhang_reward3scale9)
    zouzhang_reward3scale9:setPositionInContainer(cc.p(225,152))
    table_zouzhang_reward_popup["zouzhang_reward3scale9"] = zouzhang_reward3scale9

    local zouzhang_reward4scale9 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/zouzhe_2.png",cc.rect(24,42,5,5))
    zouzhang_reward4scale9:setSize(cc.size(118,292))
    zouzhang_reward4scale9:setAnchorPoint(cc.p(0.5,0.5))
    zouzhang_reward_popup:appendComponent(zouzhang_reward4scale9)
    zouzhang_reward4scale9:setPositionInContainer(cc.p(343,152))
    table_zouzhang_reward_popup["zouzhang_reward4scale9"] = zouzhang_reward4scale9

    local zouzhang_reward2scale9 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/zouzhe_1.png",cc.rect(101,41,5,5))
    zouzhang_reward2scale9:setSize(cc.size(167,303))
    zouzhang_reward2scale9:setAnchorPoint(cc.p(0.5,0.5))
    zouzhang_reward2scale9:setScaleX(-1)
    zouzhang_reward_popup:appendComponent(zouzhang_reward2scale9)
    zouzhang_reward2scale9:setPositionInContainer(cc.p(481.5,151.5))
    table_zouzhang_reward_popup["zouzhang_reward2scale9"] = zouzhang_reward2scale9

    local des1 = fc.FLabel:createBMFont()
    des1:setSize(cc.size(30,100))
    des1:setAnchorPoint(cc.p(0.5,0.5))
    des1:setFontSize(18)
    if LANGUAGE_TYPE == 3 then
    	des1:setVerString("啟稟皇上")
    else
    	des1:setVerString("启禀皇上")
    end
    des1:setColor(cc.c3b(91,24,6))
    zouzhang_reward_popup:appendComponent(des1)
    des1:setPositionInContainer(cc.p(365,137))
    table_zouzhang_reward_popup["des1"] = des1

    local des2 = fc.FLabel:createBMFont()
    des2:setSize(cc.size(30,245))
    des2:setAnchorPoint(cc.p(0.5,0.5))
    des2:setFontSize(18)
    if LANGUAGE_TYPE == 3 then
    	des2:setVerString("我朝國泰民安 四海升平")
    else
    	des2:setVerString("我朝国泰民安 四海升平")
    end
    des2:setColor(cc.c3b(91,24,6))
    zouzhang_reward_popup:appendComponent(des2)
    des2:setPositionInContainer(cc.p(310,176.5))
    table_zouzhang_reward_popup["des2"] = des2

    local des3 = fc.FLabel:createBMFont()
    des3:setSize(cc.size(30,245))
    des3:setAnchorPoint(cc.p(0.5,0.5))
    des3:setFontSize(18)
     if LANGUAGE_TYPE == 3 then
     	 des3:setVerString("番邦感懷天子 國威浩蕩")
     else
     	 des3:setVerString("番邦感怀天子 国威浩荡")
     end
    des3:setColor(cc.c3b(91,24,6))
    zouzhang_reward_popup:appendComponent(des3)
    des3:setPositionInContainer(cc.p(255,176.5))
    table_zouzhang_reward_popup["des3"] = des3

    local des4 = fc.FLabel:createBMFont()
    des4:setSize(cc.size(30,245))
    des4:setAnchorPoint(cc.p(0.5,0.5))
    des4:setFontSize(18)
     if LANGUAGE_TYPE == 3 then
     	des4:setVerString("特地派遣使者 前來進貢")
     else
	    des4:setVerString("特地派遣使者 前来进贡")
     end
    des4:setColor(cc.c3b(91,24,6))
    zouzhang_reward_popup:appendComponent(des4)
    des4:setPositionInContainer(cc.p(202,176.5))
    table_zouzhang_reward_popup["des4"] = des4

    local des5 = fc.FLabel:createBMFont()
    des5:setSize(cc.size(30,120))
    des5:setAnchorPoint(cc.p(0.5,0.5))
    des5:setFontSize(18)
    if LANGUAGE_TYPE == 3 then
    	des5:setVerString("請皇上過目")
    else
    	des5:setVerString("请皇上过目")
    end
    des5:setColor(cc.c3b(91,24,6))
    zouzhang_reward_popup:appendComponent(des5)
    des5:setPositionInContainer(cc.p(121,96))
    table_zouzhang_reward_popup["des5"] = des5

    local type_card_panel = fc.FContainerPanel:create()
    type_card_panel:setSize(cc.size(170,230))
    type_card_panel:setAnchorPoint(cc.p(0.5,0.5))
    zouzhang_reward_popup:appendComponent(type_card_panel)
    type_card_panel:setPositionInContainer(cc.p(478,141))
    table_zouzhang_reward_popup["type_card_panel"] = type_card_panel

    local quality = fc.FExtensionsImage:create()
    quality:setImage("batch_ui/baipinzhi_kuang.png")
    quality:setSize(cc.size(104,104))
    quality:setAnchorPoint(cc.p(0.5,0.5))
    type_card_panel:appendComponent(quality)
    quality:setPositionInContainer(cc.p(91,85))
    table_zouzhang_reward_popup["quality"] = quality

    local card = fc.FExtensionsImage:create()
    card:setAnchorPoint(cc.p(0.5,0.5))
    type_card_panel:appendComponent(card)
    card:setPositionInContainer(cc.p(91,85))
    table_zouzhang_reward_popup["card"] = card

    local des_di = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shuruwenzi.png",cc.rect(11,9,47,7))
    des_di:setSize(cc.size(120,25))
    des_di:setAnchorPoint(cc.p(0.5,0.5))
    type_card_panel:appendComponent(des_di)
    des_di:setPositionInContainer(cc.p(92,173.5))
    table_zouzhang_reward_popup["des_di"] = des_di

    local card_name = fc.FLabel:createBMFont()
    card_name:setSize(cc.size(100,30))
    card_name:setAnchorPoint(cc.p(0.5,0.5))
    card_name:setFontSize(20)
    card_name:setString("步兵步")
    card_name:setColor(cc.c3b(255,255,0))
    type_card_panel:appendComponent(card_name)
    card_name:setPositionInContainer(cc.p(92,169))
    table_zouzhang_reward_popup["card_name"] = card_name

    local num = fc.FAnimationLabel:create("",g_game.g_resourceManager:getImageFontPath(g_game.g_f_image_font_type.F_YELLOW_TYPE))
    num:setAnchorPoint(cc.p(0.5,0.5))
    num:setSize(cc.size(28,20))
    num:setAlignment(0)
    num:setScale(0.4)
    type_card_panel:appendComponent(num)
    num:setPositionInContainer(cc.p(55,123))
    table_zouzhang_reward_popup["num"] = num

    local type_exp_panel = fc.FContainerPanel:create()
    type_exp_panel:setSize(cc.size(170,230))
    type_exp_panel:setAnchorPoint(cc.p(0.5,0.5))
    zouzhang_reward_popup:appendComponent(type_exp_panel)
    type_exp_panel:setPositionInContainer(cc.p(478,141))
    table_zouzhang_reward_popup["type_exp_panel"] = type_exp_panel

    local yuanbao_double = fc.FExtensionsImage:create()
    yuanbao_double:setImage("batch_ui/yinliangDouble.png")
    yuanbao_double:setSize(cc.size(54,42))
    yuanbao_double:setAnchorPoint(cc.p(0.5,0.5))
    type_exp_panel:appendComponent(yuanbao_double)
    yuanbao_double:setPositionInContainer(cc.p(38,53))
    table_zouzhang_reward_popup["yuanbao_double"] = yuanbao_double

    local exp_image = fc.FExtensionsImage:create()
    exp_image:setImage("batch_ui/exp.png")
    exp_image:setSize(cc.size(71,42))
    exp_image:setAnchorPoint(cc.p(0.5,0.5))
    type_exp_panel:appendComponent(exp_image)
    exp_image:setPositionInContainer(cc.p(36.5,112))
    table_zouzhang_reward_popup["exp_image"] = exp_image

    local adddi1 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shuruwenzi.png",cc.rect(11,9,47,7))
    adddi1:setSize(cc.size(80,25))
    adddi1:setAnchorPoint(cc.p(0.5,0.5))
    type_exp_panel:appendComponent(adddi1)
    adddi1:setPositionInContainer(cc.p(115,53.5))
    table_zouzhang_reward_popup["adddi1"] = adddi1

    local adddi2 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shuruwenzi.png",cc.rect(11,9,47,7))
    adddi2:setSize(cc.size(80,25))
    adddi2:setAnchorPoint(cc.p(0.5,0.5))
    type_exp_panel:appendComponent(adddi2)
    adddi2:setPositionInContainer(cc.p(115,111.5))
    table_zouzhang_reward_popup["adddi2"] = adddi2

    local exp_add = fc.FLabel:createBMFont()
    exp_add:setSize(cc.size(100,30))
    exp_add:setAnchorPoint(cc.p(0.5,0.5))
    exp_add:setFontSize(20)
    exp_add:setString("1000")
    exp_add:setColor(cc.c3b(255,255,0))
    type_exp_panel:appendComponent(exp_add)
    exp_add:setPositionInContainer(cc.p(115,108))
    table_zouzhang_reward_popup["exp_add"] = exp_add

    local yinliang_add = fc.FLabel:createBMFont()
    yinliang_add:setSize(cc.size(100,30))
    yinliang_add:setAnchorPoint(cc.p(0.5,0.5))
    yinliang_add:setFontSize(20)
    yinliang_add:setString("1000")
    yinliang_add:setColor(cc.c3b(255,255,0))
    type_exp_panel:appendComponent(yinliang_add)
    yinliang_add:setPositionInContainer(cc.p(115,50))
    table_zouzhang_reward_popup["yinliang_add"] = yinliang_add

    local gongjizhiimage = fc.FExtensionsImage:create()
    gongjizhiimage:setImage("batch_ui/gongjizhi.png")
    gongjizhiimage:setSize(cc.size(36,41))
    gongjizhiimage:setAnchorPoint(cc.p(0.5,0.5))
    type_exp_panel:appendComponent(gongjizhiimage)
    gongjizhiimage:setPositionInContainer(cc.p(33,168.5))
    table_zouzhang_reward_popup["gongjizhiimage"] = gongjizhiimage

    local adddi3 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shuruwenzi.png",cc.rect(11,9,47,7))
    adddi3:setSize(cc.size(80,25))
    adddi3:setAnchorPoint(cc.p(0.5,0.5))
    type_exp_panel:appendComponent(adddi3)
    adddi3:setPositionInContainer(cc.p(115,172.5))
    table_zouzhang_reward_popup["adddi3"] = adddi3

    local gongjizhi_add = fc.FLabel:createBMFont()
    gongjizhi_add:setSize(cc.size(100,30))
    gongjizhi_add:setAnchorPoint(cc.p(0.5,0.5))
    gongjizhi_add:setFontSize(20)
    gongjizhi_add:setString("1000")
    gongjizhi_add:setColor(cc.c3b(255,255,0))
    type_exp_panel:appendComponent(gongjizhi_add)
    gongjizhi_add:setPositionInContainer(cc.p(112,169))
    table_zouzhang_reward_popup["gongjizhi_add"] = gongjizhi_add

    local plus1 = fc.FLabel:createBMFont()
    plus1:setSize(cc.size(30,30))
    plus1:setAnchorPoint(cc.p(0.5,0.5))
    plus1:setFontSize(20)
    plus1:setString("+")
    plus1:setColor(cc.c3b(255,255,0))
    type_exp_panel:appendComponent(plus1)
    plus1:setPositionInContainer(cc.p(91,50))
    table_zouzhang_reward_popup["plus1"] = plus1

    local plus2 = fc.FLabel:createBMFont()
    plus2:setSize(cc.size(30,30))
    plus2:setAnchorPoint(cc.p(0.5,0.5))
    plus2:setFontSize(20)
    plus2:setString("+")
    plus2:setColor(cc.c3b(255,255,0))
    type_exp_panel:appendComponent(plus2)
    plus2:setPositionInContainer(cc.p(91,108))
    table_zouzhang_reward_popup["plus2"] = plus2

    local plus3 = fc.FLabel:createBMFont()
    plus3:setSize(cc.size(30,30))
    plus3:setAnchorPoint(cc.p(0.5,0.5))
    plus3:setFontSize(20)
    plus3:setString("+")
    plus3:setColor(cc.c3b(255,255,0))
    type_exp_panel:appendComponent(plus3)
    plus3:setPositionInContainer(cc.p(91,168))
    table_zouzhang_reward_popup["plus3"] = plus3

    return table_zouzhang_reward_popup

end

