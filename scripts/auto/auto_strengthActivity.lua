function createstrengthActivity()

    local table_strengthActivity = {}

    local strengthActivity = fc.FContainerPanel:create()
    strengthActivity:setSize(cc.size(960,640))
    table_strengthActivity["strengthActivity"] = strengthActivity

    local label_bg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongdikuang1.png",cc.rect(25,25,4,4))
    label_bg:setSize(cc.size(695,460))
    label_bg:setAnchorPoint(cc.p(0.5,0.5))
    strengthActivity:appendComponent(label_bg)
    label_bg:setPositionInContainer(cc.p(562.5,386))
    table_strengthActivity["label_bg"] = label_bg

    local label_di = fc.FScale9Image:createWithBatchUIFrame("nobatch/benguanjiangli_kuang.png",cc.rect(99,113,2,2))
    label_di:setSize(cc.size(735,475))
    label_di:setAnchorPoint(cc.p(0.5,0.5))
    strengthActivity:appendComponent(label_di)
    label_di:setPositionInContainer(cc.p(556.5,378.5))
    table_strengthActivity["label_di"] = label_di

    local label_panel = fc.FContainerPanel:create()
    label_panel:setSize(cc.size(155,36))
    label_panel:setAnchorPoint(cc.p(0.5,0.5))
    strengthActivity:appendComponent(label_panel)
    label_panel:setPositionInContainer(cc.p(556.5,189))
    table_strengthActivity["label_panel"] = label_panel

    local wu_title = fc.FExtensionsImage:create()
    wu_title:setImage("batch_ui/wu_uizi.png")
    wu_title:setSize(cc.size(32,32))
    wu_title:setAnchorPoint(cc.p(0.5,0.5))
    label_panel:appendComponent(wu_title)
    wu_title:setPositionInContainer(cc.p(18,18))
    table_strengthActivity["wu_title"] = wu_title

    local gu_title = fc.FExtensionsImage:create()
    gu_title:setImage("batch_ui/gu_uizi.png")
    gu_title:setSize(cc.size(32,32))
    gu_title:setAnchorPoint(cc.p(0.5,0.5))
    label_panel:appendComponent(gu_title)
    gu_title:setPositionInContainer(cc.p(58,18))
    table_strengthActivity["gu_title"] = gu_title

    local feng_title = fc.FExtensionsImage:create()
    feng_title:setImage("batch_ui/feng_uizi.png")
    feng_title:setSize(cc.size(32,32))
    feng_title:setAnchorPoint(cc.p(0.5,0.5))
    label_panel:appendComponent(feng_title)
    feng_title:setPositionInContainer(cc.p(98,18))
    table_strengthActivity["feng_title"] = feng_title

    local deng_title = fc.FExtensionsImage:create()
    deng_title:setImage("batch_ui/deng_uizi.png")
    deng_title:setSize(cc.size(32,32))
    deng_title:setAnchorPoint(cc.p(0.5,0.5))
    label_panel:appendComponent(deng_title)
    deng_title:setPositionInContainer(cc.p(138,18))
    table_strengthActivity["deng_title"] = deng_title

    local time_di = fc.FExtensionsImage:create()
    time_di:setImage("batch_ui/mingchengdikuang.png")
    time_di:setSize(cc.size(170,40))
    time_di:setAnchorPoint(cc.p(0.5,0.5))
    strengthActivity:appendComponent(time_di)
    time_di:setPositionInContainer(cc.p(792,361))
    table_strengthActivity["time_di"] = time_di

    local time_di = fc.FExtensionsImage:create()
    time_di:setImage("batch_ui/mingchengdikuang.png")
    time_di:setSize(cc.size(170,40))
    time_di:setAnchorPoint(cc.p(0.5,0.5))
    strengthActivity:appendComponent(time_di)
    time_di:setPositionInContainer(cc.p(792,487))
    table_strengthActivity["time_di"] = time_di

    local time_1 = fc.FLabel:createBMFont()
    time_1:setSize(cc.size(140,30))
    time_1:setAnchorPoint(cc.p(0.5,0.5))
    time_1:setFontSize(20)
    time_1:setString("12:00 - 14:00")
    time_1:setColor(cc.c3b(106,68,19))
    strengthActivity:appendComponent(time_1)
    time_1:setPositionInContainer(cc.p(795,358))
    table_strengthActivity["time_1"] = time_1

    local time_2 = fc.FLabel:createBMFont()
    time_2:setSize(cc.size(140,30))
    time_2:setAnchorPoint(cc.p(0.5,0.5))
    time_2:setFontSize(20)
    time_2:setString("18:00 - 20:00")
    time_2:setColor(cc.c3b(106,68,19))
    strengthActivity:appendComponent(time_2)
    time_2:setPositionInContainer(cc.p(795,484))
    table_strengthActivity["time_2"] = time_2

    local shouxia_btn = fc.FTextButton:create()
    shouxia_btn:setSize(cc.size(146,53))
    shouxia_btn:setAnchorPoint(cc.p(0.5,0.5))
    shouxia_btn:setTextButtonImage("batch_ui/teshuanniu.png","batch_ui/teshuanniu.png","batch_ui/teshuanniu.png")
    shouxia_btn:setText("收 下",cc.c3b(254,255,232))
    shouxia_btn:setSelectActionEnbaled(true)
    strengthActivity:appendComponent(shouxia_btn)
    shouxia_btn:setPositionInContainer(cc.p(798,422.5))
    table_strengthActivity["shouxia_btn"] = shouxia_btn

    local qidai_btn = fc.FTextButton:create()
    qidai_btn:setSize(cc.size(146,53))
    qidai_btn:setAnchorPoint(cc.p(0.5,0.5))
    qidai_btn:setTextButtonImage("batch_ui/teshuanniu.png","batch_ui/teshuanniu.png","batch_ui/teshuanniu.png")
    qidai_btn:setText("敬 请 期 待",cc.c3b(254,255,232))
    qidai_btn:setSelectActionEnbaled(true)
    strengthActivity:appendComponent(qidai_btn)
    qidai_btn:setPositionInContainer(cc.p(798,545.5))
    table_strengthActivity["qidai_btn"] = qidai_btn

    local feng_kuang = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongbiankuang_ciguan.png",cc.rect(13,13,2,2))
    feng_kuang:setSize(cc.size(467,255))
    feng_kuang:setAnchorPoint(cc.p(0.5,0.5))
    strengthActivity:appendComponent(feng_kuang)
    feng_kuang:setPositionInContainer(cc.p(465.5,462.5))
    table_strengthActivity["feng_kuang"] = feng_kuang

    local liangcao_image = fc.FExtensionsImage:create()
    liangcao_image:setImage("nobatch/wugufengdeng_fengshoutu.png")
    liangcao_image:setSize(cc.size(459,247))
    liangcao_image:setAnchorPoint(cc.p(0.5,0.5))
    strengthActivity:appendComponent(liangcao_image)
    liangcao_image:setPositionInContainer(cc.p(465.5,462.5))
    table_strengthActivity["liangcao_image"] = liangcao_image

    local get_panel = fc.FContainerPanel:create()
    get_panel:setSize(cc.size(450,90))
    get_panel:setAnchorPoint(cc.p(0.5,0.5))
    strengthActivity:appendComponent(get_panel)
    get_panel:setPositionInContainer(cc.p(497,275))
    table_strengthActivity["get_panel"] = get_panel

    local content_get_label1 = fc.FLabel:createBMFont()
    content_get_label1:setSize(cc.size(450,30))
    content_get_label1:setAnchorPoint(cc.p(0.5,0.5))
    content_get_label1:setFontSize(20)
    content_get_label1:setString("皇上，今日里风调雨顺，天下太平，各地粮食收成不错，")
    content_get_label1:setColor(cc.c3b(106,68,19))
    content_get_label1:setAlignment(0)
    get_panel:appendComponent(content_get_label1)
    content_get_label1:setPositionInContainer(cc.p(225,15))
    table_strengthActivity["content_get_label1"] = content_get_label1

    local content_get_label2 = fc.FLabel:createBMFont()
    content_get_label2:setSize(cc.size(450,30))
    content_get_label2:setAnchorPoint(cc.p(0.5,0.5))
    content_get_label2:setFontSize(20)
    content_get_label2:setString("五谷丰登。各地百姓为我朝国库奉上了自己的心意。请皇上")
    content_get_label2:setColor(cc.c3b(106,68,19))
    content_get_label2:setAlignment(0)
    get_panel:appendComponent(content_get_label2)
    content_get_label2:setPositionInContainer(cc.p(225,45))
    table_strengthActivity["content_get_label2"] = content_get_label2

    local content_get_label3 = fc.FLabel:createBMFont()
    content_get_label3:setSize(cc.size(450,30))
    content_get_label3:setAnchorPoint(cc.p(0.5,0.5))
    content_get_label3:setFontSize(20)
    content_get_label3:setString("您查收~可以恢复")
    content_get_label3:setColor(cc.c3b(106,68,19))
    content_get_label3:setAlignment(0)
    get_panel:appendComponent(content_get_label3)
    content_get_label3:setPositionInContainer(cc.p(225,75))
    table_strengthActivity["content_get_label3"] = content_get_label3

    local liangcao_num_bg_image = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shuruwenzi.png",cc.rect(11,9,47,7))
    liangcao_num_bg_image:setSize(cc.size(80,30))
    liangcao_num_bg_image:setAnchorPoint(cc.p(0.5,0.5))
    get_panel:appendComponent(liangcao_num_bg_image)
    liangcao_num_bg_image:setPositionInContainer(cc.p(200,77))
    table_strengthActivity["liangcao_num_bg_image"] = liangcao_num_bg_image

    local liangcao_num = fc.FLabel:createBMFont()
    liangcao_num:setSize(cc.size(80,30))
    liangcao_num:setAnchorPoint(cc.p(0.5,0.5))
    liangcao_num:setFontSize(20)
    liangcao_num:setString("5000")
    liangcao_num:setColor(cc.c3b(139,255,240))
    get_panel:appendComponent(liangcao_num)
    liangcao_num:setPositionInContainer(cc.p(201,76))
    table_strengthActivity["liangcao_num"] = liangcao_num

    local liangcao_liangcao = fc.FLabel:createBMFont()
    liangcao_liangcao:setSize(cc.size(80,30))
    liangcao_liangcao:setAnchorPoint(cc.p(0.5,0.5))
    liangcao_liangcao:setFontSize(20)
    if LANGUAGE_TYPE == 3 then
    	liangcao_liangcao:setString("糧草哦~")
    else
    	liangcao_liangcao:setString("粮草哦~")
    end
    liangcao_liangcao:setColor(cc.c3b(106,68,19))
    get_panel:appendComponent(liangcao_liangcao)
    liangcao_liangcao:setPositionInContainer(cc.p(290,75))
    table_strengthActivity["liangcao_liangcao"] = liangcao_liangcao

    local cant_get_panel = fc.FContainerPanel:create()
    cant_get_panel:setSize(cc.size(450,30))
    cant_get_panel:setAnchorPoint(cc.p(0.5,0.5))
    strengthActivity:appendComponent(cant_get_panel)
    cant_get_panel:setPositionInContainer(cc.p(497,270.5))
    table_strengthActivity["cant_get_panel"] = cant_get_panel

    local content_get_label4 = fc.FLabel:createBMFont()
    content_get_label4:setSize(cc.size(100,30))
    content_get_label4:setAnchorPoint(cc.p(0.5,0.5))
    content_get_label4:setFontSize(20)
    if LANGUAGE_TYPE == 3 then
   		content_get_label4:setString("啟稟皇上，")    
    else
	    content_get_label4:setString("启禀皇上，")
    end
    content_get_label4:setColor(cc.c3b(106,68,19))
    content_get_label4:setAlignment(0)
    cant_get_panel:appendComponent(content_get_label4)
    content_get_label4:setPositionInContainer(cc.p(50,15))
    table_strengthActivity["content_get_label4"] = content_get_label4

    local liangcao_num_bg_image1 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shuruwenzi.png",cc.rect(11,9,47,7))
    liangcao_num_bg_image1:setSize(cc.size(80,30))
    liangcao_num_bg_image1:setAnchorPoint(cc.p(0.5,0.5))
    cant_get_panel:appendComponent(liangcao_num_bg_image1)
    liangcao_num_bg_image1:setPositionInContainer(cc.p(133,16))
    table_strengthActivity["liangcao_num_bg_image1"] = liangcao_num_bg_image1

    local liangcao_num1 = fc.FLabel:createBMFont()
    liangcao_num1:setSize(cc.size(80,30))
    liangcao_num1:setAnchorPoint(cc.p(0.5,0.5))
    liangcao_num1:setFontSize(20)
    liangcao_num1:setString("5000")
    liangcao_num1:setColor(cc.c3b(139,255,240))
    cant_get_panel:appendComponent(liangcao_num1)
    liangcao_num1:setPositionInContainer(cc.p(131,15))
    table_strengthActivity["liangcao_num1"] = liangcao_num1

    local content_get_label5 = fc.FLabel:createBMFont()
    content_get_label5:setSize(cc.size(200,30))
    content_get_label5:setAnchorPoint(cc.p(0.5,0.5))
    content_get_label5:setFontSize(20)
    if LANGUAGE_TYPE == 3 then
	    content_get_label5:setString("糧草正在快馬加鞭運來中！")
    else
	    content_get_label5:setString("粮草正在快马加鞭运来的路上！")
    end
    content_get_label5:setColor(cc.c3b(106,68,19))
    content_get_label5:setAlignment(0)
    cant_get_panel:appendComponent(content_get_label5)
    content_get_label5:setPositionInContainer(cc.p(281,15))
    table_strengthActivity["content_get_label5"] = content_get_label5

    local beauty_image = fc.FExtensionsImage:create()
    beauty_image:setImage("beauty_card/wangzhaojun01.png")
    beauty_image:setSize(cc.size(470,501))
    beauty_image:setAnchorPoint(cc.p(0.5,0.5))
    strengthActivity:appendComponent(beauty_image)
    beauty_image:setPositionInContainer(cc.p(111,409.5))
    table_strengthActivity["beauty_image"] = beauty_image

    return table_strengthActivity

end

