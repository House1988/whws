function createmingChenJinJieCard()

    local table_mingChenJinJieCard = {}

    local mingChenJinJieCard = fc.FContainerPanel:create()
    mingChenJinJieCard:setSize(cc.size(280,536))
    table_mingChenJinJieCard["mingChenJinJieCard"] = mingChenJinJieCard

    local bg = fc.FExtensionsImage:create()
    bg:setImage("nobatch/diwen1_paibingbuzhen.png")
    bg:setSize(cc.size(270,410))
    bg:setAnchorPoint(cc.p(0.5,0.5))
    mingChenJinJieCard:appendComponent(bg)
    bg:setPositionInContainer(cc.p(140,233))
    table_mingChenJinJieCard["bg"] = bg

    local bottomBg = fc.FExtensionsImage:create()
    bottomBg:setImage("batch_ui/tuopan1_paibingbuzhen.png")
    bottomBg:setSize(cc.size(270,125))
    bottomBg:setAnchorPoint(cc.p(0.5,0.5))
    mingChenJinJieCard:appendComponent(bottomBg)
    bottomBg:setPositionInContainer(cc.p(140,473.5))
    table_mingChenJinJieCard["bottomBg"] = bottomBg

    local image = fc.FExtensionsImage:create()
    image:setAnchorPoint(cc.p(0.5,0.5))
    mingChenJinJieCard:appendComponent(image)
    image:setPositionInContainer(cc.p(139.5,229))
    table_mingChenJinJieCard["image"] = image

    local starBg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/zongjiachengdikuang_paibingbuzhen.png",cc.rect(62,0,2,29))
    starBg:setSize(cc.size(260,29))
    starBg:setAnchorPoint(cc.p(0.5,0.5))
    starBg:setScaleY(-1)
    mingChenJinJieCard:appendComponent(starBg)
    starBg:setPositionInContainer(cc.p(140,408.5))
    table_mingChenJinJieCard["starBg"] = starBg

    local star1 = fc.FExtensionsImage:create()
    star1:setImage("batch_ui/xingxing.png")
    star1:setSize(cc.size(25,27))
    star1:setAnchorPoint(cc.p(0.5,0.5))
    mingChenJinJieCard:appendComponent(star1)
    star1:setPositionInContainer(cc.p(70.5,408.5))
    table_mingChenJinJieCard["star1"] = star1

    local star2 = fc.FExtensionsImage:create()
    star2:setImage("batch_ui/xingxing.png")
    star2:setSize(cc.size(25,27))
    star2:setAnchorPoint(cc.p(0.5,0.5))
    mingChenJinJieCard:appendComponent(star2)
    star2:setPositionInContainer(cc.p(105.5,408.5))
    table_mingChenJinJieCard["star2"] = star2

    local star3 = fc.FExtensionsImage:create()
    star3:setImage("batch_ui/xingxing.png")
    star3:setSize(cc.size(25,27))
    star3:setAnchorPoint(cc.p(0.5,0.5))
    mingChenJinJieCard:appendComponent(star3)
    star3:setPositionInContainer(cc.p(140.5,408.5))
    table_mingChenJinJieCard["star3"] = star3

    local star4 = fc.FExtensionsImage:create()
    star4:setImage("batch_ui/xingxing.png")
    star4:setSize(cc.size(25,27))
    star4:setAnchorPoint(cc.p(0.5,0.5))
    mingChenJinJieCard:appendComponent(star4)
    star4:setPositionInContainer(cc.p(174.5,408.5))
    table_mingChenJinJieCard["star4"] = star4

    local star5 = fc.FExtensionsImage:create()
    star5:setImage("batch_ui/xingxing.png")
    star5:setSize(cc.size(25,27))
    star5:setAnchorPoint(cc.p(0.5,0.5))
    mingChenJinJieCard:appendComponent(star5)
    star5:setPositionInContainer(cc.p(209.5,408.5))
    table_mingChenJinJieCard["star5"] = star5

    local name = fc.FLabel:createBMFont()
    name:setSize(cc.size(50,44))
    name:setAnchorPoint(cc.p(0.5,0.5))
    name:setFontSize(20)
    name:setString("姓名：")
    name:setColor(cc.c3b(250,255,165))
    mingChenJinJieCard:appendComponent(name)
    name:setPositionInContainer(cc.p(83,460))
    table_mingChenJinJieCard["name"] = name

    local level = fc.FLabel:createBMFont()
    level:setSize(cc.size(50,44))
    level:setAnchorPoint(cc.p(0.5,0.5))
    level:setFontSize(20)
    if LANGUAGE_TYPE == 3 then
    	level:setString("等級：")
    else
    	level:setString("等级：")
    end
    level:setColor(cc.c3b(250,255,165))
    mingChenJinJieCard:appendComponent(level)
    level:setPositionInContainer(cc.p(83,492))
    table_mingChenJinJieCard["level"] = level

    local nameText = fc.FLabel:createBMFont()
    nameText:setSize(cc.size(50,44))
    nameText:setAnchorPoint(cc.p(0.5,0.5))
    nameText:setFontSize(20)
 	nameText:setString("姓名：")
    nameText:setColor(cc.c3b(250,255,165))
    mingChenJinJieCard:appendComponent(nameText)
    nameText:setPositionInContainer(cc.p(182,460))
    table_mingChenJinJieCard["nameText"] = nameText

    local levelText = fc.FLabel:createBMFont()
    levelText:setSize(cc.size(50,44))
    levelText:setAnchorPoint(cc.p(0.5,0.5))
    levelText:setFontSize(20)
    levelText:setString("姓名：")
    levelText:setColor(cc.c3b(250,255,165))
    mingChenJinJieCard:appendComponent(levelText)
    levelText:setPositionInContainer(cc.p(182,492))
    table_mingChenJinJieCard["levelText"] = levelText

    local xq_kapaikuang_scale9 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/xingjikuang_paibingbuzhen.png",cc.rect(62,0,2,42))
    xq_kapaikuang_scale9:setSize(cc.size(270,42))
    xq_kapaikuang_scale9:setAnchorPoint(cc.p(0.5,0.5))
    mingChenJinJieCard:appendComponent(xq_kapaikuang_scale9)
    xq_kapaikuang_scale9:setPositionInContainer(cc.p(140,21))
    table_mingChenJinJieCard["xq_kapaikuang_scale9"] = xq_kapaikuang_scale9

    local bottomBar = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongbiankuang3_ciguan.png",cc.rect(40,0,2,13))
    bottomBar:setSize(cc.size(250,13))
    bottomBar:setAnchorPoint(cc.p(0.5,0.5))
    mingChenJinJieCard:appendComponent(bottomBar)
    bottomBar:setPositionInContainer(cc.p(140,529.5))
    table_mingChenJinJieCard["bottomBar"] = bottomBar

    local outFrame = fc.FScale9Image:createWithBatchUIFrame("batch_ui/paibingbuzhenbar_paibingbuzhen.png",cc.rect(0,56,25,2))
    outFrame:setSize(cc.size(25,536))
    outFrame:setAnchorPoint(cc.p(0.5,0.5))
    mingChenJinJieCard:appendComponent(outFrame)
    outFrame:setPositionInContainer(cc.p(7.5,268))
    table_mingChenJinJieCard["outFrame"] = outFrame

    local outFrame = fc.FScale9Image:createWithBatchUIFrame("batch_ui/paibingbuzhenbar_paibingbuzhen.png",cc.rect(0,56,25,2))
    outFrame:setSize(cc.size(25,536))
    outFrame:setAnchorPoint(cc.p(0.5,0.5))
    mingChenJinJieCard:appendComponent(outFrame)
    outFrame:setPositionInContainer(cc.p(272.5,268))
    table_mingChenJinJieCard["outFrame"] = outFrame

    local zi1 = fc.FExtensionsImage:create()
    zi1:setImage("batch_ui/cheng_uizi (2).png")
    zi1:setSize(cc.size(32,32))
    zi1:setAnchorPoint(cc.p(0.5,0.5))
    mingChenJinJieCard:appendComponent(zi1)
    zi1:setPositionInContainer(cc.p(108,20))
    table_mingChenJinJieCard["zi1"] = zi1

    local zi2 = fc.FExtensionsImage:create()
    zi2:setImage("batch_ui/cheng_uizi (2).png")
    zi2:setSize(cc.size(32,32))
    zi2:setAnchorPoint(cc.p(0.5,0.5))
    mingChenJinJieCard:appendComponent(zi2)
    zi2:setPositionInContainer(cc.p(140,20))
    table_mingChenJinJieCard["zi2"] = zi2

    local zi3 = fc.FExtensionsImage:create()
    zi3:setImage("batch_ui/cheng_uizi (2).png")
    zi3:setSize(cc.size(32,32))
    zi3:setAnchorPoint(cc.p(0.5,0.5))
    mingChenJinJieCard:appendComponent(zi3)
    zi3:setPositionInContainer(cc.p(172,20))
    table_mingChenJinJieCard["zi3"] = zi3

    return table_mingChenJinJieCard

end

