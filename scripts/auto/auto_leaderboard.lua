function createleaderboard()

    local table_leaderboard = {}

    local leaderboard = fc.FContainerPanel:create()
    leaderboard:setSize(cc.size(960,640))
    table_leaderboard["leaderboard"] = leaderboard

    local zhou_bg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shengzhi_ditu.png",cc.rect(40,63,4,4))
    zhou_bg:setSize(cc.size(520,900))
    zhou_bg:setAnchorPoint(cc.p(0.5,0.5))
    zhou_bg:setRotation(90)
    leaderboard:appendComponent(zhou_bg)
    zhou_bg:setPositionInContainer(cc.p(480,320))
    table_leaderboard["zhou_bg"] = zhou_bg

    local bg2 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongditu2_ciguan.png",cc.rect(1,1,2,2))
    bg2:setSize(cc.size(880,510))
    bg2:setAnchorPoint(cc.p(0.5,0.5))
    leaderboard:appendComponent(bg2)
    bg2:setPositionInContainer(cc.p(480,320))
    table_leaderboard["bg2"] = bg2

    local zhou = fc.FExtensionsImage:create()
    zhou:setImage("nobatch/shengzhi_zhou.png")
    zhou:setSize(cc.size(55,620))
    zhou:setAnchorPoint(cc.p(0.5,0.5))
    leaderboard:appendComponent(zhou)
    zhou:setPositionInContainer(cc.p(27.5,320))
    table_leaderboard["zhou"] = zhou

    local zhou = fc.FExtensionsImage:create()
    zhou:setImage("nobatch/shengzhi_zhou.png")
    zhou:setSize(cc.size(55,620))
    zhou:setAnchorPoint(cc.p(0.5,0.5))
    leaderboard:appendComponent(zhou)
    zhou:setPositionInContainer(cc.p(932.5,320))
    table_leaderboard["zhou"] = zhou

    local btnPvplb = fc.FRadioButton:create()
    btnPvplb:setRadioButtonImage("batch_ui/qieyeanniu_down1.png","batch_ui/qieyeanniu_up1.png")
    btnPvplb:setSize(cc.size(159,45))
    btnPvplb:setAnchorPoint(cc.p(0.5,0.5))
    leaderboard:appendComponent(btnPvplb)
    btnPvplb:setPositionInContainer(cc.p(147.5,87.5))
    table_leaderboard["btnPvplb"] = btnPvplb

    local title = fc.FScale9Image:createWithBatchUIFrame("batch_ui/zongjiachengdikuang_tangquanxinggong.png",cc.rect(62,0,2,29))
    title:setSize(cc.size(350,43))
    title:setAnchorPoint(cc.p(0.5,0.5))
    leaderboard:appendComponent(title)
    title:setPositionInContainer(cc.p(480,38.5))
    table_leaderboard["title"] = title

    local di = fc.FExtensionsImage:create()
    di:setImage("batch_ui/di (2).png")
    di:setSize(cc.size(59,59))
    di:setAnchorPoint(cc.p(0.5,0.5))
    leaderboard:appendComponent(di)
    di:setPositionInContainer(cc.p(412.5,29.5))
    table_leaderboard["di"] = di

    local wang = fc.FExtensionsImage:create()
    wang:setImage("batch_ui/wang.png")
    wang:setSize(cc.size(59,59))
    wang:setAnchorPoint(cc.p(0.5,0.5))
    leaderboard:appendComponent(wang)
    wang:setPositionInContainer(cc.p(479.5,29.5))
    table_leaderboard["wang"] = wang

    local bang1 = fc.FExtensionsImage:create()
    bang1:setImage("batch_ui/bang.png")
    bang1:setSize(cc.size(59,59))
    bang1:setAnchorPoint(cc.p(0.5,0.5))
    leaderboard:appendComponent(bang1)
    bang1:setPositionInContainer(cc.p(545.5,29.5))
    table_leaderboard["bang1"] = bang1

    local close = fc.FScaleButton:create()
    close:setSize(cc.size(41,45))
    close:setAnchorPoint(cc.p(0.5,0.5))
    close:setButtonImage("batch_ui/guanbi_anniu2.png")
    leaderboard:appendComponent(close)
    close:setPositionInContainer(cc.p(931.5,52.5))
    table_leaderboard["close"] = close

    local ba = fc.FExtensionsImage:create()
    ba:setImage("batch_ui/ba_uizi.png")
    ba:setSize(cc.size(32,32))
    ba:setAnchorPoint(cc.p(0.5,0.5))
    leaderboard:appendComponent(ba)
    ba:setPositionInContainer(cc.p(113,87))
    table_leaderboard["ba"] = ba

    local ye = fc.FExtensionsImage:create()
    ye:setImage("batch_ui/ye_uizi.png")
    ye:setSize(cc.size(32,32))
    ye:setAnchorPoint(cc.p(0.5,0.5))
    leaderboard:appendComponent(ye)
    ye:setPositionInContainer(cc.p(147,87))
    table_leaderboard["ye"] = ye

    local bang = fc.FExtensionsImage:create()
    bang:setImage("batch_ui/bang_uizi.png")
    bang:setSize(cc.size(32,32))
    bang:setAnchorPoint(cc.p(0.5,0.5))
    leaderboard:appendComponent(bang)
    bang:setPositionInContainer(cc.p(181,87))
    table_leaderboard["bang"] = bang

    local btnLevelRank = fc.FRadioButton:create()
    btnLevelRank:setRadioButtonImage("batch_ui/qieyeanniu_down1.png","batch_ui/qieyeanniu_up1.png")
    btnLevelRank:setSize(cc.size(159,45))
    btnLevelRank:setAnchorPoint(cc.p(0.5,0.5))
    leaderboard:appendComponent(btnLevelRank)
    btnLevelRank:setPositionInContainer(cc.p(323.5,87.5))
    table_leaderboard["btnLevelRank"] = btnLevelRank

    local zheng = fc.FExtensionsImage:create()
    zheng:setImage("batch_ui/zeng_uizi.png")
    zheng:setSize(cc.size(32,32))
    zheng:setAnchorPoint(cc.p(0.5,0.5))
    leaderboard:appendComponent(zheng)
    zheng:setPositionInContainer(cc.p(290,88))
    table_leaderboard["zheng"] = zheng

    local zhan = fc.FExtensionsImage:create()
    zhan:setImage("batch_ui/zhan_uizi.png")
    zhan:setSize(cc.size(32,32))
    zhan:setAnchorPoint(cc.p(0.5,0.5))
    leaderboard:appendComponent(zhan)
    zhan:setPositionInContainer(cc.p(324,88))
    table_leaderboard["zhan"] = zhan

    local bang = fc.FExtensionsImage:create()
    bang:setImage("batch_ui/bang_uizi.png")
    bang:setSize(cc.size(32,32))
    bang:setAnchorPoint(cc.p(0.5,0.5))
    leaderboard:appendComponent(bang)
    bang:setPositionInContainer(cc.p(358,87))
    table_leaderboard["bang"] = bang

    return table_leaderboard

end

