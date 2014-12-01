function createshangcheng_chongzhi()

    local table_shangcheng_chongzhi = {}

    local shangcheng_chongzhi = fc.FContainerPanel:create()
    shangcheng_chongzhi:setSize(cc.size(960,640))
    table_shangcheng_chongzhi["shangcheng_chongzhi"] = shangcheng_chongzhi

    local sc_cz_bg = fc.FExtensionsImage:create()
    sc_cz_bg:setAnchorPoint(cc.p(0.5,0.5))
    shangcheng_chongzhi:appendComponent(sc_cz_bg)
    sc_cz_bg:setPositionInContainer(cc.p(480,320))
    table_shangcheng_chongzhi["sc_cz_bg"] = sc_cz_bg

    local hg_tqg_bg_scale9 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/banzidikuangmeinv2_tongyong.png",cc.rect(2,2,1,1))
    hg_tqg_bg_scale9:setSize(cc.size(960,640))
    hg_tqg_bg_scale9:setAnchorPoint(cc.p(0.5,0.5))
    shangcheng_chongzhi:appendComponent(hg_tqg_bg_scale9)
    hg_tqg_bg_scale9:setPositionInContainer(cc.p(480,320))
    table_shangcheng_chongzhi["hg_tqg_bg_scale9"] = hg_tqg_bg_scale9

    local wen_left = fc.FExtensionsImage:create()
    wen_left:setImage("nobatch/banzidikuangmeinv_tongyong.png")
    wen_left:setSize(cc.size(220,163))
    wen_left:setAnchorPoint(cc.p(0.5,0.5))
    shangcheng_chongzhi:appendComponent(wen_left)
    wen_left:setPositionInContainer(cc.p(110,147.5))
    table_shangcheng_chongzhi["wen_left"] = wen_left

    local wen_r = fc.FExtensionsImage:create()
    wen_r:setImage("nobatch/banzidikuangmeinv_tongyong.png")
    wen_r:setSize(cc.size(220,163))
    wen_r:setFlipType(2)
    wen_r:setAnchorPoint(cc.p(0.5,0.5))
    shangcheng_chongzhi:appendComponent(wen_r)
    wen_r:setPositionInContainer(cc.p(850,147.5))
    table_shangcheng_chongzhi["wen_r"] = wen_r

    local wen_lb = fc.FExtensionsImage:create()
    wen_lb:setImage("nobatch/banzidikuangmeinv_tongyong.png")
    wen_lb:setSize(cc.size(220,163))
    wen_lb:setFlipType(4)
    wen_lb:setAnchorPoint(cc.p(0.5,0.5))
    shangcheng_chongzhi:appendComponent(wen_lb)
    wen_lb:setPositionInContainer(cc.p(110,558.5))
    table_shangcheng_chongzhi["wen_lb"] = wen_lb

    local wen_rb = fc.FExtensionsImage:create()
    wen_rb:setImage("nobatch/banzidikuangmeinv_tongyong.png")
    wen_rb:setSize(cc.size(220,163))
    wen_rb:setFlipType(8)
    wen_rb:setAnchorPoint(cc.p(0.5,0.5))
    shangcheng_chongzhi:appendComponent(wen_rb)
    wen_rb:setPositionInContainer(cc.p(850,558.5))
    table_shangcheng_chongzhi["wen_rb"] = wen_rb

    local title_bgL = fc.FExtensionsImage:create()
    title_bgL:setImage("nobatch/title_hougong.png")
    title_bgL:setSize(cc.size(480,67))
    title_bgL:setAnchorPoint(cc.p(0.5,0.5))
    shangcheng_chongzhi:appendComponent(title_bgL)
    title_bgL:setPositionInContainer(cc.p(241,96.5))
    table_shangcheng_chongzhi["title_bgL"] = title_bgL

    local title_bgR = fc.FExtensionsImage:create()
    title_bgR:setImage("nobatch/title_hougong.png")
    title_bgR:setSize(cc.size(480,67))
    title_bgR:setFlipType(2)
    title_bgR:setAnchorPoint(cc.p(0.5,0.5))
    shangcheng_chongzhi:appendComponent(title_bgR)
    title_bgR:setPositionInContainer(cc.p(721,96.5))
    table_shangcheng_chongzhi["title_bgR"] = title_bgR

    local sc_cz_dangqian_vip_num = fc.FAnimationLabel:create("",g_game.g_resourceManager:getImageFontPath(g_game.g_f_image_font_type.F_YELLOW_TYPE))
    sc_cz_dangqian_vip_num:setAnchorPoint(cc.p(0.5,0.5))
    sc_cz_dangqian_vip_num:setSize(cc.size(70,30))
    sc_cz_dangqian_vip_num:setScale(1)
    shangcheng_chongzhi:appendComponent(sc_cz_dangqian_vip_num)
    sc_cz_dangqian_vip_num:setPositionInContainer(cc.p(212,106))
    table_shangcheng_chongzhi["sc_cz_dangqian_vip_num"] = sc_cz_dangqian_vip_num

    local sc_cz_loading_bar = fc.FLoadingBar:create()
   sc_cz_loading_bar:setLoadingBarBgImage("batch_ui/jindutiao2_goumai.png")
    sc_cz_loading_bar:setLoadingBarImage("batch_ui/jindutiao_1.png")
    sc_cz_loading_bar:setSize(cc.size(317,19))
    sc_cz_loading_bar:setAnchorPoint(cc.p(0.5,0.5))
    sc_cz_loading_bar:setPercent(50)
    shangcheng_chongzhi:appendComponent(sc_cz_loading_bar)
    sc_cz_loading_bar:setPositionInContainer(cc.p(480.5,115.5))
    table_shangcheng_chongzhi["sc_cz_loading_bar"] = sc_cz_loading_bar

    local sc_cz_shengzhi_vip_num = fc.FAnimationLabel:create("",g_game.g_resourceManager:getImageFontPath(g_game.g_f_image_font_type.F_YELLOW_TYPE))
    sc_cz_shengzhi_vip_num:setAnchorPoint(cc.p(0.5,0.5))
    sc_cz_shengzhi_vip_num:setSize(cc.size(70,30))
    sc_cz_shengzhi_vip_num:setScale(1)
    shangcheng_chongzhi:appendComponent(sc_cz_shengzhi_vip_num)
    sc_cz_shengzhi_vip_num:setPositionInContainer(cc.p(902,106))
    table_shangcheng_chongzhi["sc_cz_shengzhi_vip_num"] = sc_cz_shengzhi_vip_num

    local title_bg1 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/zongjiachengdikuang_tangquanxinggong.png",cc.rect(62,0,2,29))
    title_bg1:setSize(cc.size(400,35))
    title_bg1:setAnchorPoint(cc.p(0.5,0.5))
    title_bg1:setScaleY(-1)
    shangcheng_chongzhi:appendComponent(title_bg1)
    title_bg1:setPositionInContainer(cc.p(480,85.5))
    table_shangcheng_chongzhi["title_bg1"] = title_bg1

    local sc_cz_zaichongzhi_label = fc.FLabel:createBMFont()
    sc_cz_zaichongzhi_label:setSize(cc.size(70,30))
    sc_cz_zaichongzhi_label:setAnchorPoint(cc.p(0.5,0.5))
    sc_cz_zaichongzhi_label:setFontSize(20)
    sc_cz_zaichongzhi_label:setString("再充值")
    sc_cz_zaichongzhi_label:setColor(cc.c3b(0,255,255))
    shangcheng_chongzhi:appendComponent(sc_cz_zaichongzhi_label)
    sc_cz_zaichongzhi_label:setPositionInContainer(cc.p(390,81))
    table_shangcheng_chongzhi["sc_cz_zaichongzhi_label"] = sc_cz_zaichongzhi_label

    local sc_cz_zaichongzhi_num_label = fc.FLabel:createBMFont()
    sc_cz_zaichongzhi_num_label:setSize(cc.size(70,30))
    sc_cz_zaichongzhi_num_label:setAnchorPoint(cc.p(0.5,0.5))
    sc_cz_zaichongzhi_num_label:setFontSize(21)
    sc_cz_zaichongzhi_num_label:setString("9999")
    sc_cz_zaichongzhi_num_label:setColor(cc.c3b(0,255,255))
    shangcheng_chongzhi:appendComponent(sc_cz_zaichongzhi_num_label)
    sc_cz_zaichongzhi_num_label:setPositionInContainer(cc.p(570,81))
    table_shangcheng_chongzhi["sc_cz_zaichongzhi_num_label"] = sc_cz_zaichongzhi_num_label

    local yuanbao = fc.FExtensionsImage:create()
    yuanbao:setImage("batch_ui/yuanbao2_shangcheng.png")
    yuanbao:setSize(cc.size(50,35))
    yuanbao:setAnchorPoint(cc.p(0.5,0.5))
    shangcheng_chongzhi:appendComponent(yuanbao)
    yuanbao:setPositionInContainer(cc.p(502,84.5))
    table_shangcheng_chongzhi["yuanbao"] = yuanbao

    local dangqian_label = fc.FLabel:createBMFont()
    dangqian_label:setSize(cc.size(70,30))
    dangqian_label:setAnchorPoint(cc.p(0.5,0.5))
    dangqian_label:setFontSize(20)
    if LANGUAGE_TYPE == 3 then
    	 dangqian_label:setString("當前")
    else
    	 dangqian_label:setString("当前")
    end
    dangqian_label:setColor(cc.c3b(250,255,165))
    shangcheng_chongzhi:appendComponent(dangqian_label)
    dangqian_label:setPositionInContainer(cc.p(62,102))
    table_shangcheng_chongzhi["dangqian_label"] = dangqian_label

    local vipIcon = fc.FExtensionsImage:create()
    vipIcon:setImage("batch_ui/VIP.png")
    vipIcon:setSize(cc.size(83,42))
    vipIcon:setAnchorPoint(cc.p(0.5,0.5))
    shangcheng_chongzhi:appendComponent(vipIcon)
    vipIcon:setPositionInContainer(cc.p(135.5,99))
    table_shangcheng_chongzhi["vipIcon"] = vipIcon

    local fuhao_label = fc.FLabel:createBMFont()
    fuhao_label:setSize(cc.size(70,30))
    fuhao_label:setAnchorPoint(cc.p(0.5,0.5))
    fuhao_label:setFontSize(20)
    fuhao_label:setString(">>")
    fuhao_label:setColor(cc.c3b(250,255,165))
    shangcheng_chongzhi:appendComponent(fuhao_label)
    fuhao_label:setPositionInContainer(cc.p(261,103))
    table_shangcheng_chongzhi["fuhao_label"] = fuhao_label

    local shengjidao_label = fc.FLabel:createBMFont()
    shengjidao_label:setSize(cc.size(70,30))
    shengjidao_label:setAnchorPoint(cc.p(0.5,0.5))
    shengjidao_label:setFontSize(20)
    if LANGUAGE_TYPE== 3 then
    	shengjidao_label:setString(">>升級後")
    else
    	shengjidao_label:setString(">>升级后")
    end
    shengjidao_label:setColor(cc.c3b(250,255,165))
    shangcheng_chongzhi:appendComponent(shengjidao_label)
    shengjidao_label:setPositionInContainer(cc.p(739,102))
    table_shangcheng_chongzhi["shengjidao_label"] = shengjidao_label

    local title_bg = fc.FExtensionsImage:create()
    title_bg:setImage("nobatch/title_3.png")
    title_bg:setSize(cc.size(1200,89))
    title_bg:setAnchorPoint(cc.p(0.5,0.5))
    shangcheng_chongzhi:appendComponent(title_bg)
    title_bg:setPositionInContainer(cc.p(480,22.5))
    table_shangcheng_chongzhi["title_bg"] = title_bg

    local sc_cz_close_button = fc.FScaleButton:create()
    sc_cz_close_button:setSize(cc.size(41,45))
    sc_cz_close_button:setAnchorPoint(cc.p(0.5,0.5))
    sc_cz_close_button:setButtonImage("batch_ui/guanbi_anniu2.png")
    shangcheng_chongzhi:appendComponent(sc_cz_close_button)
    sc_cz_close_button:setPositionInContainer(cc.p(927.5,37.5))
    table_shangcheng_chongzhi["sc_cz_close_button"] = sc_cz_close_button

    local chong = fc.FExtensionsImage:create()
    chong:setImage("batch_ui/chong1.png")
    chong:setSize(cc.size(59,59))
    chong:setAnchorPoint(cc.p(0.5,0.5))
    shangcheng_chongzhi:appendComponent(chong)
    chong:setPositionInContainer(cc.p(420.5,38.5))
    table_shangcheng_chongzhi["chong"] = chong

    local zhi = fc.FExtensionsImage:create()
    zhi:setImage("batch_ui/zhi (2).png")
    zhi:setSize(cc.size(59,59))
    zhi:setAnchorPoint(cc.p(0.5,0.5))
    shangcheng_chongzhi:appendComponent(zhi)
    zhi:setPositionInContainer(cc.p(539.5,38.5))
    table_shangcheng_chongzhi["zhi"] = zhi

    local vipIcon1 = fc.FExtensionsImage:create()
    vipIcon1:setImage("batch_ui/VIP.png")
    vipIcon1:setSize(cc.size(83,42))
    vipIcon1:setAnchorPoint(cc.p(0.5,0.5))
    shangcheng_chongzhi:appendComponent(vipIcon1)
    vipIcon1:setPositionInContainer(cc.p(825.5,99))
    table_shangcheng_chongzhi["vipIcon1"] = vipIcon1

    local sc_cz_vip_zhuizi_button = fc.FScaleButton:create()
    sc_cz_vip_zhuizi_button:setSize(cc.size(157,61))
    sc_cz_vip_zhuizi_button:setAnchorPoint(cc.p(0.5,0.5))
    sc_cz_vip_zhuizi_button:setButtonImage("batch_ui/viptequan.png")
    shangcheng_chongzhi:appendComponent(sc_cz_vip_zhuizi_button)
    sc_cz_vip_zhuizi_button:setPositionInContainer(cc.p(184.5,38.5))
    table_shangcheng_chongzhi["sc_cz_vip_zhuizi_button"] = sc_cz_vip_zhuizi_button

    local sc_redframe = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongbiankuang3_tangquanxinggong.png",cc.rect(0,27,7,2))
    sc_redframe:setSize(cc.size(7,452))
    sc_redframe:setAnchorPoint(cc.p(0.5,0.5))
    shangcheng_chongzhi:appendComponent(sc_redframe)
    sc_redframe:setPositionInContainer(cc.p(3.5,382))
    table_shangcheng_chongzhi["sc_redframe"] = sc_redframe

    local sc_redframe = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongbiankuang3_tangquanxinggong.png",cc.rect(0,27,7,2))
    sc_redframe:setSize(cc.size(7,452))
    sc_redframe:setAnchorPoint(cc.p(0.5,0.5))
    shangcheng_chongzhi:appendComponent(sc_redframe)
    sc_redframe:setPositionInContainer(cc.p(274.5,382))
    table_shangcheng_chongzhi["sc_redframe"] = sc_redframe

    local sc_titlebg2 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/zongjiachengdikuang_tangquanxinggong.png",cc.rect(62,0,2,29))
    sc_titlebg2:setSize(cc.size(278,29))
    sc_titlebg2:setAnchorPoint(cc.p(0.5,0.5))
    sc_titlebg2:setScaleY(-1)
    shangcheng_chongzhi:appendComponent(sc_titlebg2)
    sc_titlebg2:setPositionInContainer(cc.p(139,169.5))
    table_shangcheng_chongzhi["sc_titlebg2"] = sc_titlebg2

    local sc_titlebg3 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/zongjiachengdikuang_tangquanxinggong.png",cc.rect(62,0,2,29))
    sc_titlebg3:setSize(cc.size(278,29))
    sc_titlebg3:setAnchorPoint(cc.p(0.5,0.5))
    shangcheng_chongzhi:appendComponent(sc_titlebg3)
    sc_titlebg3:setPositionInContainer(cc.p(139,593.5))
    table_shangcheng_chongzhi["sc_titlebg3"] = sc_titlebg3

    local sc_monthcard_icon = fc.FExtensionsImage:create()
    sc_monthcard_icon:setImage("nobatch/yuekalibao_r.png")
    sc_monthcard_icon:setSize(cc.size(182,183))
    sc_monthcard_icon:setAnchorPoint(cc.p(0.5,0.5))
    shangcheng_chongzhi:appendComponent(sc_monthcard_icon)
    sc_monthcard_icon:setPositionInContainer(cc.p(91,237.5))
    table_shangcheng_chongzhi["sc_monthcard_icon"] = sc_monthcard_icon

    local sc_monthcard_title = fc.FExtensionsImage:create()
    sc_monthcard_title:setImage("batch_ui/yuekalibao_f.png")
    sc_monthcard_title:setSize(cc.size(156,49))
    sc_monthcard_title:setAnchorPoint(cc.p(0.5,0.5))
    shangcheng_chongzhi:appendComponent(sc_monthcard_title)
    sc_monthcard_title:setPositionInContainer(cc.p(193,175.5))
    table_shangcheng_chongzhi["sc_monthcard_title"] = sc_monthcard_title

    local sc_monthcard_btn = fc.FScaleButton:create()
    sc_monthcard_btn:setSize(cc.size(144,51))
    sc_monthcard_btn:setAnchorPoint(cc.p(0.5,0.5))
    sc_monthcard_btn:setButtonImage("batch_ui/goumai_anniu.png")
    shangcheng_chongzhi:appendComponent(sc_monthcard_btn)
    sc_monthcard_btn:setPositionInContainer(cc.p(201,239.5))
    table_shangcheng_chongzhi["sc_monthcard_btn"] = sc_monthcard_btn

    local sc_monthcard_btn_gou = fc.FExtensionsImage:create()
    sc_monthcard_btn_gou:setImage("batch_ui/gou_uizi.png")
    sc_monthcard_btn_gou:setSize(cc.size(32,32))
    sc_monthcard_btn_gou:setAnchorPoint(cc.p(0.5,0.5))
    sc_monthcard_btn:appendComponent(sc_monthcard_btn_gou)
    sc_monthcard_btn_gou:setPositionInContainer(cc.p(45,23))
    table_shangcheng_chongzhi["sc_monthcard_btn_gou"] = sc_monthcard_btn_gou

    local sc_monthcard_btn_mai = fc.FExtensionsImage:create()
    sc_monthcard_btn_mai:setImage("batch_ui/mai_uizi.png")
    sc_monthcard_btn_mai:setSize(cc.size(32,32))
    sc_monthcard_btn_mai:setAnchorPoint(cc.p(0.5,0.5))
    sc_monthcard_btn:appendComponent(sc_monthcard_btn_mai)
    sc_monthcard_btn_mai:setPositionInContainer(cc.p(95,23))
    table_shangcheng_chongzhi["sc_monthcard_btn_mai"] = sc_monthcard_btn_mai

    local sc_monthcard_limit1 = fc.FLabel:createBMFont()
    sc_monthcard_limit1:setSize(cc.size(210,30))
    sc_monthcard_limit1:setAnchorPoint(cc.p(0.5,0.5))
    sc_monthcard_limit1:setFontSize(20)
    sc_monthcard_limit1:setString("分20次领取，每月限购")
    sc_monthcard_limit1:setColor(cc.c3b(255,255,255))
    shangcheng_chongzhi:appendComponent(sc_monthcard_limit1)
    sc_monthcard_limit1:setPositionInContainer(cc.p(110,354))
    table_shangcheng_chongzhi["sc_monthcard_limit1"] = sc_monthcard_limit1

    local sc_monthcard_limit2 = fc.FExtensionsImage:create()
    sc_monthcard_limit2:setImage("batch_ui/yuekalibao_1.png")
    sc_monthcard_limit2:setSize(cc.size(18,30))
    sc_monthcard_limit2:setAnchorPoint(cc.p(0.5,0.5))
    shangcheng_chongzhi:appendComponent(sc_monthcard_limit2)
    sc_monthcard_limit2:setPositionInContainer(cc.p(228,354))
    table_shangcheng_chongzhi["sc_monthcard_limit2"] = sc_monthcard_limit2

    local sc_monthcard_limit3 = fc.FLabel:createBMFont()
    sc_monthcard_limit3:setSize(cc.size(30,30))
    sc_monthcard_limit3:setAnchorPoint(cc.p(0.5,0.5))
    sc_monthcard_limit3:setFontSize(20)
    sc_monthcard_limit3:setString("次")
    sc_monthcard_limit3:setColor(cc.c3b(255,255,0))
    shangcheng_chongzhi:appendComponent(sc_monthcard_limit3)
    sc_monthcard_limit3:setPositionInContainer(cc.p(256,354))
    table_shangcheng_chongzhi["sc_monthcard_limit3"] = sc_monthcard_limit3

    local sc_monthcard_price_bg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shuruwenzi.png",cc.rect(20,10,3,10))
    sc_monthcard_price_bg:setSize(cc.size(84,24))
    sc_monthcard_price_bg:setAnchorPoint(cc.p(0.5,0.5))
    shangcheng_chongzhi:appendComponent(sc_monthcard_price_bg)
    sc_monthcard_price_bg:setPositionInContainer(cc.p(221,287))
    table_shangcheng_chongzhi["sc_monthcard_price_bg"] = sc_monthcard_price_bg

    local sc_monthcard_price = fc.FLabel:createBMFont()
    sc_monthcard_price:setSize(cc.size(79,30))
    sc_monthcard_price:setAnchorPoint(cc.p(0.5,0.5))
    sc_monthcard_price:setFontSize(20)
    if LANGUAGE_TYPE == 3 then
    	 sc_monthcard_price:setString("NT$5000")
    else
    	 sc_monthcard_price:setString("￥5000")
    end
    
   
    sc_monthcard_price:setColor(cc.c3b(0,255,255))
    shangcheng_chongzhi:appendComponent(sc_monthcard_price)
    sc_monthcard_price:setPositionInContainer(cc.p(220.5,284))
    table_shangcheng_chongzhi["sc_monthcard_price"] = sc_monthcard_price

    return table_shangcheng_chongzhi

end

