function createsellPopup()

    local table_sellPopup = {}

    local sellPopup = fc.FContainerPanel:create()
    sellPopup:setSize(cc.size(960,640))
    table_sellPopup["sellPopup"] = sellPopup

    local bglt = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shengzhi_ditu.png",cc.rect(40,63,4,4))
    bglt:setSize(cc.size(432,460))
    bglt:setAnchorPoint(cc.p(0.5,0.5))
    sellPopup:appendComponent(bglt)
    bglt:setPositionInContainer(cc.p(466,320))
    table_sellPopup["bglt"] = bglt

    local zhou = fc.FExtensionsImage:create()
    zhou:setImage("nobatch/shengzhi_zhou.png")
    zhou:setSize(cc.size(52,534))
    zhou:setRotation(90)
    zhou:setAnchorPoint(cc.p(0.5,0.5))
    sellPopup:appendComponent(zhou)
    zhou:setPositionInContainer(cc.p(466,96))
    table_sellPopup["zhou"] = zhou

    local zhou = fc.FExtensionsImage:create()
    zhou:setImage("nobatch/shengzhi_zhou.png")
    zhou:setSize(cc.size(52,534))
    zhou:setRotation(90)
    zhou:setAnchorPoint(cc.p(0.5,0.5))
    sellPopup:appendComponent(zhou)
    zhou:setPositionInContainer(cc.p(466,547))
    table_sellPopup["zhou"] = zhou

    local bg_rect1 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongditu2_huodong.png",cc.rect(1,1,1,1))
    bg_rect1:setSize(cc.size(384,407))
    bg_rect1:setAnchorPoint(cc.p(0.5,0.5))
    sellPopup:appendComponent(bg_rect1)
    bg_rect1:setPositionInContainer(cc.p(466,322.5))
    table_sellPopup["bg_rect1"] = bg_rect1

    local bg_rect2 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongbiankuang2_ciguan.png",cc.rect(44,15,1,1))
    bg_rect2:setSize(cc.size(384,407))
    bg_rect2:setAnchorPoint(cc.p(0.5,0.5))
    sellPopup:appendComponent(bg_rect2)
    bg_rect2:setPositionInContainer(cc.p(466,322.5))
    table_sellPopup["bg_rect2"] = bg_rect2

    local btn = fc.FScaleButton:create()
    btn:setSize(cc.size(144,53))
    btn:setAnchorPoint(cc.p(0.5,0.5))
    btn:setButtonImage("batch_ui/putonganniu1_up.png")
    sellPopup:appendComponent(btn)
    btn:setPositionInContainer(cc.p(364,448.5))
    table_sellPopup["btn"] = btn

    local que = fc.FExtensionsImage:create()
    que:setImage("batch_ui/que_uizi.png")
    que:setSize(cc.size(32,32))
    que:setAnchorPoint(cc.p(0.5,0.5))
    btn:appendComponent(que)
    que:setPositionInContainer(cc.p(43,26))
    table_sellPopup["que"] = que

    local ding = fc.FExtensionsImage:create()
    ding:setImage("batch_ui/ding_uizi.png")
    ding:setSize(cc.size(32,32))
    ding:setAnchorPoint(cc.p(0.5,0.5))
    btn:appendComponent(ding)
    ding:setPositionInContainer(cc.p(96,26))
    table_sellPopup["ding"] = ding

    local close = fc.FScaleButton:create()
    close:setSize(cc.size(144,53))
    close:setAnchorPoint(cc.p(0.5,0.5))
    close:setButtonImage("batch_ui/putonganniu1_up.png")
    sellPopup:appendComponent(close)
    close:setPositionInContainer(cc.p(568,448.5))
    table_sellPopup["close"] = close

    local qu = fc.FExtensionsImage:create()
    qu:setImage("batch_ui/qu_uizi.png")
    qu:setSize(cc.size(32,32))
    qu:setAnchorPoint(cc.p(0.5,0.5))
    close:appendComponent(qu)
    qu:setPositionInContainer(cc.p(48,26))
    table_sellPopup["qu"] = qu

    local xiao = fc.FExtensionsImage:create()
    xiao:setImage("batch_ui/xiao_uizi.png")
    xiao:setSize(cc.size(32,32))
    xiao:setAnchorPoint(cc.p(0.5,0.5))
    close:appendComponent(xiao)
    xiao:setPositionInContainer(cc.p(97,26))
    table_sellPopup["xiao"] = xiao

    local bg_title_bg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/xingjikuang_tangquanxinggong.png",cc.rect(72,0,2,29))
    bg_title_bg:setSize(cc.size(260,50))
    bg_title_bg:setAnchorPoint(cc.p(0.5,0.5))
    bg_title_bg:setRotation(180)
    sellPopup:appendComponent(bg_title_bg)
    bg_title_bg:setPositionInContainer(cc.p(470,96))
    table_sellPopup["bg_title_bg"] = bg_title_bg

    local label_bg_wenzi_di = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongditu_huodong.png",cc.rect(3,3,2,2))
    label_bg_wenzi_di:setSize(cc.size(375,196))
    label_bg_wenzi_di:setAnchorPoint(cc.p(0.5,0.5))
    sellPopup:appendComponent(label_bg_wenzi_di)
    label_bg_wenzi_di:setPositionInContainer(cc.p(465.5,278))
    table_sellPopup["label_bg_wenzi_di"] = label_bg_wenzi_di

    local label = fc.FLabel:createBMFont()
    label:setSize(cc.size(100,30))
    label:setAnchorPoint(cc.p(0.5,0.5))
    label:setFontSize(20)
    label:setString("")
    label:setColor(cc.c3b(0,0,0))
    sellPopup:appendComponent(label)
    label:setPositionInContainer(cc.p(470,206))
    table_sellPopup["label"] = label

    local yinliang = fc.FExtensionsImage:create()
    yinliang:setImage("batch_ui/yuanbao_da.png")
    yinliang:setSize(cc.size(58,43))
    yinliang:setAnchorPoint(cc.p(0.5,0.5))
    sellPopup:appendComponent(yinliang)
    yinliang:setPositionInContainer(cc.p(398,260.5))
    table_sellPopup["yinliang"] = yinliang

    local yinliang = fc.FExtensionsImage:create()
    yinliang:setImage("batch_ui/yuanbao_da.png")
    yinliang:setSize(cc.size(58,43))
    yinliang:setAnchorPoint(cc.p(0.5,0.5))
    sellPopup:appendComponent(yinliang)
    yinliang:setPositionInContainer(cc.p(404,278.5))
    table_sellPopup["yinliang"] = yinliang

    local downLabel = fc.FLabel:createBMFont()
    downLabel:setSize(cc.size(100,30))
    downLabel:setAnchorPoint(cc.p(0.5,0.5))
    downLabel:setFontSize(20)
    downLabel:setString("确定出售吗？")
    downLabel:setColor(cc.c3b(0,0,0))
    sellPopup:appendComponent(downLabel)
    downLabel:setPositionInContainer(cc.p(466,338))
    table_sellPopup["downLabel"] = downLabel

    local label_bg_di = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shuruwenzi.png",cc.rect(11,9,47,7))
    label_bg_di:setSize(cc.size(120,32))
    label_bg_di:setAnchorPoint(cc.p(0.5,0.5))
    sellPopup:appendComponent(label_bg_di)
    label_bg_di:setPositionInContainer(cc.p(509,266))
    table_sellPopup["label_bg_di"] = label_bg_di

    local number = fc.FLabel:createBMFont()
    number:setSize(cc.size(100,30))
    number:setAnchorPoint(cc.p(0.5,0.5))
    number:setFontSize(20)
    number:setString("")
    number:setColor(cc.c3b(0,0,0))
    sellPopup:appendComponent(number)
    number:setPositionInContainer(cc.p(508,265))
    table_sellPopup["number"] = number

    local chu = fc.FExtensionsImage:create()
    chu:setImage("batch_ui/chu1_uizi.png")
    chu:setSize(cc.size(32,32))
    chu:setAnchorPoint(cc.p(0.5,0.5))
    sellPopup:appendComponent(chu)
    chu:setPositionInContainer(cc.p(436,96))
    table_sellPopup["chu"] = chu

    local shou = fc.FExtensionsImage:create()
    shou:setImage("batch_ui/shou_uizi.png")
    shou:setSize(cc.size(32,32))
    shou:setAnchorPoint(cc.p(0.5,0.5))
    sellPopup:appendComponent(shou)
    shou:setPositionInContainer(cc.p(504,96))
    table_sellPopup["shou"] = shou

    return table_sellPopup

end

