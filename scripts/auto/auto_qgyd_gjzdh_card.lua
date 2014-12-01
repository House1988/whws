function createqgyd_gjzdh_card()

    local table_qgyd_gjzdh_card = {}

    local qgyd_gjzdh_card = fc.FContainerPanel:create()
    qgyd_gjzdh_card:setSize(cc.size(226,452))
    table_qgyd_gjzdh_card["qgyd_gjzdh_card"] = qgyd_gjzdh_card

    local gjzdh_bg_scale9 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongdikuang1.png",cc.rect(24,24,4,4))
    gjzdh_bg_scale9:setSize(cc.size(206,409))
    gjzdh_bg_scale9:setAnchorPoint(cc.p(0.5,0.5))
    qgyd_gjzdh_card:appendComponent(gjzdh_bg_scale9)
    gjzdh_bg_scale9:setPositionInContainer(cc.p(113,247.5))
    table_qgyd_gjzdh_card["gjzdh_bg_scale9"] = gjzdh_bg_scale9

    local desBg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/ditu_qianguyidi.png",cc.rect(5,9,2,2))
    desBg:setSize(cc.size(200,140))
    desBg:setAnchorPoint(cc.p(0.5,0.5))
    qgyd_gjzdh_card:appendComponent(desBg)
    desBg:setPositionInContainer(cc.p(113,253))
    table_qgyd_gjzdh_card["desBg"] = desBg

    local gjzdh_pingzhi = fc.FExtensionsImage:create()
    gjzdh_pingzhi:setImage("batch_ui/baipinzhi_kuang.png")
    gjzdh_pingzhi:setSize(cc.size(104,104))
    gjzdh_pingzhi:setAnchorPoint(cc.p(0.5,0.5))
    qgyd_gjzdh_card:appendComponent(gjzdh_pingzhi)
    gjzdh_pingzhi:setPositionInContainer(cc.p(114,111))
    table_qgyd_gjzdh_card["gjzdh_pingzhi"] = gjzdh_pingzhi

    local gjzdh_wuping_image = fc.FExtensionsImage:create()
    gjzdh_wuping_image:setImage("nobatch/tupian.png")
    gjzdh_wuping_image:setSize(cc.size(93,93))
    gjzdh_wuping_image:setAnchorPoint(cc.p(0.5,0.5))
    qgyd_gjzdh_card:appendComponent(gjzdh_wuping_image)
    gjzdh_wuping_image:setPositionInContainer(cc.p(112.5,110.5))
    table_qgyd_gjzdh_card["gjzdh_wuping_image"] = gjzdh_wuping_image

    local gjzdh_gongjizhi_label = fc.FLabel:createBMFont()
    gjzdh_gongjizhi_label:setSize(cc.size(80,30))
    gjzdh_gongjizhi_label:setAnchorPoint(cc.p(0.5,0.5))
    gjzdh_gongjizhi_label:setFontSize(20)
    gjzdh_gongjizhi_label:setString("功绩值")
    gjzdh_gongjizhi_label:setColor(cc.c3b(91,24,6))
    qgyd_gjzdh_card:appendComponent(gjzdh_gongjizhi_label)
    gjzdh_gongjizhi_label:setPositionInContainer(cc.p(66,352))
    table_qgyd_gjzdh_card["gjzdh_gongjizhi_label"] = gjzdh_gongjizhi_label

    local gjzdh_shuoming_label = fc.FLabel:createBMFont()
    gjzdh_shuoming_label:setSize(cc.size(180,80))
    gjzdh_shuoming_label:setWidth(190)
    gjzdh_shuoming_label:setAnchorPoint(cc.p(0.5,0.5))
    gjzdh_shuoming_label:setFontSize(20)
    gjzdh_shuoming_label:setString("步兵步兵步兵步兵步兵步兵步兵步兵步兵步兵步兵步兵")
    gjzdh_shuoming_label:setColor(cc.c3b(250,255,165))
    qgyd_gjzdh_card:appendComponent(gjzdh_shuoming_label)
    gjzdh_shuoming_label:setPositionInContainer(cc.p(113,245))
    table_qgyd_gjzdh_card["gjzdh_shuoming_label"] = gjzdh_shuoming_label

    local titleBg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/zongjiachengdikuang_tangquanxinggong.png",cc.rect(62,0,2,29))
    titleBg:setSize(cc.size(226,43))
    titleBg:setAnchorPoint(cc.p(0.5,0.5))
    qgyd_gjzdh_card:appendComponent(titleBg)
    titleBg:setPositionInContainer(cc.p(113,21.5))
    table_qgyd_gjzdh_card["titleBg"] = titleBg

    local gjzdh_wupin_label = fc.FLabel:createBMFont()
    gjzdh_wupin_label:setSize(cc.size(100,30))
    gjzdh_wupin_label:setAnchorPoint(cc.p(0.5,0.5))
    gjzdh_wupin_label:setFontSize(20)
    gjzdh_wupin_label:setString("物品名称")
    gjzdh_wupin_label:setColor(cc.c3b(255,255,255))
    qgyd_gjzdh_card:appendComponent(gjzdh_wupin_label)
    gjzdh_wupin_label:setPositionInContainer(cc.p(113,15))
    table_qgyd_gjzdh_card["gjzdh_wupin_label"] = gjzdh_wupin_label

    local top_bar = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongbiankuang3_ciguan.png",cc.rect(40,0,2,13))
    top_bar:setSize(cc.size(226,13))
    top_bar:setAnchorPoint(cc.p(0.5,0.5))
    qgyd_gjzdh_card:appendComponent(top_bar)
    top_bar:setPositionInContainer(cc.p(113,49.5))
    table_qgyd_gjzdh_card["top_bar"] = top_bar

    local bottom_bar = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongbiankuang3_ciguan.png",cc.rect(40,0,2,13))
    bottom_bar:setSize(cc.size(226,13))
    bottom_bar:setAnchorPoint(cc.p(0.5,0.5))
    qgyd_gjzdh_card:appendComponent(bottom_bar)
    bottom_bar:setPositionInContainer(cc.p(113,445.5))
    table_qgyd_gjzdh_card["bottom_bar"] = bottom_bar

    local shutiao = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tangquanxinggongbar_tangquanxinggong.png",cc.rect(0,56,25,2))
    shutiao:setSize(cc.size(25,409))
    shutiao:setAnchorPoint(cc.p(0.5,0.5))
    qgyd_gjzdh_card:appendComponent(shutiao)
    shutiao:setPositionInContainer(cc.p(213.5,247.5))
    table_qgyd_gjzdh_card["shutiao"] = shutiao

    local shutiao = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tangquanxinggongbar_tangquanxinggong.png",cc.rect(0,56,25,2))
    shutiao:setSize(cc.size(25,409))
    shutiao:setAnchorPoint(cc.p(0.5,0.5))
    qgyd_gjzdh_card:appendComponent(shutiao)
    shutiao:setPositionInContainer(cc.p(12.5,247.5))
    table_qgyd_gjzdh_card["shutiao"] = shutiao

    local textbg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shuruwenzi.png",cc.rect(11,9,47,7))
    textbg:setSize(cc.size(90,30))
    textbg:setAnchorPoint(cc.p(0.5,0.5))
    qgyd_gjzdh_card:appendComponent(textbg)
    textbg:setPositionInContainer(cc.p(156,356))
    table_qgyd_gjzdh_card["textbg"] = textbg

    local gjzdh_gongjizhi_num_label = fc.FLabel:createBMFont()
    gjzdh_gongjizhi_num_label:setSize(cc.size(80,30))
    gjzdh_gongjizhi_num_label:setAnchorPoint(cc.p(0.5,0.5))
    gjzdh_gongjizhi_num_label:setFontSize(21)
    gjzdh_gongjizhi_num_label:setString("9999")
    gjzdh_gongjizhi_num_label:setColor(cc.c3b(255,255,255))
    qgyd_gjzdh_card:appendComponent(gjzdh_gongjizhi_num_label)
    gjzdh_gongjizhi_num_label:setPositionInContainer(cc.p(156,352))
    table_qgyd_gjzdh_card["gjzdh_gongjizhi_num_label"] = gjzdh_gongjizhi_num_label

    local detialBtn = fc.FContainerPanel:create()
    detialBtn:setSize(cc.size(90,90))
    detialBtn:setAnchorPoint(cc.p(0.5,0.5))
    qgyd_gjzdh_card:appendComponent(detialBtn)
    detialBtn:setPositionInContainer(cc.p(113,111))
    table_qgyd_gjzdh_card["detialBtn"] = detialBtn

    local number = fc.FLabel:createBMFont()
    number:setSize(cc.size(80,30))
    number:setAnchorPoint(cc.p(0.5,0.5))
    number:setFontSize(15)
    number:setString("功绩值")
    number:setColor(cc.c3b(91,24,6))
    qgyd_gjzdh_card:appendComponent(number)
    number:setPositionInContainer(cc.p(113,170))
    table_qgyd_gjzdh_card["number"] = number

    local duihuan = fc.FLabel:createBMFont()
    duihuan:setSize(cc.size(80,30))
    duihuan:setAnchorPoint(cc.p(0.5,0.5))
    duihuan:setFontSize(30)
    if LANGUAGE_TYPE == 3 then
    	duihuan:setString("已兌換")
    else
    	duihuan:setString("已兑换")
    end
    
    duihuan:setColor(cc.c3b(91,24,6))
    qgyd_gjzdh_card:appendComponent(duihuan)
    duihuan:setPositionInContainer(cc.p(113,403))
    table_qgyd_gjzdh_card["duihuan"] = duihuan

    local gjzdh_duihuan_button = fc.FScaleButton:create()
    gjzdh_duihuan_button:setSize(cc.size(146,53))
    gjzdh_duihuan_button:setAnchorPoint(cc.p(0.5,0.5))
    gjzdh_duihuan_button:setButtonImage("batch_ui/teshuanniu.png")
    qgyd_gjzdh_card:appendComponent(gjzdh_duihuan_button)
    gjzdh_duihuan_button:setPositionInContainer(cc.p(113,407.5))
    table_qgyd_gjzdh_card["gjzdh_duihuan_button"] = gjzdh_duihuan_button

    local dui = fc.FExtensionsImage:create()
    dui:setImage("batch_ui/dui2_uizi.png")
    dui:setSize(cc.size(32,32))
    dui:setAnchorPoint(cc.p(0.5,0.5))
    gjzdh_duihuan_button:appendComponent(dui)
    dui:setPositionInContainer(cc.p(43,26))
    table_qgyd_gjzdh_card["dui"] = dui

    local huan = fc.FExtensionsImage:create()
    huan:setImage("batch_ui/huan_uizi.png")
    huan:setSize(cc.size(32,32))
    huan:setAnchorPoint(cc.p(0.5,0.5))
    gjzdh_duihuan_button:appendComponent(huan)
    huan:setPositionInContainer(cc.p(103,26))
    table_qgyd_gjzdh_card["huan"] = huan

    local piece = fc.FExtensionsImage:create()
    piece:setImage("batch_ui/hunpi_biaozhi.png")
    piece:setSize(cc.size(42,61))
    piece:setAnchorPoint(cc.p(0.5,0.5))
    qgyd_gjzdh_card:appendComponent(piece)
    piece:setPositionInContainer(cc.p(159,125.5))
    table_qgyd_gjzdh_card["piece"] = piece

    return table_qgyd_gjzdh_card

end

