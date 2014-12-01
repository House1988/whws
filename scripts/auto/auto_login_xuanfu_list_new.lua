function createlogin_xuanfu_list_new()

    local table_login_xuanfu_list_new = {}

    local login_xuanfu_list_new = fc.FContainerPanel:create()
    login_xuanfu_list_new:setSize(cc.size(783,535))
    table_login_xuanfu_list_new["login_xuanfu_list_new"] = login_xuanfu_list_new

    local login_xf_kuang1_bg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/blackBG.png",cc.rect(1,1,1,1))
    login_xf_kuang1_bg:setSize(cc.size(783,535))
    login_xf_kuang1_bg:setAnchorPoint(cc.p(0.5,0.5))
    login_xuanfu_list_new:appendComponent(login_xf_kuang1_bg)
    login_xf_kuang1_bg:setPositionInContainer(cc.p(391.5,267.5))
    table_login_xuanfu_list_new["login_xf_kuang1_bg"] = login_xf_kuang1_bg

    local login_rect1 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongbiankuang2_ciguan.png",cc.rect(43,15,2,2))
    login_rect1:setSize(cc.size(783,535))
    login_rect1:setAnchorPoint(cc.p(0.5,0.5))
    login_xuanfu_list_new:appendComponent(login_rect1)
    login_rect1:setPositionInContainer(cc.p(391.5,267.5))
    table_login_xuanfu_list_new["login_rect1"] = login_rect1

    local login_rect2 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongbiankuang2_ciguan.png",cc.rect(43,15,2,2))
    login_rect2:setSize(cc.size(783,391))
    login_rect2:setAnchorPoint(cc.p(0.5,0.5))
    login_xuanfu_list_new:appendComponent(login_rect2)
    login_rect2:setPositionInContainer(cc.p(391.5,339.5))
    table_login_xuanfu_list_new["login_rect2"] = login_rect2

    local lg_up_di = fc.FScale9Image:createWithBatchUIFrame("batch_ui/xingjikuang_paibingbuzhen.png",cc.rect(73,14,2,2))
    lg_up_di:setSize(cc.size(770,42))
    lg_up_di:setAnchorPoint(cc.p(0.5,0.5))
    login_xuanfu_list_new:appendComponent(lg_up_di)
    lg_up_di:setPositionInContainer(cc.p(391,28))
    table_login_xuanfu_list_new["lg_up_di"] = lg_up_di

    local ui_zui = fc.FExtensionsImage:create()
    ui_zui:setImage("batch_ui/zui_uizi.png")
    ui_zui:setSize(cc.size(32,32))
    ui_zui:setAnchorPoint(cc.p(0.5,0.5))
    login_xuanfu_list_new:appendComponent(ui_zui)
    ui_zui:setPositionInContainer(cc.p(328,28))
    table_login_xuanfu_list_new["ui_zui"] = ui_zui

    local ui_jin = fc.FExtensionsImage:create()
    ui_jin:setImage("batch_ui/jin4_uizi.png")
    ui_jin:setSize(cc.size(32,32))
    ui_jin:setAnchorPoint(cc.p(0.5,0.5))
    login_xuanfu_list_new:appendComponent(ui_jin)
    ui_jin:setPositionInContainer(cc.p(370,28))
    table_login_xuanfu_list_new["ui_jin"] = ui_jin

    local ui_deng = fc.FExtensionsImage:create()
    ui_deng:setImage("batch_ui/deng_uizi.png")
    ui_deng:setSize(cc.size(32,32))
    ui_deng:setAnchorPoint(cc.p(0.5,0.5))
    login_xuanfu_list_new:appendComponent(ui_deng)
    ui_deng:setPositionInContainer(cc.p(412,28))
    table_login_xuanfu_list_new["ui_deng"] = ui_deng

    local ui_lu = fc.FExtensionsImage:create()
    ui_lu:setImage("batch_ui/lu_uizi.png")
    ui_lu:setSize(cc.size(32,32))
    ui_lu:setAnchorPoint(cc.p(0.5,0.5))
    login_xuanfu_list_new:appendComponent(ui_lu)
    ui_lu:setPositionInContainer(cc.p(454,28))
    table_login_xuanfu_list_new["ui_lu"] = ui_lu

    local lg_down_di = fc.FScale9Image:createWithBatchUIFrame("batch_ui/xingjikuang_paibingbuzhen.png",cc.rect(73,14,2,2))
    lg_down_di:setSize(cc.size(770,42))
    lg_down_di:setAnchorPoint(cc.p(0.5,0.5))
    login_xuanfu_list_new:appendComponent(lg_down_di)
    lg_down_di:setPositionInContainer(cc.p(391,171))
    table_login_xuanfu_list_new["lg_down_di"] = lg_down_di

    local ui_fu = fc.FExtensionsImage:create()
    ui_fu:setImage("batch_ui/fu4_uizi.png")
    ui_fu:setSize(cc.size(32,32))
    ui_fu:setAnchorPoint(cc.p(0.5,0.5))
    login_xuanfu_list_new:appendComponent(ui_fu)
    ui_fu:setPositionInContainer(cc.p(308,171))
    table_login_xuanfu_list_new["ui_fu"] = ui_fu

    local ui_wu = fc.FExtensionsImage:create()
    ui_wu:setImage("batch_ui/wu3_uizi.png")
    ui_wu:setSize(cc.size(32,32))
    ui_wu:setAnchorPoint(cc.p(0.5,0.5))
    login_xuanfu_list_new:appendComponent(ui_wu)
    ui_wu:setPositionInContainer(cc.p(350,171))
    table_login_xuanfu_list_new["ui_wu"] = ui_wu

    local ui_qi = fc.FExtensionsImage:create()
    ui_qi:setImage("batch_ui/qi3_uizi.png")
    ui_qi:setSize(cc.size(32,32))
    ui_qi:setAnchorPoint(cc.p(0.5,0.5))
    login_xuanfu_list_new:appendComponent(ui_qi)
    ui_qi:setPositionInContainer(cc.p(392,171))
    table_login_xuanfu_list_new["ui_qi"] = ui_qi

    local ui_lie = fc.FExtensionsImage:create()
    ui_lie:setImage("batch_ui/lie_uizi.png")
    ui_lie:setSize(cc.size(32,32))
    ui_lie:setAnchorPoint(cc.p(0.5,0.5))
    login_xuanfu_list_new:appendComponent(ui_lie)
    ui_lie:setPositionInContainer(cc.p(434,171))
    table_login_xuanfu_list_new["ui_lie"] = ui_lie

    local ui_biao = fc.FExtensionsImage:create()
    ui_biao:setImage("batch_ui/biao_uizi.png")
    ui_biao:setSize(cc.size(32,32))
    ui_biao:setAnchorPoint(cc.p(0.5,0.5))
    login_xuanfu_list_new:appendComponent(ui_biao)
    ui_biao:setPositionInContainer(cc.p(476,171))
    table_login_xuanfu_list_new["ui_biao"] = ui_biao

    local guan_bi = fc.FScaleButton:create()
    guan_bi:setSize(cc.size(41,45))
    guan_bi:setAnchorPoint(cc.p(0.5,0.5))
    guan_bi:setButtonImage("batch_ui/guanbi_anniu2.png")
    login_xuanfu_list_new:appendComponent(guan_bi)
    guan_bi:setPositionInContainer(cc.p(755.5,26.5))
    table_login_xuanfu_list_new["guan_bi"] = guan_bi

    return table_login_xuanfu_list_new

end

