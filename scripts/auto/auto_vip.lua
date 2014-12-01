function createvip()

    local table_vip = {}

    local vip = fc.FContainerPanel:create()
    vip:setSize(cc.size(960,640))
    table_vip["vip"] = vip

    local hg_tqg_bg_scale9 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/banzidikuangmeinv2_tongyong.png",cc.rect(2,2,1,1))
    hg_tqg_bg_scale9:setSize(cc.size(960,640))
    hg_tqg_bg_scale9:setAnchorPoint(cc.p(0.5,0.5))
    vip:appendComponent(hg_tqg_bg_scale9)
    hg_tqg_bg_scale9:setPositionInContainer(cc.p(480,320))
    table_vip["hg_tqg_bg_scale9"] = hg_tqg_bg_scale9

    local wen_left = fc.FExtensionsImage:create()
    wen_left:setImage("nobatch/banzidikuangmeinv_tongyong.png")
    wen_left:setSize(cc.size(220,163))
    wen_left:setAnchorPoint(cc.p(0.5,0.5))
    vip:appendComponent(wen_left)
    wen_left:setPositionInContainer(cc.p(110,147.5))
    table_vip["wen_left"] = wen_left

    local wen_r = fc.FExtensionsImage:create()
    wen_r:setImage("nobatch/banzidikuangmeinv_tongyong.png")
    wen_r:setSize(cc.size(220,163))
    wen_r:setFlipType(2)
    wen_r:setAnchorPoint(cc.p(0.5,0.5))
    vip:appendComponent(wen_r)
    wen_r:setPositionInContainer(cc.p(850,147.5))
    table_vip["wen_r"] = wen_r

    local title_bgL = fc.FExtensionsImage:create()
    title_bgL:setImage("nobatch/title_hougong.png")
    title_bgL:setSize(cc.size(480,67))
    title_bgL:setAnchorPoint(cc.p(0.5,0.5))
    vip:appendComponent(title_bgL)
    title_bgL:setPositionInContainer(cc.p(240,93.5))
    table_vip["title_bgL"] = title_bgL

    local title_bgR = fc.FExtensionsImage:create()
    title_bgR:setImage("nobatch/title_hougong.png")
    title_bgR:setSize(cc.size(480,67))
    title_bgR:setFlipType(2)
    title_bgR:setAnchorPoint(cc.p(0.5,0.5))
    vip:appendComponent(title_bgR)
    title_bgR:setPositionInContainer(cc.p(720,93.5))
    table_vip["title_bgR"] = title_bgR

    local title_bg1 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/zongjiachengdikuang_tangquanxinggong.png",cc.rect(62,0,2,29))
    title_bg1:setSize(cc.size(400,35))
    title_bg1:setAnchorPoint(cc.p(0.5,0.5))
    title_bg1:setScaleY(-1)
    vip:appendComponent(title_bg1)
    title_bg1:setPositionInContainer(cc.p(479,82.5))
    table_vip["title_bg1"] = title_bg1

    local wen_lb = fc.FExtensionsImage:create()
    wen_lb:setImage("nobatch/banzidikuangmeinv_tongyong.png")
    wen_lb:setSize(cc.size(220,163))
    wen_lb:setFlipType(4)
    wen_lb:setAnchorPoint(cc.p(0.5,0.5))
    vip:appendComponent(wen_lb)
    wen_lb:setPositionInContainer(cc.p(110,558.5))
    table_vip["wen_lb"] = wen_lb

    local wen_rb = fc.FExtensionsImage:create()
    wen_rb:setImage("nobatch/banzidikuangmeinv_tongyong.png")
    wen_rb:setSize(cc.size(220,163))
    wen_rb:setFlipType(8)
    wen_rb:setAnchorPoint(cc.p(0.5,0.5))
    vip:appendComponent(wen_rb)
    wen_rb:setPositionInContainer(cc.p(850,558.5))
    table_vip["wen_rb"] = wen_rb

    local vip_zaichongzhi_label = fc.FLabel:createBMFont()
    vip_zaichongzhi_label:setSize(cc.size(70,30))
    vip_zaichongzhi_label:setAnchorPoint(cc.p(0.5,0.5))
    vip_zaichongzhi_label:setFontSize(20)
    vip_zaichongzhi_label:setString("再充值")
    vip_zaichongzhi_label:setColor(cc.c3b(0,255,255))
    vip:appendComponent(vip_zaichongzhi_label)
    vip_zaichongzhi_label:setPositionInContainer(cc.p(377,79))
    table_vip["vip_zaichongzhi_label"] = vip_zaichongzhi_label

    local vip_zaichongzhi_num_label = fc.FLabel:createBMFont()
    vip_zaichongzhi_num_label:setSize(cc.size(70,30))
    vip_zaichongzhi_num_label:setAnchorPoint(cc.p(0.5,0.5))
    vip_zaichongzhi_num_label:setFontSize(21)
    vip_zaichongzhi_num_label:setString("9999")
    vip_zaichongzhi_num_label:setColor(cc.c3b(0,255,255))
    vip:appendComponent(vip_zaichongzhi_num_label)
    vip_zaichongzhi_num_label:setPositionInContainer(cc.p(573,79))
    table_vip["vip_zaichongzhi_num_label"] = vip_zaichongzhi_num_label

    local vip_loading_bar = fc.FLoadingBar:create()
    vip_loading_bar:setLoadingBarBgImage("batch_ui/jindutiaokuang_VIP.png")
    vip_loading_bar:setLoadingBarImage("batch_ui/jindutiao_VIP.png")
    vip_loading_bar:setSize(cc.size(233,19))
    vip_loading_bar:setAnchorPoint(cc.p(0.5,0.5))
    vip_loading_bar:setPercent(50)
    vip:appendComponent(vip_loading_bar)
    vip_loading_bar:setPositionInContainer(cc.p(479.5,112.5))
    table_vip["vip_loading_bar"] = vip_loading_bar

    local vip_dangqian_vip_image = fc.FExtensionsImage:create()
    vip_dangqian_vip_image:setImage("batch_ui/VIP.png")
    vip_dangqian_vip_image:setSize(cc.size(83,42))
    vip_dangqian_vip_image:setAnchorPoint(cc.p(0.5,0.5))
    vip:appendComponent(vip_dangqian_vip_image)
    vip_dangqian_vip_image:setPositionInContainer(cc.p(138.5,97))
    table_vip["vip_dangqian_vip_image"] = vip_dangqian_vip_image

    local vip_shengzhi_vip_image = fc.FExtensionsImage:create()
    vip_shengzhi_vip_image:setImage("batch_ui/VIP.png")
    vip_shengzhi_vip_image:setSize(cc.size(83,42))
    vip_shengzhi_vip_image:setAnchorPoint(cc.p(0.5,0.5))
    vip:appendComponent(vip_shengzhi_vip_image)
    vip_shengzhi_vip_image:setPositionInContainer(cc.p(827.5,97))
    table_vip["vip_shengzhi_vip_image"] = vip_shengzhi_vip_image

    local title_bg = fc.FExtensionsImage:create()
    title_bg:setImage("nobatch/title_3.png")
    title_bg:setSize(cc.size(1200,89))
    title_bg:setAnchorPoint(cc.p(0.5,0.5))
    vip:appendComponent(title_bg)
    title_bg:setPositionInContainer(cc.p(480,22.5))
    table_vip["title_bg"] = title_bg

    local vip_close_button = fc.FScaleButton:create()
    vip_close_button:setSize(cc.size(52,52))
    vip_close_button:setAnchorPoint(cc.p(0.5,0.5))
    vip_close_button:setButtonImage("batch_ui/guanbi_up.png")
    vip:appendComponent(vip_close_button)
    vip_close_button:setPositionInContainer(cc.p(927,48))
    table_vip["vip_close_button"] = vip_close_button

    local te = fc.FExtensionsImage:create()
    te:setImage("batch_ui/te.png")
    te:setSize(cc.size(59,59))
    te:setAnchorPoint(cc.p(0.5,0.5))
    vip:appendComponent(te)
    te:setPositionInContainer(cc.p(510.5,34.5))
    table_vip["te"] = te

    local quan = fc.FExtensionsImage:create()
    quan:setImage("batch_ui/quan.png")
    quan:setSize(cc.size(59,59))
    quan:setAnchorPoint(cc.p(0.5,0.5))
    vip:appendComponent(quan)
    quan:setPositionInContainer(cc.p(579.5,34.5))
    table_vip["quan"] = quan

    local v = fc.FExtensionsImage:create()
    v:setImage("batch_ui/V.png")
    v:setSize(cc.size(59,59))
    v:setAnchorPoint(cc.p(0.5,0.5))
    vip:appendComponent(v)
    v:setPositionInContainer(cc.p(380.5,36.5))
    table_vip["v"] = v

    local i = fc.FExtensionsImage:create()
    i:setImage("batch_ui/I.png")
    i:setSize(cc.size(59,59))
    i:setAnchorPoint(cc.p(0.5,0.5))
    vip:appendComponent(i)
    i:setPositionInContainer(cc.p(415.5,36.5))
    table_vip["i"] = i

    local p = fc.FExtensionsImage:create()
    p:setImage("batch_ui/P.png")
    p:setSize(cc.size(59,59))
    p:setAnchorPoint(cc.p(0.5,0.5))
    vip:appendComponent(p)
    p:setPositionInContainer(cc.p(449.5,36.5))
    table_vip["p"] = p

    local yuanbao = fc.FExtensionsImage:create()
    yuanbao:setImage("batch_ui/yuanbao2_shangcheng.png")
    yuanbao:setSize(cc.size(50,35))
    yuanbao:setAnchorPoint(cc.p(0.5,0.5))
    vip:appendComponent(yuanbao)
    yuanbao:setPositionInContainer(cc.p(505,82.5))
    table_vip["yuanbao"] = yuanbao

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
    vip:appendComponent(dangqian_label)
    dangqian_label:setPositionInContainer(cc.p(62,97))
    table_vip["dangqian_label"] = dangqian_label

    local fuhao_label = fc.FLabel:createBMFont()
    fuhao_label:setSize(cc.size(70,30))
    fuhao_label:setAnchorPoint(cc.p(0.5,0.5))
    fuhao_label:setFontSize(20)
    fuhao_label:setString(">>")
    fuhao_label:setColor(cc.c3b(250,255,165))
    vip:appendComponent(fuhao_label)
    fuhao_label:setPositionInContainer(cc.p(261,98))
    table_vip["fuhao_label"] = fuhao_label

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
    vip:appendComponent(shengjidao_label)
    shengjidao_label:setPositionInContainer(cc.p(739,97))
    table_vip["shengjidao_label"] = shengjidao_label

    local zhou = fc.FExtensionsImage:create()
    zhou:setImage("nobatch/shengzhi_zhou.png")
    zhou:setSize(cc.size(40,480))
    zhou:setAnchorPoint(cc.p(0.5,0.5))
    vip:appendComponent(zhou)
    zhou:setPositionInContainer(cc.p(19,362))
    table_vip["zhou"] = zhou

    local vip_pre_page_button = fc.FScaleButton:create()
    vip_pre_page_button:setSize(cc.size(38,60))
    vip_pre_page_button:setAnchorPoint(cc.p(0.5,0.5))
    vip_pre_page_button:setButtonImage("batch_ui/jiantou2.png")
    vip:appendComponent(vip_pre_page_button)
    vip_pre_page_button:setPositionInContainer(cc.p(19,400))
    table_vip["vip_pre_page_button"] = vip_pre_page_button

    local bottomBg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/zongjiachengdikuang_tangquanxinggong.png",cc.rect(62,0,2,29))
    bottomBg:setSize(cc.size(960,45))
    bottomBg:setAnchorPoint(cc.p(0.5,0.5))
    vip:appendComponent(bottomBg)
    bottomBg:setPositionInContainer(cc.p(480,617.5))
    table_vip["bottomBg"] = bottomBg

    local vip_page_num_label = fc.FLabel:createBMFont()
    vip_page_num_label:setSize(cc.size(70,30))
    vip_page_num_label:setAnchorPoint(cc.p(0.5,0.5))
    vip_page_num_label:setFontSize(21)
    vip_page_num_label:setString("3/15")
    vip_page_num_label:setColor(cc.c3b(255,255,255))
    vip:appendComponent(vip_page_num_label)
    vip_page_num_label:setPositionInContainer(cc.p(480,613))
    table_vip["vip_page_num_label"] = vip_page_num_label

    local zhou = fc.FExtensionsImage:create()
    zhou:setImage("nobatch/shengzhi_zhou.png")
    zhou:setSize(cc.size(40,480))
    zhou:setAnchorPoint(cc.p(0.5,0.5))
    vip:appendComponent(zhou)
    zhou:setPositionInContainer(cc.p(941,362))
    table_vip["zhou"] = zhou

    local vip_back_page_button = fc.FScaleButton:create()
    vip_back_page_button:setSize(cc.size(38,60))
    vip_back_page_button:setAnchorPoint(cc.p(0.5,0.5))
    vip_back_page_button:setButtonImage("batch_ui/jiantou2.png")
    vip_back_page_button:setScaleX(-1)
    vip:appendComponent(vip_back_page_button)
    vip_back_page_button:setPositionInContainer(cc.p(941,400))
    table_vip["vip_back_page_button"] = vip_back_page_button

    local vip_max_level = fc.FLabel:createBMFont()
    vip_max_level:setSize(cc.size(70,30))
    vip_max_level:setAnchorPoint(cc.p(0.5,0.5))
    vip_max_level:setFontSize(20)
    vip_max_level:setString("您已达到最高级VIP了")
    vip_max_level:setColor(cc.c3b(0,255,255))
    vip:appendComponent(vip_max_level)
    vip_max_level:setPositionInContainer(cc.p(479,107))
    table_vip["vip_max_level"] = vip_max_level

    return table_vip

end

