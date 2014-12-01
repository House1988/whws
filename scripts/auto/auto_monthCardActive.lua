function createmonthCardActive()

    local table_monthCardActive = {}

    local monthCardActive = fc.FContainerPanel:create()
    monthCardActive:setSize(cc.size(960,640))
    table_monthCardActive["monthCardActive"] = monthCardActive

    local beauty = fc.FExtensionsImage:create()
    beauty:setImage("beauty_card/shanyingongzhu01.png")
    beauty:setSize(cc.size(417,424))
    beauty:setFlipType(2)
    beauty:setAnchorPoint(cc.p(0.5,0.5))
    monthCardActive:appendComponent(beauty)
    beauty:setPositionInContainer(cc.p(174.5,415))
    table_monthCardActive["beauty"] = beauty

    local right_dikuang_1 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyonga_100_1.png",cc.rect(7,7,2,2))
    right_dikuang_1:setSize(cc.size(667,489))
    right_dikuang_1:setAnchorPoint(cc.p(0.5,0.5))
    monthCardActive:appendComponent(right_dikuang_1)
    right_dikuang_1:setPositionInContainer(cc.p(624.5,380.5))
    table_monthCardActive["right_dikuang_1"] = right_dikuang_1

    local bottombar = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongbiankuang3_ciguan.png",cc.rect(40,0,2,13))
    bottombar:setSize(cc.size(960,13))
    bottombar:setAnchorPoint(cc.p(0.5,0.5))
    bottombar:setScaleY(-1)
    monthCardActive:appendComponent(bottombar)
    bottombar:setPositionInContainer(cc.p(480,633.5))
    table_monthCardActive["bottombar"] = bottombar

    local colum = fc.FScale9Image:createWithBatchUIFrame("batch_ui/zhuzi.png",cc.rect(0,53,89,2))
    colum:setSize(cc.size(89,506))
    colum:setAnchorPoint(cc.p(0.5,0.5))
    colum:setScaleY(-1)
    monthCardActive:appendComponent(colum)
    colum:setPositionInContainer(cc.p(3.5,387))
    table_monthCardActive["colum"] = colum

    local colum = fc.FScale9Image:createWithBatchUIFrame("batch_ui/zhuzi.png",cc.rect(0,53,89,2))
    colum:setSize(cc.size(89,506))
    colum:setAnchorPoint(cc.p(0.5,0.5))
    colum:setScaleY(-1)
    monthCardActive:appendComponent(colum)
    colum:setPositionInContainer(cc.p(256.5,387))
    table_monthCardActive["colum"] = colum

    local right_dikuang_2 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyonga_k_1.png",cc.rect(7,7,2,2))
    right_dikuang_2:setSize(cc.size(634,150))
    right_dikuang_2:setAnchorPoint(cc.p(0.5,0.5))
    monthCardActive:appendComponent(right_dikuang_2)
    right_dikuang_2:setPositionInContainer(cc.p(625,488))
    table_monthCardActive["right_dikuang_2"] = right_dikuang_2

    local right_dikuang_3 = fc.FExtensionsImage:create()
    right_dikuang_3:setImage("nobatch/yuekalibao_bg.png")
    right_dikuang_3:setSize(cc.size(632,250))
    right_dikuang_3:setAnchorPoint(cc.p(0.5,0.5))
    monthCardActive:appendComponent(right_dikuang_3)
    right_dikuang_3:setPositionInContainer(cc.p(624,274))
    table_monthCardActive["right_dikuang_3"] = right_dikuang_3

    local detailBtn = fc.FScaleButton:create()
    detailBtn:setSize(cc.size(146,53))
    detailBtn:setAnchorPoint(cc.p(0.5,0.5))
    detailBtn:setButtonImage("batch_ui/teshuanniu.png")
    monthCardActive:appendComponent(detailBtn)
    detailBtn:setPositionInContainer(cc.p(629,591.5))
    table_monthCardActive["detailBtn"] = detailBtn

    local detailBtn_xiang = fc.FExtensionsImage:create()
    detailBtn_xiang:setImage("batch_ui/xiang_uizi.png")
    detailBtn_xiang:setSize(cc.size(32,32))
    detailBtn_xiang:setAnchorPoint(cc.p(0.5,0.5))
    detailBtn:appendComponent(detailBtn_xiang)
    detailBtn_xiang:setPositionInContainer(cc.p(51,26))
    table_monthCardActive["detailBtn_xiang"] = detailBtn_xiang

    local detailBtn_qing = fc.FExtensionsImage:create()
    detailBtn_qing:setImage("batch_ui/qing_uizi.png")
    detailBtn_qing:setSize(cc.size(32,32))
    detailBtn_qing:setAnchorPoint(cc.p(0.5,0.5))
    detailBtn:appendComponent(detailBtn_qing)
    detailBtn_qing:setPositionInContainer(cc.p(92,26))
    table_monthCardActive["detailBtn_qing"] = detailBtn_qing

    local buyBtn = fc.FScaleButton:create()
    buyBtn:setSize(cc.size(146,53))
    buyBtn:setAnchorPoint(cc.p(0.5,0.5))
    buyBtn:setButtonImage("batch_ui/teshuanniu.png")
    monthCardActive:appendComponent(buyBtn)
    buyBtn:setPositionInContainer(cc.p(812,591.5))
    table_monthCardActive["buyBtn"] = buyBtn

    local buyBtn_mai = fc.FExtensionsImage:create()
    buyBtn_mai:setImage("batch_ui/mai_uizi.png")
    buyBtn_mai:setSize(cc.size(32,32))
    buyBtn_mai:setAnchorPoint(cc.p(0.5,0.5))
    buyBtn:appendComponent(buyBtn_mai)
    buyBtn_mai:setPositionInContainer(cc.p(95,26))
    table_monthCardActive["buyBtn_mai"] = buyBtn_mai

    local buyBtn_gou = fc.FExtensionsImage:create()
    buyBtn_gou:setImage("batch_ui/gou_uizi.png")
    buyBtn_gou:setSize(cc.size(32,32))
    buyBtn_gou:setAnchorPoint(cc.p(0.5,0.5))
    buyBtn:appendComponent(buyBtn_gou)
    buyBtn_gou:setPositionInContainer(cc.p(55,26))
    table_monthCardActive["buyBtn_gou"] = buyBtn_gou

    local tile_yue = fc.FExtensionsImage:create()
    tile_yue:setImage("batch_ui/yue (2).png")
    tile_yue:setSize(cc.size(59,59))
    tile_yue:setAnchorPoint(cc.p(0.5,0.5))
    monthCardActive:appendComponent(tile_yue)
    tile_yue:setPositionInContainer(cc.p(381.5,186.5))
    table_monthCardActive["tile_yue"] = tile_yue

    local tile_ka = fc.FExtensionsImage:create()
    tile_ka:setImage("batch_ui/ka.png")
    tile_ka:setSize(cc.size(59,59))
    tile_ka:setAnchorPoint(cc.p(0.5,0.5))
    monthCardActive:appendComponent(tile_ka)
    tile_ka:setPositionInContainer(cc.p(434.5,186.5))
    table_monthCardActive["tile_ka"] = tile_ka

    local tile_li = fc.FExtensionsImage:create()
    tile_li:setImage("batch_ui/li3.png")
    tile_li:setSize(cc.size(59,59))
    tile_li:setAnchorPoint(cc.p(0.5,0.5))
    monthCardActive:appendComponent(tile_li)
    tile_li:setPositionInContainer(cc.p(494.5,191.5))
    table_monthCardActive["tile_li"] = tile_li

    local tile_bao = fc.FExtensionsImage:create()
    tile_bao:setImage("batch_ui/bao (3).png")
    tile_bao:setSize(cc.size(59,59))
    tile_bao:setAnchorPoint(cc.p(0.5,0.5))
    monthCardActive:appendComponent(tile_bao)
    tile_bao:setPositionInContainer(cc.p(552.5,186.5))
    table_monthCardActive["tile_bao"] = tile_bao

    local mca_zi_nei = fc.FExtensionsImage:create()
    mca_zi_nei:setImage("batch_ui/nei.png")
    mca_zi_nei:setSize(cc.size(32,32))
    mca_zi_nei:setAnchorPoint(cc.p(0.5,0.5))
    monthCardActive:appendComponent(mca_zi_nei)
    mca_zi_nei:setPositionInContainer(cc.p(340,243))
    table_monthCardActive["mca_zi_nei"] = mca_zi_nei

    local mca_zi_han = fc.FExtensionsImage:create()
    mca_zi_han:setImage("batch_ui/han.png")
    mca_zi_han:setSize(cc.size(32,32))
    mca_zi_han:setAnchorPoint(cc.p(0.5,0.5))
    monthCardActive:appendComponent(mca_zi_han)
    mca_zi_han:setPositionInContainer(cc.p(372,243))
    table_monthCardActive["mca_zi_han"] = mca_zi_han

    local mca_zi_kai = fc.FExtensionsImage:create()
    mca_zi_kai:setImage("batch_ui/kai_uizi.png")
    mca_zi_kai:setSize(cc.size(32,32))
    mca_zi_kai:setAnchorPoint(cc.p(0.5,0.5))
    monthCardActive:appendComponent(mca_zi_kai)
    mca_zi_kai:setPositionInContainer(cc.p(788,186))
    table_monthCardActive["mca_zi_kai"] = mca_zi_kai

    local mca_zi_qi = fc.FExtensionsImage:create()
    mca_zi_qi:setImage("batch_ui/qi.png")
    mca_zi_qi:setSize(cc.size(32,32))
    mca_zi_qi:setAnchorPoint(cc.p(0.5,0.5))
    monthCardActive:appendComponent(mca_zi_qi)
    mca_zi_qi:setPositionInContainer(cc.p(820,187))
    table_monthCardActive["mca_zi_qi"] = mca_zi_qi

    local mca_zi_shuo = fc.FExtensionsImage:create()
    mca_zi_shuo:setImage("batch_ui/shuo.png")
    mca_zi_shuo:setSize(cc.size(32,32))
    mca_zi_shuo:setAnchorPoint(cc.p(0.5,0.5))
    monthCardActive:appendComponent(mca_zi_shuo)
    mca_zi_shuo:setPositionInContainer(cc.p(852,186))
    table_monthCardActive["mca_zi_shuo"] = mca_zi_shuo

    local mca_zi_ming = fc.FExtensionsImage:create()
    mca_zi_ming:setImage("batch_ui/ming_uizi2.png")
    mca_zi_ming:setSize(cc.size(32,32))
    mca_zi_ming:setAnchorPoint(cc.p(0.5,0.5))
    monthCardActive:appendComponent(mca_zi_ming)
    mca_zi_ming:setPositionInContainer(cc.p(884,186))
    table_monthCardActive["mca_zi_ming"] = mca_zi_ming

    local mca_rule_bg = fc.FExtensionsImage:create()
    mca_rule_bg:setImage("batch_ui/shurukuang2_tangquanxinggong.png")
    mca_rule_bg:setSize(cc.size(196,33))
    mca_rule_bg:setAnchorPoint(cc.p(0.5,0.5))
    monthCardActive:appendComponent(mca_rule_bg)
    mca_rule_bg:setPositionInContainer(cc.p(407,417.5))
    table_monthCardActive["mca_rule_bg"] = mca_rule_bg

    local mca_zi_gui = fc.FExtensionsImage:create()
    mca_zi_gui:setImage("batch_ui/gui.png")
    mca_zi_gui:setSize(cc.size(32,32))
    mca_zi_gui:setAnchorPoint(cc.p(0.5,0.5))
    monthCardActive:appendComponent(mca_zi_gui)
    mca_zi_gui:setPositionInContainer(cc.p(351,418))
    table_monthCardActive["mca_zi_gui"] = mca_zi_gui

    local mca_zi_ze = fc.FExtensionsImage:create()
    mca_zi_ze:setImage("batch_ui/ze_uizi.png")
    mca_zi_ze:setSize(cc.size(32,32))
    mca_zi_ze:setAnchorPoint(cc.p(0.5,0.5))
    monthCardActive:appendComponent(mca_zi_ze)
    mca_zi_ze:setPositionInContainer(cc.p(383,418))
    table_monthCardActive["mca_zi_ze"] = mca_zi_ze

    local mca_rule_lbl1 = fc.FLabel:createBMFont()
    mca_rule_lbl1:setSize(cc.size(446,30))
    mca_rule_lbl1:setAnchorPoint(cc.p(0.5,0.5))
    mca_rule_lbl1:setFontSize(21)
    mca_rule_lbl1:setString("1.月卡礼包每人每月仅可购买一次；")
    mca_rule_lbl1:setColor(cc.c3b(0,255,255))
    monthCardActive:appendComponent(mca_rule_lbl1)
    mca_rule_lbl1:setPositionInContainer(cc.p(547,457))
    table_monthCardActive["mca_rule_lbl1"] = mca_rule_lbl1

    local mca_rule_lbl2 = fc.FLabel:createBMFont()
    mca_rule_lbl2:setSize(cc.size(446,30))
    mca_rule_lbl2:setAnchorPoint(cc.p(0.5,0.5))
    mca_rule_lbl2:setFontSize(21)
    mca_rule_lbl2:setString("2.当前礼包没有领取完成时，无法再次购买；")
    mca_rule_lbl2:setColor(cc.c3b(0,255,255))
    monthCardActive:appendComponent(mca_rule_lbl2)
    mca_rule_lbl2:setPositionInContainer(cc.p(547,493))
    table_monthCardActive["mca_rule_lbl2"] = mca_rule_lbl2

    local mca_rule_lbl3 = fc.FLabel:createBMFont()
    mca_rule_lbl3:setSize(cc.size(613,30))
    mca_rule_lbl3:setAnchorPoint(cc.p(0.5,0.5))
    mca_rule_lbl3:setFontSize(21)
    mca_rule_lbl3:setString("3.某日没登录，当日奖励过0点作废。登录没领取奖励，也作废。")
    mca_rule_lbl3:setColor(cc.c3b(0,255,255))
    monthCardActive:appendComponent(mca_rule_lbl3)
    mca_rule_lbl3:setPositionInContainer(cc.p(630.5,529))
    table_monthCardActive["mca_rule_lbl3"] = mca_rule_lbl3

    local mca_limit_lbl = fc.FLabel:createBMFont()
    mca_limit_lbl:setSize(cc.size(145,30))
    mca_limit_lbl:setAnchorPoint(cc.p(0.5,0.5))
    mca_limit_lbl:setFontSize(21)
    mca_limit_lbl:setString("每月限一次")
    mca_limit_lbl:setColor(cc.c3b(0,255,0))
    monthCardActive:appendComponent(mca_limit_lbl)
    mca_limit_lbl:setPositionInContainer(cc.p(848.5,233))
    table_monthCardActive["mca_limit_lbl"] = mca_limit_lbl

    local mca_jin = fc.FExtensionsImage:create()
    mca_jin:setImage("batch_ui/jin.png")
    mca_jin:setSize(cc.size(40,40))
    mca_jin:setAnchorPoint(cc.p(0.5,0.5))
    monthCardActive:appendComponent(mca_jin)
    mca_jin:setPositionInContainer(cc.p(514,231))
    table_monthCardActive["mca_jin"] = mca_jin

    local mca_shou = fc.FExtensionsImage:create()
    mca_shou:setImage("batch_ui/shou_2.png")
    mca_shou:setSize(cc.size(40,40))
    mca_shou:setAnchorPoint(cc.p(0.5,0.5))
    monthCardActive:appendComponent(mca_shou)
    mca_shou:setPositionInContainer(cc.p(554,232))
    table_monthCardActive["mca_shou"] = mca_shou

    local mca_yuan = fc.FExtensionsImage:create()
    mca_yuan:setImage("batch_ui/yuan (2).png")
    mca_yuan:setSize(cc.size(40,40))
    mca_yuan:setAnchorPoint(cc.p(0.5,0.5))
    monthCardActive:appendComponent(mca_yuan)
    mca_yuan:setPositionInContainer(cc.p(644,232))
    table_monthCardActive["mca_yuan"] = mca_yuan

    local mca_zi_colon = fc.FExtensionsImage:create()
    mca_zi_colon:setImage("batch_ui/：.png")
    mca_zi_colon:setSize(cc.size(32,32))
    mca_zi_colon:setAnchorPoint(cc.p(0.5,0.5))
    monthCardActive:appendComponent(mca_zi_colon)
    mca_zi_colon:setPositionInContainer(cc.p(404,243))
    table_monthCardActive["mca_zi_colon"] = mca_zi_colon

    local mca_zi_colon = fc.FExtensionsImage:create()
    mca_zi_colon:setImage("batch_ui/：.png")
    mca_zi_colon:setSize(cc.size(32,32))
    mca_zi_colon:setAnchorPoint(cc.p(0.5,0.5))
    monthCardActive:appendComponent(mca_zi_colon)
    mca_zi_colon:setPositionInContainer(cc.p(479,418))
    table_monthCardActive["mca_zi_colon"] = mca_zi_colon

    local mca_zi_colon = fc.FExtensionsImage:create()
    mca_zi_colon:setImage("batch_ui/：.png")
    mca_zi_colon:setSize(cc.size(32,32))
    mca_zi_colon:setAnchorPoint(cc.p(0.5,0.5))
    monthCardActive:appendComponent(mca_zi_colon)
    mca_zi_colon:setPositionInContainer(cc.p(916,186))
    table_monthCardActive["mca_zi_colon"] = mca_zi_colon

    local mca_itemList = fc.FContainerList:create(2)
    mca_itemList:setSize(cc.size(600,138))
    mca_itemList:setAnchorPoint(cc.p(0.5,0.5))
    monthCardActive:appendComponent(mca_itemList)
    mca_itemList:setPositionInContainer(cc.p(635,326))
    table_monthCardActive["mca_itemList"] = mca_itemList

    local mca_card_price = fc.FAnimationLabel:create("",g_game.g_resourceManager:getImageFontPath(g_game.g_f_image_font_type.F_BLUE_TYPE))
    mca_card_price:setAnchorPoint(cc.p(0.5,0.5))
    mca_card_price:setSize(cc.size(62,50))
    mca_card_price:setAlignment(2)
    mca_card_price:setScale(0.9)
    monthCardActive:appendComponent(mca_card_price)
    mca_card_price:setPositionInContainer(cc.p(596,233))
    table_monthCardActive["mca_card_price"] = mca_card_price

    local mca_zi_shuo = fc.FExtensionsImage:create()
    mca_zi_shuo:setImage("batch_ui/shuo.png")
    mca_zi_shuo:setSize(cc.size(32,32))
    mca_zi_shuo:setAnchorPoint(cc.p(0.5,0.5))
    monthCardActive:appendComponent(mca_zi_shuo)
    mca_zi_shuo:setPositionInContainer(cc.p(415,418))
    table_monthCardActive["mca_zi_shuo"] = mca_zi_shuo

    local mca_zi_ming = fc.FExtensionsImage:create()
    mca_zi_ming:setImage("batch_ui/ming_uizi2.png")
    mca_zi_ming:setSize(cc.size(32,32))
    mca_zi_ming:setAnchorPoint(cc.p(0.5,0.5))
    monthCardActive:appendComponent(mca_zi_ming)
    mca_zi_ming:setPositionInContainer(cc.p(447,417))
    table_monthCardActive["mca_zi_ming"] = mca_zi_ming

    return table_monthCardActive

end

