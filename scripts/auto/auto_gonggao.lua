function creategonggao()

    local table_gonggao = {}

    local gonggao = fc.FContainerPanel:create()
    gonggao:setSize(cc.size(960,640))
    table_gonggao["gonggao"] = gonggao

    local bg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/banzidikuangmeinv2_tongyong.png",cc.rect(1,1,2,2))
    bg:setSize(cc.size(760,440))
    bg:setAnchorPoint(cc.p(0.5,0.5))
    gonggao:appendComponent(bg)
    bg:setPositionInContainer(cc.p(480,379))
    table_gonggao["bg"] = bg

    local listBG = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongditu1_ciguan.png",cc.rect(1,1,1,1))
    listBG:setSize(cc.size(200,410))
    listBG:setAnchorPoint(cc.p(0.5,0.5))
    gonggao:appendComponent(listBG)
    listBG:setPositionInContainer(cc.p(210,390))
    table_gonggao["listBG"] = listBG

    local bgFrame = fc.FScale9Image:createWithBatchUIFrame("nobatch/benguanjiangli_kuang.png",cc.rect(100,113,4,4))
    bgFrame:setSize(cc.size(800,496))
    bgFrame:setAnchorPoint(cc.p(0.5,0.5))
    gonggao:appendComponent(bgFrame)
    bgFrame:setPositionInContainer(cc.p(480,364))
    table_gonggao["bgFrame"] = bgFrame

    local shengzhi = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shengzhi_ditu.png",cc.rect(40,63,4,4))
    shengzhi:setSize(cc.size(320,540))
    shengzhi:setAnchorPoint(cc.p(0.5,0.5))
    shengzhi:setRotation(90)
    gonggao:appendComponent(shengzhi)
    shengzhi:setPositionInContainer(cc.p(581,385))
    table_gonggao["shengzhi"] = shengzhi

    local zhou = fc.FExtensionsImage:create()
    zhou:setImage("nobatch/shengzhi_zhou.png")
    zhou:setSize(cc.size(39,420))
    zhou:setAnchorPoint(cc.p(0.5,0.5))
    gonggao:appendComponent(zhou)
    zhou:setPositionInContainer(cc.p(327.5,387))
    table_gonggao["zhou"] = zhou

    local zhou = fc.FExtensionsImage:create()
    zhou:setImage("nobatch/shengzhi_zhou.png")
    zhou:setSize(cc.size(39,420))
    zhou:setAnchorPoint(cc.p(0.5,0.5))
    gonggao:appendComponent(zhou)
    zhou:setPositionInContainer(cc.p(831.5,387))
    table_gonggao["zhou"] = zhou

    local upBg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/xingjikuang_tangquanxinggong.png",cc.rect(62,0,2,42))
    upBg:setSize(cc.size(460,42))
    upBg:setAnchorPoint(cc.p(0.5,0.5))
    upBg:setScaleY(-1)
    gonggao:appendComponent(upBg)
    upBg:setPositionInContainer(cc.p(579,206))
    table_gonggao["upBg"] = upBg

    local waipian_left_image = fc.FExtensionsImage:create()
    waipian_left_image:setImage("nobatch/title_3.png")
    waipian_left_image:setSize(cc.size(880,89))
    waipian_left_image:setAnchorPoint(cc.p(0.5,0.5))
    gonggao:appendComponent(waipian_left_image)
    waipian_left_image:setPositionInContainer(cc.p(480,122.5))
    table_gonggao["waipian_left_image"] = waipian_left_image

    local close = fc.FScaleButton:create()
    close:setSize(cc.size(41,45))
    close:setAnchorPoint(cc.p(0.5,0.5))
    close:setButtonImage("batch_ui/guanbi_anniu2.png")
    gonggao:appendComponent(close)
    close:setPositionInContainer(cc.p(839.5,126.5))
    table_gonggao["close"] = close

    local sideList = fc.FContainerList:create(1)
    sideList:setSize(cc.size(200,400))
    sideList:setAnchorPoint(cc.p(0.5,0.5))
    gonggao:appendComponent(sideList)
    sideList:setPositionInContainer(cc.p(210,386))
    table_gonggao["sideList"] = sideList

    local listFrame = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongbiankuang2_ciguan.png",cc.rect(43,15,2,2))
    listFrame:setSize(cc.size(200,405))
    listFrame:setAnchorPoint(cc.p(0.5,0.5))
    gonggao:appendComponent(listFrame)
    listFrame:setPositionInContainer(cc.p(210,386.5))
    table_gonggao["listFrame"] = listFrame

    local bottomBg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/xingjikuang_tangquanxinggong.png",cc.rect(62,0,2,42))
    bottomBg:setSize(cc.size(460,42))
    bottomBg:setAnchorPoint(cc.p(0.5,0.5))
    gonggao:appendComponent(bottomBg)
    bottomBg:setPositionInContainer(cc.p(579,566))
    table_gonggao["bottomBg"] = bottomBg

    local titlebg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongditu_huodong.png",cc.rect(2,2,3,3))
    titlebg:setSize(cc.size(300,40))
    titlebg:setAnchorPoint(cc.p(0.5,0.5))
    gonggao:appendComponent(titlebg)
    titlebg:setPositionInContainer(cc.p(579,249))
    table_gonggao["titlebg"] = titlebg

    local titleLabel = fc.FLabel:createSystemFont()
    titleLabel:setSize(cc.size(300,30))
    titleLabel:setAnchorPoint(cc.p(0.5,0.5))
    titleLabel:setFontSize(25)
    titleLabel:setString("aaaaaaaa")
    titleLabel:setColor(cc.c3b(255,0,0))
    gonggao:appendComponent(titleLabel)
    titleLabel:setPositionInContainer(cc.p(579,244))
    table_gonggao["titleLabel"] = titleLabel

    local zhao = fc.FExtensionsImage:create()
    zhao:setImage("batch_ui/zhao.png")
    zhao:setSize(cc.size(59,59))
    zhao:setRotation(340)
    zhao:setAnchorPoint(cc.p(0.5,0.5))
    gonggao:appendComponent(zhao)
    zhao:setPositionInContainer(cc.p(369.8,122.8))
    table_gonggao["zhao"] = zhao

    local gao = fc.FExtensionsImage:create()
    gao:setImage("batch_ui/gao.png")
    gao:setSize(cc.size(59,59))
    gao:setRotation(350)
    gao:setAnchorPoint(cc.p(0.5,0.5))
    gonggao:appendComponent(gao)
    gao:setPositionInContainer(cc.p(445.2,112.2))
    table_gonggao["gao"] = gao

    local xia = fc.FExtensionsImage:create()
    xia:setImage("batch_ui/xia.png")
    xia:setSize(cc.size(59,59))
    xia:setRotation(20)
    xia:setAnchorPoint(cc.p(0.5,0.5))
    gonggao:appendComponent(xia)
    xia:setPositionInContainer(cc.p(590.8,122.8))
    table_gonggao["xia"] = xia

    local tian = fc.FExtensionsImage:create()
    tian:setImage("batch_ui/tian2.png")
    tian:setSize(cc.size(59,59))
    tian:setRotation(10)
    tian:setAnchorPoint(cc.p(0.5,0.5))
    gonggao:appendComponent(tian)
    tian:setPositionInContainer(cc.p(516.2,110.2))
    table_gonggao["tian"] = tian

    return table_gonggao

end

