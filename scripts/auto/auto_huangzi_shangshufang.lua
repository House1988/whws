function createhuangzi_shangshufang()

    local table_huangzi_shangshufang = {}

    local huangzi_shangshufang = fc.FContainerPanel:create()
    huangzi_shangshufang:setSize(cc.size(960,640))
    table_huangzi_shangshufang["huangzi_shangshufang"] = huangzi_shangshufang

    local hzssf_bg_image = fc.FScale9Image:createWithBatchUIFrame("batch_ui/ditu_lan.png",cc.rect(2,2,1,1))
    hzssf_bg_image:setSize(cc.size(960,640))
    hzssf_bg_image:setAnchorPoint(cc.p(0.5,0.5))
    huangzi_shangshufang:appendComponent(hzssf_bg_image)
    hzssf_bg_image:setPositionInContainer(cc.p(480,320))
    table_huangzi_shangshufang["hzssf_bg_image"] = hzssf_bg_image

    local hzssf_title_bg_image = fc.FExtensionsImage:create()
    hzssf_title_bg_image:setImage("nobatch/title_mingchen_.png")
    hzssf_title_bg_image:setSize(cc.size(483,67))
    hzssf_title_bg_image:setAnchorPoint(cc.p(0.5,0.5))
    huangzi_shangshufang:appendComponent(hzssf_title_bg_image)
    hzssf_title_bg_image:setPositionInContainer(cc.p(241.5,33.5))
    table_huangzi_shangshufang["hzssf_title_bg_image"] = hzssf_title_bg_image

    local hzsssf_age_panel = fc.FContainerPanel:create()
    hzsssf_age_panel:setSize(cc.size(240,569))
    hzsssf_age_panel:setAnchorPoint(cc.p(0.5,0.5))
    huangzi_shangshufang:appendComponent(hzsssf_age_panel)
    hzsssf_age_panel:setPositionInContainer(cc.p(130,353))
    table_huangzi_shangshufang["hzsssf_age_panel"] = hzsssf_age_panel

    local hzsssf_age_zhi_bg_scale9 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongdikuang1.png",cc.rect(24,24,4,4))
    hzsssf_age_zhi_bg_scale9:setSize(cc.size(208,502))
    hzsssf_age_zhi_bg_scale9:setAnchorPoint(cc.p(0.5,0.5))
    hzsssf_age_panel:appendComponent(hzsssf_age_zhi_bg_scale9)
    hzsssf_age_zhi_bg_scale9:setPositionInContainer(cc.p(120,307))
    table_huangzi_shangshufang["hzsssf_age_zhi_bg_scale9"] = hzsssf_age_zhi_bg_scale9

    local hzsssf_line_img = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongbiankuang3_ciguan.png",cc.rect(70,15,2,2))
    hzsssf_line_img:setSize(cc.size(215,16))
    hzsssf_line_img:setAnchorPoint(cc.p(0.5,0.5))
    hzsssf_age_panel:appendComponent(hzsssf_line_img)
    hzsssf_line_img:setPositionInContainer(cc.p(120.5,49))
    table_huangzi_shangshufang["hzsssf_line_img"] = hzsssf_line_img

    local hzsssf_age_jingyan_label = fc.FLabel:createBMFont()
    hzsssf_age_jingyan_label:setSize(cc.size(71,25))
    hzsssf_age_jingyan_label:setAnchorPoint(cc.p(0.5,0.5))
    hzsssf_age_jingyan_label:setFontSize(20)
    if LANGUAGE_TYPE == 3 then
	    hzsssf_age_jingyan_label:setString("經驗：")    
    else
	    hzsssf_age_jingyan_label:setString("经验：")
    end
    hzsssf_age_jingyan_label:setColor(cc.c3b(106,68,19))
    hzsssf_age_panel:appendComponent(hzsssf_age_jingyan_label)
    hzsssf_age_jingyan_label:setPositionInContainer(cc.p(59.5,228.5))
    table_huangzi_shangshufang["hzsssf_age_jingyan_label"] = hzsssf_age_jingyan_label

    local hzsssf_age_loading_bar_bg_image = fc.FScale9Image:createWithBatchUIFrame("batch_ui/jindutiaokuang_kapai.png",cc.rect(15,11,6,3))
    hzsssf_age_loading_bar_bg_image:setSize(cc.size(206,26))
    hzsssf_age_loading_bar_bg_image:setAnchorPoint(cc.p(0.5,0.5))
    hzsssf_age_panel:appendComponent(hzsssf_age_loading_bar_bg_image)
    hzsssf_age_loading_bar_bg_image:setPositionInContainer(cc.p(120,283))
    table_huangzi_shangshufang["hzsssf_age_loading_bar_bg_image"] = hzsssf_age_loading_bar_bg_image

    local hzsssf_age_loading_bar = fc.FLoadingBar:create()
    hzsssf_age_loading_bar:setLoadingBarImage("batch_ui/jindutiao2.png")
    hzsssf_age_loading_bar:setSize(cc.size(200,19))
    hzsssf_age_loading_bar:setAnchorPoint(cc.p(0.5,0.5))
    hzsssf_age_loading_bar:setPercent(50)
    hzsssf_age_panel:appendComponent(hzsssf_age_loading_bar)
    hzsssf_age_loading_bar:setPositionInContainer(cc.p(120,283.5))
    table_huangzi_shangshufang["hzsssf_age_loading_bar"] = hzsssf_age_loading_bar

    local hzsssf_age_meicijiaoyu_label = fc.FLabel:createBMFont()
    hzsssf_age_meicijiaoyu_label:setSize(cc.size(134,25))
    hzsssf_age_meicijiaoyu_label:setAnchorPoint(cc.p(0.5,0.5))
    hzsssf_age_meicijiaoyu_label:setFontSize(20)
    if LANGUAGE_TYPE == 3 then
    	 hzsssf_age_meicijiaoyu_label:setString("每次教育花費")
    else
    	 hzsssf_age_meicijiaoyu_label:setString("每次教育花费")
    end
    hzsssf_age_meicijiaoyu_label:setColor(cc.c3b(74,31,0))
    hzsssf_age_panel:appendComponent(hzsssf_age_meicijiaoyu_label)
    hzsssf_age_meicijiaoyu_label:setPositionInContainer(cc.p(114,327.5))
    table_huangzi_shangshufang["hzsssf_age_meicijiaoyu_label"] = hzsssf_age_meicijiaoyu_label

    local hzsssf_age_lbl_bg3 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shuruwenzi.png",cc.rect(10,10,46,2))
    hzsssf_age_lbl_bg3:setSize(cc.size(78,24))
    hzsssf_age_lbl_bg3:setAnchorPoint(cc.p(0.5,0.5))
    hzsssf_age_panel:appendComponent(hzsssf_age_lbl_bg3)
    hzsssf_age_lbl_bg3:setPositionInContainer(cc.p(144,375))
    table_huangzi_shangshufang["hzsssf_age_lbl_bg3"] = hzsssf_age_lbl_bg3

    local hzsssf_age_xueshi_label = fc.FExtensionsImage:create()
    hzsssf_age_xueshi_label:setImage("batch_ui/xueshi_tubiao.png")
    hzsssf_age_xueshi_label:setSize(cc.size(59,59))
    hzsssf_age_xueshi_label:setAnchorPoint(cc.p(0.5,0.5))
    hzsssf_age_panel:appendComponent(hzsssf_age_xueshi_label)
    hzsssf_age_xueshi_label:setPositionInContainer(cc.p(52.5,374.5))
    table_huangzi_shangshufang["hzsssf_age_xueshi_label"] = hzsssf_age_xueshi_label

    local hzsssf_age_yinliang_label = fc.FExtensionsImage:create()
    hzsssf_age_yinliang_label:setImage("batch_ui/yuanbao_da.png")
    hzsssf_age_yinliang_label:setSize(cc.size(58,43))
    hzsssf_age_yinliang_label:setAnchorPoint(cc.p(0.5,0.5))
    hzsssf_age_panel:appendComponent(hzsssf_age_yinliang_label)
    hzsssf_age_yinliang_label:setPositionInContainer(cc.p(52,419.5))
    table_huangzi_shangshufang["hzsssf_age_yinliang_label"] = hzsssf_age_yinliang_label

    local hzsssf_age_xueshi_num_label = fc.FLabel:createBMFont()
    hzsssf_age_xueshi_num_label:setSize(cc.size(70,25))
    hzsssf_age_xueshi_num_label:setAnchorPoint(cc.p(0.5,0.5))
    hzsssf_age_xueshi_num_label:setFontSize(21)
    hzsssf_age_xueshi_num_label:setString("1")
    hzsssf_age_xueshi_num_label:setColor(cc.c3b(106,68,19))
    hzsssf_age_panel:appendComponent(hzsssf_age_xueshi_num_label)
    hzsssf_age_xueshi_num_label:setPositionInContainer(cc.p(144,371.5))
    table_huangzi_shangshufang["hzsssf_age_xueshi_num_label"] = hzsssf_age_xueshi_num_label

    local hzsssf_age_lbl_bg4 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shuruwenzi.png",cc.rect(10,10,46,2))
    hzsssf_age_lbl_bg4:setSize(cc.size(78,24))
    hzsssf_age_lbl_bg4:setAnchorPoint(cc.p(0.5,0.5))
    hzsssf_age_panel:appendComponent(hzsssf_age_lbl_bg4)
    hzsssf_age_lbl_bg4:setPositionInContainer(cc.p(144,421))
    table_huangzi_shangshufang["hzsssf_age_lbl_bg4"] = hzsssf_age_lbl_bg4

    local hzsssf_age_yinliang_num_label = fc.FLabel:createBMFont()
    hzsssf_age_yinliang_num_label:setSize(cc.size(70,25))
    hzsssf_age_yinliang_num_label:setAnchorPoint(cc.p(0.5,0.5))
    hzsssf_age_yinliang_num_label:setFontSize(21)
    hzsssf_age_yinliang_num_label:setString("9999")
    hzsssf_age_yinliang_num_label:setColor(cc.c3b(106,68,19))
    hzsssf_age_panel:appendComponent(hzsssf_age_yinliang_num_label)
    hzsssf_age_yinliang_num_label:setPositionInContainer(cc.p(144,417.5))
    table_huangzi_shangshufang["hzsssf_age_yinliang_num_label"] = hzsssf_age_yinliang_num_label

    local hzsssf_age_jitijiaoyu_label = fc.FLabel:createBMFont()
    hzsssf_age_jitijiaoyu_label:setSize(cc.size(233,25))
    hzsssf_age_jitijiaoyu_label:setAnchorPoint(cc.p(0.5,0.5))
    hzsssf_age_jitijiaoyu_label:setFontSize(20)
	hzsssf_age_jitijiaoyu_label:setString("所有娘娘一起教育")
    hzsssf_age_jitijiaoyu_label:setColor(cc.c3b(74,31,0))
    hzsssf_age_panel:appendComponent(hzsssf_age_jitijiaoyu_label)
    hzsssf_age_jitijiaoyu_label:setPositionInContainer(cc.p(120.5,532.5))
    table_huangzi_shangshufang["hzsssf_age_jitijiaoyu_label"] = hzsssf_age_jitijiaoyu_label

    local hzssf_jiti_button = fc.FScaleButton:create()
    hzssf_jiti_button:setSize(cc.size(146,53))
    hzssf_jiti_button:setAnchorPoint(cc.p(0.5,0.5))
    hzssf_jiti_button:setButtonImage("batch_ui/teshuanniu.png")
    hzsssf_age_panel:appendComponent(hzssf_jiti_button)
    hzssf_jiti_button:setPositionInContainer(cc.p(120,488.5))
    table_huangzi_shangshufang["hzssf_jiti_button"] = hzssf_jiti_button

    local hzssf_ji = fc.FShaderExtensionsImage:create(0)
    hzssf_ji:setAnchorPoint(cc.p(0.5,0.5))
    hzssf_ji:setImage("batch_ui/ji4_uizi.png")
    hzssf_ji:setSize(cc.size(32,32))
    hzssf_jiti_button:appendComponent(hzssf_ji)
    hzssf_ji:setPositionInContainer(cc.p(33,26))
    table_huangzi_shangshufang["hzssf_ji"] = hzssf_ji

    local hzssf_ti = fc.FShaderExtensionsImage:create(0)
    hzssf_ti:setAnchorPoint(cc.p(0.5,0.5))
    hzssf_ti:setImage("batch_ui/ti_uizi.png")
    hzssf_ti:setSize(cc.size(32,32))
    hzssf_jiti_button:appendComponent(hzssf_ti)
    hzssf_ti:setPositionInContainer(cc.p(59,26))
    table_huangzi_shangshufang["hzssf_ti"] = hzssf_ti

    local hzssf_jiao = fc.FShaderExtensionsImage:create(0)
    hzssf_jiao:setAnchorPoint(cc.p(0.5,0.5))
    hzssf_jiao:setImage("batch_ui/jiao_uizi.png")
    hzssf_jiao:setSize(cc.size(32,32))
    hzssf_jiti_button:appendComponent(hzssf_jiao)
    hzssf_jiao:setPositionInContainer(cc.p(86,26))
    table_huangzi_shangshufang["hzssf_jiao"] = hzssf_jiao

    local hzssf_yu = fc.FShaderExtensionsImage:create(0)
    hzssf_yu:setAnchorPoint(cc.p(0.5,0.5))
    hzssf_yu:setImage("batch_ui/yu_uizi.png")
    hzssf_yu:setSize(cc.size(32,32))
    hzssf_jiti_button:appendComponent(hzssf_yu)
    hzssf_yu:setPositionInContainer(cc.p(111,26))
    table_huangzi_shangshufang["hzssf_yu"] = hzssf_yu

    local hzsssf_age_head_pinzhi_image = fc.FExtensionsImage:create()
    hzsssf_age_head_pinzhi_image:setImage("batch_ui/baipinzhi_kuang.png")
    hzsssf_age_head_pinzhi_image:setSize(cc.size(104,104))
    hzsssf_age_head_pinzhi_image:setAnchorPoint(cc.p(0.5,0.5))
    hzsssf_age_panel:appendComponent(hzsssf_age_head_pinzhi_image)
    hzsssf_age_head_pinzhi_image:setPositionInContainer(cc.p(120,119))
    table_huangzi_shangshufang["hzsssf_age_head_pinzhi_image"] = hzsssf_age_head_pinzhi_image

    local hzsssf_age_image = fc.FExtensionsImage:create()
    hzsssf_age_image:setImage("nobatch/tupian.png")
    hzsssf_age_image:setSize(cc.size(90,90))
    hzsssf_age_image:setAnchorPoint(cc.p(0.5,0.5))
    hzsssf_age_panel:appendComponent(hzsssf_age_image)
    hzsssf_age_image:setPositionInContainer(cc.p(120,119))
    table_huangzi_shangshufang["hzsssf_age_image"] = hzsssf_age_image

    local hzsssf_prince_lv = fc.FLabel:createBMFont()
    hzsssf_prince_lv:setSize(cc.size(71,25))
    hzsssf_prince_lv:setAnchorPoint(cc.p(0.5,0.5))
    hzsssf_prince_lv:setFontSize(21)
    if LANGUAGE_TYPE == 3 then
	    hzsssf_prince_lv:setString("等級：")    
    else
	    hzsssf_prince_lv:setString("等级：")
    end
    hzsssf_prince_lv:setColor(cc.c3b(106,68,19))
    hzsssf_age_panel:appendComponent(hzsssf_prince_lv)
    hzsssf_prince_lv:setPositionInContainer(cc.p(59.5,190.5))
    table_huangzi_shangshufang["hzsssf_prince_lv"] = hzsssf_prince_lv

    local hzsssf_age_mingzi_bg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/zongjiachengdikuang_tangquanxinggong.png",cc.rect(70,15,2,2))
    hzsssf_age_mingzi_bg:setSize(cc.size(236,41))
    hzsssf_age_mingzi_bg:setAnchorPoint(cc.p(0.5,0.5))
    hzsssf_age_panel:appendComponent(hzsssf_age_mingzi_bg)
    hzsssf_age_mingzi_bg:setPositionInContainer(cc.p(120,21.5))
    table_huangzi_shangshufang["hzsssf_age_mingzi_bg"] = hzsssf_age_mingzi_bg

    local hzsssf_age_name_label = fc.FLabel:createSystemFont()
    hzsssf_age_name_label:setSize(cc.size(108,30))
    hzsssf_age_name_label:setAnchorPoint(cc.p(0.5,0.5))
    hzsssf_age_name_label:setFontSize(20)
    hzsssf_age_name_label:setString("步兵步兵")
    hzsssf_age_name_label:setColor(cc.c3b(255,255,255))
    hzsssf_age_panel:appendComponent(hzsssf_age_name_label)
    hzsssf_age_name_label:setPositionInContainer(cc.p(120,19))
    table_huangzi_shangshufang["hzsssf_age_name_label"] = hzsssf_age_name_label

    local hzsssf_age_lbl_bg1 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shuruwenzi.png",cc.rect(10,10,46,2))
    hzsssf_age_lbl_bg1:setSize(cc.size(78,24))
    hzsssf_age_lbl_bg1:setAnchorPoint(cc.p(0.5,0.5))
    hzsssf_age_panel:appendComponent(hzsssf_age_lbl_bg1)
    hzsssf_age_lbl_bg1:setPositionInContainer(cc.p(144,194))
    table_huangzi_shangshufang["hzsssf_age_lbl_bg1"] = hzsssf_age_lbl_bg1

    local hzsssf_age_lbl_bg2 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shuruwenzi.png",cc.rect(10,10,46,2))
    hzsssf_age_lbl_bg2:setSize(cc.size(78,24))
    hzsssf_age_lbl_bg2:setAnchorPoint(cc.p(0.5,0.5))
    hzsssf_age_panel:appendComponent(hzsssf_age_lbl_bg2)
    hzsssf_age_lbl_bg2:setPositionInContainer(cc.p(144,232))
    table_huangzi_shangshufang["hzsssf_age_lbl_bg2"] = hzsssf_age_lbl_bg2

    local hzsssf_age_line1 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongbiankuang3_ciguan.png",cc.rect(70,15,2,2))
    hzsssf_age_line1:setSize(cc.size(215,13))
    hzsssf_age_line1:setAnchorPoint(cc.p(0.5,0.5))
    hzsssf_age_panel:appendComponent(hzsssf_age_line1)
    hzsssf_age_line1:setPositionInContainer(cc.p(120.5,562.5))
    table_huangzi_shangshufang["hzsssf_age_line1"] = hzsssf_age_line1

    local hzsssf_age_level_lbl = fc.FLabel:createBMFont()
    hzsssf_age_level_lbl:setSize(cc.size(70,25))
    hzsssf_age_level_lbl:setAnchorPoint(cc.p(0.5,0.5))
    hzsssf_age_level_lbl:setFontSize(21)
    if LANGUAGE_TYPE == 3 then
    	hzsssf_age_level_lbl:setString("等級：")
    else
    	hzsssf_age_level_lbl:setString("等级：")
    end
    
    hzsssf_age_level_lbl:setColor(cc.c3b(106,68,19))
    hzsssf_age_panel:appendComponent(hzsssf_age_level_lbl)
    hzsssf_age_level_lbl:setPositionInContainer(cc.p(144,190.5))
    table_huangzi_shangshufang["hzsssf_age_level_lbl"] = hzsssf_age_level_lbl

    local hzsssf_age_exp_lbl = fc.FLabel:createBMFont()
    hzsssf_age_exp_lbl:setSize(cc.size(70,25))
    hzsssf_age_exp_lbl:setAnchorPoint(cc.p(0.5,0.5))
    hzsssf_age_exp_lbl:setFontSize(21)
    if LANGUAGE_TYPE == 3 then
	    hzsssf_age_exp_lbl:setString("等級：")
    else
	    hzsssf_age_exp_lbl:setString("等级：")
    end
    hzsssf_age_exp_lbl:setColor(cc.c3b(106,68,19))
    hzsssf_age_panel:appendComponent(hzsssf_age_exp_lbl)
    hzsssf_age_exp_lbl:setPositionInContainer(cc.p(144,228.5))
    table_huangzi_shangshufang["hzsssf_age_exp_lbl"] = hzsssf_age_exp_lbl

    local hzsssf_line_img1 = fc.FExtensionsImage:create()
    hzsssf_line_img1:setImage("batch_ui/fengexian_tangquanxinggong.png")
    hzsssf_line_img1:setSize(cc.size(14,95))
    hzsssf_line_img1:setRotation(-90)
    hzsssf_line_img1:setAnchorPoint(cc.p(0.5,0.5))
    hzsssf_age_panel:appendComponent(hzsssf_line_img1)
    hzsssf_line_img1:setPositionInContainer(cc.p(70.5,306))
    table_huangzi_shangshufang["hzsssf_line_img1"] = hzsssf_line_img1

    local hzsssf_line_img2 = fc.FExtensionsImage:create()
    hzsssf_line_img2:setImage("batch_ui/fengexian_tangquanxinggong.png")
    hzsssf_line_img2:setSize(cc.size(14,95))
    hzsssf_line_img2:setRotation(90)
    hzsssf_line_img2:setAnchorPoint(cc.p(0.5,0.5))
    hzsssf_age_panel:appendComponent(hzsssf_line_img2)
    hzsssf_line_img2:setPositionInContainer(cc.p(165.5,306))
    table_huangzi_shangshufang["hzsssf_line_img2"] = hzsssf_line_img2

    local hzsssf_line_img3 = fc.FExtensionsImage:create()
    hzsssf_line_img3:setImage("batch_ui/fengexian_tangquanxinggong.png")
    hzsssf_line_img3:setSize(cc.size(14,95))
    hzsssf_line_img3:setRotation(-90)
    hzsssf_line_img3:setAnchorPoint(cc.p(0.5,0.5))
    hzsssf_age_panel:appendComponent(hzsssf_line_img3)
    hzsssf_line_img3:setPositionInContainer(cc.p(70.5,449))
    table_huangzi_shangshufang["hzsssf_line_img3"] = hzsssf_line_img3

    local hzsssf_line_img4 = fc.FExtensionsImage:create()
    hzsssf_line_img4:setImage("batch_ui/fengexian_tangquanxinggong.png")
    hzsssf_line_img4:setSize(cc.size(14,95))
    hzsssf_line_img4:setRotation(90)
    hzsssf_line_img4:setAnchorPoint(cc.p(0.5,0.5))
    hzsssf_age_panel:appendComponent(hzsssf_line_img4)
    hzsssf_line_img4:setPositionInContainer(cc.p(165.5,449))
    table_huangzi_shangshufang["hzsssf_line_img4"] = hzsssf_line_img4

    local hzsssf_age_kuang1 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tangquanxinggongbar_tangquanxinggong.png",cc.rect(11,55,3,9))
    hzsssf_age_kuang1:setSize(cc.size(25,529))
    hzsssf_age_kuang1:setAnchorPoint(cc.p(0.5,0.5))
    hzsssf_age_panel:appendComponent(hzsssf_age_kuang1)
    hzsssf_age_kuang1:setPositionInContainer(cc.p(14.5,305.5))
    table_huangzi_shangshufang["hzsssf_age_kuang1"] = hzsssf_age_kuang1

    local hzsssf_age_kuang2 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tangquanxinggongbar_tangquanxinggong.png",cc.rect(11,55,3,9))
    hzsssf_age_kuang2:setSize(cc.size(25,529))
    hzsssf_age_kuang2:setAnchorPoint(cc.p(0.5,0.5))
    hzsssf_age_panel:appendComponent(hzsssf_age_kuang2)
    hzsssf_age_kuang2:setPositionInContainer(cc.p(225.5,305.5))
    table_huangzi_shangshufang["hzsssf_age_kuang2"] = hzsssf_age_kuang2

    local hzssf_niangniang_panel = fc.FContainerPanel:create()
    hzssf_niangniang_panel:setSize(cc.size(688,560))
    hzssf_niangniang_panel:setAnchorPoint(cc.p(0.5,0.5))
    huangzi_shangshufang:appendComponent(hzssf_niangniang_panel)
    hzssf_niangniang_panel:setPositionInContainer(cc.p(599,351))
    table_huangzi_shangshufang["hzssf_niangniang_panel"] = hzssf_niangniang_panel

    local hzssf_nn_bg1_scale9 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongdikuang1.png",cc.rect(26,26,2,2))
    hzssf_nn_bg1_scale9:setSize(cc.size(686,544))
    hzssf_nn_bg1_scale9:setAnchorPoint(cc.p(0.5,0.5))
    hzssf_niangniang_panel:appendComponent(hzssf_nn_bg1_scale9)
    hzssf_nn_bg1_scale9:setPositionInContainer(cc.p(344,280))
    table_huangzi_shangshufang["hzssf_nn_bg1_scale9"] = hzssf_nn_bg1_scale9

    local hzsssf_nn_page_num_label = fc.FLabel:createBMFont()
    hzsssf_nn_page_num_label:setSize(cc.size(47,30))
    hzsssf_nn_page_num_label:setAnchorPoint(cc.p(0.5,0.5))
    hzsssf_nn_page_num_label:setFontSize(21)
    hzsssf_nn_page_num_label:setString("0/0")
    hzsssf_nn_page_num_label:setColor(cc.c3b(83,44,13))
    hzssf_niangniang_panel:appendComponent(hzsssf_nn_page_num_label)
    hzsssf_nn_page_num_label:setPositionInContainer(cc.p(340.5,516))
    table_huangzi_shangshufang["hzsssf_nn_page_num_label"] = hzsssf_nn_page_num_label

    local hzsssf_nn_back_page_button = fc.FScaleButton:create()
    hzsssf_nn_back_page_button:setSize(cc.size(38,40))
    hzsssf_nn_back_page_button:setAnchorPoint(cc.p(0.5,0.5))
    hzsssf_nn_back_page_button:setButtonImage("batch_ui/jiantou2.png")
    hzsssf_nn_back_page_button:setScaleX(-1)
    hzssf_niangniang_panel:appendComponent(hzsssf_nn_back_page_button)
    hzsssf_nn_back_page_button:setPositionInContainer(cc.p(393,521))
    table_huangzi_shangshufang["hzsssf_nn_back_page_button"] = hzsssf_nn_back_page_button

    local hzsssf_nn_pre_page_button = fc.FScaleButton:create()
    hzsssf_nn_pre_page_button:setSize(cc.size(38,40))
    hzsssf_nn_pre_page_button:setAnchorPoint(cc.p(0.5,0.5))
    hzsssf_nn_pre_page_button:setButtonImage("batch_ui/jiantou2.png")
    hzssf_niangniang_panel:appendComponent(hzsssf_nn_pre_page_button)
    hzsssf_nn_pre_page_button:setPositionInContainer(cc.p(288,521))
    table_huangzi_shangshufang["hzsssf_nn_pre_page_button"] = hzsssf_nn_pre_page_button

    local hzssf_nn_bg2_scale9 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongbiankuang2_ciguan.png",cc.rect(43,15,2,2))
    hzssf_nn_bg2_scale9:setSize(cc.size(688,560))
    hzssf_nn_bg2_scale9:setAnchorPoint(cc.p(0.5,0.5))
    huangzi_shangshufang:appendComponent(hzssf_nn_bg2_scale9)
    hzssf_nn_bg2_scale9:setPositionInContainer(cc.p(599,351))
    table_huangzi_shangshufang["hzssf_nn_bg2_scale9"] = hzssf_nn_bg2_scale9

    local hzsssf_no_beauty_tip = fc.FLabel:createBMFont()
    hzsssf_no_beauty_tip:setSize(cc.size(355,30))
    hzsssf_no_beauty_tip:setAnchorPoint(cc.p(0.5,0.5))
    hzsssf_no_beauty_tip:setFontSize(20)
    local str1 = g_game.g_dictConfigManager:getLanTextById(91)
    hzsssf_no_beauty_tip:setString(str1)
    hzsssf_no_beauty_tip:setColor(cc.c3b(0,0,0))
    huangzi_shangshufang:appendComponent(hzsssf_no_beauty_tip)
    hzsssf_no_beauty_tip:setPositionInContainer(cc.p(599.5,309))
    table_huangzi_shangshufang["hzsssf_no_beauty_tip"] = hzsssf_no_beauty_tip

    local hzssf_title_bg_image2 = fc.FExtensionsImage:create()
    hzssf_title_bg_image2:setImage("nobatch/title_mingchen_.png")
    hzssf_title_bg_image2:setSize(cc.size(483,67))
    hzssf_title_bg_image2:setFlipType(2)
    hzssf_title_bg_image2:setAnchorPoint(cc.p(0.5,0.5))
    huangzi_shangshufang:appendComponent(hzssf_title_bg_image2)
    hzssf_title_bg_image2:setPositionInContainer(cc.p(718.5,33.5))
    table_huangzi_shangshufang["hzssf_title_bg_image2"] = hzssf_title_bg_image2

    local hzssf_title_image = fc.FContainerPanel:create()
    hzssf_title_image:setSize(cc.size(146,35))
    hzssf_title_image:setAnchorPoint(cc.p(0.5,0.5))
    huangzi_shangshufang:appendComponent(hzssf_title_image)
    hzssf_title_image:setPositionInContainer(cc.p(480,36))
    table_huangzi_shangshufang["hzssf_title_image"] = hzssf_title_image

    local shang = fc.FExtensionsImage:create()
    shang:setImage("batch_ui/shang.png")
    shang:setSize(cc.size(40,40))
    shang:setAnchorPoint(cc.p(0.5,0.5))
    hzssf_title_image:appendComponent(shang)
    shang:setPositionInContainer(cc.p(20,20))
    table_huangzi_shangshufang["shang"] = shang

    local shu = fc.FExtensionsImage:create()
    shu:setImage("batch_ui/shu2.png")
    shu:setSize(cc.size(40,40))
    shu:setAnchorPoint(cc.p(0.5,0.5))
    hzssf_title_image:appendComponent(shu)
    shu:setPositionInContainer(cc.p(73,20))
    table_huangzi_shangshufang["shu"] = shu

    local fang = fc.FExtensionsImage:create()
    fang:setImage("batch_ui/fang.png")
    fang:setSize(cc.size(40,40))
    fang:setAnchorPoint(cc.p(0.5,0.5))
    hzssf_title_image:appendComponent(fang)
    fang:setPositionInContainer(cc.p(126,20))
    table_huangzi_shangshufang["fang"] = fang

    local hzsssf_prince_exp_num = fc.FLabel:createBMFont()
    hzsssf_prince_exp_num:setSize(cc.size(70,30))
    hzsssf_prince_exp_num:setAnchorPoint(cc.p(0.5,0.5))
    hzsssf_prince_exp_num:setFontSize(20)
    hzsssf_prince_exp_num:setString("1/10")
    hzsssf_prince_exp_num:setColor(cc.c3b(255,255,255))
    huangzi_shangshufang:appendComponent(hzsssf_prince_exp_num)
    hzsssf_prince_exp_num:setPositionInContainer(cc.p(133,348))
    table_huangzi_shangshufang["hzsssf_prince_exp_num"] = hzsssf_prince_exp_num

    local hzssf_corner_l = fc.FExtensionsImage:create()
    hzssf_corner_l:setImage("batch_ui/title_mingchen_2.png")
    hzssf_corner_l:setSize(cc.size(62,121))
    hzssf_corner_l:setAnchorPoint(cc.p(0.5,0.5))
    huangzi_shangshufang:appendComponent(hzssf_corner_l)
    hzssf_corner_l:setPositionInContainer(cc.p(31,69.5))
    table_huangzi_shangshufang["hzssf_corner_l"] = hzssf_corner_l

    local hzssf_corner_r = fc.FExtensionsImage:create()
    hzssf_corner_r:setImage("batch_ui/title_mingchen_2.png")
    hzssf_corner_r:setSize(cc.size(62,121))
    hzssf_corner_r:setFlipType(2)
    hzssf_corner_r:setAnchorPoint(cc.p(0.5,0.5))
    huangzi_shangshufang:appendComponent(hzssf_corner_r)
    hzssf_corner_r:setPositionInContainer(cc.p(929,69.5))
    table_huangzi_shangshufang["hzssf_corner_r"] = hzssf_corner_r

    local hzssf_title_close_button = fc.FScaleButton:create()
    hzssf_title_close_button:setSize(cc.size(52,52))
    hzssf_title_close_button:setAnchorPoint(cc.p(0.5,0.5))
    hzssf_title_close_button:setButtonImage("batch_ui/guanbi_up.png")
    huangzi_shangshufang:appendComponent(hzssf_title_close_button)
    hzssf_title_close_button:setPositionInContainer(cc.p(933,35))
    table_huangzi_shangshufang["hzssf_title_close_button"] = hzssf_title_close_button

    local yinliangBg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shuruwenzi.png",cc.rect(11,9,47,7))
    yinliangBg:setSize(cc.size(130,30))
    yinliangBg:setAnchorPoint(cc.p(0.5,0.5))
    huangzi_shangshufang:appendComponent(yinliangBg)
    yinliangBg:setPositionInContainer(cc.p(823,35))
    table_huangzi_shangshufang["yinliangBg"] = yinliangBg

    local yinliangIcon = fc.FExtensionsImage:create()
    yinliangIcon:setImage("batch_ui/yuanbao_da.png")
    yinliangIcon:setSize(cc.size(58,43))
    yinliangIcon:setAnchorPoint(cc.p(0.5,0.5))
    huangzi_shangshufang:appendComponent(yinliangIcon)
    yinliangIcon:setPositionInContainer(cc.p(729,30.5))
    table_huangzi_shangshufang["yinliangIcon"] = yinliangIcon

    local yinliangIcon = fc.FExtensionsImage:create()
    yinliangIcon:setImage("batch_ui/yuanbao_da.png")
    yinliangIcon:setSize(cc.size(58,43))
    yinliangIcon:setAnchorPoint(cc.p(0.5,0.5))
    huangzi_shangshufang:appendComponent(yinliangIcon)
    yinliangIcon:setPositionInContainer(cc.p(720,41.5))
    table_huangzi_shangshufang["yinliangIcon"] = yinliangIcon

    local yinliangnumber = fc.FLabel:createBMFont()
    yinliangnumber:setSize(cc.size(70,30))
    yinliangnumber:setAnchorPoint(cc.p(0.5,0.5))
    yinliangnumber:setFontSize(21)
    yinliangnumber:setString("9999")
    yinliangnumber:setColor(cc.c3b(250,255,165))
    huangzi_shangshufang:appendComponent(yinliangnumber)
    yinliangnumber:setPositionInContainer(cc.p(823,30))
    table_huangzi_shangshufang["yinliangnumber"] = yinliangnumber

    local hzssf_to_tqxg_btn = fc.FScaleButton:create()
    hzssf_to_tqxg_btn:setSize(cc.size(146,53))
    hzssf_to_tqxg_btn:setAnchorPoint(cc.p(0.5,0.5))
    hzssf_to_tqxg_btn:setButtonImage("batch_ui/teshuanniu.png")
    huangzi_shangshufang:appendComponent(hzssf_to_tqxg_btn)
    hzssf_to_tqxg_btn:setPositionInContainer(cc.p(599,383.5))
    table_huangzi_shangshufang["hzssf_to_tqxg_btn"] = hzssf_to_tqxg_btn

    local hzssf_tang = fc.FShaderExtensionsImage:create(0)
    hzssf_tang:setAnchorPoint(cc.p(0.5,0.5))
    hzssf_tang:setImage("batch_ui/tang_uizi.png")
    hzssf_tang:setSize(cc.size(32,32))
    hzssf_to_tqxg_btn:appendComponent(hzssf_tang)
    hzssf_tang:setPositionInContainer(cc.p(34,26))
    table_huangzi_shangshufang["hzssf_tang"] = hzssf_tang

    local hzssf_quan = fc.FShaderExtensionsImage:create(0)
    hzssf_quan:setAnchorPoint(cc.p(0.5,0.5))
    hzssf_quan:setImage("batch_ui/quan3_uizi.png")
    hzssf_quan:setSize(cc.size(32,32))
    hzssf_to_tqxg_btn:appendComponent(hzssf_quan)
    hzssf_quan:setPositionInContainer(cc.p(61,26))
    table_huangzi_shangshufang["hzssf_quan"] = hzssf_quan

    local hzssf_xing = fc.FShaderExtensionsImage:create(0)
    hzssf_xing:setAnchorPoint(cc.p(0.5,0.5))
    hzssf_xing:setImage("batch_ui/xing_uizi.png")
    hzssf_xing:setSize(cc.size(32,32))
    hzssf_to_tqxg_btn:appendComponent(hzssf_xing)
    hzssf_xing:setPositionInContainer(cc.p(89,26))
    table_huangzi_shangshufang["hzssf_xing"] = hzssf_xing

    local hzssf_gong = fc.FShaderExtensionsImage:create(0)
    hzssf_gong:setAnchorPoint(cc.p(0.5,0.5))
    hzssf_gong:setImage("batch_ui/gong_uizi.png")
    hzssf_gong:setSize(cc.size(32,32))
    hzssf_to_tqxg_btn:appendComponent(hzssf_gong)
    hzssf_gong:setPositionInContainer(cc.p(115,26))
    table_huangzi_shangshufang["hzssf_gong"] = hzssf_gong

    return table_huangzi_shangshufang

end

