function createzhanyi_waikuang()

    local table_zhanyi_waikuang = {}

    local zhanyi_waikuang = fc.FContainerPanel:create()
    zhanyi_waikuang:setSize(cc.size(960,640))
    table_zhanyi_waikuang["zhanyi_waikuang"] = zhanyi_waikuang

    local zy_wk_bg_scale9 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/ditu_lan.png",cc.rect(2,2,2,2))
    zy_wk_bg_scale9:setSize(cc.size(960,640))
    zy_wk_bg_scale9:setAnchorPoint(cc.p(0.5,0.5))
    zhanyi_waikuang:appendComponent(zy_wk_bg_scale9)
    zy_wk_bg_scale9:setPositionInContainer(cc.p(480,320))
    table_zhanyi_waikuang["zy_wk_bg_scale9"] = zy_wk_bg_scale9

    local wen_l = fc.FExtensionsImage:create()
    wen_l:setImage("nobatch/title_mingchen_.png")
    wen_l:setSize(cc.size(483,67))
    wen_l:setAnchorPoint(cc.p(0.5,0.5))
    zhanyi_waikuang:appendComponent(wen_l)
    wen_l:setPositionInContainer(cc.p(241.5,33.5))
    table_zhanyi_waikuang["wen_l"] = wen_l

    local wen_r = fc.FExtensionsImage:create()
    wen_r:setImage("nobatch/title_mingchen_.png")
    wen_r:setSize(cc.size(483,67))
    wen_r:setFlipType(2)
    wen_r:setAnchorPoint(cc.p(0.5,0.5))
    zhanyi_waikuang:appendComponent(wen_r)
    wen_r:setPositionInContainer(cc.p(718.5,33.5))
    table_zhanyi_waikuang["wen_r"] = wen_r

    local di_wen_l = fc.FExtensionsImage:create()
    di_wen_l:setImage("nobatch/banzidikuang_tongyong.png")
    di_wen_l:setSize(cc.size(220,163))
    di_wen_l:setAnchorPoint(cc.p(0.5,0.5))
    zhanyi_waikuang:appendComponent(di_wen_l)
    di_wen_l:setPositionInContainer(cc.p(110,148.5))
    table_zhanyi_waikuang["di_wen_l"] = di_wen_l

    local di_wen_r = fc.FExtensionsImage:create()
    di_wen_r:setImage("nobatch/banzidikuang_tongyong.png")
    di_wen_r:setSize(cc.size(220,163))
    di_wen_r:setFlipType(2)
    di_wen_r:setAnchorPoint(cc.p(0.5,0.5))
    zhanyi_waikuang:appendComponent(di_wen_r)
    di_wen_r:setPositionInContainer(cc.p(850,148.5))
    table_zhanyi_waikuang["di_wen_r"] = di_wen_r

    local di_wen_lb = fc.FExtensionsImage:create()
    di_wen_lb:setImage("nobatch/banzidikuang_tongyong.png")
    di_wen_lb:setSize(cc.size(220,163))
    di_wen_lb:setFlipType(4)
    di_wen_lb:setAnchorPoint(cc.p(0.5,0.5))
    zhanyi_waikuang:appendComponent(di_wen_lb)
    di_wen_lb:setPositionInContainer(cc.p(110,558.5))
    table_zhanyi_waikuang["di_wen_lb"] = di_wen_lb

    local di_wen_rb = fc.FExtensionsImage:create()
    di_wen_rb:setImage("nobatch/banzidikuang_tongyong.png")
    di_wen_rb:setSize(cc.size(220,163))
    di_wen_rb:setFlipType(8)
    di_wen_rb:setAnchorPoint(cc.p(0.5,0.5))
    zhanyi_waikuang:appendComponent(di_wen_rb)
    di_wen_rb:setPositionInContainer(cc.p(850,558.5))
    table_zhanyi_waikuang["di_wen_rb"] = di_wen_rb

    local zhanyi_guanqia_bg_scale9 = fc.FContainerPanel:create()
    zhanyi_guanqia_bg_scale9:setSize(cc.size(960,245))
    zhanyi_guanqia_bg_scale9:setAnchorPoint(cc.p(0.5,0.5))
    zhanyi_waikuang:appendComponent(zhanyi_guanqia_bg_scale9)
    zhanyi_guanqia_bg_scale9:setPositionInContainer(cc.p(480,516.5))
    table_zhanyi_waikuang["zhanyi_guanqia_bg_scale9"] = zhanyi_guanqia_bg_scale9

    local guanqia_piece = fc.FExtensionsImage:create()
    guanqia_piece:setImage("batch_ui/tuopan1_paibingbuzhen.png")
    guanqia_piece:setSize(cc.size(227,245))
    guanqia_piece:setAnchorPoint(cc.p(0.5,0.5))
    zhanyi_guanqia_bg_scale9:appendComponent(guanqia_piece)
    guanqia_piece:setPositionInContainer(cc.p(113.5,122.5))
    table_zhanyi_waikuang["guanqia_piece"] = guanqia_piece

    local guanqia_piece = fc.FExtensionsImage:create()
    guanqia_piece:setImage("batch_ui/tuopan1_paibingbuzhen.png")
    guanqia_piece:setSize(cc.size(227,245))
    guanqia_piece:setAnchorPoint(cc.p(0.5,0.5))
    zhanyi_guanqia_bg_scale9:appendComponent(guanqia_piece)
    guanqia_piece:setPositionInContainer(cc.p(320.5,122.5))
    table_zhanyi_waikuang["guanqia_piece"] = guanqia_piece

    local guanqia_piece = fc.FExtensionsImage:create()
    guanqia_piece:setImage("batch_ui/tuopan1_paibingbuzhen.png")
    guanqia_piece:setSize(cc.size(227,245))
    guanqia_piece:setAnchorPoint(cc.p(0.5,0.5))
    zhanyi_guanqia_bg_scale9:appendComponent(guanqia_piece)
    guanqia_piece:setPositionInContainer(cc.p(508.5,122.5))
    table_zhanyi_waikuang["guanqia_piece"] = guanqia_piece

    local guanqia_piece = fc.FExtensionsImage:create()
    guanqia_piece:setImage("batch_ui/tuopan1_paibingbuzhen.png")
    guanqia_piece:setSize(cc.size(227,245))
    guanqia_piece:setAnchorPoint(cc.p(0.5,0.5))
    zhanyi_guanqia_bg_scale9:appendComponent(guanqia_piece)
    guanqia_piece:setPositionInContainer(cc.p(673.5,122.5))
    table_zhanyi_waikuang["guanqia_piece"] = guanqia_piece

    local guanqia_piece = fc.FExtensionsImage:create()
    guanqia_piece:setImage("batch_ui/tuopan1_paibingbuzhen.png")
    guanqia_piece:setSize(cc.size(227,245))
    guanqia_piece:setAnchorPoint(cc.p(0.5,0.5))
    zhanyi_guanqia_bg_scale9:appendComponent(guanqia_piece)
    guanqia_piece:setPositionInContainer(cc.p(846.5,122.5))
    table_zhanyi_waikuang["guanqia_piece"] = guanqia_piece

    local zy_paibing_button = fc.FScaleButton:create()
    zy_paibing_button:setSize(cc.size(65,124))
    zy_paibing_button:setAnchorPoint(cc.p(0.5,0.5))
    zy_paibing_button:setButtonImage("batch_ui/huanzhen2_anniu.png")
    zhanyi_waikuang:appendComponent(zy_paibing_button)
    zy_paibing_button:setPositionInContainer(cc.p(927.5,532))
    table_zhanyi_waikuang["zy_paibing_button"] = zy_paibing_button

    local zy_ui_pai = fc.FExtensionsImage:create()
    zy_ui_pai:setImage("batch_ui/pai_uizi.png")
    zy_ui_pai:setSize(cc.size(32,32))
    zy_ui_pai:setAnchorPoint(cc.p(0.5,0.5))
    zy_paibing_button:appendComponent(zy_ui_pai)
    zy_ui_pai:setPositionInContainer(cc.p(49,21))
    table_zhanyi_waikuang["zy_ui_pai"] = zy_ui_pai

    local zy_ui_bing = fc.FExtensionsImage:create()
    zy_ui_bing:setImage("batch_ui/bing_uizi.png")
    zy_ui_bing:setSize(cc.size(32,32))
    zy_ui_bing:setAnchorPoint(cc.p(0.5,0.5))
    zy_paibing_button:appendComponent(zy_ui_bing)
    zy_ui_bing:setPositionInContainer(cc.p(49,48))
    table_zhanyi_waikuang["zy_ui_bing"] = zy_ui_bing

    local zy_ui_bu = fc.FExtensionsImage:create()
    zy_ui_bu:setImage("batch_ui/bu_uizi.png")
    zy_ui_bu:setSize(cc.size(32,32))
    zy_ui_bu:setAnchorPoint(cc.p(0.5,0.5))
    zy_paibing_button:appendComponent(zy_ui_bu)
    zy_ui_bu:setPositionInContainer(cc.p(49,75))
    table_zhanyi_waikuang["zy_ui_bu"] = zy_ui_bu

    local zy_ui_zhen = fc.FExtensionsImage:create()
    zy_ui_zhen:setImage("batch_ui/zhen_uizi.png")
    zy_ui_zhen:setSize(cc.size(32,32))
    zy_ui_zhen:setAnchorPoint(cc.p(0.5,0.5))
    zy_paibing_button:appendComponent(zy_ui_zhen)
    zy_ui_zhen:setPositionInContainer(cc.p(49,102))
    table_zhanyi_waikuang["zy_ui_zhen"] = zy_ui_zhen

    local lian_r = fc.FExtensionsImage:create()
    lian_r:setImage("batch_ui/title_mingchen_2.png")
    lian_r:setSize(cc.size(62,121))
    lian_r:setFlipType(2)
    lian_r:setAnchorPoint(cc.p(0.5,0.5))
    zhanyi_waikuang:appendComponent(lian_r)
    lian_r:setPositionInContainer(cc.p(929,67.5))
    table_zhanyi_waikuang["lian_r"] = lian_r

    local zy_close_button = fc.FScaleButton:create()
    zy_close_button:setSize(cc.size(56,56))
    zy_close_button:setAnchorPoint(cc.p(0.5,0.5))
    zy_close_button:setButtonImage("batch_ui/guanbi_up.png")
    zhanyi_waikuang:appendComponent(zy_close_button)
    zy_close_button:setPositionInContainer(cc.p(931,35))
    table_zhanyi_waikuang["zy_close_button"] = zy_close_button

    local lian_l = fc.FExtensionsImage:create()
    lian_l:setImage("batch_ui/title_mingchen_2.png")
    lian_l:setSize(cc.size(62,121))
    lian_l:setAnchorPoint(cc.p(0.5,0.5))
    zhanyi_waikuang:appendComponent(lian_l)
    lian_l:setPositionInContainer(cc.p(31,67.5))
    table_zhanyi_waikuang["lian_l"] = lian_l

    local title_bg_image = fc.FScale9Image:createWithBatchUIFrame("batch_ui/xingjikuang_tangquanxinggong.png",cc.rect(72,17,2,2))
    title_bg_image:setSize(cc.size(260,50))
    title_bg_image:setAnchorPoint(cc.p(0.5,0.5))
    zhanyi_waikuang:appendComponent(title_bg_image)
    title_bg_image:setPositionInContainer(cc.p(481,36))
    table_zhanyi_waikuang["title_bg_image"] = title_bg_image

    local zy_name_label = fc.FLabel:createBMFont()
    zy_name_label:setSize(cc.size(200,27))
    zy_name_label:setAnchorPoint(cc.p(0.5,0.5))
    zy_name_label:setFontSize(24)
    zy_name_label:setString("鸦片战争")
    zy_name_label:setColor(cc.c3b(250,255,165))
    zhanyi_waikuang:appendComponent(zy_name_label)
    zy_name_label:setPositionInContainer(cc.p(481,35.5))
    table_zhanyi_waikuang["zy_name_label"] = zy_name_label

    local title_liangcao = fc.FLabel:createBMFont()
    title_liangcao:setSize(cc.size(70,26))
    title_liangcao:setAnchorPoint(cc.p(0.5,0.5))
    title_liangcao:setFontSize(20)
    if LANGUAGE_TYPE == 3 then
    	title_liangcao:setString("糧草")
    else	
    	title_liangcao:setString("粮草")
    end
    
    title_liangcao:setColor(cc.c3b(250,255,165))
    zhanyi_waikuang:appendComponent(title_liangcao)
    title_liangcao:setPositionInContainer(cc.p(692,40))
    table_zhanyi_waikuang["title_liangcao"] = title_liangcao

    local liangcao_num_di = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shuruwenzi.png",cc.rect(11,9,47,7))
    liangcao_num_di:setSize(cc.size(140,28))
    liangcao_num_di:setAnchorPoint(cc.p(0.5,0.5))
    zhanyi_waikuang:appendComponent(liangcao_num_di)
    liangcao_num_di:setPositionInContainer(cc.p(799,41))
    table_zhanyi_waikuang["liangcao_num_di"] = liangcao_num_di

    local zy_tili_num_label = fc.FLabel:createBMFont()
    zy_tili_num_label:setSize(cc.size(70,26))
    zy_tili_num_label:setAnchorPoint(cc.p(0.5,0.5))
    zy_tili_num_label:setFontSize(20)
    zy_tili_num_label:setString("50/100")
    zy_tili_num_label:setColor(cc.c3b(255,255,255))
    zhanyi_waikuang:appendComponent(zy_tili_num_label)
    zy_tili_num_label:setPositionInContainer(cc.p(799,39))
    table_zhanyi_waikuang["zy_tili_num_label"] = zy_tili_num_label

    local zy_bar1 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongbiankuang3_ciguan.png",cc.rect(46,5,2,2))
    zy_bar1:setSize(cc.size(960,13))
    zy_bar1:setAnchorPoint(cc.p(0.5,0.5))
    zhanyi_waikuang:appendComponent(zy_bar1)
    zy_bar1:setPositionInContainer(cc.p(480,391.5))
    table_zhanyi_waikuang["zy_bar1"] = zy_bar1

    local zy_big_zuo1 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/zongjiachengdikuang_paibingbuzhen.png",cc.rect(62,0,2,29))
    zy_big_zuo1:setSize(cc.size(960,31))
    zy_big_zuo1:setAnchorPoint(cc.p(0.5,0.5))
    zhanyi_waikuang:appendComponent(zy_big_zuo1)
    zy_big_zuo1:setPositionInContainer(cc.p(480,372.5))
    table_zhanyi_waikuang["zy_big_zuo1"] = zy_big_zuo1

    local zy_bar2 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongbiankuang3_ciguan.png",cc.rect(46,5,2,2))
    zy_bar2:setSize(cc.size(320,13))
    zy_bar2:setAnchorPoint(cc.p(0.5,0.5))
    zhanyi_waikuang:appendComponent(zy_bar2)
    zy_bar2:setPositionInContainer(cc.p(160,73.5))
    table_zhanyi_waikuang["zy_bar2"] = zy_bar2

    local zy_bar3 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongbiankuang3_ciguan.png",cc.rect(46,5,2,2))
    zy_bar3:setSize(cc.size(320,13))
    zy_bar3:setAnchorPoint(cc.p(0.5,0.5))
    zhanyi_waikuang:appendComponent(zy_bar3)
    zy_bar3:setPositionInContainer(cc.p(480,73.5))
    table_zhanyi_waikuang["zy_bar3"] = zy_bar3

    local zy_bar4 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongbiankuang3_ciguan.png",cc.rect(46,5,2,2))
    zy_bar4:setSize(cc.size(320,13))
    zy_bar4:setAnchorPoint(cc.p(0.5,0.5))
    zhanyi_waikuang:appendComponent(zy_bar4)
    zy_bar4:setPositionInContainer(cc.p(800,73.5))
    table_zhanyi_waikuang["zy_bar4"] = zy_bar4

    local zy_color_bg = fc.FShaderExtensionsImage:create(0)
    zy_color_bg:setAnchorPoint(cc.p(0.5,0.5))
    zy_color_bg:setImage("batch_ui/meinvpinzhi_zi.png")
    zy_color_bg:setSize(cc.size(310,230))
    zhanyi_waikuang:appendComponent(zy_color_bg)
    zy_color_bg:setPositionInContainer(cc.p(163,237))
    table_zhanyi_waikuang["zy_color_bg"] = zy_color_bg

    local zy_color_bg = fc.FShaderExtensionsImage:create(0)
    zy_color_bg:setAnchorPoint(cc.p(0.5,0.5))
    zy_color_bg:setImage("batch_ui/meinvpinzhi_zi.png")
    zy_color_bg:setSize(cc.size(310,230))
    zhanyi_waikuang:appendComponent(zy_color_bg)
    zy_color_bg:setPositionInContainer(cc.p(481,237))
    table_zhanyi_waikuang["zy_color_bg"] = zy_color_bg

    local zy_big_zuo2 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/xingjikuang_paibingbuzhen.png",cc.rect(72,15,3,3))
    zy_big_zuo2:setSize(cc.size(290,42))
    zy_big_zuo2:setAnchorPoint(cc.p(0.5,0.5))
    zhanyi_waikuang:appendComponent(zy_big_zuo2)
    zy_big_zuo2:setPositionInContainer(cc.p(166,101))
    table_zhanyi_waikuang["zy_big_zuo2"] = zy_big_zuo2

    local zy_color_bg = fc.FShaderExtensionsImage:create(0)
    zy_color_bg:setAnchorPoint(cc.p(0.5,0.5))
    zy_color_bg:setImage("batch_ui/meinvpinzhi_zi.png")
    zy_color_bg:setSize(cc.size(310,230))
    zhanyi_waikuang:appendComponent(zy_color_bg)
    zy_color_bg:setPositionInContainer(cc.p(792,237))
    table_zhanyi_waikuang["zy_color_bg"] = zy_color_bg

    local zy_big_zuo3 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/xingjikuang_paibingbuzhen.png",cc.rect(72,15,3,3))
    zy_big_zuo3:setSize(cc.size(290,42))
    zy_big_zuo3:setAnchorPoint(cc.p(0.5,0.5))
    zhanyi_waikuang:appendComponent(zy_big_zuo3)
    zy_big_zuo3:setPositionInContainer(cc.p(480,101))
    table_zhanyi_waikuang["zy_big_zuo3"] = zy_big_zuo3

    local zy_big_zuo4 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/xingjikuang_paibingbuzhen.png",cc.rect(72,15,3,3))
    zy_big_zuo4:setSize(cc.size(290,42))
    zy_big_zuo4:setAnchorPoint(cc.p(0.5,0.5))
    zhanyi_waikuang:appendComponent(zy_big_zuo4)
    zy_big_zuo4:setPositionInContainer(cc.p(790,101))
    table_zhanyi_waikuang["zy_big_zuo4"] = zy_big_zuo4

    local zy_reward_rect = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongbiankuang2_ciguan.png",cc.rect(44,15,1,1))
    zy_reward_rect:setSize(cc.size(304,230))
    zy_reward_rect:setAnchorPoint(cc.p(0.5,0.5))
    zhanyi_waikuang:appendComponent(zy_reward_rect)
    zy_reward_rect:setPositionInContainer(cc.p(166,238))
    table_zhanyi_waikuang["zy_reward_rect"] = zy_reward_rect

    local zy_ver_bar = fc.FScale9Image:createWithBatchUIFrame("batch_ui/paibingbuzhenbar_paibingbuzhen.png",cc.rect(13,57,1,2))
    zy_ver_bar:setSize(cc.size(25,290))
    zy_ver_bar:setAnchorPoint(cc.p(0.5,0.5))
    zhanyi_waikuang:appendComponent(zy_ver_bar)
    zy_ver_bar:setPositionInContainer(cc.p(10.5,211))
    table_zhanyi_waikuang["zy_ver_bar"] = zy_ver_bar

    local zy_reward_rect = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongbiankuang2_ciguan.png",cc.rect(44,15,1,1))
    zy_reward_rect:setSize(cc.size(304,230))
    zy_reward_rect:setAnchorPoint(cc.p(0.5,0.5))
    zhanyi_waikuang:appendComponent(zy_reward_rect)
    zy_reward_rect:setPositionInContainer(cc.p(479,238))
    table_zhanyi_waikuang["zy_reward_rect"] = zy_reward_rect

    local zy_ver_bar = fc.FScale9Image:createWithBatchUIFrame("batch_ui/paibingbuzhenbar_paibingbuzhen.png",cc.rect(13,57,1,2))
    zy_ver_bar:setSize(cc.size(25,290))
    zy_ver_bar:setAnchorPoint(cc.p(0.5,0.5))
    zhanyi_waikuang:appendComponent(zy_ver_bar)
    zy_ver_bar:setPositionInContainer(cc.p(322.5,211))
    table_zhanyi_waikuang["zy_ver_bar"] = zy_ver_bar

    local zy_reward_rect = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongbiankuang2_ciguan.png",cc.rect(44,15,1,1))
    zy_reward_rect:setSize(cc.size(304,230))
    zy_reward_rect:setAnchorPoint(cc.p(0.5,0.5))
    zhanyi_waikuang:appendComponent(zy_reward_rect)
    zy_reward_rect:setPositionInContainer(cc.p(791,238))
    table_zhanyi_waikuang["zy_reward_rect"] = zy_reward_rect

    local zy_ver_bar = fc.FScale9Image:createWithBatchUIFrame("batch_ui/paibingbuzhenbar_paibingbuzhen.png",cc.rect(13,57,1,2))
    zy_ver_bar:setSize(cc.size(25,290))
    zy_ver_bar:setAnchorPoint(cc.p(0.5,0.5))
    zhanyi_waikuang:appendComponent(zy_ver_bar)
    zy_ver_bar:setPositionInContainer(cc.p(634.5,211))
    table_zhanyi_waikuang["zy_ver_bar"] = zy_ver_bar

    local zy_ver_bar = fc.FScale9Image:createWithBatchUIFrame("batch_ui/paibingbuzhenbar_paibingbuzhen.png",cc.rect(13,57,1,2))
    zy_ver_bar:setSize(cc.size(25,290))
    zy_ver_bar:setAnchorPoint(cc.p(0.5,0.5))
    zhanyi_waikuang:appendComponent(zy_ver_bar)
    zy_ver_bar:setPositionInContainer(cc.p(948.5,211))
    table_zhanyi_waikuang["zy_ver_bar"] = zy_ver_bar

    local atk_type_image = fc.FExtensionsImage:create()
    atk_type_image:setImage("batch_ui/fangyu_tubiao.png")
    atk_type_image:setSize(cc.size(35,36))
    atk_type_image:setAnchorPoint(cc.p(0.5,0.5))
    zhanyi_waikuang:appendComponent(atk_type_image)
    atk_type_image:setPositionInContainer(cc.p(852.5,158))
    table_zhanyi_waikuang["atk_type_image"] = atk_type_image

    local zy_ui_guan = fc.FExtensionsImage:create()
    zy_ui_guan:setImage("batch_ui/guan (2).png")
    zy_ui_guan:setSize(cc.size(41,41))
    zy_ui_guan:setRotation(355)
    zy_ui_guan:setAnchorPoint(cc.p(0.5,0.5))
    zhanyi_waikuang:appendComponent(zy_ui_guan)
    zy_ui_guan:setPositionInContainer(cc.p(461.2,136.2))
    table_zhanyi_waikuang["zy_ui_guan"] = zy_ui_guan

    local zy_ui_ben = fc.FExtensionsImage:create()
    zy_ui_ben:setImage("batch_ui/ben.png")
    zy_ui_ben:setSize(cc.size(41,41))
    zy_ui_ben:setRotation(350)
    zy_ui_ben:setAnchorPoint(cc.p(0.5,0.5))
    zhanyi_waikuang:appendComponent(zy_ui_ben)
    zy_ui_ben:setPositionInContainer(cc.p(421.7,140.7))
    table_zhanyi_waikuang["zy_ui_ben"] = zy_ui_ben

    local zy_ui_jiang = fc.FExtensionsImage:create()
    zy_ui_jiang:setImage("batch_ui/jiang (2).png")
    zy_ui_jiang:setSize(cc.size(41,41))
    zy_ui_jiang:setRotation(5)
    zy_ui_jiang:setAnchorPoint(cc.p(0.5,0.5))
    zhanyi_waikuang:appendComponent(zy_ui_jiang)
    zy_ui_jiang:setPositionInContainer(cc.p(501.2,135.2))
    table_zhanyi_waikuang["zy_ui_jiang"] = zy_ui_jiang

    local zy_ui_li = fc.FExtensionsImage:create()
    zy_ui_li:setImage("batch_ui/li.png")
    zy_ui_li:setSize(cc.size(41,41))
    zy_ui_li:setRotation(10)
    zy_ui_li:setAnchorPoint(cc.p(0.5,0.5))
    zhanyi_waikuang:appendComponent(zy_ui_li)
    zy_ui_li:setPositionInContainer(cc.p(541.7,140.7))
    table_zhanyi_waikuang["zy_ui_li"] = zy_ui_li

    local reward_yinliang_label = fc.FLabel:createBMFont()
    reward_yinliang_label:setSize(cc.size(100,26))
    reward_yinliang_label:setAnchorPoint(cc.p(0.5,0.5))
    reward_yinliang_label:setFontSize(20)
    if LANGUAGE_TYPE == 3 then
    	 reward_yinliang_label:setString("獎勵銀兩")
    else
    	 reward_yinliang_label:setString("奖励银两")
    end
    reward_yinliang_label:setColor(cc.c3b(0,255,0))
    zhanyi_waikuang:appendComponent(reward_yinliang_label)
    reward_yinliang_label:setPositionInContainer(cc.p(110,202))
    table_zhanyi_waikuang["reward_yinliang_label"] = reward_yinliang_label

    local reward_jingyan_label = fc.FLabel:createBMFont()
    reward_jingyan_label:setSize(cc.size(100,26))
    reward_jingyan_label:setAnchorPoint(cc.p(0.5,0.5))
    reward_jingyan_label:setFontSize(20)
    if LANGUAGE_TYPE == 3 then
     	reward_jingyan_label:setString("獎勵經驗 ")
    else
     	reward_jingyan_label:setString("奖励经验 ")
    end
    reward_jingyan_label:setColor(cc.c3b(0,255,0))
    zhanyi_waikuang:appendComponent(reward_jingyan_label)
    reward_jingyan_label:setPositionInContainer(cc.p(110,245))
    table_zhanyi_waikuang["reward_jingyan_label"] = reward_jingyan_label

    local cost_liangcao_label = fc.FLabel:createBMFont()
    cost_liangcao_label:setSize(cc.size(100,26))
    cost_liangcao_label:setAnchorPoint(cc.p(0.5,0.5))
    cost_liangcao_label:setFontSize(20)
    if LANGUAGE_TYPE == 3 then
    	 cost_liangcao_label:setString("消耗糧草")
    else
    	 cost_liangcao_label:setString("消耗粮草")
    end
   
    cost_liangcao_label:setColor(cc.c3b(250,255,165))
    zhanyi_waikuang:appendComponent(cost_liangcao_label)
    cost_liangcao_label:setPositionInContainer(cc.p(110,159))
    table_zhanyi_waikuang["cost_liangcao_label"] = cost_liangcao_label

    local cost_label_di = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shuruwenzi.png",cc.rect(11,9,47,7))
    cost_label_di:setSize(cc.size(100,28))
    cost_label_di:setAnchorPoint(cc.p(0.5,0.5))
    zhanyi_waikuang:appendComponent(cost_label_di)
    cost_label_di:setPositionInContainer(cc.p(222,161))
    table_zhanyi_waikuang["cost_label_di"] = cost_label_di

    local cost_label_di = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shuruwenzi.png",cc.rect(11,9,47,7))
    cost_label_di:setSize(cc.size(100,28))
    cost_label_di:setAnchorPoint(cc.p(0.5,0.5))
    zhanyi_waikuang:appendComponent(cost_label_di)
    cost_label_di:setPositionInContainer(cc.p(221,203))
    table_zhanyi_waikuang["cost_label_di"] = cost_label_di

    local cost_label_di = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shuruwenzi.png",cc.rect(11,9,47,7))
    cost_label_di:setSize(cc.size(100,28))
    cost_label_di:setAnchorPoint(cc.p(0.5,0.5))
    zhanyi_waikuang:appendComponent(cost_label_di)
    cost_label_di:setPositionInContainer(cc.p(220,247))
    table_zhanyi_waikuang["cost_label_di"] = cost_label_di

    local cost_liangcao = fc.FLabel:createBMFont()
    cost_liangcao:setSize(cc.size(100,26))
    cost_liangcao:setAnchorPoint(cc.p(0.5,0.5))
    cost_liangcao:setFontSize(20)
    cost_liangcao:setString("100")
    cost_liangcao:setColor(cc.c3b(139,255,240))
    zhanyi_waikuang:appendComponent(cost_liangcao)
    cost_liangcao:setPositionInContainer(cc.p(222,159))
    table_zhanyi_waikuang["cost_liangcao"] = cost_liangcao

    local reward_yinliang = fc.FLabel:createBMFont()
    reward_yinliang:setSize(cc.size(100,26))
    reward_yinliang:setAnchorPoint(cc.p(0.5,0.5))
    reward_yinliang:setFontSize(20)
    reward_yinliang:setString("101")
    reward_yinliang:setColor(cc.c3b(0,255,0))
    zhanyi_waikuang:appendComponent(reward_yinliang)
    reward_yinliang:setPositionInContainer(cc.p(221,202))
    table_zhanyi_waikuang["reward_yinliang"] = reward_yinliang

    local reward_jingyan = fc.FLabel:createBMFont()
    reward_jingyan:setSize(cc.size(100,26))
    reward_jingyan:setAnchorPoint(cc.p(0.5,0.5))
    reward_jingyan:setFontSize(20)
    reward_jingyan:setString("201")
    reward_jingyan:setColor(cc.c3b(0,255,0))
    zhanyi_waikuang:appendComponent(reward_jingyan)
    reward_jingyan:setPositionInContainer(cc.p(220,246))
    table_zhanyi_waikuang["reward_jingyan"] = reward_jingyan

    local guanka_leixing = fc.FLabel:createBMFont()
    guanka_leixing:setSize(cc.size(100,26))
    guanka_leixing:setAnchorPoint(cc.p(0.5,0.5))
    guanka_leixing:setFontSize(20)
    if LANGUAGE_TYPE == 3 then
    	guanka_leixing:setString("關卡類型：")
    else
    	guanka_leixing:setString("关卡类型：")
    end
    
    guanka_leixing:setColor(cc.c3b(250,255,165))
    zhanyi_waikuang:appendComponent(guanka_leixing)
    guanka_leixing:setPositionInContainer(cc.p(749,157))
    table_zhanyi_waikuang["guanka_leixing"] = guanka_leixing

    local difang_zhenxing = fc.FLabel:createBMFont()
    difang_zhenxing:setSize(cc.size(100,26))
    difang_zhenxing:setAnchorPoint(cc.p(0.5,0.5))
    difang_zhenxing:setFontSize(20)
    if LANGUAGE_TYPE == 3 then
    	difang_zhenxing:setString("敵方陣型：")
    else
    	difang_zhenxing:setString("敌方阵形：")
    end
    difang_zhenxing:setColor(cc.c3b(250,255,165))
    zhanyi_waikuang:appendComponent(difang_zhenxing)
    difang_zhenxing:setPositionInContainer(cc.p(749,186))
    table_zhanyi_waikuang["difang_zhenxing"] = difang_zhenxing

    local button_saodang = fc.FScaleButton:create()
    button_saodang:setSize(cc.size(102,67))
    button_saodang:setAnchorPoint(cc.p(0.5,0.5))
    button_saodang:setButtonImage("batch_ui/saodangduoci.png")
    zhanyi_waikuang:appendComponent(button_saodang)
    button_saodang:setPositionInContainer(cc.p(232,302.5))
    table_zhanyi_waikuang["button_saodang"] = button_saodang

    local button_saodangOnce = fc.FScaleButton:create()
    button_saodangOnce:setSize(cc.size(102,67))
    button_saodangOnce:setAnchorPoint(cc.p(0.5,0.5))
    button_saodangOnce:setButtonImage("batch_ui/saodangyici.png")
    zhanyi_waikuang:appendComponent(button_saodangOnce)
    button_saodangOnce:setPositionInContainer(cc.p(94,302.5))
    table_zhanyi_waikuang["button_saodangOnce"] = button_saodangOnce

    return table_zhanyi_waikuang

end

