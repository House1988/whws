function createmingchenjinjie()

    local table_mingchenjinjie = {}

    local mingchenjinjie = fc.FContainerPanel:create()
    mingchenjinjie:setSize(cc.size(960,640))
    table_mingchenjinjie["mingchenjinjie"] = mingchenjinjie

    local xiangqing_bg_image = fc.FScale9Image:createWithBatchUIFrame("batch_ui/ditu_lan.png",cc.rect(2,2,2,2))
    xiangqing_bg_image:setSize(cc.size(960,640))
    xiangqing_bg_image:setAnchorPoint(cc.p(0.5,0.5))
    mingchenjinjie:appendComponent(xiangqing_bg_image)
    xiangqing_bg_image:setPositionInContainer(cc.p(480,320))
    table_mingchenjinjie["xiangqing_bg_image"] = xiangqing_bg_image

    local xiangqing_biaotidiwen_image = fc.FExtensionsImage:create()
    xiangqing_biaotidiwen_image:setImage("nobatch/title_mingchen_.png")
    xiangqing_biaotidiwen_image:setSize(cc.size(483,67))
    xiangqing_biaotidiwen_image:setAnchorPoint(cc.p(0.5,0.5))
    mingchenjinjie:appendComponent(xiangqing_biaotidiwen_image)
    xiangqing_biaotidiwen_image:setPositionInContainer(cc.p(241.5,33.5))
    table_mingchenjinjie["xiangqing_biaotidiwen_image"] = xiangqing_biaotidiwen_image

    local xiangqing_biaotidiwen_image2 = fc.FExtensionsImage:create()
    xiangqing_biaotidiwen_image2:setImage("nobatch/title_mingchen_.png")
    xiangqing_biaotidiwen_image2:setSize(cc.size(483,67))
    xiangqing_biaotidiwen_image2:setFlipType(2)
    xiangqing_biaotidiwen_image2:setAnchorPoint(cc.p(0.5,0.5))
    mingchenjinjie:appendComponent(xiangqing_biaotidiwen_image2)
    xiangqing_biaotidiwen_image2:setPositionInContainer(cc.p(718.5,33.5))
    table_mingchenjinjie["xiangqing_biaotidiwen_image2"] = xiangqing_biaotidiwen_image2

    local diwen_left = fc.FExtensionsImage:create()
    diwen_left:setImage("nobatch/banzidikuang_tongyong.png")
    diwen_left:setSize(cc.size(220,163))
    diwen_left:setAnchorPoint(cc.p(0.5,0.5))
    mingchenjinjie:appendComponent(diwen_left)
    diwen_left:setPositionInContainer(cc.p(110,148.5))
    table_mingchenjinjie["diwen_left"] = diwen_left

    local diwen_right = fc.FExtensionsImage:create()
    diwen_right:setImage("nobatch/banzidikuang_tongyong.png")
    diwen_right:setSize(cc.size(220,163))
    diwen_right:setFlipType(2)
    diwen_right:setAnchorPoint(cc.p(0.5,0.5))
    mingchenjinjie:appendComponent(diwen_right)
    diwen_right:setPositionInContainer(cc.p(850,149.5))
    table_mingchenjinjie["diwen_right"] = diwen_right

    local diwen_leftbottom = fc.FExtensionsImage:create()
    diwen_leftbottom:setImage("nobatch/banzidikuang_tongyong.png")
    diwen_leftbottom:setSize(cc.size(220,163))
    diwen_leftbottom:setFlipType(4)
    diwen_leftbottom:setAnchorPoint(cc.p(0.5,0.5))
    mingchenjinjie:appendComponent(diwen_leftbottom)
    diwen_leftbottom:setPositionInContainer(cc.p(110,558.5))
    table_mingchenjinjie["diwen_leftbottom"] = diwen_leftbottom

    local diwen_rightbottom = fc.FExtensionsImage:create()
    diwen_rightbottom:setImage("nobatch/banzidikuang_tongyong.png")
    diwen_rightbottom:setSize(cc.size(220,163))
    diwen_rightbottom:setFlipType(8)
    diwen_rightbottom:setAnchorPoint(cc.p(0.5,0.5))
    mingchenjinjie:appendComponent(diwen_rightbottom)
    diwen_rightbottom:setPositionInContainer(cc.p(850,558.5))
    table_mingchenjinjie["diwen_rightbottom"] = diwen_rightbottom

    local lian_left = fc.FExtensionsImage:create()
    lian_left:setImage("batch_ui/title_mingchen_2.png")
    lian_left:setSize(cc.size(62,121))
    lian_left:setAnchorPoint(cc.p(0.5,0.5))
    mingchenjinjie:appendComponent(lian_left)
    lian_left:setPositionInContainer(cc.p(31,60.5))
    table_mingchenjinjie["lian_left"] = lian_left

    local lian_right = fc.FExtensionsImage:create()
    lian_right:setImage("batch_ui/title_mingchen_2.png")
    lian_right:setSize(cc.size(62,121))
    lian_right:setFlipType(2)
    lian_right:setAnchorPoint(cc.p(0.5,0.5))
    mingchenjinjie:appendComponent(lian_right)
    lian_right:setPositionInContainer(cc.p(929,60.5))
    table_mingchenjinjie["lian_right"] = lian_right

    local xiangqing_close_button = fc.FScaleButton:create()
    xiangqing_close_button:setSize(cc.size(52,52))
    xiangqing_close_button:setAnchorPoint(cc.p(0.5,0.5))
    xiangqing_close_button:setButtonImage("batch_ui/guanbi_up.png")
    mingchenjinjie:appendComponent(xiangqing_close_button)
    xiangqing_close_button:setPositionInContainer(cc.p(934,32))
    table_mingchenjinjie["xiangqing_close_button"] = xiangqing_close_button

    local yellowBg1 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongditu1_ciguan.png",cc.rect(1,1,1,1))
    yellowBg1:setSize(cc.size(160,50))
    yellowBg1:setAnchorPoint(cc.p(0.5,0.5))
    mingchenjinjie:appendComponent(yellowBg1)
    yellowBg1:setPositionInContainer(cc.p(386,145))
    table_mingchenjinjie["yellowBg1"] = yellowBg1

    local yellowBg2 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongditu2_ciguan.png",cc.rect(1,1,2,2))
    yellowBg2:setSize(cc.size(160,130))
    yellowBg2:setAnchorPoint(cc.p(0.5,0.5))
    mingchenjinjie:appendComponent(yellowBg2)
    yellowBg2:setPositionInContainer(cc.p(386,235))
    table_mingchenjinjie["yellowBg2"] = yellowBg2

    local yellowBg1 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongditu1_ciguan.png",cc.rect(1,1,1,1))
    yellowBg1:setSize(cc.size(160,50))
    yellowBg1:setAnchorPoint(cc.p(0.5,0.5))
    mingchenjinjie:appendComponent(yellowBg1)
    yellowBg1:setPositionInContainer(cc.p(571,145))
    table_mingchenjinjie["yellowBg1"] = yellowBg1

    local yellowBg2 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongditu2_ciguan.png",cc.rect(1,1,2,2))
    yellowBg2:setSize(cc.size(160,130))
    yellowBg2:setAnchorPoint(cc.p(0.5,0.5))
    mingchenjinjie:appendComponent(yellowBg2)
    yellowBg2:setPositionInContainer(cc.p(571,235))
    table_mingchenjinjie["yellowBg2"] = yellowBg2

    local labelCiguan1 = fc.FLabel:createBMFont()
    labelCiguan1:setSize(cc.size(100,38))
    labelCiguan1:setAnchorPoint(cc.p(0.5,0.5))
    labelCiguan1:setFontSize(32)
    if LANGUAGE_TYPE == 3 then
    	labelCiguan1:setString("賜官前")
    else	
    	labelCiguan1:setString("赐官前")
    end	
    labelCiguan1:setColor(cc.c3b(125,1,1))
    mingchenjinjie:appendComponent(labelCiguan1)
    labelCiguan1:setPositionInContainer(cc.p(386,143))
    table_mingchenjinjie["labelCiguan1"] = labelCiguan1

    local labelCiguan2 = fc.FLabel:createBMFont()
    labelCiguan2:setSize(cc.size(100,38))
    labelCiguan2:setAnchorPoint(cc.p(0.5,0.5))
    labelCiguan2:setFontSize(32)
    if LANGUAGE_TYPE == 3 then
    	 labelCiguan2:setString("賜官後")
    else
    	 labelCiguan2:setString("赐官后")
    end
    labelCiguan2:setColor(cc.c3b(125,1,1))
    mingchenjinjie:appendComponent(labelCiguan2)
    labelCiguan2:setPositionInContainer(cc.p(572,143))
    table_mingchenjinjie["labelCiguan2"] = labelCiguan2

    local attack = fc.FLabel:createBMFont()
    attack:setSize(cc.size(50,44))
    attack:setAnchorPoint(cc.p(0.5,0.5))
    attack:setFontSize(20)
    attack:setString("攻击：")
    attack:setColor(cc.c3b(125,1,1))
    mingchenjinjie:appendComponent(attack)
    attack:setPositionInContainer(cc.p(341,192))
    table_mingchenjinjie["attack"] = attack

    local def = fc.FLabel:createBMFont()
    def:setSize(cc.size(50,44))
    def:setAnchorPoint(cc.p(0.5,0.5))
    def:setFontSize(20)
    def:setString("防御：")
    def:setColor(cc.c3b(125,1,1))
    mingchenjinjie:appendComponent(def)
    def:setPositionInContainer(cc.p(341,224))
    table_mingchenjinjie["def"] = def

    local attack = fc.FLabel:createBMFont()
    attack:setSize(cc.size(50,44))
    attack:setAnchorPoint(cc.p(0.5,0.5))
    attack:setFontSize(20)
    attack:setString("攻击：")
    attack:setColor(cc.c3b(125,1,1))
    mingchenjinjie:appendComponent(attack)
    attack:setPositionInContainer(cc.p(527,193))
    table_mingchenjinjie["attack"] = attack

    local def = fc.FLabel:createBMFont()
    def:setSize(cc.size(50,44))
    def:setAnchorPoint(cc.p(0.5,0.5))
    def:setFontSize(20)
    def:setString("防御：")
    def:setColor(cc.c3b(125,1,1))
    mingchenjinjie:appendComponent(def)
    def:setPositionInContainer(cc.p(527,225))
    table_mingchenjinjie["def"] = def

    local textbg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shuruwenzi.png",cc.rect(11,9,47,7))
    textbg:setSize(cc.size(80,30))
    textbg:setAnchorPoint(cc.p(0.5,0.5))
    mingchenjinjie:appendComponent(textbg)
    textbg:setPositionInContainer(cc.p(416,192))
    table_mingchenjinjie["textbg"] = textbg

    local textbg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shuruwenzi.png",cc.rect(11,9,47,7))
    textbg:setSize(cc.size(80,30))
    textbg:setAnchorPoint(cc.p(0.5,0.5))
    mingchenjinjie:appendComponent(textbg)
    textbg:setPositionInContainer(cc.p(416,227))
    table_mingchenjinjie["textbg"] = textbg

    local textbg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shuruwenzi.png",cc.rect(11,9,47,7))
    textbg:setSize(cc.size(80,30))
    textbg:setAnchorPoint(cc.p(0.5,0.5))
    mingchenjinjie:appendComponent(textbg)
    textbg:setPositionInContainer(cc.p(602,192))
    table_mingchenjinjie["textbg"] = textbg

    local textbg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shuruwenzi.png",cc.rect(11,9,47,7))
    textbg:setSize(cc.size(80,30))
    textbg:setAnchorPoint(cc.p(0.5,0.5))
    mingchenjinjie:appendComponent(textbg)
    textbg:setPositionInContainer(cc.p(602,226))
    table_mingchenjinjie["textbg"] = textbg

    local upInsideBg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongbiankuang2_ciguan.png",cc.rect(43,15,2,2))
    upInsideBg:setSize(cc.size(160,180))
    upInsideBg:setAnchorPoint(cc.p(0.5,0.5))
    mingchenjinjie:appendComponent(upInsideBg)
    upInsideBg:setPositionInContainer(cc.p(386,210))
    table_mingchenjinjie["upInsideBg"] = upInsideBg

    local upInsideBg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongbiankuang2_ciguan.png",cc.rect(43,15,2,2))
    upInsideBg:setSize(cc.size(160,180))
    upInsideBg:setAnchorPoint(cc.p(0.5,0.5))
    mingchenjinjie:appendComponent(upInsideBg)
    upInsideBg:setPositionInContainer(cc.p(571,210))
    table_mingchenjinjie["upInsideBg"] = upInsideBg

    local btn = fc.FScaleButton:create()
    btn:setSize(cc.size(144,53))
    btn:setAnchorPoint(cc.p(0.5,0.5))
    btn:setButtonImage("batch_ui/putonganniu1_up.png")
    mingchenjinjie:appendComponent(btn)
    btn:setPositionInContainer(cc.p(479,558.5))
    table_mingchenjinjie["btn"] = btn

    local ci = fc.FExtensionsImage:create()
    ci:setImage("batch_ui/ci_uizi.png")
    ci:setSize(cc.size(32,32))
    ci:setAnchorPoint(cc.p(0.5,0.5))
    btn:appendComponent(ci)
    ci:setPositionInContainer(cc.p(40,26))
    table_mingchenjinjie["ci"] = ci

    local guan = fc.FExtensionsImage:create()
    guan:setImage("batch_ui/guan1_uizi.png")
    guan:setSize(cc.size(32,32))
    guan:setAnchorPoint(cc.p(0.5,0.5))
    btn:appendComponent(guan)
    guan:setPositionInContainer(cc.p(104,26))
    table_mingchenjinjie["guan"] = guan

    local arrow = fc.FExtensionsImage:create()
    arrow:setImage("batch_ui/jiantou_ciguan.png")
    arrow:setSize(cc.size(36,26))
    arrow:setAnchorPoint(cc.p(0.5,0.5))
    mingchenjinjie:appendComponent(arrow)
    arrow:setPositionInContainer(cc.p(478,218))
    table_mingchenjinjie["arrow"] = arrow

    local itempanel1 = fc.FContainerPanel:create()
    itempanel1:setSize(cc.size(104,165))
    itempanel1:setAnchorPoint(cc.p(0.5,0.5))
    mingchenjinjie:appendComponent(itempanel1)
    itempanel1:setPositionInContainer(cc.p(359,444))
    table_mingchenjinjie["itempanel1"] = itempanel1

    local frame1 = fc.FExtensionsImage:create()
    frame1:setImage("batch_ui/baipinzhi_kuang.png")
    frame1:setSize(cc.size(104,104))
    frame1:setAnchorPoint(cc.p(0.5,0.5))
    itempanel1:appendComponent(frame1)
    frame1:setPositionInContainer(cc.p(52,83))
    table_mingchenjinjie["frame1"] = frame1

    local item1 = fc.FExtensionsImage:create()
    item1:setAnchorPoint(cc.p(0.5,0.5))
    itempanel1:appendComponent(item1)
    item1:setPositionInContainer(cc.p(52,83))
    table_mingchenjinjie["item1"] = item1

    local textBg2 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shuruwenzi.png",cc.rect(11,9,47,7))
    textBg2:setSize(cc.size(100,30))
    textBg2:setAnchorPoint(cc.p(0.5,0.5))
    itempanel1:appendComponent(textBg2)
    textBg2:setPositionInContainer(cc.p(52,150))
    table_mingchenjinjie["textBg2"] = textBg2

    local number1 = fc.FLabel:createBMFont()
    number1:setSize(cc.size(80,20))
    number1:setAnchorPoint(cc.p(0.5,0.5))
    number1:setFontSize(20)
    number1:setString("")
    number1:setColor(cc.c3b(139,255,240))
    itempanel1:appendComponent(number1)
    number1:setPositionInContainer(cc.p(52,149))
    table_mingchenjinjie["number1"] = number1

    local nameLine = fc.FScale9Image:createWithBatchUIFrame("batch_ui/zuhemingchengdikuang.png",cc.rect(12,12,2,2))
    nameLine:setSize(cc.size(104,28))
    nameLine:setAnchorPoint(cc.p(0.5,0.5))
    itempanel1:appendComponent(nameLine)
    nameLine:setPositionInContainer(cc.p(52,14))
    table_mingchenjinjie["nameLine"] = nameLine

    local itmeName1 = fc.FLabel:createBMFont()
    itmeName1:setSize(cc.size(100,20))
    itmeName1:setAnchorPoint(cc.p(0.5,0.5))
    itmeName1:setFontSize(20)
    itmeName1:setString("")
    itmeName1:setColor(cc.c3b(252,237,202))
    itempanel1:appendComponent(itmeName1)
    itmeName1:setPositionInContainer(cc.p(52,9))
    table_mingchenjinjie["itmeName1"] = itmeName1

    local itempanel2 = fc.FContainerPanel:create()
    itempanel2:setSize(cc.size(104,165))
    itempanel2:setAnchorPoint(cc.p(0.5,0.5))
    mingchenjinjie:appendComponent(itempanel2)
    itempanel2:setPositionInContainer(cc.p(479,445))
    table_mingchenjinjie["itempanel2"] = itempanel2

    local nameLine = fc.FScale9Image:createWithBatchUIFrame("batch_ui/zuhemingchengdikuang.png",cc.rect(12,12,2,2))
    nameLine:setSize(cc.size(104,28))
    nameLine:setAnchorPoint(cc.p(0.5,0.5))
    itempanel2:appendComponent(nameLine)
    nameLine:setPositionInContainer(cc.p(52,14))
    table_mingchenjinjie["nameLine"] = nameLine

    local textBg2 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shuruwenzi.png",cc.rect(11,9,47,7))
    textBg2:setSize(cc.size(100,30))
    textBg2:setAnchorPoint(cc.p(0.5,0.5))
    itempanel2:appendComponent(textBg2)
    textBg2:setPositionInContainer(cc.p(52,153))
    table_mingchenjinjie["textBg2"] = textBg2

    local frame2 = fc.FExtensionsImage:create()
    frame2:setImage("batch_ui/baipinzhi_kuang.png")
    frame2:setSize(cc.size(104,104))
    frame2:setAnchorPoint(cc.p(0.5,0.5))
    itempanel2:appendComponent(frame2)
    frame2:setPositionInContainer(cc.p(52,83))
    table_mingchenjinjie["frame2"] = frame2

    local item2 = fc.FExtensionsImage:create()
    item2:setAnchorPoint(cc.p(0.5,0.5))
    itempanel2:appendComponent(item2)
    item2:setPositionInContainer(cc.p(52,83))
    table_mingchenjinjie["item2"] = item2

    local itmeName2 = fc.FLabel:createBMFont()
    itmeName2:setSize(cc.size(100,20))
    itmeName2:setAnchorPoint(cc.p(0.5,0.5))
    itmeName2:setFontSize(20)
    itmeName2:setString("")
    itmeName2:setColor(cc.c3b(252,237,202))
    itempanel2:appendComponent(itmeName2)
    itmeName2:setPositionInContainer(cc.p(52,10))
    table_mingchenjinjie["itmeName2"] = itmeName2

    local number2 = fc.FLabel:createBMFont()
    number2:setSize(cc.size(80,20))
    number2:setAnchorPoint(cc.p(0.5,0.5))
    number2:setFontSize(20)
    number2:setString("")
    number2:setColor(cc.c3b(139,255,240))
    itempanel2:appendComponent(number2)
    number2:setPositionInContainer(cc.p(52,148))
    table_mingchenjinjie["number2"] = number2

    local itempanel3 = fc.FContainerPanel:create()
    itempanel3:setSize(cc.size(104,165))
    itempanel3:setAnchorPoint(cc.p(0.5,0.5))
    mingchenjinjie:appendComponent(itempanel3)
    itempanel3:setPositionInContainer(cc.p(599,445))
    table_mingchenjinjie["itempanel3"] = itempanel3

    local nameLine = fc.FScale9Image:createWithBatchUIFrame("batch_ui/zuhemingchengdikuang.png",cc.rect(12,12,2,2))
    nameLine:setSize(cc.size(104,28))
    nameLine:setAnchorPoint(cc.p(0.5,0.5))
    itempanel3:appendComponent(nameLine)
    nameLine:setPositionInContainer(cc.p(52,14))
    table_mingchenjinjie["nameLine"] = nameLine

    local textBg2 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shuruwenzi.png",cc.rect(11,9,47,7))
    textBg2:setSize(cc.size(100,30))
    textBg2:setAnchorPoint(cc.p(0.5,0.5))
    itempanel3:appendComponent(textBg2)
    textBg2:setPositionInContainer(cc.p(52,153))
    table_mingchenjinjie["textBg2"] = textBg2

    local frame3 = fc.FExtensionsImage:create()
    frame3:setImage("batch_ui/baipinzhi_kuang.png")
    frame3:setSize(cc.size(104,104))
    frame3:setAnchorPoint(cc.p(0.5,0.5))
    itempanel3:appendComponent(frame3)
    frame3:setPositionInContainer(cc.p(52,83))
    table_mingchenjinjie["frame3"] = frame3

    local item3 = fc.FExtensionsImage:create()
    item3:setAnchorPoint(cc.p(0.5,0.5))
    itempanel3:appendComponent(item3)
    item3:setPositionInContainer(cc.p(52,83))
    table_mingchenjinjie["item3"] = item3

    local itmeName3 = fc.FLabel:createBMFont()
    itmeName3:setSize(cc.size(100,20))
    itmeName3:setAnchorPoint(cc.p(0.5,0.5))
    itmeName3:setFontSize(20)
    itmeName3:setString("")
    itmeName3:setColor(cc.c3b(252,237,202))
    itempanel3:appendComponent(itmeName3)
    itmeName3:setPositionInContainer(cc.p(52,10))
    table_mingchenjinjie["itmeName3"] = itmeName3

    local number3 = fc.FLabel:createBMFont()
    number3:setSize(cc.size(80,20))
    number3:setAnchorPoint(cc.p(0.5,0.5))
    number3:setFontSize(20)
    number3:setString("")
    number3:setColor(cc.c3b(139,255,240))
    itempanel3:appendComponent(number3)
    number3:setPositionInContainer(cc.p(52,148))
    table_mingchenjinjie["number3"] = number3

    local unlock = fc.FLabel:createBMFont()
    unlock:setSize(cc.size(140,20))
    unlock:setWidth(150)
    unlock:setAnchorPoint(cc.p(0.5,0.5))
    unlock:setFontSize(20)
    unlock:setString("消 耗")
    unlock:setColor(cc.c3b(206,53,0))
    mingchenjinjie:appendComponent(unlock)
    unlock:setPositionInContainer(cc.p(570,263))
    table_mingchenjinjie["unlock"] = unlock

    local title = fc.FContainerPanel:create()
    title:setSize(cc.size(180,30))
    title:setAnchorPoint(cc.p(0.5,0.5))
    mingchenjinjie:appendComponent(title)
    title:setPositionInContainer(cc.p(479,33))
    table_mingchenjinjie["title"] = title

    local ci = fc.FExtensionsImage:create()
    ci:setImage("batch_ui/ci.png")
    ci:setSize(cc.size(40,40))
    ci:setAnchorPoint(cc.p(0.5,0.5))
    title:appendComponent(ci)
    ci:setPositionInContainer(cc.p(20,20))
    table_mingchenjinjie["ci"] = ci

    local guan = fc.FExtensionsImage:create()
    guan:setImage("batch_ui/guan.png")
    guan:setSize(cc.size(40,40))
    guan:setAnchorPoint(cc.p(0.5,0.5))
    title:appendComponent(guan)
    guan:setPositionInContainer(cc.p(160,20))
    table_mingchenjinjie["guan"] = guan

    local attText1 = fc.FLabel:createBMFont()
    attText1:setSize(cc.size(50,44))
    attText1:setAnchorPoint(cc.p(0.5,0.5))
    attText1:setFontSize(20)
    attText1:setString("攻击：")
    attText1:setColor(cc.c3b(139,255,240))
    mingchenjinjie:appendComponent(attText1)
    attText1:setPositionInContainer(cc.p(416,191))
    table_mingchenjinjie["attText1"] = attText1

    local defText1 = fc.FLabel:createBMFont()
    defText1:setSize(cc.size(50,44))
    defText1:setAnchorPoint(cc.p(0.5,0.5))
    defText1:setFontSize(20)
    defText1:setString("攻击：")
    defText1:setColor(cc.c3b(139,255,240))
    mingchenjinjie:appendComponent(defText1)
    defText1:setPositionInContainer(cc.p(416,226))
    table_mingchenjinjie["defText1"] = defText1

    local attText2 = fc.FLabel:createBMFont()
    attText2:setSize(cc.size(50,44))
    attText2:setAnchorPoint(cc.p(0.5,0.5))
    attText2:setFontSize(20)
    attText2:setString("攻击：")
    attText2:setColor(cc.c3b(139,255,240))
    mingchenjinjie:appendComponent(attText2)
    attText2:setPositionInContainer(cc.p(601,191))
    table_mingchenjinjie["attText2"] = attText2

    local defText2 = fc.FLabel:createBMFont()
    defText2:setSize(cc.size(50,44))
    defText2:setAnchorPoint(cc.p(0.5,0.5))
    defText2:setFontSize(20)
    defText2:setString("攻击：")
    defText2:setColor(cc.c3b(139,255,240))
    mingchenjinjie:appendComponent(defText2)
    defText2:setPositionInContainer(cc.p(601,226))
    table_mingchenjinjie["defText2"] = defText2

    local yinliangBG = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shuruwenzi.png",cc.rect(11,9,47,7))
    yinliangBG:setSize(cc.size(180,40))
    yinliangBG:setAnchorPoint(cc.p(0.5,0.5))
    mingchenjinjie:appendComponent(yinliangBG)
    yinliangBG:setPositionInContainer(cc.p(802,34))
    table_mingchenjinjie["yinliangBG"] = yinliangBG

    local yinliang = fc.FExtensionsImage:create()
    yinliang:setImage("batch_ui/yinliangDouble.png")
    yinliang:setSize(cc.size(54,42))
    yinliang:setAnchorPoint(cc.p(0.5,0.5))
    mingchenjinjie:appendComponent(yinliang)
    yinliang:setPositionInContainer(cc.p(745,34))
    table_mingchenjinjie["yinliang"] = yinliang

    local yinliangNumber = fc.FLabel:createBMFont()
    yinliangNumber:setSize(cc.size(70,30))
    yinliangNumber:setAnchorPoint(cc.p(0.5,0.5))
    yinliangNumber:setFontSize(21)
    yinliangNumber:setString("9999")
    yinliangNumber:setColor(cc.c3b(250,255,165))
    mingchenjinjie:appendComponent(yinliangNumber)
    yinliangNumber:setPositionInContainer(cc.p(832,34))
    table_mingchenjinjie["yinliangNumber"] = yinliangNumber

    local topBg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/zongjiachengdikuang_paibingbuzhen.png",cc.rect(62,0,2,29))
    topBg:setSize(cc.size(400,50))
    topBg:setAnchorPoint(cc.p(0.5,0.5))
    topBg:setScaleY(-1)
    mingchenjinjie:appendComponent(topBg)
    topBg:setPositionInContainer(cc.p(479,92))
    table_mingchenjinjie["topBg"] = topBg

    local topBg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/zongjiachengdikuang_paibingbuzhen.png",cc.rect(62,0,2,29))
    topBg:setSize(cc.size(400,50))
    topBg:setAnchorPoint(cc.p(0.5,0.5))
    topBg:setScaleY(-1)
    mingchenjinjie:appendComponent(topBg)
    topBg:setPositionInContainer(cc.p(479,331))
    table_mingchenjinjie["topBg"] = topBg

    local xiaohao = fc.FLabel:createBMFont()
    xiaohao:setSize(cc.size(100,20))
    xiaohao:setAnchorPoint(cc.p(0.5,0.5))
    xiaohao:setFontSize(20)
    xiaohao:setString("消 耗")
    xiaohao:setColor(cc.c3b(250,255,165))
    mingchenjinjie:appendComponent(xiaohao)
    xiaohao:setPositionInContainer(cc.p(479,326))
    table_mingchenjinjie["xiaohao"] = xiaohao

    local xiaoguo = fc.FLabel:createBMFont()
    xiaoguo:setSize(cc.size(100,20))
    xiaoguo:setAnchorPoint(cc.p(0.5,0.5))
    xiaoguo:setFontSize(20)
    xiaoguo:setString("晋升效果")
    xiaoguo:setColor(cc.c3b(250,255,165))
    mingchenjinjie:appendComponent(xiaoguo)
    xiaoguo:setPositionInContainer(cc.p(479,85))
    table_mingchenjinjie["xiaoguo"] = xiaoguo

    local bottomFrame = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongbiankuang3_ciguan.png",cc.rect(40,0,2,13))
    bottomFrame:setSize(cc.size(400,13))
    bottomFrame:setAnchorPoint(cc.p(0.5,0.5))
    mingchenjinjie:appendComponent(bottomFrame)
    bottomFrame:setPositionInContainer(cc.p(479,596.5))
    table_mingchenjinjie["bottomFrame"] = bottomFrame

    return table_mingchenjinjie

end

