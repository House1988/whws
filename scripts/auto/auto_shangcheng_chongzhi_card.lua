function createshangcheng_chongzhi_card()

    local table_shangcheng_chongzhi_card = {}

    local shangcheng_chongzhi_card = fc.FContainerPanel:create()
    shangcheng_chongzhi_card:setSize(cc.size(220,221))
    table_shangcheng_chongzhi_card["shangcheng_chongzhi_card"] = shangcheng_chongzhi_card

    local sc_cz_card_bg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongditu1_ciguan.png",cc.rect(1,1,1,1))
    sc_cz_card_bg:setSize(cc.size(220,60))
    sc_cz_card_bg:setAnchorPoint(cc.p(0.5,0.5))
    shangcheng_chongzhi_card:appendComponent(sc_cz_card_bg)
    sc_cz_card_bg:setPositionInContainer(cc.p(110,191))
    table_shangcheng_chongzhi_card["sc_cz_card_bg"] = sc_cz_card_bg

    local sc_cz_card_bg1 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongditu2_ciguan.png",cc.rect(1,1,2,2))
    sc_cz_card_bg1:setSize(cc.size(220,161))
    sc_cz_card_bg1:setAnchorPoint(cc.p(0.5,0.5))
    shangcheng_chongzhi_card:appendComponent(sc_cz_card_bg1)
    sc_cz_card_bg1:setPositionInContainer(cc.p(110,80.5))
    table_shangcheng_chongzhi_card["sc_cz_card_bg1"] = sc_cz_card_bg1

    local sc_cs_card_yuanbao_image = fc.FExtensionsImage:create()
    sc_cs_card_yuanbao_image:setImage("batch_ui/chongzhi_yuanbao.png")
    sc_cs_card_yuanbao_image:setSize(cc.size(141,95))
    sc_cs_card_yuanbao_image:setAnchorPoint(cc.p(0.5,0.5))
    shangcheng_chongzhi_card:appendComponent(sc_cs_card_yuanbao_image)
    sc_cs_card_yuanbao_image:setPositionInContainer(cc.p(114.5,105.5))
    table_shangcheng_chongzhi_card["sc_cs_card_yuanbao_image"] = sc_cs_card_yuanbao_image

    local sc_cs_card_chongzhi_button = fc.FScaleButton:create()
    sc_cs_card_chongzhi_button:setSize(cc.size(144,51))
    sc_cs_card_chongzhi_button:setAnchorPoint(cc.p(0.5,0.5))
    sc_cs_card_chongzhi_button:setButtonImage("batch_ui/goumai_anniu.png")
    shangcheng_chongzhi_card:appendComponent(sc_cs_card_chongzhi_button)
    sc_cs_card_chongzhi_button:setPositionInContainer(cc.p(148,188.5))
    table_shangcheng_chongzhi_card["sc_cs_card_chongzhi_button"] = sc_cs_card_chongzhi_button

    local sc_chong = fc.FExtensionsImage:create()
    sc_chong:setImage("batch_ui/chong_uizi.png")
    sc_chong:setSize(cc.size(32,32))
    sc_chong:setAnchorPoint(cc.p(0.5,0.5))
    sc_cs_card_chongzhi_button:appendComponent(sc_chong)
    sc_chong:setPositionInContainer(cc.p(45,23))
    table_shangcheng_chongzhi_card["sc_chong"] = sc_chong

    local sc_zhi = fc.FExtensionsImage:create()
    sc_zhi:setImage("batch_ui/zhi_uizi.png")
    sc_zhi:setSize(cc.size(32,32))
    sc_zhi:setAnchorPoint(cc.p(0.5,0.5))
    sc_cs_card_chongzhi_button:appendComponent(sc_zhi)
    sc_zhi:setPositionInContainer(cc.p(95,24))
    table_shangcheng_chongzhi_card["sc_zhi"] = sc_zhi

    local sc_titleBg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/jibieditu1_huodong.png",cc.rect(2,0,3,46))
    sc_titleBg:setSize(cc.size(199,46))
    sc_titleBg:setAnchorPoint(cc.p(0.5,0.5))
    sc_titleBg:setScaleX(-1)
    shangcheng_chongzhi_card:appendComponent(sc_titleBg)
    sc_titleBg:setPositionInContainer(cc.p(120.5,29))
    table_shangcheng_chongzhi_card["sc_titleBg"] = sc_titleBg

    local sc_cz_card_yuanbao_num_label = fc.FLabel:createBMFont()
    sc_cz_card_yuanbao_num_label:setSize(cc.size(60,30))
    sc_cz_card_yuanbao_num_label:setAnchorPoint(cc.p(0.5,0.5))
    sc_cz_card_yuanbao_num_label:setFontSize(20)
    sc_cz_card_yuanbao_num_label:setString("300")
    sc_cz_card_yuanbao_num_label:setColor(cc.c3b(255,255,0))
    shangcheng_chongzhi_card:appendComponent(sc_cz_card_yuanbao_num_label)
    sc_cz_card_yuanbao_num_label:setPositionInContainer(cc.p(98,24))
    table_shangcheng_chongzhi_card["sc_cz_card_yuanbao_num_label"] = sc_cz_card_yuanbao_num_label

    local sc_cz_card_fuhao_label = fc.FLabel:createBMFont()
    sc_cz_card_fuhao_label:setSize(cc.size(50,30))
    sc_cz_card_fuhao_label:setAnchorPoint(cc.p(0.5,0.5))
    sc_cz_card_fuhao_label:setFontSize(21)
    sc_cz_card_fuhao_label:setString("=")
    sc_cz_card_fuhao_label:setColor(cc.c3b(255,255,0))
    shangcheng_chongzhi_card:appendComponent(sc_cz_card_fuhao_label)
    sc_cz_card_fuhao_label:setPositionInContainer(cc.p(145,23))
    table_shangcheng_chongzhi_card["sc_cz_card_fuhao_label"] = sc_cz_card_fuhao_label

    local sc_cz_card_rmb_label = fc.FLabel:createBMFont()
    sc_cz_card_rmb_label:setSize(cc.size(50,30))
    sc_cz_card_rmb_label:setAnchorPoint(cc.p(0.5,0.5))
    sc_cz_card_rmb_label:setFontSize(21)
    sc_cz_card_rmb_label:setString("300")
    sc_cz_card_rmb_label:setColor(cc.c3b(0,255,255))
    shangcheng_chongzhi_card:appendComponent(sc_cz_card_rmb_label)
    sc_cz_card_rmb_label:setPositionInContainer(cc.p(192,23))
    table_shangcheng_chongzhi_card["sc_cz_card_rmb_label"] = sc_cz_card_rmb_label

    local sc_rmb_image = fc.FExtensionsImage:create()
    sc_rmb_image:setImage("batch_ui/renminbi_shangcheng.png")
    sc_rmb_image:setSize(cc.size(17,19))
    sc_rmb_image:setAnchorPoint(cc.p(0.5,0.5))
    shangcheng_chongzhi_card:appendComponent(sc_rmb_image)
    sc_rmb_image:setPositionInContainer(cc.p(161.5,27.5))
    table_shangcheng_chongzhi_card["sc_rmb_image"] = sc_rmb_image

    local kuang = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongbiankuang2_ciguan.png",cc.rect(43,15,2,2))
    kuang:setSize(cc.size(220,221))
    kuang:setAnchorPoint(cc.p(0.5,0.5))
    shangcheng_chongzhi_card:appendComponent(kuang)
    kuang:setPositionInContainer(cc.p(110,110.5))
    table_shangcheng_chongzhi_card["kuang"] = kuang

    local bottom_flag = fc.FExtensionsImage:create()
    bottom_flag:setImage("batch_ui/first_charge_corner.png")
    bottom_flag:setSize(cc.size(81,66))
    bottom_flag:setAnchorPoint(cc.p(0.5,0.5))
    shangcheng_chongzhi_card:appendComponent(bottom_flag)
    bottom_flag:setPositionInContainer(cc.p(43.5,179))
    table_shangcheng_chongzhi_card["bottom_flag"] = bottom_flag

    return table_shangcheng_chongzhi_card

end

