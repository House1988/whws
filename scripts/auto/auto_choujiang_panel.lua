function createchoujiang_panel()

    local table_choujiang_panel = {}

    local choujiang_panel = fc.FContainerPanel:create()
    choujiang_panel:setSize(cc.size(960,640))
    table_choujiang_panel["choujiang_panel"] = choujiang_panel

    local listBg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongdikuang1.png",cc.rect(25,25,4,4))
    listBg:setSize(cc.size(254,300))
    listBg:setAnchorPoint(cc.p(0.5,0.5))
    choujiang_panel:appendComponent(listBg)
    listBg:setPositionInContainer(cc.p(803,386))
    table_choujiang_panel["listBg"] = listBg

    local bar = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongbiankuang3_ciguan.png",cc.rect(40,0,2,13))
    bar:setSize(cc.size(906,13))
    bar:setAnchorPoint(cc.p(0.5,0.5))
    bar:setScaleY(-1)
    choujiang_panel:appendComponent(bar)
    bar:setPositionInContainer(cc.p(480,536.5))
    table_choujiang_panel["bar"] = bar

    local fr_bg2 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongbiankuang_ciguan.png",cc.rect(11,11,3,3))
    fr_bg2:setSize(cc.size(906,470))
    fr_bg2:setAnchorPoint(cc.p(0.5,0.5))
    choujiang_panel:appendComponent(fr_bg2)
    fr_bg2:setPositionInContainer(cc.p(480,400))
    table_choujiang_panel["fr_bg2"] = fr_bg2

    local fr_eave = fc.FScale9Image:createWithBatchUIFrame("nobatch/biankuang3_chongzhiyouli.png",cc.rect(122,0,65,361))
    fr_eave:setSize(cc.size(960,361))
    fr_eave:setAnchorPoint(cc.p(0.5,0.5))
    choujiang_panel:appendComponent(fr_eave)
    fr_eave:setPositionInContainer(cc.p(480,314.5))
    table_choujiang_panel["fr_eave"] = fr_eave

    local fr_countdown_lbl = fc.FLabel:createBMFont()
    fr_countdown_lbl:setSize(cc.size(350,25))
    fr_countdown_lbl:setAnchorPoint(cc.p(0.5,0.5))
    fr_countdown_lbl:setFontSize(20)
    fr_countdown_lbl:setString("活动倒计时：活动已结束")
    fr_countdown_lbl:setColor(cc.c3b(250,255,165))
    choujiang_panel:appendComponent(fr_countdown_lbl)
    fr_countdown_lbl:setPositionInContainer(cc.p(266,206.5))
    table_choujiang_panel["fr_countdown_lbl"] = fr_countdown_lbl

    local leiji_label = fc.FLabel:createBMFont()
    leiji_label:setSize(cc.size(200,25))
    leiji_label:setAnchorPoint(cc.p(0.5,0.5))
    leiji_label:setFontSize(20)
    leiji_label:setString("活动期间已累计充值0元")
    leiji_label:setColor(cc.c3b(250,255,165))
    choujiang_panel:appendComponent(leiji_label)
    leiji_label:setPositionInContainer(cc.p(567,206.5))
    table_choujiang_panel["leiji_label"] = leiji_label

    local jifen_label = fc.FLabel:createBMFont()
    jifen_label:setSize(cc.size(200,50))
    jifen_label:setAnchorPoint(cc.p(0.5,0.5))
    jifen_label:setFontSize(20)
    jifen_label:setString("活动期间已累计充值0元")
    jifen_label:setColor(cc.c3b(250,255,165))
    choujiang_panel:appendComponent(jifen_label)
    jifen_label:setPositionInContainer(cc.p(789,207))
    table_choujiang_panel["jifen_label"] = jifen_label

    local conLT = fc.FExtensionsImage:create()
    conLT:setImage("batch_ui/tongyongbiankuang4_tangquanxinggong.png")
    conLT:setSize(cc.size(25,27))
    conLT:setFlipType(2)
    conLT:setAnchorPoint(cc.p(0.5,0.5))
    choujiang_panel:appendComponent(conLT)
    conLT:setPositionInContainer(cc.p(691.5,249.5))
    table_choujiang_panel["conLT"] = conLT

    local conRT = fc.FExtensionsImage:create()
    conRT:setImage("batch_ui/tongyongbiankuang4_tangquanxinggong.png")
    conRT:setSize(cc.size(25,27))
    conRT:setAnchorPoint(cc.p(0.5,0.5))
    choujiang_panel:appendComponent(conRT)
    conRT:setPositionInContainer(cc.p(661.5,249.5))
    table_choujiang_panel["conRT"] = conRT

    local conRB = fc.FExtensionsImage:create()
    conRB:setImage("batch_ui/tongyongbiankuang4_tangquanxinggong.png")
    conRB:setSize(cc.size(25,27))
    conRB:setFlipType(4)
    conRB:setAnchorPoint(cc.p(0.5,0.5))
    choujiang_panel:appendComponent(conRB)
    conRB:setPositionInContainer(cc.p(661.5,522.5))
    table_choujiang_panel["conRB"] = conRB

    local conLB = fc.FExtensionsImage:create()
    conLB:setImage("batch_ui/tongyongbiankuang4_tangquanxinggong.png")
    conLB:setSize(cc.size(25,27))
    conLB:setFlipType(8)
    conLB:setAnchorPoint(cc.p(0.5,0.5))
    choujiang_panel:appendComponent(conLB)
    conLB:setPositionInContainer(cc.p(691.5,522.5))
    table_choujiang_panel["conLB"] = conLB

    local side_bar = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tangquanxinggongbar_tangquanxinggong.png",cc.rect(0,56,25,2))
    side_bar:setSize(cc.size(25,300))
    side_bar:setAnchorPoint(cc.p(0.5,0.5))
    choujiang_panel:appendComponent(side_bar)
    side_bar:setPositionInContainer(cc.p(676.5,386))
    table_choujiang_panel["side_bar"] = side_bar

    local btnRankReward = fc.FScaleButton:create()
    btnRankReward:setSize(cc.size(144,53))
    btnRankReward:setAnchorPoint(cc.p(0.5,0.5))
    btnRankReward:setButtonImage("batch_ui/putonganniu1_up.png")
    choujiang_panel:appendComponent(btnRankReward)
    btnRankReward:setPositionInContainer(cc.p(801,352.5))
    table_choujiang_panel["btnRankReward"] = btnRankReward

    local li = fc.FShaderExtensionsImage:create(0)
    li:setAnchorPoint(cc.p(0.5,0.5))
    li:setImage("batch_ui/li3_uizi.png")
    li:setSize(cc.size(32,32))
    btnRankReward:appendComponent(li)
    li:setPositionInContainer(cc.p(110,25))
    table_choujiang_panel["li"] = li

    local hang = fc.FShaderExtensionsImage:create(0)
    hang:setAnchorPoint(cc.p(0.5,0.5))
    hang:setImage("batch_ui/xing_uizi.png")
    hang:setSize(cc.size(32,32))
    btnRankReward:appendComponent(hang)
    hang:setPositionInContainer(cc.p(60,25))
    table_choujiang_panel["hang"] = hang

    local jiang = fc.FShaderExtensionsImage:create(0)
    jiang:setAnchorPoint(cc.p(0.5,0.5))
    jiang:setImage("batch_ui/jiang2_uizi.png")
    jiang:setSize(cc.size(32,32))
    btnRankReward:appendComponent(jiang)
    jiang:setPositionInContainer(cc.p(85,26))
    table_choujiang_panel["jiang"] = jiang

    local pai = fc.FShaderExtensionsImage:create(0)
    pai:setAnchorPoint(cc.p(0.5,0.5))
    pai:setImage("batch_ui/pai_uizi.png")
    pai:setSize(cc.size(32,32))
    btnRankReward:appendComponent(pai)
    pai:setPositionInContainer(cc.p(33,26))
    table_choujiang_panel["pai"] = pai

    local btnRank = fc.FScaleButton:create()
    btnRank:setSize(cc.size(144,53))
    btnRank:setAnchorPoint(cc.p(0.5,0.5))
    btnRank:setButtonImage("batch_ui/putonganniu1_up.png")
    choujiang_panel:appendComponent(btnRank)
    btnRank:setPositionInContainer(cc.p(801,287.5))
    table_choujiang_panel["btnRank"] = btnRank

    local ji = fc.FShaderExtensionsImage:create(0)
    ji:setAnchorPoint(cc.p(0.5,0.5))
    ji:setImage("batch_ui/ji_uizi (2).png")
    ji:setSize(cc.size(32,32))
    btnRank:appendComponent(ji)
    ji:setPositionInContainer(cc.p(32,26))
    table_choujiang_panel["ji"] = ji

    local fen = fc.FShaderExtensionsImage:create(0)
    fen:setAnchorPoint(cc.p(0.5,0.5))
    fen:setImage("batch_ui/fen_uizi.png")
    fen:setSize(cc.size(32,32))
    btnRank:appendComponent(fen)
    fen:setPositionInContainer(cc.p(58,26))
    table_choujiang_panel["fen"] = fen

    local pai = fc.FShaderExtensionsImage:create(0)
    pai:setAnchorPoint(cc.p(0.5,0.5))
    pai:setImage("batch_ui/pai_uizi.png")
    pai:setSize(cc.size(32,32))
    btnRank:appendComponent(pai)
    pai:setPositionInContainer(cc.p(84,26))
    table_choujiang_panel["pai"] = pai

    local hang = fc.FShaderExtensionsImage:create(0)
    hang:setAnchorPoint(cc.p(0.5,0.5))
    hang:setImage("batch_ui/xing_uizi.png")
    hang:setSize(cc.size(32,32))
    btnRank:appendComponent(hang)
    hang:setPositionInContainer(cc.p(111,25))
    table_choujiang_panel["hang"] = hang

    local btnShop = fc.FScaleButton:create()
    btnShop:setSize(cc.size(144,53))
    btnShop:setAnchorPoint(cc.p(0.5,0.5))
    btnShop:setButtonImage("batch_ui/putonganniu1_up.png")
    choujiang_panel:appendComponent(btnShop)
    btnShop:setPositionInContainer(cc.p(801,481.5))
    table_choujiang_panel["btnShop"] = btnShop

    local ji = fc.FShaderExtensionsImage:create(0)
    ji:setAnchorPoint(cc.p(0.5,0.5))
    ji:setImage("batch_ui/ji_uizi (2).png")
    ji:setSize(cc.size(32,32))
    btnShop:appendComponent(ji)
    ji:setPositionInContainer(cc.p(34,26))
    table_choujiang_panel["ji"] = ji

    local fen = fc.FShaderExtensionsImage:create(0)
    fen:setAnchorPoint(cc.p(0.5,0.5))
    fen:setImage("batch_ui/fen_uizi.png")
    fen:setSize(cc.size(32,32))
    btnShop:appendComponent(fen)
    fen:setPositionInContainer(cc.p(60,26))
    table_choujiang_panel["fen"] = fen

    local shang = fc.FShaderExtensionsImage:create(0)
    shang:setAnchorPoint(cc.p(0.5,0.5))
    shang:setImage("batch_ui/shang_uizi (2).png")
    shang:setSize(cc.size(32,32))
    btnShop:appendComponent(shang)
    shang:setPositionInContainer(cc.p(86,26))
    table_choujiang_panel["shang"] = shang

    local dian = fc.FShaderExtensionsImage:create(0)
    dian:setAnchorPoint(cc.p(0.5,0.5))
    dian:setImage("batch_ui/dian_uizi (2).png")
    dian:setSize(cc.size(32,32))
    btnShop:appendComponent(dian)
    dian:setPositionInContainer(cc.p(112,26))
    table_choujiang_panel["dian"] = dian

    local btnReward = fc.FScaleButton:create()
    btnReward:setSize(cc.size(144,53))
    btnReward:setAnchorPoint(cc.p(0.5,0.5))
    btnReward:setButtonImage("batch_ui/putonganniu1_up.png")
    choujiang_panel:appendComponent(btnReward)
    btnReward:setPositionInContainer(cc.p(801,416.5))
    table_choujiang_panel["btnReward"] = btnReward

    local jiang = fc.FShaderExtensionsImage:create(0)
    jiang:setAnchorPoint(cc.p(0.5,0.5))
    jiang:setImage("batch_ui/jiang2_uizi.png")
    jiang:setSize(cc.size(32,32))
    btnReward:appendComponent(jiang)
    jiang:setPositionInContainer(cc.p(33,26))
    table_choujiang_panel["jiang"] = jiang

    local li = fc.FShaderExtensionsImage:create(0)
    li:setAnchorPoint(cc.p(0.5,0.5))
    li:setImage("batch_ui/li3_uizi.png")
    li:setSize(cc.size(32,32))
    btnReward:appendComponent(li)
    li:setPositionInContainer(cc.p(59,26))
    table_choujiang_panel["li"] = li

    local yu = fc.FShaderExtensionsImage:create(0)
    yu:setAnchorPoint(cc.p(0.5,0.5))
    yu:setImage("batch_ui/yu_uizi (2).png")
    yu:setSize(cc.size(32,32))
    btnReward:appendComponent(yu)
    yu:setPositionInContainer(cc.p(85,26))
    table_choujiang_panel["yu"] = yu

    local lan = fc.FShaderExtensionsImage:create(0)
    lan:setAnchorPoint(cc.p(0.5,0.5))
    lan:setImage("batch_ui/lan_uizi.png")
    lan:setSize(cc.size(32,32))
    btnReward:appendComponent(lan)
    lan:setPositionInContainer(cc.p(111,27))
    table_choujiang_panel["lan"] = lan

    local des = fc.FLabel:createBMFont()
    des:setSize(cc.size(850,50))
    des:setWidth(850)
    des:setAnchorPoint(cc.p(0.5,0.5))
    des:setFontSize(20)
    
    local strTT = g_game.g_dictConfigManager:getLanTextById(36)
    des:setString(strTT)
    des:setColor(cc.c3b(255,255,0))
    choujiang_panel:appendComponent(des)
    des:setPositionInContainer(cc.p(480,581))
    table_choujiang_panel["des"] = des

    local imageTime1 = fc.FExtensionsImage:create()
    imageTime1:setImage("nobatch/minglushuangshou_choukayicianniu.png")
    imageTime1:setSize(cc.size(218,245))
    imageTime1:setAnchorPoint(cc.p(0.5,0.5))
    choujiang_panel:appendComponent(imageTime1)
    imageTime1:setPositionInContainer(cc.p(212,369.5))
    table_choujiang_panel["imageTime1"] = imageTime1

    local imageTime10 = fc.FExtensionsImage:create()
    imageTime10:setImage("batch_ui/minglushuangshou_choukashicianniu.png")
    imageTime10:setSize(cc.size(218,245))
    imageTime10:setAnchorPoint(cc.p(0.5,0.5))
    choujiang_panel:appendComponent(imageTime10)
    imageTime10:setPositionInContainer(cc.p(496,369.5))
    table_choujiang_panel["imageTime10"] = imageTime10

    local xiaohao = fc.FLabel:createBMFont()
    xiaohao:setSize(cc.size(100,25))
    xiaohao:setAnchorPoint(cc.p(0.5,0.5))
    xiaohao:setFontSize(20)
    xiaohao:setString("消耗")
    xiaohao:setColor(cc.c3b(255,255,255))
    choujiang_panel:appendComponent(xiaohao)
    xiaohao:setPositionInContainer(cc.p(144,507.5))
    table_choujiang_panel["xiaohao"] = xiaohao

    local xiaohao = fc.FLabel:createBMFont()
    xiaohao:setSize(cc.size(100,25))
    xiaohao:setAnchorPoint(cc.p(0.5,0.5))
    xiaohao:setFontSize(20)
    xiaohao:setString("消耗")
    xiaohao:setColor(cc.c3b(255,255,255))
    choujiang_panel:appendComponent(xiaohao)
    xiaohao:setPositionInContainer(cc.p(426,507.5))
    table_choujiang_panel["xiaohao"] = xiaohao

    local yuanbao = fc.FExtensionsImage:create()
    yuanbao:setImage("batch_ui/yuanbao.png")
    yuanbao:setSize(cc.size(50,35))
    yuanbao:setAnchorPoint(cc.p(0.5,0.5))
    choujiang_panel:appendComponent(yuanbao)
    yuanbao:setPositionInContainer(cc.p(193,510.5))
    table_choujiang_panel["yuanbao"] = yuanbao

    local yuanbao = fc.FExtensionsImage:create()
    yuanbao:setImage("batch_ui/yuanbao.png")
    yuanbao:setSize(cc.size(50,35))
    yuanbao:setAnchorPoint(cc.p(0.5,0.5))
    choujiang_panel:appendComponent(yuanbao)
    yuanbao:setPositionInContainer(cc.p(476,512.5))
    table_choujiang_panel["yuanbao"] = yuanbao

    local text_bg = fc.FExtensionsImage:create()
    text_bg:setImage("batch_ui/shuruwenzi.png")
    text_bg:setSize(cc.size(100,30))
    text_bg:setAnchorPoint(cc.p(0.5,0.5))
    choujiang_panel:appendComponent(text_bg)
    text_bg:setPositionInContainer(cc.p(268,510))
    table_choujiang_panel["text_bg"] = text_bg

    local text_bg = fc.FExtensionsImage:create()
    text_bg:setImage("batch_ui/shuruwenzi.png")
    text_bg:setSize(cc.size(100,30))
    text_bg:setAnchorPoint(cc.p(0.5,0.5))
    choujiang_panel:appendComponent(text_bg)
    text_bg:setPositionInContainer(cc.p(552,510))
    table_choujiang_panel["text_bg"] = text_bg

    local number1 = fc.FLabel:createBMFont()
    number1:setSize(cc.size(100,25))
    number1:setAnchorPoint(cc.p(0.5,0.5))
    number1:setFontSize(20)
    number1:setString("消耗")
    number1:setColor(cc.c3b(0,255,255))
    choujiang_panel:appendComponent(number1)
    number1:setPositionInContainer(cc.p(268,506.5))
    table_choujiang_panel["number1"] = number1

    local number10 = fc.FLabel:createBMFont()
    number10:setSize(cc.size(100,25))
    number10:setAnchorPoint(cc.p(0.5,0.5))
    number10:setFontSize(20)
    number10:setString("消耗")
    number10:setColor(cc.c3b(0,255,255))
    choujiang_panel:appendComponent(number10)
    number10:setPositionInContainer(cc.p(552,507.5))
    table_choujiang_panel["number10"] = number10

    local btn1 = fc.FContainerPanel:create()
    btn1:setSize(cc.size(218,245))
    btn1:setAnchorPoint(cc.p(0.5,0.5))
    choujiang_panel:appendComponent(btn1)
    btn1:setPositionInContainer(cc.p(212,369.5))
    table_choujiang_panel["btn1"] = btn1

    local btn10 = fc.FContainerPanel:create()
    btn10:setSize(cc.size(218,245))
    btn10:setAnchorPoint(cc.p(0.5,0.5))
    choujiang_panel:appendComponent(btn10)
    btn10:setPositionInContainer(cc.p(496,369.5))
    table_choujiang_panel["btn10"] = btn10

    local des1 = fc.FLabel:createBMFont()
    des1:setSize(cc.size(100,25))
    des1:setAnchorPoint(cc.p(0.5,0.5))
    des1:setFontSize(20)
    des1:setString("抽卡一次")
    des1:setColor(cc.c3b(255,255,255))
    choujiang_panel:appendComponent(des1)
    des1:setPositionInContainer(cc.p(212,428.5))
    table_choujiang_panel["des1"] = des1

    local des10 = fc.FLabel:createBMFont()
    des10:setSize(cc.size(100,25))
    des10:setAnchorPoint(cc.p(0.5,0.5))
    des10:setFontSize(20)
    des10:setString("抽卡10次，必得4")
    des10:setColor(cc.c3b(255,255,255))
    choujiang_panel:appendComponent(des10)
    des10:setPositionInContainer(cc.p(492,428.5))
    table_choujiang_panel["des10"] = des10

    local star = fc.FExtensionsImage:create()
    star:setImage("batch_ui/xingxing.png")
    star:setSize(cc.size(20,19))
    star:setAnchorPoint(cc.p(0.5,0.5))
    choujiang_panel:appendComponent(star)
    star:setPositionInContainer(cc.p(579,431.5))
    table_choujiang_panel["star"] = star

    return table_choujiang_panel

end

