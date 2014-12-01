function createbingfaBg()

    local table_bingfaBg = {}

    local bingfaBg = fc.FContainerPanel:create()
    bingfaBg:setSize(cc.size(960,640))
    table_bingfaBg["bingfaBg"] = bingfaBg

    local bgLT = fc.FExtensionsImage:create()
    bgLT:setImage("nobatch/banzidikuang_tongyong.png")
    bgLT:setSize(cc.size(480,320))
    bgLT:setAnchorPoint(cc.p(0.5,0.5))
    bingfaBg:appendComponent(bgLT)
    bgLT:setPositionInContainer(cc.p(240,160))
    table_bingfaBg["bgLT"] = bgLT

    local bgLB = fc.FExtensionsImage:create()
    bgLB:setImage("nobatch/banzidikuang_tongyong.png")
    bgLB:setSize(cc.size(480,320))
    bgLB:setFlipType(4)
    bgLB:setAnchorPoint(cc.p(0.5,0.5))
    bingfaBg:appendComponent(bgLB)
    bgLB:setPositionInContainer(cc.p(240,480))
    table_bingfaBg["bgLB"] = bgLB

    local bgRT = fc.FExtensionsImage:create()
    bgRT:setImage("nobatch/banzidikuang_tongyong.png")
    bgRT:setSize(cc.size(480,320))
    bgRT:setFlipType(2)
    bgRT:setAnchorPoint(cc.p(0.5,0.5))
    bingfaBg:appendComponent(bgRT)
    bgRT:setPositionInContainer(cc.p(720,160))
    table_bingfaBg["bgRT"] = bgRT

    local bgRB = fc.FExtensionsImage:create()
    bgRB:setImage("nobatch/banzidikuang_tongyong.png")
    bgRB:setSize(cc.size(480,320))
    bgRB:setFlipType(8)
    bgRB:setAnchorPoint(cc.p(0.5,0.5))
    bingfaBg:appendComponent(bgRB)
    bgRB:setPositionInContainer(cc.p(720,480))
    table_bingfaBg["bgRB"] = bgRB

    local titleL = fc.FExtensionsImage:create()
    titleL:setImage("nobatch/title_mingchen_.png")
    titleL:setSize(cc.size(480,67))
    titleL:setAnchorPoint(cc.p(0.5,0.5))
    bingfaBg:appendComponent(titleL)
    titleL:setPositionInContainer(cc.p(240,33.5))
    table_bingfaBg["titleL"] = titleL

    local titleR = fc.FExtensionsImage:create()
    titleR:setImage("nobatch/title_mingchen_.png")
    titleR:setSize(cc.size(480,67))
    titleR:setFlipType(2)
    titleR:setAnchorPoint(cc.p(0.5,0.5))
    bingfaBg:appendComponent(titleR)
    titleR:setPositionInContainer(cc.p(720,33.5))
    table_bingfaBg["titleR"] = titleR

    local clothL = fc.FExtensionsImage:create()
    clothL:setImage("batch_ui/title_mingchen_2.png")
    clothL:setSize(cc.size(62,121))
    clothL:setAnchorPoint(cc.p(0.5,0.5))
    bingfaBg:appendComponent(clothL)
    clothL:setPositionInContainer(cc.p(31,60.5))
    table_bingfaBg["clothL"] = clothL

    local clothR = fc.FExtensionsImage:create()
    clothR:setImage("batch_ui/title_mingchen_2.png")
    clothR:setSize(cc.size(62,121))
    clothR:setFlipType(2)
    clothR:setAnchorPoint(cc.p(0.5,0.5))
    bingfaBg:appendComponent(clothR)
    clothR:setPositionInContainer(cc.p(929,60.5))
    table_bingfaBg["clothR"] = clothR

    local close = fc.FScaleButton:create()
    close:setSize(cc.size(52,52))
    close:setAnchorPoint(cc.p(0.5,0.5))
    close:setButtonImage("batch_ui/guanbi_up.png")
    bingfaBg:appendComponent(close)
    close:setPositionInContainer(cc.p(934,34))
    table_bingfaBg["close"] = close

    local btnBingFa = fc.FRadioButton:create()
    btnBingFa:setRadioButtonImage("batch_ui/qieyeanniu_down1.png","batch_ui/qieyeanniu_up1.png")
    btnBingFa:setSize(cc.size(159,45))
    btnBingFa:setAnchorPoint(cc.p(0.5,0.5))
    bingfaBg:appendComponent(btnBingFa)
    btnBingFa:setPositionInContainer(cc.p(391.5,37.5))
    table_bingfaBg["btnBingFa"] = btnBingFa

    local btnCanYe = fc.FRadioButton:create()
    btnCanYe:setRadioButtonImage("batch_ui/qieyeanniu_down1.png","batch_ui/qieyeanniu_up1.png")
    btnCanYe:setSize(cc.size(159,45))
    btnCanYe:setAnchorPoint(cc.p(0.5,0.5))
    bingfaBg:appendComponent(btnCanYe)
    btnCanYe:setPositionInContainer(cc.p(561.5,37.5))
    table_bingfaBg["btnCanYe"] = btnCanYe

    local labelBg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shuruwenzi.png",cc.rect(11,9,47,7))
    labelBg:setSize(cc.size(130,40))
    labelBg:setAnchorPoint(cc.p(0.5,0.5))
    bingfaBg:appendComponent(labelBg)
    labelBg:setPositionInContainer(cc.p(816,36))
    table_bingfaBg["labelBg"] = labelBg

    local labelJunling = fc.FLabel:createBMFont()
    labelJunling:setSize(cc.size(50,44))
    labelJunling:setAnchorPoint(cc.p(0.5,0.5))
    labelJunling:setFontSize(21)
    labelJunling:setString("军令：")
    labelJunling:setColor(cc.c3b(139,255,240))
    bingfaBg:appendComponent(labelJunling)
    labelJunling:setPositionInContainer(cc.p(783,33))
    table_bingfaBg["labelJunling"] = labelJunling

    local junLingValue = fc.FLabel:createBMFont()
    junLingValue:setSize(cc.size(50,44))
    junLingValue:setAnchorPoint(cc.p(0.5,0.5))
    junLingValue:setFontSize(21)
    junLingValue:setString("军令：")
    junLingValue:setColor(cc.c3b(139,255,240))
    bingfaBg:appendComponent(junLingValue)
    junLingValue:setPositionInContainer(cc.p(851,33))
    table_bingfaBg["junLingValue"] = junLingValue

    local shengji_label = fc.FContainerPanel:create()
    shengji_label:setSize(cc.size(300,30))
    shengji_label:setAnchorPoint(cc.p(0.5,0.5))
    bingfaBg:appendComponent(shengji_label)
    shengji_label:setPositionInContainer(cc.p(480,35))
    table_bingfaBg["shengji_label"] = shengji_label

    local bing1 = fc.FExtensionsImage:create()
    bing1:setImage("batch_ui/bing_2.png")
    bing1:setSize(cc.size(40,40))
    bing1:setAnchorPoint(cc.p(0.5,0.5))
    shengji_label:appendComponent(bing1)
    bing1:setPositionInContainer(cc.p(20,20))
    table_bingfaBg["bing1"] = bing1

    local fa1 = fc.FExtensionsImage:create()
    fa1:setImage("batch_ui/fa.png")
    fa1:setSize(cc.size(40,40))
    fa1:setAnchorPoint(cc.p(0.5,0.5))
    shengji_label:appendComponent(fa1)
    fa1:setPositionInContainer(cc.p(57,20))
    table_bingfaBg["fa1"] = fa1

    local sheng = fc.FExtensionsImage:create()
    sheng:setImage("batch_ui/sheng.png")
    sheng:setSize(cc.size(40,40))
    sheng:setAnchorPoint(cc.p(0.5,0.5))
    shengji_label:appendComponent(sheng)
    sheng:setPositionInContainer(cc.p(94,20))
    table_bingfaBg["sheng"] = sheng

    local ji = fc.FExtensionsImage:create()
    ji:setImage("batch_ui/ji.png")
    ji:setSize(cc.size(40,40))
    ji:setAnchorPoint(cc.p(0.5,0.5))
    shengji_label:appendComponent(ji)
    ji:setPositionInContainer(cc.p(131,20))
    table_bingfaBg["ji"] = ji

    local cai = fc.FExtensionsImage:create()
    cai:setImage("batch_ui/cai.png")
    cai:setSize(cc.size(40,40))
    cai:setAnchorPoint(cc.p(0.5,0.5))
    shengji_label:appendComponent(cai)
    cai:setPositionInContainer(cc.p(169,20))
    table_bingfaBg["cai"] = cai

    local liao = fc.FExtensionsImage:create()
    liao:setImage("batch_ui/liao.png")
    liao:setSize(cc.size(40,40))
    liao:setAnchorPoint(cc.p(0.5,0.5))
    shengji_label:appendComponent(liao)
    liao:setPositionInContainer(cc.p(206,20))
    table_bingfaBg["liao"] = liao

    local xuan = fc.FExtensionsImage:create()
    xuan:setImage("batch_ui/xuan.png")
    xuan:setSize(cc.size(40,40))
    xuan:setAnchorPoint(cc.p(0.5,0.5))
    shengji_label:appendComponent(xuan)
    xuan:setPositionInContainer(cc.p(243,20))
    table_bingfaBg["xuan"] = xuan

    local ze = fc.FExtensionsImage:create()
    ze:setImage("batch_ui/ze.png")
    ze:setSize(cc.size(40,40))
    ze:setAnchorPoint(cc.p(0.5,0.5))
    shengji_label:appendComponent(ze)
    ze:setPositionInContainer(cc.p(280,20))
    table_bingfaBg["ze"] = ze

    local chushou_label = fc.FContainerPanel:create()
    chushou_label:setSize(cc.size(350,30))
    chushou_label:setAnchorPoint(cc.p(0.5,0.5))
    bingfaBg:appendComponent(chushou_label)
    chushou_label:setPositionInContainer(cc.p(480,35))
    table_bingfaBg["chushou_label"] = chushou_label

    local bing1 = fc.FExtensionsImage:create()
    bing1:setImage("batch_ui/bing_2.png")
    bing1:setSize(cc.size(40,40))
    bing1:setAnchorPoint(cc.p(0.5,0.5))
    chushou_label:appendComponent(bing1)
    bing1:setPositionInContainer(cc.p(291,20))
    table_bingfaBg["bing1"] = bing1

    local fa1 = fc.FExtensionsImage:create()
    fa1:setImage("batch_ui/fa.png")
    fa1:setSize(cc.size(40,40))
    fa1:setAnchorPoint(cc.p(0.5,0.5))
    chushou_label:appendComponent(fa1)
    fa1:setPositionInContainer(cc.p(330,20))
    table_bingfaBg["fa1"] = fa1

    local qing = fc.FExtensionsImage:create()
    qing:setImage("batch_ui/qing_3.png")
    qing:setSize(cc.size(40,40))
    qing:setAnchorPoint(cc.p(0.5,0.5))
    chushou_label:appendComponent(qing)
    qing:setPositionInContainer(cc.p(20,20))
    table_bingfaBg["qing"] = qing

    local xuan = fc.FExtensionsImage:create()
    xuan:setImage("batch_ui/xuan.png")
    xuan:setSize(cc.size(40,40))
    xuan:setAnchorPoint(cc.p(0.5,0.5))
    chushou_label:appendComponent(xuan)
    xuan:setPositionInContainer(cc.p(59,20))
    table_bingfaBg["xuan"] = xuan

    local ze = fc.FExtensionsImage:create()
    ze:setImage("batch_ui/ze.png")
    ze:setSize(cc.size(40,40))
    ze:setAnchorPoint(cc.p(0.5,0.5))
    chushou_label:appendComponent(ze)
    ze:setPositionInContainer(cc.p(98,20))
    table_bingfaBg["ze"] = ze

    local yao = fc.FExtensionsImage:create()
    yao:setImage("batch_ui/yao.png")
    yao:setSize(cc.size(40,40))
    yao:setAnchorPoint(cc.p(0.5,0.5))
    chushou_label:appendComponent(yao)
    yao:setPositionInContainer(cc.p(136,20))
    table_bingfaBg["yao"] = yao

    local chu = fc.FExtensionsImage:create()
    chu:setImage("batch_ui/chu_3.png")
    chu:setSize(cc.size(40,40))
    chu:setAnchorPoint(cc.p(0.5,0.5))
    chushou_label:appendComponent(chu)
    chu:setPositionInContainer(cc.p(175,20))
    table_bingfaBg["chu"] = chu

    local shou = fc.FExtensionsImage:create()
    shou:setImage("batch_ui/shou_2.png")
    shou:setSize(cc.size(40,40))
    shou:setAnchorPoint(cc.p(0.5,0.5))
    chushou_label:appendComponent(shou)
    shou:setPositionInContainer(cc.p(214,20))
    table_bingfaBg["shou"] = shou

    local de = fc.FExtensionsImage:create()
    de:setImage("batch_ui/de.png")
    de:setSize(cc.size(40,40))
    de:setAnchorPoint(cc.p(0.5,0.5))
    chushou_label:appendComponent(de)
    de:setPositionInContainer(cc.p(252,20))
    table_bingfaBg["de"] = de

    local label_canye = fc.FContainerPanel:create()
    label_canye:setSize(cc.size(80,30))
    label_canye:setAnchorPoint(cc.p(0.5,0.5))
    bingfaBg:appendComponent(label_canye)
    label_canye:setPositionInContainer(cc.p(562,38))
    table_bingfaBg["label_canye"] = label_canye

    local can = fc.FExtensionsImage:create()
    can:setImage("batch_ui/can_uizi.png")
    can:setSize(cc.size(32,32))
    can:setAnchorPoint(cc.p(0.5,0.5))
    label_canye:appendComponent(can)
    can:setPositionInContainer(cc.p(16,16))
    table_bingfaBg["can"] = can

    local ye = fc.FExtensionsImage:create()
    ye:setImage("batch_ui/ye1_uizi.png")
    ye:setSize(cc.size(32,32))
    ye:setAnchorPoint(cc.p(0.5,0.5))
    label_canye:appendComponent(ye)
    ye:setPositionInContainer(cc.p(64,16))
    table_bingfaBg["ye"] = ye

    local label_bingfa = fc.FContainerPanel:create()
    label_bingfa:setSize(cc.size(80,30))
    label_bingfa:setAnchorPoint(cc.p(0.5,0.5))
    bingfaBg:appendComponent(label_bingfa)
    label_bingfa:setPositionInContainer(cc.p(392,38))
    table_bingfaBg["label_bingfa"] = label_bingfa

    local bing = fc.FExtensionsImage:create()
    bing:setImage("batch_ui/bing_uizi.png")
    bing:setSize(cc.size(32,32))
    bing:setAnchorPoint(cc.p(0.5,0.5))
    label_bingfa:appendComponent(bing)
    bing:setPositionInContainer(cc.p(16,16))
    table_bingfaBg["bing"] = bing

    local fa = fc.FExtensionsImage:create()
    fa:setImage("batch_ui/fa_uizi.png")
    fa:setSize(cc.size(32,32))
    fa:setAnchorPoint(cc.p(0.5,0.5))
    label_bingfa:appendComponent(fa)
    fa:setPositionInContainer(cc.p(64,16))
    table_bingfaBg["fa"] = fa

    return table_bingfaBg

end

