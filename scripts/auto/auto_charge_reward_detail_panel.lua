function createcharge_reward_detail_panel()

    local table_charge_reward_detail_panel = {}

    local charge_reward_detail_panel = fc.FContainerPanel:create()
    charge_reward_detail_panel:setSize(cc.size(960,640))
    table_charge_reward_detail_panel["charge_reward_detail_panel"] = charge_reward_detail_panel

    local crd_panel = fc.FContainerPanel:create()
    crd_panel:setSize(cc.size(534,554))
    crd_panel:setAnchorPoint(cc.p(0.5,0.5))
    charge_reward_detail_panel:appendComponent(crd_panel)
    crd_panel:setPositionInContainer(cc.p(480,320))
    table_charge_reward_detail_panel["crd_panel"] = crd_panel

    local crd_image_bg_lu = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shengzhi_ditu.png",cc.rect(40,63,4,4))
    crd_image_bg_lu:setSize(cc.size(412,500))
    crd_image_bg_lu:setAnchorPoint(cc.p(0.5,0.5))
    crd_panel:appendComponent(crd_image_bg_lu)
    crd_image_bg_lu:setPositionInContainer(cc.p(267,279))
    table_charge_reward_detail_panel["crd_image_bg_lu"] = crd_image_bg_lu

    local crd_image_bg_up = fc.FExtensionsImage:create()
    crd_image_bg_up:setImage("nobatch/shengzhi_zhou.png")
    crd_image_bg_up:setSize(cc.size(52,534))
    crd_image_bg_up:setRotation(90)
    crd_image_bg_up:setAnchorPoint(cc.p(0.5,0.5))
    crd_panel:appendComponent(crd_image_bg_up)
    crd_image_bg_up:setPositionInContainer(cc.p(267,26))
    table_charge_reward_detail_panel["crd_image_bg_up"] = crd_image_bg_up

    local ttitle_bg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/zongjiachengdikuang_tangquanxinggong.png",cc.rect(62,0,2,29))
    ttitle_bg:setSize(cc.size(300,42))
    ttitle_bg:setAnchorPoint(cc.p(0.5,0.5))
    crd_panel:appendComponent(ttitle_bg)
    ttitle_bg:setPositionInContainer(cc.p(267,26))
    table_charge_reward_detail_panel["ttitle_bg"] = ttitle_bg

    local crd_image_bg_bottom = fc.FExtensionsImage:create()
    crd_image_bg_bottom:setImage("nobatch/shengzhi_zhou.png")
    crd_image_bg_bottom:setSize(cc.size(52,534))
    crd_image_bg_bottom:setRotation(90)
    crd_image_bg_bottom:setAnchorPoint(cc.p(0.5,0.5))
    crd_panel:appendComponent(crd_image_bg_bottom)
    crd_image_bg_bottom:setPositionInContainer(cc.p(267,528))
    table_charge_reward_detail_panel["crd_image_bg_bottom"] = crd_image_bg_bottom

    local crd_li = fc.FExtensionsImage:create()
    crd_li:setImage("batch_ui/li1_uizi.png")
    crd_li:setSize(cc.size(32,32))
    crd_li:setAnchorPoint(cc.p(0.5,0.5))
    crd_panel:appendComponent(crd_li)
    crd_li:setPositionInContainer(cc.p(191,23))
    table_charge_reward_detail_panel["crd_li"] = crd_li

    local crd_bao = fc.FExtensionsImage:create()
    crd_bao:setImage("batch_ui/bao_uizi.png")
    crd_bao:setSize(cc.size(32,32))
    crd_bao:setAnchorPoint(cc.p(0.5,0.5))
    crd_panel:appendComponent(crd_bao)
    crd_bao:setPositionInContainer(cc.p(237,23))
    table_charge_reward_detail_panel["crd_bao"] = crd_bao

    local crd_xiang = fc.FExtensionsImage:create()
    crd_xiang:setImage("batch_ui/xiang_uizi.png")
    crd_xiang:setSize(cc.size(32,32))
    crd_xiang:setAnchorPoint(cc.p(0.5,0.5))
    crd_panel:appendComponent(crd_xiang)
    crd_xiang:setPositionInContainer(cc.p(284,23))
    table_charge_reward_detail_panel["crd_xiang"] = crd_xiang

    local crd_qing = fc.FExtensionsImage:create()
    crd_qing:setImage("batch_ui/qing_uizi.png")
    crd_qing:setSize(cc.size(32,32))
    crd_qing:setAnchorPoint(cc.p(0.5,0.5))
    crd_panel:appendComponent(crd_qing)
    crd_qing:setPositionInContainer(cc.p(333,23))
    table_charge_reward_detail_panel["crd_qing"] = crd_qing

    local crd_rect1 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongditu2_huodong.png",cc.rect(1,1,1,1))
    crd_rect1:setSize(cc.size(384,458))
    crd_rect1:setAnchorPoint(cc.p(0.5,0.5))
    crd_panel:appendComponent(crd_rect1)
    crd_rect1:setPositionInContainer(cc.p(267,278))
    table_charge_reward_detail_panel["crd_rect1"] = crd_rect1

    local crd_rect2 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongbiankuang2_ciguan.png",cc.rect(44,15,1,1))
    crd_rect2:setSize(cc.size(384,458))
    crd_rect2:setAnchorPoint(cc.p(0.5,0.5))
    crd_panel:appendComponent(crd_rect2)
    crd_rect2:setPositionInContainer(cc.p(267,278))
    table_charge_reward_detail_panel["crd_rect2"] = crd_rect2

    local crd_title_label = fc.FLabel:createBMFont()
    crd_title_label:setSize(cc.size(200,30))
    crd_title_label:setAnchorPoint(cc.p(0.5,0.5))
    crd_title_label:setFontSize(24)
    crd_title_label:setString("累计充值9999")
    crd_title_label:setColor(cc.c3b(206,53,0))
    crd_panel:appendComponent(crd_title_label)
    crd_title_label:setPositionInContainer(cc.p(267,87))
    table_charge_reward_detail_panel["crd_title_label"] = crd_title_label

    local crd_confirm_btn = fc.FScaleButton:create()
    crd_confirm_btn:setSize(cc.size(144,53))
    crd_confirm_btn:setAnchorPoint(cc.p(0.5,0.5))
    crd_confirm_btn:setButtonImage("batch_ui/putonganniu1_up.png")
    crd_panel:appendComponent(crd_confirm_btn)
    crd_confirm_btn:setPositionInContainer(cc.p(267,465.5))
    table_charge_reward_detail_panel["crd_confirm_btn"] = crd_confirm_btn

    local crd_que = fc.FShaderExtensionsImage:create(0)
    crd_que:setAnchorPoint(cc.p(0.5,0.5))
    crd_que:setImage("batch_ui/ling_uizi.png")
    crd_que:setSize(cc.size(32,32))
    crd_confirm_btn:appendComponent(crd_que)
    crd_que:setPositionInContainer(cc.p(47,26))
    table_charge_reward_detail_panel["crd_que"] = crd_que

    local crd_ding = fc.FShaderExtensionsImage:create(0)
    crd_ding:setAnchorPoint(cc.p(0.5,0.5))
    crd_ding:setImage("batch_ui/qu_uizi.png")
    crd_ding:setSize(cc.size(32,32))
    crd_confirm_btn:appendComponent(crd_ding)
    crd_ding:setPositionInContainer(cc.p(97,26))
    table_charge_reward_detail_panel["crd_ding"] = crd_ding

    local close = fc.FScaleButton:create()
    close:setSize(cc.size(34,33))
    close:setAnchorPoint(cc.p(0.5,0.5))
    close:setButtonImage("batch_ui/guanbi_anniu2.png")
    crd_panel:appendComponent(close)
    close:setPositionInContainer(cc.p(498,26.5))
    table_charge_reward_detail_panel["close"] = close

    return table_charge_reward_detail_panel

end

