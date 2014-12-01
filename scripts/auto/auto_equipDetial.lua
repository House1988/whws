function createequipDetial()

    local table_equipDetial = {}

    local equipDetial = fc.FContainerPanel:create()
    equipDetial:setSize(cc.size(960,640))
    table_equipDetial["equipDetial"] = equipDetial

    local bgLT = fc.FExtensionsImage:create()
    bgLT:setImage("nobatch/banzidikuang_tongyong.png")
    bgLT:setSize(cc.size(480,320))
    bgLT:setAnchorPoint(cc.p(0.5,0.5))
    equipDetial:appendComponent(bgLT)
    bgLT:setPositionInContainer(cc.p(240,160))
    table_equipDetial["bgLT"] = bgLT

    local bgLB = fc.FExtensionsImage:create()
    bgLB:setImage("nobatch/banzidikuang_tongyong.png")
    bgLB:setSize(cc.size(480,320))
    bgLB:setFlipType(4)
    bgLB:setAnchorPoint(cc.p(0.5,0.5))
    equipDetial:appendComponent(bgLB)
    bgLB:setPositionInContainer(cc.p(240,480))
    table_equipDetial["bgLB"] = bgLB

    local bgRT = fc.FExtensionsImage:create()
    bgRT:setImage("nobatch/banzidikuang_tongyong.png")
    bgRT:setSize(cc.size(480,320))
    bgRT:setFlipType(2)
    bgRT:setAnchorPoint(cc.p(0.5,0.5))
    equipDetial:appendComponent(bgRT)
    bgRT:setPositionInContainer(cc.p(720,160))
    table_equipDetial["bgRT"] = bgRT

    local bgRB = fc.FExtensionsImage:create()
    bgRB:setImage("nobatch/banzidikuang_tongyong.png")
    bgRB:setSize(cc.size(480,320))
    bgRB:setFlipType(8)
    bgRB:setAnchorPoint(cc.p(0.5,0.5))
    equipDetial:appendComponent(bgRB)
    bgRB:setPositionInContainer(cc.p(720,480))
    table_equipDetial["bgRB"] = bgRB

    local titleL = fc.FExtensionsImage:create()
    titleL:setImage("nobatch/title_mingchen_.png")
    titleL:setSize(cc.size(480,67))
    titleL:setAnchorPoint(cc.p(0.5,0.5))
    equipDetial:appendComponent(titleL)
    titleL:setPositionInContainer(cc.p(240,33.5))
    table_equipDetial["titleL"] = titleL

    local titleR = fc.FExtensionsImage:create()
    titleR:setImage("nobatch/title_mingchen_.png")
    titleR:setSize(cc.size(480,67))
    titleR:setFlipType(2)
    titleR:setAnchorPoint(cc.p(0.5,0.5))
    equipDetial:appendComponent(titleR)
    titleR:setPositionInContainer(cc.p(720,33.5))
    table_equipDetial["titleR"] = titleR

    local clothL = fc.FExtensionsImage:create()
    clothL:setImage("batch_ui/title_mingchen_2.png")
    clothL:setSize(cc.size(62,121))
    clothL:setAnchorPoint(cc.p(0.5,0.5))
    equipDetial:appendComponent(clothL)
    clothL:setPositionInContainer(cc.p(31,60.5))
    table_equipDetial["clothL"] = clothL

    local leftBg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongdikuang1.png",cc.rect(25,25,4,4))
    leftBg:setSize(cc.size(450,570))
    leftBg:setAnchorPoint(cc.p(0.5,0.5))
    equipDetial:appendComponent(leftBg)
    leftBg:setPositionInContainer(cc.p(240,353))
    table_equipDetial["leftBg"] = leftBg

    local leftBg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongdikuang1.png",cc.rect(25,25,4,4))
    leftBg:setSize(cc.size(450,570))
    leftBg:setAnchorPoint(cc.p(0.5,0.5))
    equipDetial:appendComponent(leftBg)
    leftBg:setPositionInContainer(cc.p(719,354))
    table_equipDetial["leftBg"] = leftBg

    local iconBG = fc.FExtensionsImage:create()
    iconBG:setImage("batch_ui/teshutouxiangkuang.png")
    iconBG:setSize(cc.size(172,172))
    iconBG:setAnchorPoint(cc.p(0.5,0.5))
    equipDetial:appendComponent(iconBG)
    iconBG:setPositionInContainer(cc.p(240,217))
    table_equipDetial["iconBG"] = iconBG

    local icon = fc.FExtensionsImage:create()
    icon:setImage("batch_ui/wuqi_zhuangbeixianqing.png")
    icon:setSize(cc.size(107,132))
    icon:setAnchorPoint(cc.p(0.5,0.5))
    equipDetial:appendComponent(icon)
    icon:setPositionInContainer(cc.p(136.5,203))
    table_equipDetial["icon"] = icon

    local frame = fc.FExtensionsImage:create()
    frame:setImage("batch_ui/chengpinzhi_kuang.png")
    frame:setSize(cc.size(104,104))
    frame:setAnchorPoint(cc.p(0.5,0.5))
    equipDetial:appendComponent(frame)
    frame:setPositionInContainer(cc.p(240,217))
    table_equipDetial["frame"] = frame

    local blackBar = fc.FExtensionsImage:create()
    blackBar:setImage("batch_ui/xingxingdiwen.png")
    blackBar:setSize(cc.size(450,26))
    blackBar:setAnchorPoint(cc.p(0.5,0.5))
    equipDetial:appendComponent(blackBar)
    blackBar:setPositionInContainer(cc.p(240,307))
    table_equipDetial["blackBar"] = blackBar

    local star1 = fc.FExtensionsImage:create()
    star1:setImage("batch_ui/xingxing.png")
    star1:setSize(cc.size(25,27))
    star1:setAnchorPoint(cc.p(0.5,0.5))
    equipDetial:appendComponent(star1)
    star1:setPositionInContainer(cc.p(134.5,306.5))
    table_equipDetial["star1"] = star1

    local star2 = fc.FExtensionsImage:create()
    star2:setImage("batch_ui/xingxing.png")
    star2:setSize(cc.size(25,27))
    star2:setAnchorPoint(cc.p(0.5,0.5))
    equipDetial:appendComponent(star2)
    star2:setPositionInContainer(cc.p(188.5,306.5))
    table_equipDetial["star2"] = star2

    local star3 = fc.FExtensionsImage:create()
    star3:setImage("batch_ui/xingxing.png")
    star3:setSize(cc.size(25,27))
    star3:setAnchorPoint(cc.p(0.5,0.5))
    equipDetial:appendComponent(star3)
    star3:setPositionInContainer(cc.p(243.5,306.5))
    table_equipDetial["star3"] = star3

    local star4 = fc.FExtensionsImage:create()
    star4:setImage("batch_ui/xingxing.png")
    star4:setSize(cc.size(25,27))
    star4:setAnchorPoint(cc.p(0.5,0.5))
    equipDetial:appendComponent(star4)
    star4:setPositionInContainer(cc.p(297.5,306.5))
    table_equipDetial["star4"] = star4

    local star5 = fc.FExtensionsImage:create()
    star5:setImage("batch_ui/xingxing.png")
    star5:setSize(cc.size(25,27))
    star5:setAnchorPoint(cc.p(0.5,0.5))
    equipDetial:appendComponent(star5)
    star5:setPositionInContainer(cc.p(352.5,306.5))
    table_equipDetial["star5"] = star5

    local levelLabel = fc.FLabel:createSystemFont()
    levelLabel:setSize(cc.size(180,25))
    levelLabel:setAnchorPoint(cc.p(0.5,0.5))
    levelLabel:setFontSize(20)
    levelLabel:setString("")
    levelLabel:setColor(cc.c3b(0, 0, 0))
    equipDetial:appendComponent(levelLabel)
    levelLabel:setPositionInContainer(cc.p(240,340.5))
    table_equipDetial["levelLabel"] = levelLabel

    local zhuangBeiLabel = fc.FLabel:createSystemFont()
    zhuangBeiLabel:setSize(cc.size(180,25))
    zhuangBeiLabel:setAnchorPoint(cc.p(0.5,0.5))
    zhuangBeiLabel:setFontSize(20)
    zhuangBeiLabel:setString("")
    zhuangBeiLabel:setColor(cc.c3b(0, 0, 0))
    equipDetial:appendComponent(zhuangBeiLabel)
    zhuangBeiLabel:setPositionInContainer(cc.p(240,373.5))
    table_equipDetial["zhuangBeiLabel"] = zhuangBeiLabel

    local desLabel = fc.FLabel:createSystemFont()
    desLabel:setSize(cc.size(400,25))
    desLabel:setWidth(400)
    desLabel:setAnchorPoint(cc.p(0.5,0.5))
    desLabel:setFontSize(20)
    desLabel:setString("")
    desLabel:setColor(cc.c3b(0, 0, 0))
    equipDetial:appendComponent(desLabel)
    desLabel:setPositionInContainer(cc.p(240,504.5))
    table_equipDetial["desLabel"] = desLabel

    local btnChange = fc.FScaleButton:create()
    btnChange:setSize(cc.size(144,53))
    btnChange:setAnchorPoint(cc.p(0.5,0.5))
    btnChange:setButtonImage("batch_ui/putonganniu1_up.png")
    equipDetial:appendComponent(btnChange)
    btnChange:setPositionInContainer(cc.p(352,607.5))
    table_equipDetial["btnChange"] = btnChange

    local geng = fc.FShaderExtensionsImage:create(0)
    geng:setAnchorPoint(cc.p(0.5,0.5))
    geng:setImage("batch_ui/geng_uizi.png")
    geng:setSize(cc.size(32,32))
    btnChange:appendComponent(geng)
    geng:setPositionInContainer(cc.p(44,26))
    table_equipDetial["geng"] = geng

    local huan = fc.FShaderExtensionsImage:create(0)
    huan:setAnchorPoint(cc.p(0.5,0.5))
    huan:setImage("batch_ui/huan_uizi.png")
    huan:setSize(cc.size(32,32))
    btnChange:appendComponent(huan)
    huan:setPositionInContainer(cc.p(98,26))
    table_equipDetial["huan"] = huan

    local btnRemove = fc.FScaleButton:create()
    btnRemove:setSize(cc.size(144,53))
    btnRemove:setAnchorPoint(cc.p(0.5,0.5))
    btnRemove:setButtonImage("batch_ui/putonganniu1_up.png")
    equipDetial:appendComponent(btnRemove)
    btnRemove:setPositionInContainer(cc.p(134,607.5))
    table_equipDetial["btnRemove"] = btnRemove

    local xie = fc.FShaderExtensionsImage:create(0)
    xie:setAnchorPoint(cc.p(0.5,0.5))
    xie:setImage("batch_ui/xie_uizi.png")
    xie:setSize(cc.size(32,32))
    btnRemove:appendComponent(xie)
    xie:setPositionInContainer(cc.p(45,26))
    table_equipDetial["xie"] = xie

    local xia = fc.FShaderExtensionsImage:create(0)
    xia:setAnchorPoint(cc.p(0.5,0.5))
    xia:setImage("batch_ui/xia_uizi.png")
    xia:setSize(cc.size(32,32))
    btnRemove:appendComponent(xia)
    xia:setPositionInContainer(cc.p(96,26))
    table_equipDetial["xia"] = xia

    local officer1 = fc.FExtensionsImage:create()
    officer1:setImage("batch_ui/chengpinzhi_kuang.png")
    officer1:setSize(cc.size(104,104))
    officer1:setAnchorPoint(cc.p(0.5,0.5))
    equipDetial:appendComponent(officer1)
    officer1:setPositionInContainer(cc.p(579,224))
    table_equipDetial["officer1"] = officer1

    local officer2 = fc.FExtensionsImage:create()
    officer2:setImage("batch_ui/chengpinzhi_kuang.png")
    officer2:setSize(cc.size(104,104))
    officer2:setAnchorPoint(cc.p(0.5,0.5))
    equipDetial:appendComponent(officer2)
    officer2:setPositionInContainer(cc.p(722,224))
    table_equipDetial["officer2"] = officer2

    local officer3 = fc.FExtensionsImage:create()
    officer3:setImage("batch_ui/chengpinzhi_kuang.png")
    officer3:setSize(cc.size(104,104))
    officer3:setAnchorPoint(cc.p(0.5,0.5))
    equipDetial:appendComponent(officer3)
    officer3:setPositionInContainer(cc.p(865,224))
    table_equipDetial["officer3"] = officer3

    local name1 = fc.FLabel:createSystemFont()
    name1:setSize(cc.size(100,25))
    name1:setAnchorPoint(cc.p(0.5,0.5))
    name1:setFontSize(20)
    name1:setString("")
    name1:setColor(cc.c3b(0, 0, 0))
    equipDetial:appendComponent(name1)
    name1:setPositionInContainer(cc.p(579,301.5))
    table_equipDetial["name1"] = name1

    local name2 = fc.FLabel:createSystemFont()
    name2:setSize(cc.size(100,25))
    name2:setAnchorPoint(cc.p(0.5,0.5))
    name2:setFontSize(20)
    name2:setString("")
    name2:setColor(cc.c3b(0, 0, 0))
    equipDetial:appendComponent(name2)
    name2:setPositionInContainer(cc.p(722,301.5))
    table_equipDetial["name2"] = name2

    local clothR = fc.FExtensionsImage:create()
    clothR:setImage("batch_ui/title_mingchen_2.png")
    clothR:setSize(cc.size(62,121))
    clothR:setFlipType(2)
    clothR:setAnchorPoint(cc.p(0.5,0.5))
    equipDetial:appendComponent(clothR)
    clothR:setPositionInContainer(cc.p(929,60.5))
    table_equipDetial["clothR"] = clothR

    local name3 = fc.FLabel:createSystemFont()
    name3:setSize(cc.size(100,25))
    name3:setAnchorPoint(cc.p(0.5,0.5))
    name3:setFontSize(20)
    name3:setString("")
    name3:setColor(cc.c3b(0, 0, 0))
    equipDetial:appendComponent(name3)
    name3:setPositionInContainer(cc.p(865,301.5))
    table_equipDetial["name3"] = name3

    local line1 = fc.FExtensionsImage:create()
    line1:setImage("batch_ui/ditu2_guoqingxinxi.png")
    line1:setSize(cc.size(114,4))
    line1:setAnchorPoint(cc.p(0.5,0.5))
    equipDetial:appendComponent(line1)
    line1:setPositionInContainer(cc.p(579,285))
    table_equipDetial["line1"] = line1

    local rightLabelBG = fc.FExtensionsImage:create()
    rightLabelBG:setImage("nobatch/ditu_guoqingxinxi.png")
    rightLabelBG:setSize(cc.size(439,42))
    rightLabelBG:setAnchorPoint(cc.p(0.5,0.5))
    equipDetial:appendComponent(rightLabelBG)
    rightLabelBG:setPositionInContainer(cc.p(724.5,142))
    table_equipDetial["rightLabelBG"] = rightLabelBG

    local rightLabel = fc.FLabel:createSystemFont()
    rightLabel:setSize(cc.size(180,25))
    rightLabel:setAnchorPoint(cc.p(0.5,0.5))
    rightLabel:setFontSize(20)
    if LANGUAGE_TYPE == 3 then
    	rightLabel:setString("裝備於以下名臣，可額外提高攻擊/防禦")
    else
	    rightLabel:setString("装备于以下名臣，可额外提高攻击/防御")
    end
    rightLabel:setColor(cc.c3b(0, 0, 0))
    equipDetial:appendComponent(rightLabel)
    rightLabel:setPositionInContainer(cc.p(722,138.5))
    table_equipDetial["rightLabel"] = rightLabel

    local rightLevelLabel = fc.FLabel:createSystemFont()
    rightLevelLabel:setSize(cc.size(180,25))
    rightLevelLabel:setAnchorPoint(cc.p(0.5,0.5))
    rightLevelLabel:setFontSize(20)
    rightLevelLabel:setString("")
    rightLevelLabel:setColor(cc.c3b(0, 0, 0))
    equipDetial:appendComponent(rightLevelLabel)
    rightLevelLabel:setPositionInContainer(cc.p(722,397.5))
    table_equipDetial["rightLevelLabel"] = rightLevelLabel

    local rightZhuangBeiLabel = fc.FLabel:createSystemFont()
    rightZhuangBeiLabel:setSize(cc.size(180,25))
    rightZhuangBeiLabel:setAnchorPoint(cc.p(0.5,0.5))
    rightZhuangBeiLabel:setFontSize(20)
    rightZhuangBeiLabel:setString("")
    rightZhuangBeiLabel:setColor(cc.c3b(0, 0, 0))
    equipDetial:appendComponent(rightZhuangBeiLabel)
    rightZhuangBeiLabel:setPositionInContainer(cc.p(722,432.5))
    table_equipDetial["rightZhuangBeiLabel"] = rightZhuangBeiLabel

    local btnUpgrade = fc.FScaleButton:create()
    btnUpgrade:setSize(cc.size(146,53))
    btnUpgrade:setAnchorPoint(cc.p(0.5,0.5))
    btnUpgrade:setButtonImage("batch_ui/teshuanniu.png")
    equipDetial:appendComponent(btnUpgrade)
    btnUpgrade:setPositionInContainer(cc.p(722,553.5))
    table_equipDetial["btnUpgrade"] = btnUpgrade

    local sheng = fc.FShaderExtensionsImage:create(0)
    sheng:setAnchorPoint(cc.p(0.5,0.5))
    sheng:setImage("batch_ui/sheng1_uizi.png")
    sheng:setSize(cc.size(32,32))
    btnUpgrade:appendComponent(sheng)
    sheng:setPositionInContainer(cc.p(47,26))
    table_equipDetial["sheng"] = sheng

    local ji = fc.FShaderExtensionsImage:create(0)
    ji:setAnchorPoint(cc.p(0.5,0.5))
    ji:setImage("batch_ui/ji1_uizi.png")
    ji:setSize(cc.size(32,32))
    btnUpgrade:appendComponent(ji)
    ji:setPositionInContainer(cc.p(101,26))
    table_equipDetial["ji"] = ji

    local yinliangLabel = fc.FLabel:createSystemFont()
    yinliangLabel:setSize(cc.size(50,25))
    yinliangLabel:setAnchorPoint(cc.p(0.5,0.5))
    yinliangLabel:setFontSize(20)
    if LANGUAGE_TYPE == 3 then
    	yinliangLabel:setString("花費:")
    else
    	yinliangLabel:setString("花费:")
    end
    
    yinliangLabel:setColor(cc.c3b(0, 0, 0))
    equipDetial:appendComponent(yinliangLabel)
    yinliangLabel:setPositionInContainer(cc.p(647,488.5))
    table_equipDetial["yinliangLabel"] = yinliangLabel

    local yinliangNumber = fc.FLabel:createSystemFont()
    yinliangNumber:setSize(cc.size(50,25))
    yinliangNumber:setAnchorPoint(cc.p(0.5,0.5))
    yinliangNumber:setFontSize(20)
    if LANGUAGE_TYPE == 3 then
    	yinliangNumber:setString("花費:")
    else
    	yinliangNumber:setString("花费:")
    end
    yinliangNumber:setColor(cc.c3b(0, 0, 0))
    equipDetial:appendComponent(yinliangNumber)
    yinliangNumber:setPositionInContainer(cc.p(786,489.5))
    table_equipDetial["yinliangNumber"] = yinliangNumber

    local downLabel = fc.FLabel:createSystemFont()
    downLabel:setSize(cc.size(180,25))
    downLabel:setAnchorPoint(cc.p(0.5,0.5))
    downLabel:setFontSize(20)
     if LANGUAGE_TYPE == 3 then
     	downLabel:setString("提高皇帝等級可提升裝備升級上限")
     else
     	downLabel:setString("提高皇帝等级可提升装备升级上限")
     end
    
    downLabel:setColor(cc.c3b(0, 0, 0))
    equipDetial:appendComponent(downLabel)
    downLabel:setPositionInContainer(cc.p(722,602.5))
    table_equipDetial["downLabel"] = downLabel

    local line2 = fc.FExtensionsImage:create()
    line2:setImage("batch_ui/ditu2_guoqingxinxi.png")
    line2:setSize(cc.size(114,4))
    line2:setAnchorPoint(cc.p(0.5,0.5))
    equipDetial:appendComponent(line2)
    line2:setPositionInContainer(cc.p(579,326))
    table_equipDetial["line2"] = line2

    local line3 = fc.FExtensionsImage:create()
    line3:setImage("batch_ui/ditu2_guoqingxinxi.png")
    line3:setSize(cc.size(114,4))
    line3:setAnchorPoint(cc.p(0.5,0.5))
    equipDetial:appendComponent(line3)
    line3:setPositionInContainer(cc.p(722,286))
    table_equipDetial["line3"] = line3

    local line4 = fc.FExtensionsImage:create()
    line4:setImage("batch_ui/ditu2_guoqingxinxi.png")
    line4:setSize(cc.size(114,4))
    line4:setAnchorPoint(cc.p(0.5,0.5))
    equipDetial:appendComponent(line4)
    line4:setPositionInContainer(cc.p(722,325))
    table_equipDetial["line4"] = line4

    local line5 = fc.FExtensionsImage:create()
    line5:setImage("batch_ui/ditu2_guoqingxinxi.png")
    line5:setSize(cc.size(114,4))
    line5:setAnchorPoint(cc.p(0.5,0.5))
    equipDetial:appendComponent(line5)
    line5:setPositionInContainer(cc.p(865,286))
    table_equipDetial["line5"] = line5

    local line6 = fc.FExtensionsImage:create()
    line6:setImage("batch_ui/ditu2_guoqingxinxi.png")
    line6:setSize(cc.size(114,4))
    line6:setAnchorPoint(cc.p(0.5,0.5))
    equipDetial:appendComponent(line6)
    line6:setPositionInContainer(cc.p(865,325))
    table_equipDetial["line6"] = line6

    local close = fc.FScaleButton:create()
    close:setSize(cc.size(52,52))
    close:setAnchorPoint(cc.p(0.5,0.5))
    close:setButtonImage("batch_ui/guanbi_up.png")
    equipDetial:appendComponent(close)
    close:setPositionInContainer(cc.p(934,34))
    table_equipDetial["close"] = close

    local title = fc.FContainerPanel:create()
    title:setSize(cc.size(201,40))
    title:setAnchorPoint(cc.p(0.5,0.5))
    equipDetial:appendComponent(title)
    title:setPositionInContainer(cc.p(480.5,34))
    table_equipDetial["title"] = title

    local zhuang = fc.FExtensionsImage:create()
    zhuang:setImage("batch_ui/zhuang.png")
    zhuang:setSize(cc.size(40,40))
    zhuang:setAnchorPoint(cc.p(0.5,0.5))
    title:appendComponent(zhuang)
    zhuang:setPositionInContainer(cc.p(20,20))
    table_equipDetial["zhuang"] = zhuang

    local bei = fc.FExtensionsImage:create()
    bei:setImage("batch_ui/bei.png")
    bei:setSize(cc.size(40,40))
    bei:setAnchorPoint(cc.p(0.5,0.5))
    title:appendComponent(bei)
    bei:setPositionInContainer(cc.p(74,20))
    table_equipDetial["bei"] = bei

    local xiang = fc.FExtensionsImage:create()
    xiang:setImage("batch_ui/xiang.png")
    xiang:setSize(cc.size(40,40))
    xiang:setAnchorPoint(cc.p(0.5,0.5))
    title:appendComponent(xiang)
    xiang:setPositionInContainer(cc.p(127,20))
    table_equipDetial["xiang"] = xiang

    local qing = fc.FExtensionsImage:create()
    qing:setImage("batch_ui/qing.png")
    qing:setSize(cc.size(40,40))
    qing:setAnchorPoint(cc.p(0.5,0.5))
    title:appendComponent(qing)
    qing:setPositionInContainer(cc.p(181,20))
    table_equipDetial["qing"] = qing

    local titleTop = fc.FScale9Image:createWithBatchUIFrame("batch_ui/xingjikuang_tangquanxinggong.png",cc.rect(62,0,2,42))
    titleTop:setSize(cc.size(450,42))
    titleTop:setAnchorPoint(cc.p(0.5,0.5))
    equipDetial:appendComponent(titleTop)
    titleTop:setPositionInContainer(cc.p(240,89))
    table_equipDetial["titleTop"] = titleTop

    local nameLabel = fc.FLabel:createSystemFont()
    nameLabel:setSize(cc.size(180,40))
    nameLabel:setAnchorPoint(cc.p(0.5,0.5))
    nameLabel:setFontSize(32)
    nameLabel:setString("")
    nameLabel:setColor(cc.c3b(255, 255, 255))
    equipDetial:appendComponent(nameLabel)
    nameLabel:setPositionInContainer(cc.p(240,83))
    table_equipDetial["nameLabel"] = nameLabel

    local titleBottom = fc.FScale9Image:createWithBatchUIFrame("batch_ui/xingjikuang_tangquanxinggong.png",cc.rect(62,0,2,42))
    titleBottom:setSize(cc.size(450,42))
    titleBottom:setAnchorPoint(cc.p(0.5,0.5))
    titleBottom:setScaleY(-1)
    equipDetial:appendComponent(titleBottom)
    titleBottom:setPositionInContainer(cc.p(240,421))
    table_equipDetial["titleBottom"] = titleBottom

    local jieshaoLabel = fc.FLabel:createSystemFont()
    jieshaoLabel:setSize(cc.size(180,40))
    jieshaoLabel:setAnchorPoint(cc.p(0.5,0.5))
    jieshaoLabel:setFontSize(32)
    if LANGUAGE_TYPE == 3 then
    	jieshaoLabel:setString("裝備介紹")
    else
    	jieshaoLabel:setString("装备介绍")
    end
    
    jieshaoLabel:setColor(cc.c3b(255, 255, 255))
    equipDetial:appendComponent(jieshaoLabel)
    jieshaoLabel:setPositionInContainer(cc.p(240,413))
    table_equipDetial["jieshaoLabel"] = jieshaoLabel

    local titleBottom = fc.FScale9Image:createWithBatchUIFrame("batch_ui/xingjikuang_tangquanxinggong.png",cc.rect(62,0,2,42))
    titleBottom:setSize(cc.size(450,42))
    titleBottom:setAnchorPoint(cc.p(0.5,0.5))
    titleBottom:setScaleY(-1)
    equipDetial:appendComponent(titleBottom)
    titleBottom:setPositionInContainer(cc.p(722,355))
    table_equipDetial["titleBottom"] = titleBottom

    local shengjiyulanLabel = fc.FLabel:createSystemFont()
    shengjiyulanLabel:setSize(cc.size(180,40))
    shengjiyulanLabel:setAnchorPoint(cc.p(0.5,0.5))
    shengjiyulanLabel:setFontSize(32)
    if LANGUAGE_TYPE == 3 then
	    shengjiyulanLabel:setString("升級預覽")
    else
	    shengjiyulanLabel:setString("升级预览")
    end
    shengjiyulanLabel:setColor(cc.c3b(255, 255, 255))
    equipDetial:appendComponent(shengjiyulanLabel)
    shengjiyulanLabel:setPositionInContainer(cc.p(722,350))
    table_equipDetial["shengjiyulanLabel"] = shengjiyulanLabel

    local titleTop = fc.FScale9Image:createWithBatchUIFrame("batch_ui/xingjikuang_tangquanxinggong.png",cc.rect(62,0,2,42))
    titleTop:setSize(cc.size(450,42))
    titleTop:setAnchorPoint(cc.p(0.5,0.5))
    equipDetial:appendComponent(titleTop)
    titleTop:setPositionInContainer(cc.p(720,90))
    table_equipDetial["titleTop"] = titleTop

    local yuanfenLabel = fc.FLabel:createSystemFont()
    yuanfenLabel:setSize(cc.size(180,40))
    yuanfenLabel:setAnchorPoint(cc.p(0.5,0.5))
    yuanfenLabel:setFontSize(32)
    if LANGUAGE_TYPE == 3 then
    	yuanfenLabel:setString("緣分一覽")
    else
	    yuanfenLabel:setString("缘分一览")
    end
    yuanfenLabel:setColor(cc.c3b(255, 255, 255))
    equipDetial:appendComponent(yuanfenLabel)
    yuanfenLabel:setPositionInContainer(cc.p(720,83))
    table_equipDetial["yuanfenLabel"] = yuanfenLabel

    local bingfaTitle = fc.FContainerPanel:create()
    bingfaTitle:setSize(cc.size(201,40))
    bingfaTitle:setAnchorPoint(cc.p(0.5,0.5))
    equipDetial:appendComponent(bingfaTitle)
    bingfaTitle:setPositionInContainer(cc.p(480.5,34))
    table_equipDetial["bingfaTitle"] = bingfaTitle

    local xiang = fc.FExtensionsImage:create()
    xiang:setImage("batch_ui/xiang.png")
    xiang:setSize(cc.size(40,40))
    xiang:setAnchorPoint(cc.p(0.5,0.5))
    bingfaTitle:appendComponent(xiang)
    xiang:setPositionInContainer(cc.p(127,20))
    table_equipDetial["xiang"] = xiang

    local qing = fc.FExtensionsImage:create()
    qing:setImage("batch_ui/qing.png")
    qing:setSize(cc.size(40,40))
    qing:setAnchorPoint(cc.p(0.5,0.5))
    bingfaTitle:appendComponent(qing)
    qing:setPositionInContainer(cc.p(181,20))
    table_equipDetial["qing"] = qing

    local bing = fc.FExtensionsImage:create()
    bing:setImage("batch_ui/bing_2.png")
    bing:setSize(cc.size(40,40))
    bing:setAnchorPoint(cc.p(0.5,0.5))
    bingfaTitle:appendComponent(bing)
    bing:setPositionInContainer(cc.p(20,20))
    table_equipDetial["bing"] = bing

    local fa = fc.FExtensionsImage:create()
    fa:setImage("batch_ui/fa.png")
    fa:setSize(cc.size(40,40))
    fa:setAnchorPoint(cc.p(0.5,0.5))
    bingfaTitle:appendComponent(fa)
    fa:setPositionInContainer(cc.p(74,20))
    table_equipDetial["fa"] = fa

    local yinliangIcon1 = fc.FExtensionsImage:create()
    yinliangIcon1:setImage("batch_ui/yuanbao_da.png")
    yinliangIcon1:setSize(cc.size(58,43))
    yinliangIcon1:setAnchorPoint(cc.p(0.5,0.5))
    equipDetial:appendComponent(yinliangIcon1)
    yinliangIcon1:setPositionInContainer(cc.p(722,491.5))
    table_equipDetial["yinliangIcon1"] = yinliangIcon1

    local label_dididid = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shuruwenzi.png",cc.rect(11,9,47,7))
    label_dididid:setSize(cc.size(180,40))
    label_dididid:setAnchorPoint(cc.p(0.5,0.5))
    equipDetial:appendComponent(label_dididid)
    label_dididid:setPositionInContainer(cc.p(802,35))
    table_equipDetial["label_dididid"] = label_dididid

    local totalYinliangLabel = fc.FLabel:createSystemFont()
    totalYinliangLabel:setSize(cc.size(60,30))
    totalYinliangLabel:setAnchorPoint(cc.p(0.5,0.5))
    totalYinliangLabel:setFontSize(21)
    if LANGUAGE_TYPE == 3 then
    	totalYinliangLabel:setString("花費:")
    else
	    totalYinliangLabel:setString("花费:")
    end
    totalYinliangLabel:setColor(cc.c3b(250,255,165))
    equipDetial:appendComponent(totalYinliangLabel)
    totalYinliangLabel:setPositionInContainer(cc.p(829,34))
    table_equipDetial["totalYinliangLabel"] = totalYinliangLabel

    local yinliangIcon = fc.FExtensionsImage:create()
    yinliangIcon:setImage("batch_ui/yinliangDouble.png")
    yinliangIcon:setSize(cc.size(54,42))
    yinliangIcon:setAnchorPoint(cc.p(0.5,0.5))
    equipDetial:appendComponent(yinliangIcon)
    yinliangIcon:setPositionInContainer(cc.p(745,34))
    table_equipDetial["yinliangIcon"] = yinliangIcon

    local btnUpgradel = fc.FScaleButton:create()
    btnUpgradel:setSize(cc.size(146,53))
    btnUpgradel:setAnchorPoint(cc.p(0.5,0.5))
    btnUpgradel:setButtonImage("batch_ui/teshuanniu.png")
    equipDetial:appendComponent(btnUpgradel)
    btnUpgradel:setPositionInContainer(cc.p(625,553.5))
    table_equipDetial["btnUpgradel"] = btnUpgradel

    local sheng = fc.FShaderExtensionsImage:create(0)
    sheng:setAnchorPoint(cc.p(0.5,0.5))
    sheng:setImage("batch_ui/sheng1_uizi.png")
    sheng:setSize(cc.size(32,32))
    btnUpgradel:appendComponent(sheng)
    sheng:setPositionInContainer(cc.p(47,26))
    table_equipDetial["sheng"] = sheng

    local ji = fc.FShaderExtensionsImage:create(0)
    ji:setAnchorPoint(cc.p(0.5,0.5))
    ji:setImage("batch_ui/ji1_uizi.png")
    ji:setSize(cc.size(32,32))
    btnUpgradel:appendComponent(ji)
    ji:setPositionInContainer(cc.p(101,26))
    table_equipDetial["ji"] = ji

    local btnUpgradeR = fc.FScaleButton:create()
    btnUpgradeR:setSize(cc.size(146,53))
    btnUpgradeR:setAnchorPoint(cc.p(0.5,0.5))
    btnUpgradeR:setButtonImage("batch_ui/teshuanniu.png")
    equipDetial:appendComponent(btnUpgradeR)
    btnUpgradeR:setPositionInContainer(cc.p(825,553.5))
    table_equipDetial["btnUpgradeR"] = btnUpgradeR

    local sheng = fc.FShaderExtensionsImage:create(0)
    sheng:setAnchorPoint(cc.p(0.5,0.5))
    sheng:setImage("batch_ui/sheng1_uizi.png")
    sheng:setSize(cc.size(32,32))
    btnUpgradeR:appendComponent(sheng)
    sheng:setPositionInContainer(cc.p(86,26))
    table_equipDetial["sheng"] = sheng

    local ji = fc.FShaderExtensionsImage:create(0)
    ji:setAnchorPoint(cc.p(0.5,0.5))
    ji:setImage("batch_ui/ji1_uizi.png")
    ji:setSize(cc.size(32,32))
    btnUpgradeR:appendComponent(ji)
    ji:setPositionInContainer(cc.p(113,26))
    table_equipDetial["ji"] = ji

    local yi = fc.FShaderExtensionsImage:create(0)
    yi:setAnchorPoint(cc.p(0.5,0.5))
    yi:setImage("batch_ui/yi_uizi.png")
    yi:setSize(cc.size(32,32))
    btnUpgradeR:appendComponent(yi)
    yi:setPositionInContainer(cc.p(31,26))
    table_equipDetial["yi"] = yi

    local jian = fc.FShaderExtensionsImage:create(0)
    jian:setAnchorPoint(cc.p(0.5,0.5))
    jian:setImage("batch_ui/jian_uizi (2).png")
    jian:setSize(cc.size(32,32))
    btnUpgradeR:appendComponent(jian)
    jian:setPositionInContainer(cc.p(58,26))
    table_equipDetial["jian"] = jian

    return table_equipDetial

end

