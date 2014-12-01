function createrank_reward_item()

    local table_rank_reward_item = {}

    local rank_reward_item = fc.FContainerPanel:create()
    rank_reward_item:setSize(cc.size(600,160))
    table_rank_reward_item["rank_reward_item"] = rank_reward_item

    local titlebg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/zongjiachengdikuang_tangquanxinggong.png",cc.rect(62,0,2,29))
    titlebg:setSize(cc.size(600,35))
    titlebg:setAnchorPoint(cc.p(0.5,0.5))
    titlebg:setScaleY(-1)
    rank_reward_item:appendComponent(titlebg)
    titlebg:setPositionInContainer(cc.p(300,17.5))
    table_rank_reward_item["titlebg"] = titlebg

    local mingci = fc.FLabel:createBMFont()
    mingci:setSize(cc.size(100,30))
    mingci:setAnchorPoint(cc.p(0.5,0.5))
    mingci:setFontSize(20)
    mingci:setString("")
    mingci:setColor(cc.c3b(0,255,0))
    rank_reward_item:appendComponent(mingci)
    mingci:setPositionInContainer(cc.p(108,13))
    table_rank_reward_item["mingci"] = mingci

    local text1 = fc.FLabel:createBMFont()
    text1:setSize(cc.size(100,30))
    text1:setAnchorPoint(cc.p(0.5,0.5))
    text1:setFontSize(20)
  	if LANGUAGE_TYPE == 3 then
  		text1:setString("且累計積分≥")
  	else	
  		text1:setString("且累计积分≥")
  	end
    text1:setColor(cc.c3b(0,255,0))
    rank_reward_item:appendComponent(text1)
    text1:setPositionInContainer(cc.p(399,15))
    table_rank_reward_item["text1"] = text1

    local itme1 = fc.FContainerPanel:create()
    itme1:setSize(cc.size(80,120))
    itme1:setAnchorPoint(cc.p(0.5,0.5))
    rank_reward_item:appendComponent(itme1)
    itme1:setPositionInContainer(cc.p(60,100))
    table_rank_reward_item["itme1"] = itme1

    local frame1 = fc.FExtensionsImage:create()
    frame1:setImage("batch_ui/baipinzhi_kuang.png")
    frame1:setSize(cc.size(75,75))
    frame1:setAnchorPoint(cc.p(0.5,0.5))
    itme1:appendComponent(frame1)
    frame1:setPositionInContainer(cc.p(37.5,37.5))
    table_rank_reward_item["frame1"] = frame1

    local image1 = fc.FExtensionsImage:create()
    image1:setImage("batch_ui/baipinzhi_kuang.png")
    image1:setSize(cc.size(65,65))
    image1:setAnchorPoint(cc.p(0.5,0.5))
    itme1:appendComponent(image1)
    image1:setPositionInContainer(cc.p(37.5,39.5))
    table_rank_reward_item["image1"] = image1

    local textBg = fc.FExtensionsImage:create()
    textBg:setImage("batch_ui/shuruwenzi.png")
    textBg:setSize(cc.size(75,25))
    textBg:setAnchorPoint(cc.p(0.5,0.5))
    itme1:appendComponent(textBg)
    textBg:setPositionInContainer(cc.p(37.5,93.5))
    table_rank_reward_item["textBg"] = textBg

    local name1 = fc.FLabel:createBMFont()
    name1:setSize(cc.size(75,24))
    name1:setAnchorPoint(cc.p(0.5,0.5))
    name1:setFontSize(15)
    name1:setString("")
    name1:setColor(cc.c3b(255,255,255))
    itme1:appendComponent(name1)
    name1:setPositionInContainer(cc.p(37.5,91))
    table_rank_reward_item["name1"] = name1

    local number1 = fc.FLabel:createBMFont()
    number1:setSize(cc.size(50,24))
    number1:setAnchorPoint(cc.p(0.5,0.5))
    number1:setFontSize(12)
    number1:setString("")
    number1:setColor(cc.c3b(0,255,255))
    itme1:appendComponent(number1)
    number1:setPositionInContainer(cc.p(46,60))
    table_rank_reward_item["number1"] = number1

    local flag1 = fc.FExtensionsImage:create()
    flag1:setImage("batch_ui/hunpi_biaozhi.png")
    flag1:setSize(cc.size(32,48))
    flag1:setAnchorPoint(cc.p(0.5,0.5))
    itme1:appendComponent(flag1)
    flag1:setPositionInContainer(cc.p(64,24))
    table_rank_reward_item["flag1"] = flag1

    local itme2 = fc.FContainerPanel:create()
    itme2:setSize(cc.size(80,120))
    itme2:setAnchorPoint(cc.p(0.5,0.5))
    rank_reward_item:appendComponent(itme2)
    itme2:setPositionInContainer(cc.p(157,100))
    table_rank_reward_item["itme2"] = itme2

    local frame2 = fc.FExtensionsImage:create()
    frame2:setImage("batch_ui/baipinzhi_kuang.png")
    frame2:setSize(cc.size(75,75))
    frame2:setAnchorPoint(cc.p(0.5,0.5))
    itme2:appendComponent(frame2)
    frame2:setPositionInContainer(cc.p(37.5,37.5))
    table_rank_reward_item["frame2"] = frame2

    local image2 = fc.FExtensionsImage:create()
    image2:setImage("batch_ui/baipinzhi_kuang.png")
    image2:setSize(cc.size(65,65))
    image2:setAnchorPoint(cc.p(0.5,0.5))
    itme2:appendComponent(image2)
    image2:setPositionInContainer(cc.p(37.5,37.5))
    table_rank_reward_item["image2"] = image2

    local textBg = fc.FExtensionsImage:create()
    textBg:setImage("batch_ui/shuruwenzi.png")
    textBg:setSize(cc.size(75,25))
    textBg:setAnchorPoint(cc.p(0.5,0.5))
    itme2:appendComponent(textBg)
    textBg:setPositionInContainer(cc.p(37.5,93.5))
    table_rank_reward_item["textBg"] = textBg

    local name2 = fc.FLabel:createBMFont()
    name2:setSize(cc.size(75,24))
    name2:setAnchorPoint(cc.p(0.5,0.5))
    name2:setFontSize(15)
    name2:setString("")
    name2:setColor(cc.c3b(255,255,255))
    itme2:appendComponent(name2)
    name2:setPositionInContainer(cc.p(37.5,91))
    table_rank_reward_item["name2"] = name2

    local number2 = fc.FLabel:createBMFont()
    number2:setSize(cc.size(50,24))
    number2:setAnchorPoint(cc.p(0.5,0.5))
    number2:setFontSize(12)
    number2:setString("")
    number2:setColor(cc.c3b(0,255,255))
    itme2:appendComponent(number2)
    number2:setPositionInContainer(cc.p(46,60))
    table_rank_reward_item["number2"] = number2

    local flag2 = fc.FExtensionsImage:create()
    flag2:setImage("batch_ui/hunpi_biaozhi.png")
    flag2:setSize(cc.size(32,48))
    flag2:setAnchorPoint(cc.p(0.5,0.5))
    itme2:appendComponent(flag2)
    flag2:setPositionInContainer(cc.p(64,24))
    table_rank_reward_item["flag2"] = flag2

    local itme3 = fc.FContainerPanel:create()
    itme3:setSize(cc.size(80,120))
    itme3:setAnchorPoint(cc.p(0.5,0.5))
    rank_reward_item:appendComponent(itme3)
    itme3:setPositionInContainer(cc.p(253,100))
    table_rank_reward_item["itme3"] = itme3

    local frame3 = fc.FExtensionsImage:create()
    frame3:setImage("batch_ui/baipinzhi_kuang.png")
    frame3:setSize(cc.size(75,75))
    frame3:setAnchorPoint(cc.p(0.5,0.5))
    itme3:appendComponent(frame3)
    frame3:setPositionInContainer(cc.p(37.5,37.5))
    table_rank_reward_item["frame3"] = frame3

    local image3 = fc.FExtensionsImage:create()
    image3:setImage("batch_ui/baipinzhi_kuang.png")
    image3:setSize(cc.size(65,65))
    image3:setAnchorPoint(cc.p(0.5,0.5))
    itme3:appendComponent(image3)
    image3:setPositionInContainer(cc.p(37.5,37.5))
    table_rank_reward_item["image3"] = image3

    local textBg = fc.FExtensionsImage:create()
    textBg:setImage("batch_ui/shuruwenzi.png")
    textBg:setSize(cc.size(75,25))
    textBg:setAnchorPoint(cc.p(0.5,0.5))
    itme3:appendComponent(textBg)
    textBg:setPositionInContainer(cc.p(37.5,93.5))
    table_rank_reward_item["textBg"] = textBg

    local name3 = fc.FLabel:createBMFont()
    name3:setSize(cc.size(75,24))
    name3:setAnchorPoint(cc.p(0.5,0.5))
    name3:setFontSize(15)
    name3:setString("")
    name3:setColor(cc.c3b(255,255,255))
    itme3:appendComponent(name3)
    name3:setPositionInContainer(cc.p(37.5,91))
    table_rank_reward_item["name3"] = name3

    local number3 = fc.FLabel:createBMFont()
    number3:setSize(cc.size(50,24))
    number3:setAnchorPoint(cc.p(0.5,0.5))
    number3:setFontSize(12)
    number3:setString("")
    number3:setColor(cc.c3b(0,255,255))
    itme3:appendComponent(number3)
    number3:setPositionInContainer(cc.p(46,60))
    table_rank_reward_item["number3"] = number3

    local flag3 = fc.FExtensionsImage:create()
    flag3:setImage("batch_ui/hunpi_biaozhi.png")
    flag3:setSize(cc.size(32,48))
    flag3:setAnchorPoint(cc.p(0.5,0.5))
    itme3:appendComponent(flag3)
    flag3:setPositionInContainer(cc.p(64,24))
    table_rank_reward_item["flag3"] = flag3

    local text2 = fc.FLabel:createBMFont()
    text2:setSize(cc.size(100,30))
    text2:setAnchorPoint(cc.p(0.5,0.5))
    text2:setFontSize(20)
    if LANGUAGE_TYPE == 3 then
	    text2:setString("且累計積分≥")
    else
	    text2:setString("且累计积分≥")
    end
    text2:setColor(cc.c3b(255,255,0))
    rank_reward_item:appendComponent(text2)
    text2:setPositionInContainer(cc.p(531,15))
    table_rank_reward_item["text2"] = text2

    local itme4 = fc.FContainerPanel:create()
    itme4:setSize(cc.size(80,120))
    itme4:setAnchorPoint(cc.p(0.5,0.5))
    rank_reward_item:appendComponent(itme4)
    itme4:setPositionInContainer(cc.p(350,100))
    table_rank_reward_item["itme4"] = itme4

    local frame4 = fc.FExtensionsImage:create()
    frame4:setImage("batch_ui/baipinzhi_kuang.png")
    frame4:setSize(cc.size(75,75))
    frame4:setAnchorPoint(cc.p(0.5,0.5))
    itme4:appendComponent(frame4)
    frame4:setPositionInContainer(cc.p(37.5,37.5))
    table_rank_reward_item["frame4"] = frame4

    local image4 = fc.FExtensionsImage:create()
    image4:setImage("batch_ui/baipinzhi_kuang.png")
    image4:setSize(cc.size(65,65))
    image4:setAnchorPoint(cc.p(0.5,0.5))
    itme4:appendComponent(image4)
    image4:setPositionInContainer(cc.p(37.5,37.5))
    table_rank_reward_item["image4"] = image4

    local number4 = fc.FLabel:createBMFont()
    number4:setSize(cc.size(50,24))
    number4:setAnchorPoint(cc.p(0.5,0.5))
    number4:setFontSize(12)
    number4:setString("")
    number4:setColor(cc.c3b(0,255,255))
    itme4:appendComponent(number4)
    number4:setPositionInContainer(cc.p(46,60))
    table_rank_reward_item["number4"] = number4

    local textBg = fc.FExtensionsImage:create()
    textBg:setImage("batch_ui/shuruwenzi.png")
    textBg:setSize(cc.size(75,25))
    textBg:setAnchorPoint(cc.p(0.5,0.5))
    itme4:appendComponent(textBg)
    textBg:setPositionInContainer(cc.p(37.5,93.5))
    table_rank_reward_item["textBg"] = textBg

    local name4 = fc.FLabel:createBMFont()
    name4:setSize(cc.size(75,24))
    name4:setAnchorPoint(cc.p(0.5,0.5))
    name4:setFontSize(15)
    name4:setString("")
    name4:setColor(cc.c3b(255,255,255))
    itme4:appendComponent(name4)
    name4:setPositionInContainer(cc.p(37.5,91))
    table_rank_reward_item["name4"] = name4

    local flag4 = fc.FExtensionsImage:create()
    flag4:setImage("batch_ui/hunpi_biaozhi.png")
    flag4:setSize(cc.size(32,48))
    flag4:setAnchorPoint(cc.p(0.5,0.5))
    itme4:appendComponent(flag4)
    flag4:setPositionInContainer(cc.p(64,24))
    table_rank_reward_item["flag4"] = flag4

    local itme5 = fc.FContainerPanel:create()
    itme5:setSize(cc.size(80,120))
    itme5:setAnchorPoint(cc.p(0.5,0.5))
    rank_reward_item:appendComponent(itme5)
    itme5:setPositionInContainer(cc.p(446,100))
    table_rank_reward_item["itme5"] = itme5

    local frame5 = fc.FExtensionsImage:create()
    frame5:setImage("batch_ui/baipinzhi_kuang.png")
    frame5:setSize(cc.size(75,75))
    frame5:setAnchorPoint(cc.p(0.5,0.5))
    itme5:appendComponent(frame5)
    frame5:setPositionInContainer(cc.p(37.5,37.5))
    table_rank_reward_item["frame5"] = frame5

    local image5 = fc.FExtensionsImage:create()
    image5:setImage("batch_ui/baipinzhi_kuang.png")
    image5:setSize(cc.size(65,65))
    image5:setAnchorPoint(cc.p(0.5,0.5))
    itme5:appendComponent(image5)
    image5:setPositionInContainer(cc.p(37.5,37.5))
    table_rank_reward_item["image5"] = image5

    local textBg = fc.FExtensionsImage:create()
    textBg:setImage("batch_ui/shuruwenzi.png")
    textBg:setSize(cc.size(75,25))
    textBg:setAnchorPoint(cc.p(0.5,0.5))
    itme5:appendComponent(textBg)
    textBg:setPositionInContainer(cc.p(37.5,93.5))
    table_rank_reward_item["textBg"] = textBg

    local name5 = fc.FLabel:createBMFont()
    name5:setSize(cc.size(75,24))
    name5:setAnchorPoint(cc.p(0.5,0.5))
    name5:setFontSize(15)
    name5:setString("")
    name5:setColor(cc.c3b(255,255,255))
    itme5:appendComponent(name5)
    name5:setPositionInContainer(cc.p(37.5,91))
    table_rank_reward_item["name5"] = name5

    local number5 = fc.FLabel:createBMFont()
    number5:setSize(cc.size(50,24))
    number5:setAnchorPoint(cc.p(0.5,0.5))
    number5:setFontSize(12)
    number5:setString("")
    number5:setColor(cc.c3b(0,255,255))
    itme5:appendComponent(number5)
    number5:setPositionInContainer(cc.p(46,60))
    table_rank_reward_item["number5"] = number5

    local flag5 = fc.FExtensionsImage:create()
    flag5:setImage("batch_ui/hunpi_biaozhi.png")
    flag5:setSize(cc.size(32,48))
    flag5:setAnchorPoint(cc.p(0.5,0.5))
    itme5:appendComponent(flag5)
    flag5:setPositionInContainer(cc.p(64,24))
    table_rank_reward_item["flag5"] = flag5

    local itme6 = fc.FContainerPanel:create()
    itme6:setSize(cc.size(80,120))
    itme6:setAnchorPoint(cc.p(0.5,0.5))
    rank_reward_item:appendComponent(itme6)
    itme6:setPositionInContainer(cc.p(543,100))
    table_rank_reward_item["itme6"] = itme6

    local frame6 = fc.FExtensionsImage:create()
    frame6:setImage("batch_ui/baipinzhi_kuang.png")
    frame6:setSize(cc.size(75,75))
    frame6:setAnchorPoint(cc.p(0.5,0.5))
    itme6:appendComponent(frame6)
    frame6:setPositionInContainer(cc.p(37.5,37.5))
    table_rank_reward_item["frame6"] = frame6

    local image6 = fc.FExtensionsImage:create()
    image6:setImage("batch_ui/baipinzhi_kuang.png")
    image6:setSize(cc.size(65,65))
    image6:setAnchorPoint(cc.p(0.5,0.5))
    itme6:appendComponent(image6)
    image6:setPositionInContainer(cc.p(37.5,37.5))
    table_rank_reward_item["image6"] = image6

    local textBg = fc.FExtensionsImage:create()
    textBg:setImage("batch_ui/shuruwenzi.png")
    textBg:setSize(cc.size(75,25))
    textBg:setAnchorPoint(cc.p(0.5,0.5))
    itme6:appendComponent(textBg)
    textBg:setPositionInContainer(cc.p(37.5,93.5))
    table_rank_reward_item["textBg"] = textBg

    local number6 = fc.FLabel:createBMFont()
    number6:setSize(cc.size(50,24))
    number6:setAnchorPoint(cc.p(0.5,0.5))
    number6:setFontSize(12)
    number6:setString("")
    number6:setColor(cc.c3b(0,255,255))
    itme6:appendComponent(number6)
    number6:setPositionInContainer(cc.p(46,60))
    table_rank_reward_item["number6"] = number6

    local name6 = fc.FLabel:createBMFont()
    name6:setSize(cc.size(75,24))
    name6:setAnchorPoint(cc.p(0.5,0.5))
    name6:setFontSize(15)
    name6:setString("")
    name6:setColor(cc.c3b(255,255,255))
    itme6:appendComponent(name6)
    name6:setPositionInContainer(cc.p(37.5,91))
    table_rank_reward_item["name6"] = name6

    local flag6 = fc.FExtensionsImage:create()
    flag6:setImage("batch_ui/hunpi_biaozhi.png")
    flag6:setSize(cc.size(32,48))
    flag6:setAnchorPoint(cc.p(0.5,0.5))
    itme6:appendComponent(flag6)
    flag6:setPositionInContainer(cc.p(64,24))
    table_rank_reward_item["flag6"] = flag6

    return table_rank_reward_item

end

