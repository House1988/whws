function createvip_pac_detail()

    local table_vip_pac_detail = {}

    local vip_pac_detail = fc.FContainerPanel:create()
    vip_pac_detail:setSize(cc.size(960,640))
    table_vip_pac_detail["vip_pac_detail"] = vip_pac_detail

    local vip_pac_bottom = fc.FContainerPanel:create()
    vip_pac_bottom:setSize(cc.size(534,500))
    vip_pac_bottom:setAnchorPoint(cc.p(0.5,0.5))
    vip_pac_detail:appendComponent(vip_pac_bottom)
    vip_pac_bottom:setPositionInContainer(cc.p(480,320))
    table_vip_pac_detail["vip_pac_bottom"] = vip_pac_bottom

    local v_di1 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shengzhi_ditu.png",cc.rect(40,63,4,4))
    v_di1:setSize(cc.size(412,435))
    v_di1:setAnchorPoint(cc.p(0.5,0.5))
    vip_pac_bottom:appendComponent(v_di1)
    v_di1:setPositionInContainer(cc.p(267,250.5))
    table_vip_pac_detail["v_di1"] = v_di1

    local v_zhou = fc.FExtensionsImage:create()
    v_zhou:setImage("nobatch/shengzhi_zhou.png")
    v_zhou:setSize(cc.size(52,534))
    v_zhou:setRotation(90)
    v_zhou:setAnchorPoint(cc.p(0.5,0.5))
    vip_pac_bottom:appendComponent(v_zhou)
    v_zhou:setPositionInContainer(cc.p(267,26))
    table_vip_pac_detail["v_zhou"] = v_zhou

    local v_zhou = fc.FExtensionsImage:create()
    v_zhou:setImage("nobatch/shengzhi_zhou.png")
    v_zhou:setSize(cc.size(52,534))
    v_zhou:setRotation(90)
    v_zhou:setAnchorPoint(cc.p(0.5,0.5))
    vip_pac_bottom:appendComponent(v_zhou)
    v_zhou:setPositionInContainer(cc.p(267,474))
    table_vip_pac_detail["v_zhou"] = v_zhou

    local v_di2 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongditu2_huodong.png",cc.rect(1,1,1,1))
    v_di2:setSize(cc.size(370,400))
    v_di2:setAnchorPoint(cc.p(0.5,0.5))
    vip_pac_bottom:appendComponent(v_di2)
    v_di2:setPositionInContainer(cc.p(267,250))
    table_vip_pac_detail["v_di2"] = v_di2

    local v_di3 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongbiankuang2_ciguan.png",cc.rect(44,15,1,1))
    v_di3:setSize(cc.size(370,400))
    v_di3:setAnchorPoint(cc.p(0.5,0.5))
    vip_pac_bottom:appendComponent(v_di3)
    v_di3:setPositionInContainer(cc.p(267,250))
    table_vip_pac_detail["v_di3"] = v_di3

    local v_di4 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongditu_huodong.png",cc.rect(3,3,2,2))
    v_di4:setSize(cc.size(366,280))
    v_di4:setAnchorPoint(cc.p(0.5,0.5))
    vip_pac_bottom:appendComponent(v_di4)
    v_di4:setPositionInContainer(cc.p(267,229))
    table_vip_pac_detail["v_di4"] = v_di4

    local v_yes_btn = fc.FScaleButton:create()
    v_yes_btn:setSize(cc.size(144,53))
    v_yes_btn:setAnchorPoint(cc.p(0.5,0.5))
    v_yes_btn:setButtonImage("batch_ui/putonganniu1_up.png")
    vip_pac_bottom:appendComponent(v_yes_btn)
    v_yes_btn:setPositionInContainer(cc.p(267,409.5))
    table_vip_pac_detail["v_yes_btn"] = v_yes_btn

    local v_que = fc.FExtensionsImage:create()
    v_que:setImage("batch_ui/que_uizi.png")
    v_que:setSize(cc.size(32,32))
    v_que:setAnchorPoint(cc.p(0.5,0.5))
    v_yes_btn:appendComponent(v_que)
    v_que:setPositionInContainer(cc.p(40,26))
    table_vip_pac_detail["v_que"] = v_que

    local v_ding = fc.FExtensionsImage:create()
    v_ding:setImage("batch_ui/ding_uizi.png")
    v_ding:setSize(cc.size(32,32))
    v_ding:setAnchorPoint(cc.p(0.5,0.5))
    v_yes_btn:appendComponent(v_ding)
    v_ding:setPositionInContainer(cc.p(99,26))
    table_vip_pac_detail["v_ding"] = v_ding

    local v_title_bg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/zongjiachengdikuang_tangquanxinggong.png",cc.rect(66,18,2,2))
    v_title_bg:setSize(cc.size(240,50))
    v_title_bg:setAnchorPoint(cc.p(0.5,0.5))
    vip_pac_bottom:appendComponent(v_title_bg)
    v_title_bg:setPositionInContainer(cc.p(267,25))
    table_vip_pac_detail["v_title_bg"] = v_title_bg

    local v_li = fc.FExtensionsImage:create()
    v_li:setImage("batch_ui/li1_uizi.png")
    v_li:setSize(cc.size(32,32))
    v_li:setAnchorPoint(cc.p(0.5,0.5))
    vip_pac_bottom:appendComponent(v_li)
    v_li:setPositionInContainer(cc.p(219,24))
    table_vip_pac_detail["v_li"] = v_li

    local v_bao = fc.FExtensionsImage:create()
    v_bao:setImage("batch_ui/bao_uizi.png")
    v_bao:setSize(cc.size(32,32))
    v_bao:setAnchorPoint(cc.p(0.5,0.5))
    vip_pac_bottom:appendComponent(v_bao)
    v_bao:setPositionInContainer(cc.p(250,24))
    table_vip_pac_detail["v_bao"] = v_bao

    local v_xiang = fc.FExtensionsImage:create()
    v_xiang:setImage("batch_ui/xiang_uizi.png")
    v_xiang:setSize(cc.size(32,32))
    v_xiang:setAnchorPoint(cc.p(0.5,0.5))
    vip_pac_bottom:appendComponent(v_xiang)
    v_xiang:setPositionInContainer(cc.p(282,24))
    table_vip_pac_detail["v_xiang"] = v_xiang

    local v_qing = fc.FExtensionsImage:create()
    v_qing:setImage("batch_ui/qing_uizi.png")
    v_qing:setSize(cc.size(32,32))
    v_qing:setAnchorPoint(cc.p(0.5,0.5))
    vip_pac_bottom:appendComponent(v_qing)
    v_qing:setPositionInContainer(cc.p(313,24))
    table_vip_pac_detail["v_qing"] = v_qing

    return table_vip_pac_detail

end

