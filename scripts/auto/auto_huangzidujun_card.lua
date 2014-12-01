function createhuangzidujun_card()

    local table_huangzidujun_card = {}

    local huangzidujun_card = fc.FContainerPanel:create()
    huangzidujun_card:setSize(cc.size(742,430))
    table_huangzidujun_card["huangzidujun_card"] = huangzidujun_card

    local huangzi_card_panel = fc.FContainerPanel:create()
    huangzi_card_panel:setSize(cc.size(406,429))
    huangzi_card_panel:setAnchorPoint(cc.p(0.5,0.5))
    huangzidujun_card:appendComponent(huangzi_card_panel)
    huangzi_card_panel:setPositionInContainer(cc.p(266,215.5))
    table_huangzidujun_card["huangzi_card_panel"] = huangzi_card_panel

    local card_diwen_panel = fc.FContainerPanel:create()
    card_diwen_panel:setSize(cc.size(266,390))
    card_diwen_panel:setAnchorPoint(cc.p(0.5,0.5))
    huangzi_card_panel:appendComponent(card_diwen_panel)
    card_diwen_panel:setPositionInContainer(cc.p(204,227))
    table_huangzidujun_card["card_diwen_panel"] = card_diwen_panel

    local card_quality_diwen = fc.FScale9Image:createWithBatchUIFrame("batch_ui/diwen4_paibingbuzhen.png",cc.rect(1,1,1,1))
    card_quality_diwen:setSize(cc.size(266,390))
    card_quality_diwen:setAnchorPoint(cc.p(0.5,0.5))
    card_diwen_panel:appendComponent(card_quality_diwen)
    card_quality_diwen:setPositionInContainer(cc.p(133,195))
    table_huangzidujun_card["card_quality_diwen"] = card_quality_diwen

    local diwen_la = fc.FExtensionsImage:create()
    diwen_la:setImage("batch_ui/diwen3_paibingbuzhen.png")
    diwen_la:setSize(cc.size(50,50))
    diwen_la:setAnchorPoint(cc.p(0.5,0.5))
    card_diwen_panel:appendComponent(diwen_la)
    diwen_la:setPositionInContainer(cc.p(25,25))
    table_huangzidujun_card["diwen_la"] = diwen_la

    local diwen_lb = fc.FExtensionsImage:create()
    diwen_lb:setImage("batch_ui/diwen3_paibingbuzhen.png")
    diwen_lb:setSize(cc.size(50,50))
    diwen_lb:setFlipType(4)
    diwen_lb:setAnchorPoint(cc.p(0.5,0.5))
    card_diwen_panel:appendComponent(diwen_lb)
    diwen_lb:setPositionInContainer(cc.p(25,364))
    table_huangzidujun_card["diwen_lb"] = diwen_lb

    local diwen_ra = fc.FExtensionsImage:create()
    diwen_ra:setImage("batch_ui/diwen3_paibingbuzhen.png")
    diwen_ra:setSize(cc.size(50,50))
    diwen_ra:setFlipType(2)
    diwen_ra:setAnchorPoint(cc.p(0.5,0.5))
    card_diwen_panel:appendComponent(diwen_ra)
    diwen_ra:setPositionInContainer(cc.p(241,25))
    table_huangzidujun_card["diwen_ra"] = diwen_ra

    local diwen_rb = fc.FExtensionsImage:create()
    diwen_rb:setImage("batch_ui/diwen3_paibingbuzhen.png")
    diwen_rb:setSize(cc.size(50,50))
    diwen_rb:setFlipType(8)
    diwen_rb:setAnchorPoint(cc.p(0.5,0.5))
    card_diwen_panel:appendComponent(diwen_rb)
    diwen_rb:setPositionInContainer(cc.p(241,364))
    table_huangzidujun_card["diwen_rb"] = diwen_rb

    local shangzuo = fc.FScale9Image:createWithBatchUIFrame("batch_ui/zongjiachengdikuang_paibingbuzhen.png",cc.rect(62,0,2,29))
    shangzuo:setSize(cc.size(335,48))
    shangzuo:setAnchorPoint(cc.p(0.5,0.5))
    shangzuo:setScaleY(-1)
    huangzi_card_panel:appendComponent(shangzuo)
    shangzuo:setPositionInContainer(cc.p(203.5,31))
    table_huangzidujun_card["shangzuo"] = shangzuo

    local star_dark = fc.FExtensionsImage:create()
    star_dark:setImage("batch_ui/xingxing_dark.png")
    star_dark:setSize(cc.size(20,19))
    star_dark:setAnchorPoint(cc.p(0.5,0.5))
    huangzi_card_panel:appendComponent(star_dark)
    star_dark:setPositionInContainer(cc.p(139,26.5))
    table_huangzidujun_card["star_dark"] = star_dark

    local star_dark = fc.FExtensionsImage:create()
    star_dark:setImage("batch_ui/xingxing_dark.png")
    star_dark:setSize(cc.size(20,19))
    star_dark:setAnchorPoint(cc.p(0.5,0.5))
    huangzi_card_panel:appendComponent(star_dark)
    star_dark:setPositionInContainer(cc.p(171,26.5))
    table_huangzidujun_card["star_dark"] = star_dark

    local star_dark = fc.FExtensionsImage:create()
    star_dark:setImage("batch_ui/xingxing_dark.png")
    star_dark:setSize(cc.size(20,19))
    star_dark:setAnchorPoint(cc.p(0.5,0.5))
    huangzi_card_panel:appendComponent(star_dark)
    star_dark:setPositionInContainer(cc.p(204,26.5))
    table_huangzidujun_card["star_dark"] = star_dark

    local star_dark = fc.FExtensionsImage:create()
    star_dark:setImage("batch_ui/xingxing_dark.png")
    star_dark:setSize(cc.size(20,19))
    star_dark:setAnchorPoint(cc.p(0.5,0.5))
    huangzi_card_panel:appendComponent(star_dark)
    star_dark:setPositionInContainer(cc.p(236,26.5))
    table_huangzidujun_card["star_dark"] = star_dark

    local star_dark = fc.FExtensionsImage:create()
    star_dark:setImage("batch_ui/xingxing_dark.png")
    star_dark:setSize(cc.size(20,19))
    star_dark:setAnchorPoint(cc.p(0.5,0.5))
    huangzi_card_panel:appendComponent(star_dark)
    star_dark:setPositionInContainer(cc.p(268,26.5))
    table_huangzidujun_card["star_dark"] = star_dark

    local hzdj_star1_image = fc.FExtensionsImage:create()
    hzdj_star1_image:setImage("batch_ui/xingxing.png")
    hzdj_star1_image:setSize(cc.size(20,19))
    hzdj_star1_image:setAnchorPoint(cc.p(0.5,0.5))
    huangzi_card_panel:appendComponent(hzdj_star1_image)
    hzdj_star1_image:setPositionInContainer(cc.p(139,26.5))
    table_huangzidujun_card["hzdj_star1_image"] = hzdj_star1_image

    local hzdj_star2_image = fc.FExtensionsImage:create()
    hzdj_star2_image:setImage("batch_ui/xingxing.png")
    hzdj_star2_image:setSize(cc.size(20,19))
    hzdj_star2_image:setAnchorPoint(cc.p(0.5,0.5))
    huangzi_card_panel:appendComponent(hzdj_star2_image)
    hzdj_star2_image:setPositionInContainer(cc.p(170,26.5))
    table_huangzidujun_card["hzdj_star2_image"] = hzdj_star2_image

    local hzdj_star3_image = fc.FExtensionsImage:create()
    hzdj_star3_image:setImage("batch_ui/xingxing.png")
    hzdj_star3_image:setSize(cc.size(20,19))
    hzdj_star3_image:setAnchorPoint(cc.p(0.5,0.5))
    huangzi_card_panel:appendComponent(hzdj_star3_image)
    hzdj_star3_image:setPositionInContainer(cc.p(204,26.5))
    table_huangzidujun_card["hzdj_star3_image"] = hzdj_star3_image

    local hzdj_star4_image = fc.FExtensionsImage:create()
    hzdj_star4_image:setImage("batch_ui/xingxing.png")
    hzdj_star4_image:setSize(cc.size(20,19))
    hzdj_star4_image:setAnchorPoint(cc.p(0.5,0.5))
    huangzi_card_panel:appendComponent(hzdj_star4_image)
    hzdj_star4_image:setPositionInContainer(cc.p(236,26.5))
    table_huangzidujun_card["hzdj_star4_image"] = hzdj_star4_image

    local hzdj_star5_image = fc.FExtensionsImage:create()
    hzdj_star5_image:setImage("batch_ui/xingxing.png")
    hzdj_star5_image:setSize(cc.size(20,19))
    hzdj_star5_image:setAnchorPoint(cc.p(0.5,0.5))
    huangzi_card_panel:appendComponent(hzdj_star5_image)
    hzdj_star5_image:setPositionInContainer(cc.p(268,26.5))
    table_huangzidujun_card["hzdj_star5_image"] = hzdj_star5_image

    local card_gan = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongbiankuang5_paibingbuzhen.png",cc.rect(6,24,2,2))
    card_gan:setSize(cc.size(7,368))
    card_gan:setAnchorPoint(cc.p(0.5,0.5))
    huangzi_card_panel:appendComponent(card_gan)
    card_gan:setPositionInContainer(cc.p(71.5,239))
    table_huangzidujun_card["card_gan"] = card_gan

    local card_gan = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongbiankuang5_paibingbuzhen.png",cc.rect(6,24,2,2))
    card_gan:setSize(cc.size(7,368))
    card_gan:setAnchorPoint(cc.p(0.5,0.5))
    huangzi_card_panel:appendComponent(card_gan)
    card_gan:setPositionInContainer(cc.p(337.5,238))
    table_huangzidujun_card["card_gan"] = card_gan

    local hzdj_touxiang_image = fc.FExtensionsImage:create()
    hzdj_touxiang_image:setImage("nobatch/tupian.png")
    hzdj_touxiang_image:setSize(cc.size(320,363))
    hzdj_touxiang_image:setAnchorPoint(cc.p(0.5,0.5))
    huangzi_card_panel:appendComponent(hzdj_touxiang_image)
    hzdj_touxiang_image:setPositionInContainer(cc.p(204,240.5))
    table_huangzidujun_card["hzdj_touxiang_image"] = hzdj_touxiang_image

    local public_prop_di = fc.FScale9Image:createWithBatchUIFrame("batch_ui/zuhemingchengdikuang.png",cc.rect(11,9,3,3))
    public_prop_di:setSize(cc.size(253,244))
    public_prop_di:setAnchorPoint(cc.p(0.5,0.5))
    huangzidujun_card:appendComponent(public_prop_di)
    public_prop_di:setPositionInContainer(cc.p(595.5,159))
    table_huangzidujun_card["public_prop_di"] = public_prop_di

    local hzdj_change_button = fc.FScaleButton:create()
    hzdj_change_button:setSize(cc.size(144,53))
    hzdj_change_button:setAnchorPoint(cc.p(0.5,0.5))
    hzdj_change_button:setButtonImage("batch_ui/putonganniu1_up.png")
    huangzidujun_card:appendComponent(hzdj_change_button)
    hzdj_change_button:setPositionInContainer(cc.p(596,320.5))
    table_huangzidujun_card["hzdj_change_button"] = hzdj_change_button

    local geng_ui = fc.FShaderExtensionsImage:create(0)
    geng_ui:setAnchorPoint(cc.p(0.5,0.5))
    geng_ui:setImage("batch_ui/geng_uizi.png")
    geng_ui:setSize(cc.size(32,32))
    hzdj_change_button:appendComponent(geng_ui)
    geng_ui:setPositionInContainer(cc.p(39,26))
    table_huangzidujun_card["geng_ui"] = geng_ui

    local huan_ui = fc.FShaderExtensionsImage:create(0)
    huan_ui:setAnchorPoint(cc.p(0.5,0.5))
    huan_ui:setImage("batch_ui/huan_uizi.png")
    huan_ui:setSize(cc.size(32,32))
    hzdj_change_button:appendComponent(huan_ui)
    huan_ui:setPositionInContainer(cc.p(101,26))
    table_huangzidujun_card["huan_ui"] = huan_ui

    local hzdj_yuelongmen_button = fc.FScaleButton:create()
    hzdj_yuelongmen_button:setSize(cc.size(144,53))
    hzdj_yuelongmen_button:setAnchorPoint(cc.p(0.5,0.5))
    hzdj_yuelongmen_button:setButtonImage("batch_ui/putonganniu1_up.png")
    huangzidujun_card:appendComponent(hzdj_yuelongmen_button)
    hzdj_yuelongmen_button:setPositionInContainer(cc.p(596,387.5))
    table_huangzidujun_card["hzdj_yuelongmen_button"] = hzdj_yuelongmen_button

    local yue_ui = fc.FShaderExtensionsImage:create(0)
    yue_ui:setAnchorPoint(cc.p(0.5,0.5))
    yue_ui:setImage("batch_ui/yue_uizi.png")
    yue_ui:setSize(cc.size(32,32))
    hzdj_yuelongmen_button:appendComponent(yue_ui)
    yue_ui:setPositionInContainer(cc.p(39,26))
    table_huangzidujun_card["yue_ui"] = yue_ui

    local long_ui = fc.FShaderExtensionsImage:create(0)
    long_ui:setAnchorPoint(cc.p(0.5,0.5))
    long_ui:setImage("batch_ui/long_uizi.png")
    long_ui:setSize(cc.size(32,32))
    hzdj_yuelongmen_button:appendComponent(long_ui)
    long_ui:setPositionInContainer(cc.p(72,26))
    table_huangzidujun_card["long_ui"] = long_ui

    local men_ui = fc.FShaderExtensionsImage:create(0)
    men_ui:setAnchorPoint(cc.p(0.5,0.5))
    men_ui:setImage("batch_ui/men_uizi.png")
    men_ui:setSize(cc.size(32,32))
    hzdj_yuelongmen_button:appendComponent(men_ui)
    men_ui:setPositionInContainer(cc.p(104,26))
    table_huangzidujun_card["men_ui"] = men_ui

    local xingming = fc.FLabel:createBMFont()
    xingming:setSize(cc.size(60,30))
    xingming:setAnchorPoint(cc.p(0.5,0.5))
    xingming:setFontSize(20)
    xingming:setString("姓名：")
    xingming:setColor(cc.c3b(250,255,165))
    huangzidujun_card:appendComponent(xingming)
    xingming:setPositionInContainer(cc.p(538,98))
    table_huangzidujun_card["xingming"] = xingming

    local dengji = fc.FLabel:createBMFont()
    dengji:setSize(cc.size(60,30))
    dengji:setAnchorPoint(cc.p(0.5,0.5))
    dengji:setFontSize(20)
    if LANGUAGE_TYPE == 3 then
    	dengji:setString("等級：")
    else
    	dengji:setString("等级：")
    end
    
    dengji:setColor(cc.c3b(250,255,165))
    huangzidujun_card:appendComponent(dengji)
    dengji:setPositionInContainer(cc.p(538,158))
    table_huangzidujun_card["dengji"] = dengji

    local jingyan = fc.FLabel:createBMFont()
    jingyan:setSize(cc.size(60,30))
    jingyan:setAnchorPoint(cc.p(0.5,0.5))
    jingyan:setFontSize(20)
     if LANGUAGE_TYPE == 3 then
     	jingyan:setString("經驗：")
     else
     	jingyan:setString("经验：")
     end
    jingyan:setColor(cc.c3b(250,255,165))
    huangzidujun_card:appendComponent(jingyan)
    jingyan:setPositionInContainer(cc.p(538,221))
    table_huangzidujun_card["jingyan"] = jingyan

    local tip_info_di = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shuruwenzi.png",cc.rect(11,9,47,7))
    tip_info_di:setSize(cc.size(90,30))
    tip_info_di:setAnchorPoint(cc.p(0.5,0.5))
    huangzidujun_card:appendComponent(tip_info_di)
    tip_info_di:setPositionInContainer(cc.p(620,160))
    table_huangzidujun_card["tip_info_di"] = tip_info_di

    local tip_info_di = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shuruwenzi.png",cc.rect(11,9,47,7))
    tip_info_di:setSize(cc.size(90,30))
    tip_info_di:setAnchorPoint(cc.p(0.5,0.5))
    huangzidujun_card:appendComponent(tip_info_di)
    tip_info_di:setPositionInContainer(cc.p(619,222))
    table_huangzidujun_card["tip_info_di"] = tip_info_di

    local hzdj_card_name_label = fc.FLabel:createSystemFont()
    hzdj_card_name_label:setSize(cc.size(80,30))
    hzdj_card_name_label:setAnchorPoint(cc.p(0.5,0.5))
    hzdj_card_name_label:setFontSize(20)
    hzdj_card_name_label:setString("步兵")
    hzdj_card_name_label:setColor(cc.c3b(139,255,240))
    hzdj_card_name_label:setAlignment(0)
    huangzidujun_card:appendComponent(hzdj_card_name_label)
    hzdj_card_name_label:setPositionInContainer(cc.p(617,99))
    table_huangzidujun_card["hzdj_card_name_label"] = hzdj_card_name_label

    local hzdj_tx_loading_num_label = fc.FLabel:createBMFont()
    hzdj_tx_loading_num_label:setSize(cc.size(60,30))
    hzdj_tx_loading_num_label:setAnchorPoint(cc.p(0.5,0.5))
    hzdj_tx_loading_num_label:setFontSize(20)
    hzdj_tx_loading_num_label:setString("100")
    hzdj_tx_loading_num_label:setColor(cc.c3b(139,255,240))
    huangzidujun_card:appendComponent(hzdj_tx_loading_num_label)
    hzdj_tx_loading_num_label:setPositionInContainer(cc.p(620,157))
    table_huangzidujun_card["hzdj_tx_loading_num_label"] = hzdj_tx_loading_num_label

    local jingyan_num = fc.FLabel:createBMFont()
    jingyan_num:setSize(cc.size(60,30))
    jingyan_num:setAnchorPoint(cc.p(0.5,0.5))
    jingyan_num:setFontSize(20)
    jingyan_num:setString("101")
    jingyan_num:setColor(cc.c3b(139,255,240))
    huangzidujun_card:appendComponent(jingyan_num)
    jingyan_num:setPositionInContainer(cc.p(619,219))
    table_huangzidujun_card["jingyan_num"] = jingyan_num

    return table_huangzidujun_card

end

