function createxunfang()

    local table_xunfang = {}

    local xunfang = fc.FContainerPanel:create()
    xunfang:setSize(cc.size(960,640))
    table_xunfang["xunfang"] = xunfang

    local bgLT = fc.FExtensionsImage:create()
    bgLT:setImage("nobatch/banzidikuang_tongyong.png")
    bgLT:setSize(cc.size(480,320))
    bgLT:setAnchorPoint(cc.p(0.5,0.5))
    xunfang:appendComponent(bgLT)
    bgLT:setPositionInContainer(cc.p(240,160))
    table_xunfang["bgLT"] = bgLT

    local bgLB = fc.FExtensionsImage:create()
    bgLB:setImage("nobatch/banzidikuang_tongyong.png")
    bgLB:setSize(cc.size(480,320))
    bgLB:setFlipType(4)
    bgLB:setAnchorPoint(cc.p(0.5,0.5))
    xunfang:appendComponent(bgLB)
    bgLB:setPositionInContainer(cc.p(240,480))
    table_xunfang["bgLB"] = bgLB

    local bgRT = fc.FExtensionsImage:create()
    bgRT:setImage("nobatch/banzidikuang_tongyong.png")
    bgRT:setSize(cc.size(480,320))
    bgRT:setFlipType(2)
    bgRT:setAnchorPoint(cc.p(0.5,0.5))
    xunfang:appendComponent(bgRT)
    bgRT:setPositionInContainer(cc.p(720,160))
    table_xunfang["bgRT"] = bgRT

    local bgRB = fc.FExtensionsImage:create()
    bgRB:setImage("nobatch/banzidikuang_tongyong.png")
    bgRB:setSize(cc.size(480,320))
    bgRB:setFlipType(8)
    bgRB:setAnchorPoint(cc.p(0.5,0.5))
    xunfang:appendComponent(bgRB)
    bgRB:setPositionInContainer(cc.p(720,480))
    table_xunfang["bgRB"] = bgRB

    local titleL = fc.FExtensionsImage:create()
    titleL:setImage("nobatch/title_mingchen_.png")
    titleL:setSize(cc.size(480,67))
    titleL:setAnchorPoint(cc.p(0.5,0.5))
    xunfang:appendComponent(titleL)
    titleL:setPositionInContainer(cc.p(240,33.5))
    table_xunfang["titleL"] = titleL

    local titleR = fc.FExtensionsImage:create()
    titleR:setImage("nobatch/title_mingchen_.png")
    titleR:setSize(cc.size(480,67))
    titleR:setFlipType(2)
    titleR:setAnchorPoint(cc.p(0.5,0.5))
    xunfang:appendComponent(titleR)
    titleR:setPositionInContainer(cc.p(720,33.5))
    table_xunfang["titleR"] = titleR

    local clothL = fc.FExtensionsImage:create()
    clothL:setImage("batch_ui/title_mingchen_2.png")
    clothL:setSize(cc.size(62,121))
    clothL:setAnchorPoint(cc.p(0.5,0.5))
    xunfang:appendComponent(clothL)
    clothL:setPositionInContainer(cc.p(31,60.5))
    table_xunfang["clothL"] = clothL

    local clothR = fc.FExtensionsImage:create()
    clothR:setImage("batch_ui/title_mingchen_2.png")
    clothR:setSize(cc.size(62,121))
    clothR:setFlipType(2)
    clothR:setAnchorPoint(cc.p(0.5,0.5))
    xunfang:appendComponent(clothR)
    clothR:setPositionInContainer(cc.p(929,60.5))
    table_xunfang["clothR"] = clothR

    local close = fc.FScaleButton:create()
    close:setSize(cc.size(52,52))
    close:setAnchorPoint(cc.p(0.5,0.5))
    close:setButtonImage("batch_ui/guanbi_up.png")
    xunfang:appendComponent(close)
    close:setPositionInContainer(cc.p(934,34))
    table_xunfang["close"] = close

    local title = fc.FContainerPanel:create()
    title:setSize(cc.size(180,30))
    title:setAnchorPoint(cc.p(0.5,0.5))
    xunfang:appendComponent(title)
    title:setPositionInContainer(cc.p(480,34))
    table_xunfang["title"] = title

    local wei = fc.FExtensionsImage:create()
    wei:setImage("batch_ui/wei_1.png")
    wei:setSize(cc.size(40,40))
    wei:setAnchorPoint(cc.p(0.5,0.5))
    title:appendComponent(wei)
    wei:setPositionInContainer(cc.p(20,20))
    table_xunfang["wei"] = wei

    local fu = fc.FExtensionsImage:create()
    fu:setImage("batch_ui/fu_3.png")
    fu:setSize(cc.size(40,40))
    fu:setAnchorPoint(cc.p(0.5,0.5))
    title:appendComponent(fu)
    fu:setPositionInContainer(cc.p(67,20))
    table_xunfang["fu"] = fu

    local si = fc.FExtensionsImage:create()
    si:setImage("batch_ui/si.png")
    si:setSize(cc.size(40,40))
    si:setAnchorPoint(cc.p(0.5,0.5))
    title:appendComponent(si)
    si:setPositionInContainer(cc.p(113,20))
    table_xunfang["si"] = si

    local fang = fc.FExtensionsImage:create()
    fang:setImage("batch_ui/fang_1.png")
    fang:setSize(cc.size(40,40))
    fang:setAnchorPoint(cc.p(0.5,0.5))
    title:appendComponent(fang)
    fang:setPositionInContainer(cc.p(160,20))
    table_xunfang["fang"] = fang

    local listbg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongdikuang1.png",cc.rect(25,25,4,4))
    listbg:setSize(cc.size(290,540))
    listbg:setAnchorPoint(cc.p(0.5,0.5))
    xunfang:appendComponent(listbg)
    listbg:setPositionInContainer(cc.p(175,352))
    table_xunfang["listbg"] = listbg

    local listbg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongdikuang1.png",cc.rect(25,25,4,4))
    listbg:setSize(cc.size(290,540))
    listbg:setAnchorPoint(cc.p(0.5,0.5))
    xunfang:appendComponent(listbg)
    listbg:setPositionInContainer(cc.p(480,352))
    table_xunfang["listbg"] = listbg

    local listbg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongdikuang1.png",cc.rect(25,25,4,4))
    listbg:setSize(cc.size(290,540))
    listbg:setAnchorPoint(cc.p(0.5,0.5))
    xunfang:appendComponent(listbg)
    listbg:setPositionInContainer(cc.p(785,352))
    table_xunfang["listbg"] = listbg

    local listTitle = fc.FScale9Image:createWithBatchUIFrame("batch_ui/xingjikuang_tangquanxinggong.png",cc.rect(62,0,2,42))
    listTitle:setSize(cc.size(290,42))
    listTitle:setAnchorPoint(cc.p(0.5,0.5))
    xunfang:appendComponent(listTitle)
    listTitle:setPositionInContainer(cc.p(175,106))
    table_xunfang["listTitle"] = listTitle

    local listTitle = fc.FScale9Image:createWithBatchUIFrame("batch_ui/xingjikuang_tangquanxinggong.png",cc.rect(62,0,2,42))
    listTitle:setSize(cc.size(290,42))
    listTitle:setAnchorPoint(cc.p(0.5,0.5))
    xunfang:appendComponent(listTitle)
    listTitle:setPositionInContainer(cc.p(480,106))
    table_xunfang["listTitle"] = listTitle

    local listTitle = fc.FScale9Image:createWithBatchUIFrame("batch_ui/xingjikuang_tangquanxinggong.png",cc.rect(62,0,2,42))
    listTitle:setSize(cc.size(290,42))
    listTitle:setAnchorPoint(cc.p(0.5,0.5))
    xunfang:appendComponent(listTitle)
    listTitle:setPositionInContainer(cc.p(785,106))
    table_xunfang["listTitle"] = listTitle

    local name1 = fc.FLabel:createBMFont()
    name1:setSize(cc.size(70,30))
    name1:setAnchorPoint(cc.p(0.5,0.5))
    name1:setFontSize(21)
    if LANGUAGE_TYPE == 3 then
    	name1:setString("坊間市集")
    else
    	name1:setString("坊间市集")
    end
    name1:setColor(cc.c3b(255, 255,255))
    xunfang:appendComponent(name1)
    name1:setPositionInContainer(cc.p(172,102))
    table_xunfang["name1"] = name1

    local name2 = fc.FLabel:createBMFont()
    name2:setSize(cc.size(70,30))
    name2:setAnchorPoint(cc.p(0.5,0.5))
    name2:setFontSize(21)
	name2:setString("名山古剎")
    name2:setColor(cc.c3b(255, 255,255))
    xunfang:appendComponent(name2)
    name2:setPositionInContainer(cc.p(480,102))
    table_xunfang["name2"] = name2

    local name3 = fc.FLabel:createBMFont()
    name3:setSize(cc.size(70,30))
    name3:setAnchorPoint(cc.p(0.5,0.5))
    name3:setFontSize(21)
    name3:setString("海外仙山")
    name3:setColor(cc.c3b(255, 255,255))
    xunfang:appendComponent(name3)
    name3:setPositionInContainer(cc.p(788,102))
    table_xunfang["name3"] = name3

    local image1 = fc.FExtensionsImage:create()
    image1:setAnchorPoint(cc.p(0.5,0.5))
    xunfang:appendComponent(image1)
    image1:setPositionInContainer(cc.p(175,321))
    table_xunfang["image1"] = image1

    local image2 = fc.FExtensionsImage:create()
    image2:setAnchorPoint(cc.p(0.5,0.5))
    xunfang:appendComponent(image2)
    image2:setPositionInContainer(cc.p(480,321))
    table_xunfang["image2"] = image2

    local image3 = fc.FExtensionsImage:create()
    image3:setAnchorPoint(cc.p(0.5,0.5))
    xunfang:appendComponent(image3)
    image3:setPositionInContainer(cc.p(788,321))
    table_xunfang["image3"] = image3

    local textBg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shuruwenzi.png",cc.rect(11,9,47,7))
    textBg:setSize(cc.size(60,30))
    textBg:setAnchorPoint(cc.p(0.5,0.5))
    xunfang:appendComponent(textBg)
    textBg:setPositionInContainer(cc.p(166,536))
    table_xunfang["textBg"] = textBg

    local textBg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shuruwenzi.png",cc.rect(11,9,47,7))
    textBg:setSize(cc.size(60,30))
    textBg:setAnchorPoint(cc.p(0.5,0.5))
    xunfang:appendComponent(textBg)
    textBg:setPositionInContainer(cc.p(466,536))
    table_xunfang["textBg"] = textBg

    local textBg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shuruwenzi.png",cc.rect(11,9,47,7))
    textBg:setSize(cc.size(60,30))
    textBg:setAnchorPoint(cc.p(0.5,0.5))
    xunfang:appendComponent(textBg)
    textBg:setPositionInContainer(cc.p(767,536))
    table_xunfang["textBg"] = textBg

    local itemName1 = fc.FLabel:createBMFont()
    itemName1:setSize(cc.size(70,30))
    itemName1:setAnchorPoint(cc.p(0.5,0.5))
    itemName1:setFontSize(21)
    itemName1:setString("9999")
    itemName1:setColor(cc.c3b(0, 0,255))
    xunfang:appendComponent(itemName1)
    itemName1:setPositionInContainer(cc.p(84,534))
    table_xunfang["itemName1"] = itemName1

    local itemName2 = fc.FLabel:createBMFont()
    itemName2:setSize(cc.size(70,30))
    itemName2:setAnchorPoint(cc.p(0.5,0.5))
    itemName2:setFontSize(21)
    itemName2:setString("9999")
    itemName2:setColor(cc.c3b(180, 0,255))
    xunfang:appendComponent(itemName2)
    itemName2:setPositionInContainer(cc.p(389,533))
    table_xunfang["itemName2"] = itemName2

    local itemName3 = fc.FLabel:createBMFont()
    itemName3:setSize(cc.size(70,30))
    itemName3:setAnchorPoint(cc.p(0.5,0.5))
    itemName3:setFontSize(21)
    itemName3:setString("9999")
    itemName3:setColor(cc.c3b(255, 90,0))
    xunfang:appendComponent(itemName3)
    itemName3:setPositionInContainer(cc.p(692,535))
    table_xunfang["itemName3"] = itemName3

    local itemNumber1 = fc.FLabel:createBMFont()
    itemNumber1:setSize(cc.size(60,30))
    itemNumber1:setAnchorPoint(cc.p(0.5,0.5))
    itemNumber1:setFontSize(21)
    itemNumber1:setString("9999")
    itemNumber1:setColor(cc.c3b(139,255,240))
    xunfang:appendComponent(itemNumber1)
    itemNumber1:setPositionInContainer(cc.p(165,534))
    table_xunfang["itemNumber1"] = itemNumber1

    local itemNumber2 = fc.FLabel:createBMFont()
    itemNumber2:setSize(cc.size(70,30))
    itemNumber2:setAnchorPoint(cc.p(0.5,0.5))
    itemNumber2:setFontSize(21)
    itemNumber2:setString("9999")
    itemNumber2:setColor(cc.c3b(139,255,240))
    xunfang:appendComponent(itemNumber2)
    itemNumber2:setPositionInContainer(cc.p(465,534))
    table_xunfang["itemNumber2"] = itemNumber2

    local itemNumber3 = fc.FLabel:createBMFont()
    itemNumber3:setSize(cc.size(70,30))
    itemNumber3:setAnchorPoint(cc.p(0.5,0.5))
    itemNumber3:setFontSize(21)
    itemNumber3:setString("9999")
    itemNumber3:setColor(cc.c3b(139,255,240))
    xunfang:appendComponent(itemNumber3)
    itemNumber3:setPositionInContainer(cc.p(768,534))
    table_xunfang["itemNumber3"] = itemNumber3

    local line = fc.FExtensionsImage:create()
    line:setImage("batch_ui/ditu2_guoqingxinxi.png")
    line:setSize(cc.size(80,4))
    line:setAnchorPoint(cc.p(0.5,0.5))
    xunfang:appendComponent(line)
    line:setPositionInContainer(cc.p(391,520))
    table_xunfang["line"] = line

    local line = fc.FExtensionsImage:create()
    line:setImage("batch_ui/ditu2_guoqingxinxi.png")
    line:setSize(cc.size(80,4))
    line:setAnchorPoint(cc.p(0.5,0.5))
    xunfang:appendComponent(line)
    line:setPositionInContainer(cc.p(390,556))
    table_xunfang["line"] = line

    local line = fc.FExtensionsImage:create()
    line:setImage("batch_ui/ditu2_guoqingxinxi.png")
    line:setSize(cc.size(80,4))
    line:setAnchorPoint(cc.p(0.5,0.5))
    xunfang:appendComponent(line)
    line:setPositionInContainer(cc.p(87,521))
    table_xunfang["line"] = line

    local line = fc.FExtensionsImage:create()
    line:setImage("batch_ui/ditu2_guoqingxinxi.png")
    line:setSize(cc.size(80,4))
    line:setAnchorPoint(cc.p(0.5,0.5))
    xunfang:appendComponent(line)
    line:setPositionInContainer(cc.p(87,557))
    table_xunfang["line"] = line

    local line = fc.FExtensionsImage:create()
    line:setImage("batch_ui/ditu2_guoqingxinxi.png")
    line:setSize(cc.size(80,4))
    line:setAnchorPoint(cc.p(0.5,0.5))
    xunfang:appendComponent(line)
    line:setPositionInContainer(cc.p(686,522))
    table_xunfang["line"] = line

    local line = fc.FExtensionsImage:create()
    line:setImage("batch_ui/ditu2_guoqingxinxi.png")
    line:setSize(cc.size(80,4))
    line:setAnchorPoint(cc.p(0.5,0.5))
    xunfang:appendComponent(line)
    line:setPositionInContainer(cc.p(686,558))
    table_xunfang["line"] = line

    local imageFrame = fc.FScale9Image:createWithBatchUIFrame("batch_ui/kapaikuang.png",cc.rect(44,24,4,4))
    imageFrame:setSize(cc.size(250,370))
    imageFrame:setAnchorPoint(cc.p(0.5,0.5))
    xunfang:appendComponent(imageFrame)
    imageFrame:setPositionInContainer(cc.p(175,321))
    table_xunfang["imageFrame"] = imageFrame

    local imageFrame = fc.FScale9Image:createWithBatchUIFrame("batch_ui/kapaikuang.png",cc.rect(44,24,4,4))
    imageFrame:setSize(cc.size(250,370))
    imageFrame:setAnchorPoint(cc.p(0.5,0.5))
    xunfang:appendComponent(imageFrame)
    imageFrame:setPositionInContainer(cc.p(480,321))
    table_xunfang["imageFrame"] = imageFrame

    local imageFrame = fc.FScale9Image:createWithBatchUIFrame("batch_ui/kapaikuang.png",cc.rect(44,24,4,4))
    imageFrame:setSize(cc.size(250,370))
    imageFrame:setAnchorPoint(cc.p(0.5,0.5))
    xunfang:appendComponent(imageFrame)
    imageFrame:setPositionInContainer(cc.p(788,321))
    table_xunfang["imageFrame"] = imageFrame

    local btn1 = fc.FContainerPanel:create()
    btn1:setSize(cc.size(250,380))
    btn1:setAnchorPoint(cc.p(0.5,0.5))
    xunfang:appendComponent(btn1)
    btn1:setPositionInContainer(cc.p(175,321))
    table_xunfang["btn1"] = btn1

    local btn2 = fc.FContainerPanel:create()
    btn2:setSize(cc.size(250,380))
    btn2:setAnchorPoint(cc.p(0.5,0.5))
    xunfang:appendComponent(btn2)
    btn2:setPositionInContainer(cc.p(480,321))
    table_xunfang["btn2"] = btn2

    local btn3 = fc.FContainerPanel:create()
    btn3:setSize(cc.size(250,380))
    btn3:setAnchorPoint(cc.p(0.5,0.5))
    xunfang:appendComponent(btn3)
    btn3:setPositionInContainer(cc.p(788,321))
    table_xunfang["btn3"] = btn3

    local yuanbao = fc.FExtensionsImage:create()
    yuanbao:setImage("batch_ui/yuanbao2_shangcheng.png")
    yuanbao:setSize(cc.size(40,30))
    yuanbao:setAnchorPoint(cc.p(0.5,0.5))
    xunfang:appendComponent(yuanbao)
    yuanbao:setPositionInContainer(cc.p(704,27))
    table_xunfang["yuanbao"] = yuanbao

    local yuanbao = fc.FExtensionsImage:create()
    yuanbao:setImage("batch_ui/yuanbao2_shangcheng.png")
    yuanbao:setSize(cc.size(40,30))
    yuanbao:setAnchorPoint(cc.p(0.5,0.5))
    xunfang:appendComponent(yuanbao)
    yuanbao:setPositionInContainer(cc.p(720,40))
    table_xunfang["yuanbao"] = yuanbao

    local detialBtn1 = fc.FScaleButton:create()
    detialBtn1:setSize(cc.size(144,53))
    detialBtn1:setAnchorPoint(cc.p(0.5,0.5))
    detialBtn1:setButtonImage("batch_ui/putonganniu1_up.png")
    xunfang:appendComponent(detialBtn1)
    detialBtn1:setPositionInContainer(cc.p(175,588.5))
    table_xunfang["detialBtn1"] = detialBtn1

    local jiang = fc.FExtensionsImage:create()
    jiang:setImage("batch_ui/jiang2_uizi.png")
    jiang:setSize(cc.size(32,32))
    jiang:setAnchorPoint(cc.p(0.5,0.5))
    detialBtn1:appendComponent(jiang)
    jiang:setPositionInContainer(cc.p(32,26))
    table_xunfang["jiang"] = jiang

    local li = fc.FExtensionsImage:create()
    li:setImage("batch_ui/li3_uizi.png")
    li:setSize(cc.size(32,32))
    li:setAnchorPoint(cc.p(0.5,0.5))
    detialBtn1:appendComponent(li)
    li:setPositionInContainer(cc.p(57,26))
    table_xunfang["li"] = li

    local xiang = fc.FExtensionsImage:create()
    xiang:setImage("batch_ui/xiang_uizi.png")
    xiang:setSize(cc.size(32,32))
    xiang:setAnchorPoint(cc.p(0.5,0.5))
    detialBtn1:appendComponent(xiang)
    xiang:setPositionInContainer(cc.p(83,26))
    table_xunfang["xiang"] = xiang

    local qing = fc.FExtensionsImage:create()
    qing:setImage("batch_ui/qing_uizi.png")
    qing:setSize(cc.size(32,32))
    qing:setAnchorPoint(cc.p(0.5,0.5))
    detialBtn1:appendComponent(qing)
    qing:setPositionInContainer(cc.p(108,26))
    table_xunfang["qing"] = qing

    local detialBtn2 = fc.FScaleButton:create()
    detialBtn2:setSize(cc.size(144,53))
    detialBtn2:setAnchorPoint(cc.p(0.5,0.5))
    detialBtn2:setButtonImage("batch_ui/putonganniu1_up.png")
    xunfang:appendComponent(detialBtn2)
    detialBtn2:setPositionInContainer(cc.p(480,588.5))
    table_xunfang["detialBtn2"] = detialBtn2

    local jiang = fc.FExtensionsImage:create()
    jiang:setImage("batch_ui/jiang2_uizi.png")
    jiang:setSize(cc.size(32,32))
    jiang:setAnchorPoint(cc.p(0.5,0.5))
    detialBtn2:appendComponent(jiang)
    jiang:setPositionInContainer(cc.p(32,26))
    table_xunfang["jiang"] = jiang

    local li = fc.FExtensionsImage:create()
    li:setImage("batch_ui/li3_uizi.png")
    li:setSize(cc.size(32,32))
    li:setAnchorPoint(cc.p(0.5,0.5))
    detialBtn2:appendComponent(li)
    li:setPositionInContainer(cc.p(57,26))
    table_xunfang["li"] = li

    local xiang = fc.FExtensionsImage:create()
    xiang:setImage("batch_ui/xiang_uizi.png")
    xiang:setSize(cc.size(32,32))
    xiang:setAnchorPoint(cc.p(0.5,0.5))
    detialBtn2:appendComponent(xiang)
    xiang:setPositionInContainer(cc.p(83,26))
    table_xunfang["xiang"] = xiang

    local qing = fc.FExtensionsImage:create()
    qing:setImage("batch_ui/qing_uizi.png")
    qing:setSize(cc.size(32,32))
    qing:setAnchorPoint(cc.p(0.5,0.5))
    detialBtn2:appendComponent(qing)
    qing:setPositionInContainer(cc.p(108,26))
    table_xunfang["qing"] = qing

    local detialBtn3 = fc.FScaleButton:create()
    detialBtn3:setSize(cc.size(144,53))
    detialBtn3:setAnchorPoint(cc.p(0.5,0.5))
    detialBtn3:setButtonImage("batch_ui/putonganniu1_up.png")
    xunfang:appendComponent(detialBtn3)
    detialBtn3:setPositionInContainer(cc.p(788,588.5))
    table_xunfang["detialBtn3"] = detialBtn3

    local jiang = fc.FExtensionsImage:create()
    jiang:setImage("batch_ui/jiang2_uizi.png")
    jiang:setSize(cc.size(32,32))
    jiang:setAnchorPoint(cc.p(0.5,0.5))
    detialBtn3:appendComponent(jiang)
    jiang:setPositionInContainer(cc.p(32,26))
    table_xunfang["jiang"] = jiang

    local li = fc.FExtensionsImage:create()
    li:setImage("batch_ui/li3_uizi.png")
    li:setSize(cc.size(32,32))
    li:setAnchorPoint(cc.p(0.5,0.5))
    detialBtn3:appendComponent(li)
    li:setPositionInContainer(cc.p(57,26))
    table_xunfang["li"] = li

    local xiang = fc.FExtensionsImage:create()
    xiang:setImage("batch_ui/xiang_uizi.png")
    xiang:setSize(cc.size(32,32))
    xiang:setAnchorPoint(cc.p(0.5,0.5))
    detialBtn3:appendComponent(xiang)
    xiang:setPositionInContainer(cc.p(83,26))
    table_xunfang["xiang"] = xiang

    local qing = fc.FExtensionsImage:create()
    qing:setImage("batch_ui/qing_uizi.png")
    qing:setSize(cc.size(32,32))
    qing:setAnchorPoint(cc.p(0.5,0.5))
    detialBtn3:appendComponent(qing)
    qing:setPositionInContainer(cc.p(108,26))
    table_xunfang["qing"] = qing

    local huo_label = fc.FLabel:createBMFont()
    huo_label:setSize(cc.size(30,30))
    huo_label:setAnchorPoint(cc.p(0.5,0.5))
    huo_label:setFontSize(21)
    huo_label:setString("或")
    huo_label:setColor(cc.c3b(91,24,6))
    xunfang:appendComponent(huo_label)
    huo_label:setPositionInContainer(cc.p(207,535))
    table_xunfang["huo_label"] = huo_label

    local yuanbao = fc.FExtensionsImage:create()
    yuanbao:setImage("batch_ui/yuanbao2_shangcheng.png")
    yuanbao:setSize(cc.size(40,30))
    yuanbao:setAnchorPoint(cc.p(0.5,0.5))
    xunfang:appendComponent(yuanbao)
    yuanbao:setPositionInContainer(cc.p(233,536))
    table_xunfang["yuanbao"] = yuanbao

    local textBg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shuruwenzi.png",cc.rect(11,9,47,7))
    textBg:setSize(cc.size(60,30))
    textBg:setAnchorPoint(cc.p(0.5,0.5))
    xunfang:appendComponent(textBg)
    textBg:setPositionInContainer(cc.p(283,537))
    table_xunfang["textBg"] = textBg

    local cost1 = fc.FLabel:createBMFont()
    cost1:setSize(cc.size(60,30))
    cost1:setAnchorPoint(cc.p(0.5,0.5))
    cost1:setFontSize(21)
    cost1:setString("99")
    cost1:setColor(cc.c3b(0,255,255))
    xunfang:appendComponent(cost1)
    cost1:setPositionInContainer(cc.p(282,535))
    table_xunfang["cost1"] = cost1

    local listFrame = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongbiankuang2_ciguan.png",cc.rect(43,15,2,2))
    listFrame:setSize(cc.size(290,550))
    listFrame:setAnchorPoint(cc.p(0.5,0.5))
    xunfang:appendComponent(listFrame)
    listFrame:setPositionInContainer(cc.p(176,352))
    table_xunfang["listFrame"] = listFrame

    local huo_label = fc.FLabel:createBMFont()
    huo_label:setSize(cc.size(30,30))
    huo_label:setAnchorPoint(cc.p(0.5,0.5))
    huo_label:setFontSize(21)
    huo_label:setString("或")
    huo_label:setColor(cc.c3b(91,24,6))
    xunfang:appendComponent(huo_label)
    huo_label:setPositionInContainer(cc.p(510,534))
    table_xunfang["huo_label"] = huo_label

    local yuanbao = fc.FExtensionsImage:create()
    yuanbao:setImage("batch_ui/yuanbao2_shangcheng.png")
    yuanbao:setSize(cc.size(40,30))
    yuanbao:setAnchorPoint(cc.p(0.5,0.5))
    xunfang:appendComponent(yuanbao)
    yuanbao:setPositionInContainer(cc.p(538,535))
    table_xunfang["yuanbao"] = yuanbao

    local textBg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shuruwenzi.png",cc.rect(11,9,47,7))
    textBg:setSize(cc.size(60,30))
    textBg:setAnchorPoint(cc.p(0.5,0.5))
    xunfang:appendComponent(textBg)
    textBg:setPositionInContainer(cc.p(587,536))
    table_xunfang["textBg"] = textBg

    local cost2 = fc.FLabel:createBMFont()
    cost2:setSize(cc.size(60,30))
    cost2:setAnchorPoint(cc.p(0.5,0.5))
    cost2:setFontSize(21)
    cost2:setString("99")
    cost2:setColor(cc.c3b(0,255,255))
    xunfang:appendComponent(cost2)
    cost2:setPositionInContainer(cc.p(587,534))
    table_xunfang["cost2"] = cost2

    local listFrame = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongbiankuang2_ciguan.png",cc.rect(43,15,2,2))
    listFrame:setSize(cc.size(290,550))
    listFrame:setAnchorPoint(cc.p(0.5,0.5))
    xunfang:appendComponent(listFrame)
    listFrame:setPositionInContainer(cc.p(480,352))
    table_xunfang["listFrame"] = listFrame

    local huo_label = fc.FLabel:createBMFont()
    huo_label:setSize(cc.size(30,30))
    huo_label:setAnchorPoint(cc.p(0.5,0.5))
    huo_label:setFontSize(21)
    huo_label:setString("或")
    huo_label:setColor(cc.c3b(91,24,6))
    xunfang:appendComponent(huo_label)
    huo_label:setPositionInContainer(cc.p(814,535))
    table_xunfang["huo_label"] = huo_label

    local yuanbao = fc.FExtensionsImage:create()
    yuanbao:setImage("batch_ui/yuanbao2_shangcheng.png")
    yuanbao:setSize(cc.size(40,30))
    yuanbao:setAnchorPoint(cc.p(0.5,0.5))
    xunfang:appendComponent(yuanbao)
    yuanbao:setPositionInContainer(cc.p(841,535))
    table_xunfang["yuanbao"] = yuanbao

    local textBg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shuruwenzi.png",cc.rect(11,9,47,7))
    textBg:setSize(cc.size(60,30))
    textBg:setAnchorPoint(cc.p(0.5,0.5))
    xunfang:appendComponent(textBg)
    textBg:setPositionInContainer(cc.p(890,537))
    table_xunfang["textBg"] = textBg

    local cost3 = fc.FLabel:createBMFont()
    cost3:setSize(cc.size(60,30))
    cost3:setAnchorPoint(cc.p(0.5,0.5))
    cost3:setFontSize(21)
    cost3:setString("99")
    cost3:setColor(cc.c3b(0,255,255))
    xunfang:appendComponent(cost3)
    cost3:setPositionInContainer(cc.p(890,535))
    table_xunfang["cost3"] = cost3

    local listFrame = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongbiankuang2_ciguan.png",cc.rect(43,15,2,2))
    listFrame:setSize(cc.size(290,550))
    listFrame:setAnchorPoint(cc.p(0.5,0.5))
    xunfang:appendComponent(listFrame)
    listFrame:setPositionInContainer(cc.p(785,352))
    table_xunfang["listFrame"] = listFrame

    local ttt_label_di = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shuruwenzi.png",cc.rect(11,9,47,7))
    ttt_label_di:setSize(cc.size(120,30))
    ttt_label_di:setAnchorPoint(cc.p(0.5,0.5))
    xunfang:appendComponent(ttt_label_di)
    ttt_label_di:setPositionInContainer(cc.p(813,33))
    table_xunfang["ttt_label_di"] = ttt_label_di

    local yuanbaoNumber = fc.FLabel:createBMFont()
    yuanbaoNumber:setSize(cc.size(70,30))
    yuanbaoNumber:setAnchorPoint(cc.p(0.5,0.5))
    yuanbaoNumber:setFontSize(21)
    yuanbaoNumber:setString("9999")
    yuanbaoNumber:setColor(cc.c3b(250,255,165))
    xunfang:appendComponent(yuanbaoNumber)
    yuanbaoNumber:setPositionInContainer(cc.p(814,29))
    table_xunfang["yuanbaoNumber"] = yuanbaoNumber

    local iamgedi3 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/mingzikuang2.png",cc.rect(44,24,1,1))
    iamgedi3:setSize(cc.size(265,63))
    iamgedi3:setAnchorPoint(cc.p(0.5,0.5))
    xunfang:appendComponent(iamgedi3)
    iamgedi3:setPositionInContainer(cc.p(175.5,483.5))
    table_xunfang["iamgedi3"] = iamgedi3

    local label1 = fc.FLabel:createBMFont()
    label1:setSize(cc.size(60,30))
    label1:setAnchorPoint(cc.p(0.5,0.5))
    label1:setFontSize(20)
    label1:setString("1～5")
    label1:setColor(cc.c3b(255,255,0))
    xunfang:appendComponent(label1)
    label1:setPositionInContainer(cc.p(129,481))
    table_xunfang["label1"] = label1

    local xing = fc.FExtensionsImage:create()
    xing:setImage("batch_ui/xingxing.png")
    xing:setSize(cc.size(20,19))
    xing:setAnchorPoint(cc.p(0.5,0.5))
    xunfang:appendComponent(xing)
    xing:setPositionInContainer(cc.p(170,483.5))
    table_xunfang["xing"] = xing

    local label4 = fc.FLabel:createBMFont()
    label4:setSize(cc.size(60,30))
    label4:setAnchorPoint(cc.p(0.5,0.5))
    label4:setFontSize(20)
    if LANGUAGE_TYPE == 3 then
    	label4:setString("裝備")
    else
    	label4:setString("装备")
    end
    
    label4:setColor(cc.c3b(255,255,0))
    xunfang:appendComponent(label4)
    label4:setPositionInContainer(cc.p(211,481))
    table_xunfang["label4"] = label4

    local iamgedi1 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/mingzikuang1.png",cc.rect(45,32,1,1))
    iamgedi1:setSize(cc.size(265,63))
    iamgedi1:setAnchorPoint(cc.p(0.5,0.5))
    xunfang:appendComponent(iamgedi1)
    iamgedi1:setPositionInContainer(cc.p(480.5,483.5))
    table_xunfang["iamgedi1"] = iamgedi1

    local label2 = fc.FLabel:createBMFont()
    label2:setSize(cc.size(60,30))
    label2:setAnchorPoint(cc.p(0.5,0.5))
    label2:setFontSize(20)
    label2:setString("2～5")
    label2:setColor(cc.c3b(255,255,0))
    xunfang:appendComponent(label2)
    label2:setPositionInContainer(cc.p(435,481))
    table_xunfang["label2"] = label2

    local xing = fc.FExtensionsImage:create()
    xing:setImage("batch_ui/xingxing.png")
    xing:setSize(cc.size(20,19))
    xing:setAnchorPoint(cc.p(0.5,0.5))
    xunfang:appendComponent(xing)
    xing:setPositionInContainer(cc.p(476,483.5))
    table_xunfang["xing"] = xing

    local label4 = fc.FLabel:createBMFont()
    label4:setSize(cc.size(60,30))
    label4:setAnchorPoint(cc.p(0.5,0.5))
    label4:setFontSize(20)
     if LANGUAGE_TYPE == 3 then
	    label4:setString("裝備")
     else
	    label4:setString("装备")
     end
    label4:setColor(cc.c3b(255,255,0))
    xunfang:appendComponent(label4)
    label4:setPositionInContainer(cc.p(518,481))
    table_xunfang["label4"] = label4

    local iamgedi2 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/mingzikuang.png",cc.rect(43,25,1,1))
    iamgedi2:setSize(cc.size(265,63))
    iamgedi2:setAnchorPoint(cc.p(0.5,0.5))
    xunfang:appendComponent(iamgedi2)
    iamgedi2:setPositionInContainer(cc.p(787.5,483.5))
    table_xunfang["iamgedi2"] = iamgedi2

    local label3 = fc.FLabel:createBMFont()
    label3:setSize(cc.size(60,30))
    label3:setAnchorPoint(cc.p(0.5,0.5))
    label3:setFontSize(20)
    label3:setString("3～5")
    label3:setColor(cc.c3b(255,255,0))
    xunfang:appendComponent(label3)
    label3:setPositionInContainer(cc.p(746,481))
    table_xunfang["label3"] = label3

    local xing = fc.FExtensionsImage:create()
    xing:setImage("batch_ui/xingxing.png")
    xing:setSize(cc.size(20,19))
    xing:setAnchorPoint(cc.p(0.5,0.5))
    xunfang:appendComponent(xing)
    xing:setPositionInContainer(cc.p(788,483.5))
    table_xunfang["xing"] = xing

    local label4 = fc.FLabel:createBMFont()
    label4:setSize(cc.size(60,30))
    label4:setAnchorPoint(cc.p(0.5,0.5))
    label4:setFontSize(20)
     if LANGUAGE_TYPE == 3 then
     	 label4:setString("裝備")
     else
     	 label4:setString("装备")
     end
    label4:setColor(cc.c3b(255,255,0))
    xunfang:appendComponent(label4)
    label4:setPositionInContainer(cc.p(831,481))
    table_xunfang["label4"] = label4

    return table_xunfang

end

