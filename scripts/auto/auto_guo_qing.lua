function createguo_qing()

    local table_guo_qing = {}

    local guo_qing = fc.FContainerPanel:create()
    guo_qing:setSize(cc.size(960,640))
    table_guo_qing["guo_qing"] = guo_qing

    local panel_bg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/ditu_lan.png",cc.rect(2,2,2,2))
    panel_bg:setSize(cc.size(960,640))
    panel_bg:setAnchorPoint(cc.p(0.5,0.5))
    guo_qing:appendComponent(panel_bg)
    panel_bg:setPositionInContainer(cc.p(480,320))
    table_guo_qing["panel_bg"] = panel_bg

    local title_bg = fc.FExtensionsImage:create()
    title_bg:setImage("nobatch/title_mingchen_.png")
    title_bg:setSize(cc.size(483,67))
    title_bg:setAnchorPoint(cc.p(0.5,0.5))
    guo_qing:appendComponent(title_bg)
    title_bg:setPositionInContainer(cc.p(241.5,33.5))
    table_guo_qing["title_bg"] = title_bg

    local guoqing_info_left_bg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongdikuang1.png",cc.rect(25,25,4,4))
    guoqing_info_left_bg:setSize(cc.size(472,571))
    guoqing_info_left_bg:setAnchorPoint(cc.p(0.5,0.5))
    guo_qing:appendComponent(guoqing_info_left_bg)
    guoqing_info_left_bg:setPositionInContainer(cc.p(244,349.5))
    table_guo_qing["guoqing_info_left_bg"] = guoqing_info_left_bg

    local guoqing_info_right_bg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongdikuang1.png",cc.rect(25,25,4,4))
    guoqing_info_right_bg:setSize(cc.size(472,571))
    guoqing_info_right_bg:setAnchorPoint(cc.p(0.5,0.5))
    guo_qing:appendComponent(guoqing_info_right_bg)
    guoqing_info_right_bg:setPositionInContainer(cc.p(718,349.5))
    table_guo_qing["guoqing_info_right_bg"] = guoqing_info_right_bg

    local tag_label1 = fc.FExtensionsImage:create()
    tag_label1:setImage("nobatch/ditu_guoqingxinxi.png")
    tag_label1:setSize(cc.size(439,42))
    tag_label1:setAnchorPoint(cc.p(0.5,0.5))
    guo_qing:appendComponent(tag_label1)
    tag_label1:setPositionInContainer(cc.p(233.5,137))
    table_guo_qing["tag_label1"] = tag_label1

    local tag_label2 = fc.FExtensionsImage:create()
    tag_label2:setImage("nobatch/ditu_guoqingxinxi.png")
    tag_label2:setSize(cc.size(439,20))
    tag_label2:setAnchorPoint(cc.p(0.5,0.5))
    guo_qing:appendComponent(tag_label2)
    tag_label2:setPositionInContainer(cc.p(233.5,212))
    table_guo_qing["tag_label2"] = tag_label2

    local tag_label3 = fc.FExtensionsImage:create()
    tag_label3:setImage("nobatch/ditu_guoqingxinxi.png")
    tag_label3:setSize(cc.size(439,42))
    tag_label3:setAnchorPoint(cc.p(0.5,0.5))
    guo_qing:appendComponent(tag_label3)
    tag_label3:setPositionInContainer(cc.p(233.5,294))
    table_guo_qing["tag_label3"] = tag_label3

    local tag_label4 = fc.FExtensionsImage:create()
    tag_label4:setImage("nobatch/ditu_guoqingxinxi.png")
    tag_label4:setSize(cc.size(439,42))
    tag_label4:setAnchorPoint(cc.p(0.5,0.5))
    guo_qing:appendComponent(tag_label4)
    tag_label4:setPositionInContainer(cc.p(233.5,385))
    table_guo_qing["tag_label4"] = tag_label4

    local tag_label5 = fc.FExtensionsImage:create()
    tag_label5:setImage("nobatch/ditu_guoqingxinxi.png")
    tag_label5:setSize(cc.size(439,42))
    tag_label5:setAnchorPoint(cc.p(0.5,0.5))
    guo_qing:appendComponent(tag_label5)
    tag_label5:setPositionInContainer(cc.p(233.5,466))
    table_guo_qing["tag_label5"] = tag_label5

    local tag_label6 = fc.FExtensionsImage:create()
    tag_label6:setImage("nobatch/ditu_guoqingxinxi.png")
    tag_label6:setSize(cc.size(439,42))
    tag_label6:setAnchorPoint(cc.p(0.5,0.5))
    guo_qing:appendComponent(tag_label6)
    tag_label6:setPositionInContainer(cc.p(233.5,545))
    table_guo_qing["tag_label6"] = tag_label6

    local tag_label7 = fc.FExtensionsImage:create()
    tag_label7:setImage("nobatch/ditu_guoqingxinxi.png")
    tag_label7:setSize(cc.size(439,42))
    tag_label7:setAnchorPoint(cc.p(0.5,0.5))
    guo_qing:appendComponent(tag_label7)
    tag_label7:setPositionInContainer(cc.p(231.5,611))
    table_guo_qing["tag_label7"] = tag_label7

    local text_label1 = fc.FLabel:createBMFont()
    text_label1:setSize(cc.size(100,37))
    text_label1:setAnchorPoint(cc.p(0.5,0.5))
    text_label1:setFontSize(32)
    if  LANGUAGE_TYPE == 3 then
    	text_label1:setString("年號：")
    else
    	text_label1:setString("年号：")
    end
    
    text_label1:setColor(cc.c3b(140,27,4))
    guo_qing:appendComponent(text_label1)
    text_label1:setPositionInContainer(cc.p(95,91.5))
    table_guo_qing["text_label1"] = text_label1

    local year_str = fc.FLabel:createSystemFont()
    year_str:setSize(cc.size(100,37))
    year_str:setAnchorPoint(cc.p(0.5,0.5))
    year_str:setFontSize(20)
    year_str:setString("铮铮")
    year_str:setColor(cc.c3b(140,27,4))
    guo_qing:appendComponent(year_str)
    year_str:setPositionInContainer(cc.p(244,91.5))
    table_guo_qing["year_str"] = year_str

    local text_label2 = fc.FLabel:createBMFont()
    text_label2:setSize(cc.size(100,37))
    text_label2:setAnchorPoint(cc.p(0.5,0.5))
    text_label2:setFontSize(32)
    text_label2:setString("姓名：")
    text_label2:setColor(cc.c3b(140,27,4))
    guo_qing:appendComponent(text_label2)
    text_label2:setPositionInContainer(cc.p(95,132.5))
    table_guo_qing["text_label2"] = text_label2

    local user_str = fc.FLabel:createSystemFont()
    user_str:setSize(cc.size(100,37))
    user_str:setAnchorPoint(cc.p(0.5,0.5))
    user_str:setFontSize(20)
    user_str:setString("xiaozhengzheng")
    user_str:setColor(cc.c3b(140,27,4))
    guo_qing:appendComponent(user_str)
    user_str:setPositionInContainer(cc.p(244,133.5))
    table_guo_qing["user_str"] = user_str

    local text_label3 = fc.FLabel:createBMFont()
    text_label3:setSize(cc.size(100,37))
    text_label3:setAnchorPoint(cc.p(0.5,0.5))
    text_label3:setFontSize(32)
    if LANGUAGE_TYPE == 3 then
    	text_label3:setString("VIP等級：")
    else
	    text_label3:setString("VIP等级：")
    end
    text_label3:setColor(cc.c3b(140,27,4))
    guo_qing:appendComponent(text_label3)
    text_label3:setPositionInContainer(cc.p(95,174.5))
    table_guo_qing["text_label3"] = text_label3

    local text_label4 = fc.FLabel:createBMFont()
    text_label4:setSize(cc.size(100,37))
    text_label4:setAnchorPoint(cc.p(0.5,0.5))
    text_label4:setFontSize(32)
    if LANGUAGE_TYPE == 3 then
        text_label4:setString("等級：")
    else
       	text_label4:setString("等级：")
    end
    
    text_label4:setColor(cc.c3b(140,27,4))
    guo_qing:appendComponent(text_label4)
    text_label4:setPositionInContainer(cc.p(95,242.5))
    table_guo_qing["text_label4"] = text_label4

    local text_label5 = fc.FLabel:createBMFont()
    text_label5:setSize(cc.size(100,37))
    text_label5:setAnchorPoint(cc.p(0.5,0.5))
    text_label5:setFontSize(32)
    if LANGUAGE_TYPE == 3 then
	    text_label5:setString("經驗：")
    else
	    text_label5:setString("经验：")
    end
    text_label5:setColor(cc.c3b(140,27,4))
    guo_qing:appendComponent(text_label5)
    text_label5:setPositionInContainer(cc.p(95,288.5))
    table_guo_qing["text_label5"] = text_label5

    local text_label6 = fc.FLabel:createBMFont()
    text_label6:setSize(cc.size(100,37))
    text_label6:setAnchorPoint(cc.p(0.5,0.5))
    text_label6:setFontSize(32)
     if LANGUAGE_TYPE == 3 then
     	text_label6:setString("銀兩：")
     else
	    text_label6:setString("银两：")
     end
    text_label6:setColor(cc.c3b(140,27,4))
    guo_qing:appendComponent(text_label6)
    text_label6:setPositionInContainer(cc.p(95,334.5))
    table_guo_qing["text_label6"] = text_label6

    local text_label7 = fc.FLabel:createBMFont()
    text_label7:setSize(cc.size(100,37))
    text_label7:setAnchorPoint(cc.p(0.5,0.5))
    text_label7:setFontSize(32)
     if LANGUAGE_TYPE == 3 then
     	text_label7:setString("元寶：")
     else
	    text_label7:setString("元宝：")
     end
    text_label7:setColor(cc.c3b(140,27,4))
    guo_qing:appendComponent(text_label7)
    text_label7:setPositionInContainer(cc.p(95,380.5))
    table_guo_qing["text_label7"] = text_label7

    local text_label8 = fc.FLabel:createBMFont()
    text_label8:setSize(cc.size(100,37))
    text_label8:setAnchorPoint(cc.p(0.5,0.5))
    text_label8:setFontSize(32)
    local str1 = g_game.g_dictConfigManager:getLanTextById(100)
    text_label8:setString(str1)
    text_label8:setColor(cc.c3b(140,27,4))
    guo_qing:appendComponent(text_label8)
    text_label8:setPositionInContainer(cc.p(95,421.5))
    table_guo_qing["text_label8"] = text_label8

    local text_label9 = fc.FLabel:createBMFont()
    text_label9:setSize(cc.size(100,37))
    text_label9:setAnchorPoint(cc.p(0.5,0.5))
    text_label9:setFontSize(32)
     local str2 = g_game.g_dictConfigManager:getLanTextById(101)
    text_label9:setString(str2)
    text_label9:setColor(cc.c3b(140,27,4))
    guo_qing:appendComponent(text_label9)
    text_label9:setPositionInContainer(cc.p(95,501.5))
    table_guo_qing["text_label9"] = text_label9

    local text_label10 = fc.FLabel:createBMFont()
    text_label10:setSize(cc.size(100,37))
    text_label10:setAnchorPoint(cc.p(0.5,0.5))
    text_label10:setFontSize(32)
     local str3 = g_game.g_dictConfigManager:getLanTextById(102)
    text_label10:setString(str3)
    text_label10:setColor(cc.c3b(140,27,4))
    guo_qing:appendComponent(text_label10)
    text_label10:setPositionInContainer(cc.p(95,574.5))
    table_guo_qing["text_label10"] = text_label10

    local vip_btn = fc.FTextButton:create()
    vip_btn:setSize(cc.size(139,47))
    vip_btn:setAnchorPoint(cc.p(0.5,0.5))
    vip_btn:setTextButtonImage("batch_ui/VIP_guoqingxinxi.png","batch_ui/VIP_guoqingxinxi.png","batch_ui/VIP_guoqingxinxi.png")
    if LANGUAGE_TYPE == 3 then
    	 vip_btn:setText("VIP特權",cc.c3b(255,255,255))
    else
    	 vip_btn:setText("VIP特权",cc.c3b(255,255,255))
    end
   
    vip_btn:setSelectActionEnbaled(true)
    guo_qing:appendComponent(vip_btn)
    vip_btn:setPositionInContainer(cc.p(380.5,181.5))
    table_guo_qing["vip_btn"] = vip_btn

    local level_value = fc.FLabel:createBMFont()
    level_value:setSize(cc.size(100,37))
    level_value:setAnchorPoint(cc.p(0.5,0.5))
    level_value:setFontSize(20)
    level_value:setString("19")
    level_value:setColor(cc.c3b(140,27,4))
    guo_qing:appendComponent(level_value)
    level_value:setPositionInContainer(cc.p(244,242.5))
    table_guo_qing["level_value"] = level_value

    local exp_value = fc.FLabel:createBMFont()
    exp_value:setSize(cc.size(100,37))
    exp_value:setAnchorPoint(cc.p(0.5,0.5))
    exp_value:setFontSize(20)
    exp_value:setString("200")
    exp_value:setColor(cc.c3b(140,27,4))
    guo_qing:appendComponent(exp_value)
    exp_value:setPositionInContainer(cc.p(244,288.5))
    table_guo_qing["exp_value"] = exp_value

    local silver_value = fc.FLabel:createBMFont()
    silver_value:setSize(cc.size(100,37))
    silver_value:setAnchorPoint(cc.p(0.5,0.5))
    silver_value:setFontSize(20)
    silver_value:setString("100")
    silver_value:setColor(cc.c3b(140,27,4))
    guo_qing:appendComponent(silver_value)
    silver_value:setPositionInContainer(cc.p(244,335.5))
    table_guo_qing["silver_value"] = silver_value

    local yuanbao_value = fc.FLabel:createBMFont()
    yuanbao_value:setSize(cc.size(100,37))
    yuanbao_value:setAnchorPoint(cc.p(0.5,0.5))
    yuanbao_value:setFontSize(20)
    yuanbao_value:setString("105")
    yuanbao_value:setColor(cc.c3b(140,27,4))
    guo_qing:appendComponent(yuanbao_value)
    yuanbao_value:setPositionInContainer(cc.p(244,381.5))
    table_guo_qing["yuanbao_value"] = yuanbao_value

    local liangcao_des = fc.FLabel:createBMFont()
    liangcao_des:setSize(cc.size(164,37))
    liangcao_des:setAnchorPoint(cc.p(0.5,0.5))
    liangcao_des:setFontSize(20)
     local str4 = g_game.g_dictConfigManager:getLanTextById(103)
    liangcao_des:setString(str4)
    liangcao_des:setColor(cc.c3b(14,114,47))
    guo_qing:appendComponent(liangcao_des)
    liangcao_des:setPositionInContainer(cc.p(250,423.5))
    table_guo_qing["liangcao_des"] = liangcao_des

    local liangcao_cd_value = fc.FLabel:createBMFont()
    liangcao_cd_value:setSize(cc.size(100,37))
    liangcao_cd_value:setAnchorPoint(cc.p(0.5,0.5))
    liangcao_cd_value:setFontSize(20)
    liangcao_cd_value:setString("00:00:00")
    liangcao_cd_value:setColor(cc.c3b(14,114,47))
    guo_qing:appendComponent(liangcao_cd_value)
    liangcao_cd_value:setPositionInContainer(cc.p(409,423.5))
    table_guo_qing["liangcao_cd_value"] = liangcao_cd_value

    local junling_des = fc.FLabel:createBMFont()
    junling_des:setSize(cc.size(164,37))
    junling_des:setAnchorPoint(cc.p(0.5,0.5))
    junling_des:setFontSize(20)
    local str5 = g_game.g_dictConfigManager:getLanTextById(104)
    junling_des:setString(str5)
    junling_des:setColor(cc.c3b(14,114,47))
    guo_qing:appendComponent(junling_des)
    junling_des:setPositionInContainer(cc.p(250,503.5))
    table_guo_qing["junling_des"] = junling_des

    local junling_cd_value = fc.FLabel:createBMFont()
    junling_cd_value:setSize(cc.size(100,37))
    junling_cd_value:setAnchorPoint(cc.p(0.5,0.5))
    junling_cd_value:setFontSize(20)
    junling_cd_value:setString("00:00:00")
    junling_cd_value:setColor(cc.c3b(14,114,47))
    guo_qing:appendComponent(junling_cd_value)
    junling_cd_value:setPositionInContainer(cc.p(409,503.5))
    table_guo_qing["junling_cd_value"] = junling_cd_value

    local jingli_des = fc.FLabel:createBMFont()
    jingli_des:setSize(cc.size(164,37))
    jingli_des:setAnchorPoint(cc.p(0.5,0.5))
    jingli_des:setFontSize(20)
     local str6 = g_game.g_dictConfigManager:getLanTextById(105)
    jingli_des:setString(str6)
    jingli_des:setColor(cc.c3b(14,114,47))
    guo_qing:appendComponent(jingli_des)
    jingli_des:setPositionInContainer(cc.p(250,576.5))
    table_guo_qing["jingli_des"] = jingli_des

    local jingli_cd_value = fc.FLabel:createBMFont()
    jingli_cd_value:setSize(cc.size(100,37))
    jingli_cd_value:setAnchorPoint(cc.p(0.5,0.5))
    jingli_cd_value:setFontSize(20)
    jingli_cd_value:setString("00:00:00")
    jingli_cd_value:setColor(cc.c3b(14,114,47))
    guo_qing:appendComponent(jingli_cd_value)
    jingli_cd_value:setPositionInContainer(cc.p(408,576.5))
    table_guo_qing["jingli_cd_value"] = jingli_cd_value

    local small_bg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/biaotiditu_guoqingxinxi.png",cc.rect(70,15,4,4))
    small_bg:setSize(cc.size(400,34))
    small_bg:setAnchorPoint(cc.p(0.5,0.5))
    guo_qing:appendComponent(small_bg)
    small_bg:setPositionInContainer(cc.p(725,96))
    table_guo_qing["small_bg"] = small_bg

    local temp_image = fc.FExtensionsImage:create()
    temp_image:setImage("batch_ui/ditu2_guoqingxinxi.png")
    temp_image:setSize(cc.size(400,4))
    temp_image:setAnchorPoint(cc.p(0.5,0.5))
    guo_qing:appendComponent(temp_image)
    temp_image:setPositionInContainer(cc.p(724,292))
    table_guo_qing["temp_image"] = temp_image

    local star_label5 = fc.FLabel:createBMFont()
    star_label5:setSize(cc.size(60,37))
    star_label5:setAnchorPoint(cc.p(0.5,0.5))
    star_label5:setFontSize(20)
    star_label5:setString("5星：")
    star_label5:setColor(cc.c3b(140,27,4))
    guo_qing:appendComponent(star_label5)
    star_label5:setPositionInContainer(cc.p(583,135.5))
    table_guo_qing["star_label5"] = star_label5

    local star_label4 = fc.FLabel:createBMFont()
    star_label4:setSize(cc.size(60,37))
    star_label4:setAnchorPoint(cc.p(0.5,0.5))
    star_label4:setFontSize(20)
    star_label4:setString("4星：")
    star_label4:setColor(cc.c3b(140,27,4))
    guo_qing:appendComponent(star_label4)
    star_label4:setPositionInContainer(cc.p(767,130.5))
    table_guo_qing["star_label4"] = star_label4

    local star_label3 = fc.FLabel:createBMFont()
    star_label3:setSize(cc.size(60,37))
    star_label3:setAnchorPoint(cc.p(0.5,0.5))
    star_label3:setFontSize(20)
    star_label3:setString("3星：")
    star_label3:setColor(cc.c3b(140,27,4))
    guo_qing:appendComponent(star_label3)
    star_label3:setPositionInContainer(cc.p(583,173.5))
    table_guo_qing["star_label3"] = star_label3

    local star_label2 = fc.FLabel:createBMFont()
    star_label2:setSize(cc.size(60,37))
    star_label2:setAnchorPoint(cc.p(0.5,0.5))
    star_label2:setFontSize(20)
    star_label2:setString("2星：")
    star_label2:setColor(cc.c3b(140,27,4))
    guo_qing:appendComponent(star_label2)
    star_label2:setPositionInContainer(cc.p(767,168.5))
    table_guo_qing["star_label2"] = star_label2

    local star_label1 = fc.FLabel:createBMFont()
    star_label1:setSize(cc.size(60,37))
    star_label1:setAnchorPoint(cc.p(0.5,0.5))
    star_label1:setFontSize(20)
    star_label1:setString("1星：")
    star_label1:setColor(cc.c3b(140,27,4))
    guo_qing:appendComponent(star_label1)
    star_label1:setPositionInContainer(cc.p(583,207.5))
    table_guo_qing["star_label1"] = star_label1

    local font_di_image = fc.FExtensionsImage:create()
    font_di_image:setImage("batch_ui/zi_ditu_guoqingxinxi.png")
    font_di_image:setSize(cc.size(63,26))
    font_di_image:setAnchorPoint(cc.p(0.5,0.5))
    guo_qing:appendComponent(font_di_image)
    font_di_image:setPositionInContainer(cc.p(647.5,136))
    table_guo_qing["font_di_image"] = font_di_image

    local font_di_image = fc.FExtensionsImage:create()
    font_di_image:setImage("batch_ui/zi_ditu_guoqingxinxi.png")
    font_di_image:setSize(cc.size(63,26))
    font_di_image:setAnchorPoint(cc.p(0.5,0.5))
    guo_qing:appendComponent(font_di_image)
    font_di_image:setPositionInContainer(cc.p(647.5,174))
    table_guo_qing["font_di_image"] = font_di_image

    local font_di_image = fc.FExtensionsImage:create()
    font_di_image:setImage("batch_ui/zi_ditu_guoqingxinxi.png")
    font_di_image:setSize(cc.size(63,26))
    font_di_image:setAnchorPoint(cc.p(0.5,0.5))
    guo_qing:appendComponent(font_di_image)
    font_di_image:setPositionInContainer(cc.p(647.5,213))
    table_guo_qing["font_di_image"] = font_di_image

    local font_di_image = fc.FExtensionsImage:create()
    font_di_image:setImage("batch_ui/zi_ditu_guoqingxinxi.png")
    font_di_image:setSize(cc.size(63,26))
    font_di_image:setAnchorPoint(cc.p(0.5,0.5))
    guo_qing:appendComponent(font_di_image)
    font_di_image:setPositionInContainer(cc.p(833.5,135))
    table_guo_qing["font_di_image"] = font_di_image

    local font_di_image = fc.FExtensionsImage:create()
    font_di_image:setImage("batch_ui/zi_ditu_guoqingxinxi.png")
    font_di_image:setSize(cc.size(63,26))
    font_di_image:setAnchorPoint(cc.p(0.5,0.5))
    guo_qing:appendComponent(font_di_image)
    font_di_image:setPositionInContainer(cc.p(833.5,171))
    table_guo_qing["font_di_image"] = font_di_image

    local wei_label = fc.FLabel:createBMFont()
    wei_label:setSize(cc.size(30,30))
    wei_label:setAnchorPoint(cc.p(0.5,0.5))
    wei_label:setFontSize(20)
    wei_label:setString("位")
    wei_label:setColor(cc.c3b(140,27,4))
    guo_qing:appendComponent(wei_label)
    wei_label:setPositionInContainer(cc.p(880,131))
    table_guo_qing["wei_label"] = wei_label

    local wei_label = fc.FLabel:createBMFont()
    wei_label:setSize(cc.size(30,30))
    wei_label:setAnchorPoint(cc.p(0.5,0.5))
    wei_label:setFontSize(20)
    wei_label:setString("位")
    wei_label:setColor(cc.c3b(140,27,4))
    guo_qing:appendComponent(wei_label)
    wei_label:setPositionInContainer(cc.p(880,167))
    table_guo_qing["wei_label"] = wei_label

    local wei_label = fc.FLabel:createBMFont()
    wei_label:setSize(cc.size(30,30))
    wei_label:setAnchorPoint(cc.p(0.5,0.5))
    wei_label:setFontSize(20)
    wei_label:setString("位")
    wei_label:setColor(cc.c3b(140,27,4))
    guo_qing:appendComponent(wei_label)
    wei_label:setPositionInContainer(cc.p(694,132))
    table_guo_qing["wei_label"] = wei_label

    local wei_label = fc.FLabel:createBMFont()
    wei_label:setSize(cc.size(30,30))
    wei_label:setAnchorPoint(cc.p(0.5,0.5))
    wei_label:setFontSize(20)
    wei_label:setString("位")
    wei_label:setColor(cc.c3b(140,27,4))
    guo_qing:appendComponent(wei_label)
    wei_label:setPositionInContainer(cc.p(694,170))
    table_guo_qing["wei_label"] = wei_label

    local wei_label = fc.FLabel:createBMFont()
    wei_label:setSize(cc.size(30,30))
    wei_label:setAnchorPoint(cc.p(0.5,0.5))
    wei_label:setFontSize(20)
    wei_label:setString("位")
    wei_label:setColor(cc.c3b(140,27,4))
    guo_qing:appendComponent(wei_label)
    wei_label:setPositionInContainer(cc.p(694,208))
    table_guo_qing["wei_label"] = wei_label

    local font_di_big_image = fc.FExtensionsImage:create()
    font_di_big_image:setImage("batch_ui/zi_ditu_guoqingxinxi.png")
    font_di_big_image:setSize(cc.size(114,50))
    font_di_big_image:setAnchorPoint(cc.p(0.5,0.5))
    guo_qing:appendComponent(font_di_big_image)
    font_di_big_image:setPositionInContainer(cc.p(658,260))
    table_guo_qing["font_di_big_image"] = font_di_big_image

    local font_di_big_image = fc.FExtensionsImage:create()
    font_di_big_image:setImage("batch_ui/zi_ditu_guoqingxinxi.png")
    font_di_big_image:setSize(cc.size(114,50))
    font_di_big_image:setAnchorPoint(cc.p(0.5,0.5))
    guo_qing:appendComponent(font_di_big_image)
    font_di_big_image:setPositionInContainer(cc.p(809,260))
    table_guo_qing["font_di_big_image"] = font_di_big_image

    local add_liangcao_btn = fc.FScaleButton:create()
    add_liangcao_btn:setSize(cc.size(35,35))
    add_liangcao_btn:setAnchorPoint(cc.p(0.5,0.5))
    add_liangcao_btn:setButtonImage("batch_ui/jia_guoqingxinxi.png")
    guo_qing:appendComponent(add_liangcao_btn)
    add_liangcao_btn:setPositionInContainer(cc.p(397.5,465.5))
    table_guo_qing["add_liangcao_btn"] = add_liangcao_btn

    local add_junling_btn = fc.FScaleButton:create()
    add_junling_btn:setSize(cc.size(35,35))
    add_junling_btn:setAnchorPoint(cc.p(0.5,0.5))
    add_junling_btn:setButtonImage("batch_ui/jia_guoqingxinxi.png")
    guo_qing:appendComponent(add_junling_btn)
    add_junling_btn:setPositionInContainer(cc.p(397.5,541.5))
    table_guo_qing["add_junling_btn"] = add_junling_btn

    local add_jingli_btn = fc.FScaleButton:create()
    add_jingli_btn:setSize(cc.size(35,35))
    add_jingli_btn:setAnchorPoint(cc.p(0.5,0.5))
    add_jingli_btn:setButtonImage("batch_ui/jia_guoqingxinxi.png")
    guo_qing:appendComponent(add_jingli_btn)
    add_jingli_btn:setPositionInContainer(cc.p(397.5,614.5))
    table_guo_qing["add_jingli_btn"] = add_jingli_btn

    local star_label5 = fc.FLabel:createBMFont()
    star_label5:setSize(cc.size(60,37))
    star_label5:setAnchorPoint(cc.p(0.5,0.5))
    star_label5:setFontSize(20)
    star_label5:setString("5星：")
    star_label5:setColor(cc.c3b(140,27,4))
    guo_qing:appendComponent(star_label5)
    star_label5:setPositionInContainer(cc.p(580,351.5))
    table_guo_qing["star_label5"] = star_label5

    local star_label4 = fc.FLabel:createBMFont()
    star_label4:setSize(cc.size(60,37))
    star_label4:setAnchorPoint(cc.p(0.5,0.5))
    star_label4:setFontSize(20)
    star_label4:setString("4星：")
    star_label4:setColor(cc.c3b(140,27,4))
    guo_qing:appendComponent(star_label4)
    star_label4:setPositionInContainer(cc.p(764,350.5))
    table_guo_qing["star_label4"] = star_label4

    local star_label3 = fc.FLabel:createBMFont()
    star_label3:setSize(cc.size(60,37))
    star_label3:setAnchorPoint(cc.p(0.5,0.5))
    star_label3:setFontSize(20)
    star_label3:setString("3星：")
    star_label3:setColor(cc.c3b(140,27,4))
    guo_qing:appendComponent(star_label3)
    star_label3:setPositionInContainer(cc.p(580,389.5))
    table_guo_qing["star_label3"] = star_label3

    local star_label2 = fc.FLabel:createBMFont()
    star_label2:setSize(cc.size(60,37))
    star_label2:setAnchorPoint(cc.p(0.5,0.5))
    star_label2:setFontSize(20)
    star_label2:setString("2星：")
    star_label2:setColor(cc.c3b(140,27,4))
    guo_qing:appendComponent(star_label2)
    star_label2:setPositionInContainer(cc.p(764,388.5))
    table_guo_qing["star_label2"] = star_label2

    local star_label1 = fc.FLabel:createBMFont()
    star_label1:setSize(cc.size(60,37))
    star_label1:setAnchorPoint(cc.p(0.5,0.5))
    star_label1:setFontSize(20)
    star_label1:setString("1星：")
    star_label1:setColor(cc.c3b(140,27,4))
    guo_qing:appendComponent(star_label1)
    star_label1:setPositionInContainer(cc.p(580,427.5))
    table_guo_qing["star_label1"] = star_label1

    local font_di_image = fc.FExtensionsImage:create()
    font_di_image:setImage("batch_ui/zi_ditu_guoqingxinxi.png")
    font_di_image:setSize(cc.size(63,26))
    font_di_image:setAnchorPoint(cc.p(0.5,0.5))
    guo_qing:appendComponent(font_di_image)
    font_di_image:setPositionInContainer(cc.p(644.5,356))
    table_guo_qing["font_di_image"] = font_di_image

    local font_di_image = fc.FExtensionsImage:create()
    font_di_image:setImage("batch_ui/zi_ditu_guoqingxinxi.png")
    font_di_image:setSize(cc.size(63,26))
    font_di_image:setAnchorPoint(cc.p(0.5,0.5))
    guo_qing:appendComponent(font_di_image)
    font_di_image:setPositionInContainer(cc.p(644.5,394))
    table_guo_qing["font_di_image"] = font_di_image

    local font_di_image = fc.FExtensionsImage:create()
    font_di_image:setImage("batch_ui/zi_ditu_guoqingxinxi.png")
    font_di_image:setSize(cc.size(63,26))
    font_di_image:setAnchorPoint(cc.p(0.5,0.5))
    guo_qing:appendComponent(font_di_image)
    font_di_image:setPositionInContainer(cc.p(644.5,433))
    table_guo_qing["font_di_image"] = font_di_image

    local font_di_image = fc.FExtensionsImage:create()
    font_di_image:setImage("batch_ui/zi_ditu_guoqingxinxi.png")
    font_di_image:setSize(cc.size(63,26))
    font_di_image:setAnchorPoint(cc.p(0.5,0.5))
    guo_qing:appendComponent(font_di_image)
    font_di_image:setPositionInContainer(cc.p(830.5,355))
    table_guo_qing["font_di_image"] = font_di_image

    local font_di_image = fc.FExtensionsImage:create()
    font_di_image:setImage("batch_ui/zi_ditu_guoqingxinxi.png")
    font_di_image:setSize(cc.size(63,26))
    font_di_image:setAnchorPoint(cc.p(0.5,0.5))
    guo_qing:appendComponent(font_di_image)
    font_di_image:setPositionInContainer(cc.p(830.5,391))
    table_guo_qing["font_di_image"] = font_di_image

    local wei_label = fc.FLabel:createBMFont()
    wei_label:setSize(cc.size(30,30))
    wei_label:setAnchorPoint(cc.p(0.5,0.5))
    wei_label:setFontSize(20)
    wei_label:setString("位")
    wei_label:setColor(cc.c3b(140,27,4))
    guo_qing:appendComponent(wei_label)
    wei_label:setPositionInContainer(cc.p(877,351))
    table_guo_qing["wei_label"] = wei_label

    local wei_label = fc.FLabel:createBMFont()
    wei_label:setSize(cc.size(30,30))
    wei_label:setAnchorPoint(cc.p(0.5,0.5))
    wei_label:setFontSize(20)
    wei_label:setString("位")
    wei_label:setColor(cc.c3b(140,27,4))
    guo_qing:appendComponent(wei_label)
    wei_label:setPositionInContainer(cc.p(877,387))
    table_guo_qing["wei_label"] = wei_label

    local wei_label = fc.FLabel:createBMFont()
    wei_label:setSize(cc.size(30,30))
    wei_label:setAnchorPoint(cc.p(0.5,0.5))
    wei_label:setFontSize(20)
    wei_label:setString("位")
    wei_label:setColor(cc.c3b(140,27,4))
    guo_qing:appendComponent(wei_label)
    wei_label:setPositionInContainer(cc.p(691,352))
    table_guo_qing["wei_label"] = wei_label

    local wei_label = fc.FLabel:createBMFont()
    wei_label:setSize(cc.size(30,30))
    wei_label:setAnchorPoint(cc.p(0.5,0.5))
    wei_label:setFontSize(20)
    wei_label:setString("位")
    wei_label:setColor(cc.c3b(140,27,4))
    guo_qing:appendComponent(wei_label)
    wei_label:setPositionInContainer(cc.p(691,390))
    table_guo_qing["wei_label"] = wei_label

    local wei_label = fc.FLabel:createBMFont()
    wei_label:setSize(cc.size(30,30))
    wei_label:setAnchorPoint(cc.p(0.5,0.5))
    wei_label:setFontSize(20)
    wei_label:setString("位")
    wei_label:setColor(cc.c3b(140,27,4))
    guo_qing:appendComponent(wei_label)
    wei_label:setPositionInContainer(cc.p(691,428))
    table_guo_qing["wei_label"] = wei_label

    local star_label5 = fc.FLabel:createBMFont()
    star_label5:setSize(cc.size(60,37))
    star_label5:setAnchorPoint(cc.p(0.5,0.5))
    star_label5:setFontSize(20)
    star_label5:setString("5星：")
    star_label5:setColor(cc.c3b(140,27,4))
    guo_qing:appendComponent(star_label5)
    star_label5:setPositionInContainer(cc.p(577,528.5))
    table_guo_qing["star_label5"] = star_label5

    local star_label4 = fc.FLabel:createBMFont()
    star_label4:setSize(cc.size(60,37))
    star_label4:setAnchorPoint(cc.p(0.5,0.5))
    star_label4:setFontSize(20)
    star_label4:setString("4星：")
    star_label4:setColor(cc.c3b(140,27,4))
    guo_qing:appendComponent(star_label4)
    star_label4:setPositionInContainer(cc.p(761,527.5))
    table_guo_qing["star_label4"] = star_label4

    local star_label3 = fc.FLabel:createBMFont()
    star_label3:setSize(cc.size(60,37))
    star_label3:setAnchorPoint(cc.p(0.5,0.5))
    star_label3:setFontSize(20)
    star_label3:setString("3星：")
    star_label3:setColor(cc.c3b(140,27,4))
    guo_qing:appendComponent(star_label3)
    star_label3:setPositionInContainer(cc.p(577,566.5))
    table_guo_qing["star_label3"] = star_label3

    local star_label2 = fc.FLabel:createBMFont()
    star_label2:setSize(cc.size(60,37))
    star_label2:setAnchorPoint(cc.p(0.5,0.5))
    star_label2:setFontSize(20)
    star_label2:setString("2星：")
    star_label2:setColor(cc.c3b(140,27,4))
    guo_qing:appendComponent(star_label2)
    star_label2:setPositionInContainer(cc.p(761,565.5))
    table_guo_qing["star_label2"] = star_label2

    local star_label1 = fc.FLabel:createBMFont()
    star_label1:setSize(cc.size(60,37))
    star_label1:setAnchorPoint(cc.p(0.5,0.5))
    star_label1:setFontSize(20)
    star_label1:setString("1星：")
    star_label1:setColor(cc.c3b(140,27,4))
    guo_qing:appendComponent(star_label1)
    star_label1:setPositionInContainer(cc.p(577,604.5))
    table_guo_qing["star_label1"] = star_label1

    local font_di_image = fc.FExtensionsImage:create()
    font_di_image:setImage("batch_ui/zi_ditu_guoqingxinxi.png")
    font_di_image:setSize(cc.size(63,26))
    font_di_image:setAnchorPoint(cc.p(0.5,0.5))
    guo_qing:appendComponent(font_di_image)
    font_di_image:setPositionInContainer(cc.p(641.5,533))
    table_guo_qing["font_di_image"] = font_di_image

    local font_di_image = fc.FExtensionsImage:create()
    font_di_image:setImage("batch_ui/zi_ditu_guoqingxinxi.png")
    font_di_image:setSize(cc.size(63,26))
    font_di_image:setAnchorPoint(cc.p(0.5,0.5))
    guo_qing:appendComponent(font_di_image)
    font_di_image:setPositionInContainer(cc.p(641.5,571))
    table_guo_qing["font_di_image"] = font_di_image

    local font_di_image = fc.FExtensionsImage:create()
    font_di_image:setImage("batch_ui/zi_ditu_guoqingxinxi.png")
    font_di_image:setSize(cc.size(63,26))
    font_di_image:setAnchorPoint(cc.p(0.5,0.5))
    guo_qing:appendComponent(font_di_image)
    font_di_image:setPositionInContainer(cc.p(641.5,610))
    table_guo_qing["font_di_image"] = font_di_image

    local font_di_image = fc.FExtensionsImage:create()
    font_di_image:setImage("batch_ui/zi_ditu_guoqingxinxi.png")
    font_di_image:setSize(cc.size(63,26))
    font_di_image:setAnchorPoint(cc.p(0.5,0.5))
    guo_qing:appendComponent(font_di_image)
    font_di_image:setPositionInContainer(cc.p(827.5,532))
    table_guo_qing["font_di_image"] = font_di_image

    local font_di_image = fc.FExtensionsImage:create()
    font_di_image:setImage("batch_ui/zi_ditu_guoqingxinxi.png")
    font_di_image:setSize(cc.size(63,26))
    font_di_image:setAnchorPoint(cc.p(0.5,0.5))
    guo_qing:appendComponent(font_di_image)
    font_di_image:setPositionInContainer(cc.p(827.5,568))
    table_guo_qing["font_di_image"] = font_di_image

    local wei_label = fc.FLabel:createBMFont()
    wei_label:setSize(cc.size(30,30))
    wei_label:setAnchorPoint(cc.p(0.5,0.5))
    wei_label:setFontSize(20)
    wei_label:setString("位")
    wei_label:setColor(cc.c3b(140,27,4))
    guo_qing:appendComponent(wei_label)
    wei_label:setPositionInContainer(cc.p(874,528))
    table_guo_qing["wei_label"] = wei_label

    local wei_label = fc.FLabel:createBMFont()
    wei_label:setSize(cc.size(30,30))
    wei_label:setAnchorPoint(cc.p(0.5,0.5))
    wei_label:setFontSize(20)
    wei_label:setString("位")
    wei_label:setColor(cc.c3b(140,27,4))
    guo_qing:appendComponent(wei_label)
    wei_label:setPositionInContainer(cc.p(874,564))
    table_guo_qing["wei_label"] = wei_label

    local wei_label = fc.FLabel:createBMFont()
    wei_label:setSize(cc.size(30,30))
    wei_label:setAnchorPoint(cc.p(0.5,0.5))
    wei_label:setFontSize(20)
    wei_label:setString("位")
    wei_label:setColor(cc.c3b(140,27,4))
    guo_qing:appendComponent(wei_label)
    wei_label:setPositionInContainer(cc.p(688,529))
    table_guo_qing["wei_label"] = wei_label

    local wei_label = fc.FLabel:createBMFont()
    wei_label:setSize(cc.size(30,30))
    wei_label:setAnchorPoint(cc.p(0.5,0.5))
    wei_label:setFontSize(20)
    wei_label:setString("位")
    wei_label:setColor(cc.c3b(140,27,4))
    guo_qing:appendComponent(wei_label)
    wei_label:setPositionInContainer(cc.p(688,567))
    table_guo_qing["wei_label"] = wei_label

    local wei_label = fc.FLabel:createBMFont()
    wei_label:setSize(cc.size(30,30))
    wei_label:setAnchorPoint(cc.p(0.5,0.5))
    wei_label:setFontSize(20)
    wei_label:setString("位")
    wei_label:setColor(cc.c3b(140,27,4))
    guo_qing:appendComponent(wei_label)
    wei_label:setPositionInContainer(cc.p(688,605))
    table_guo_qing["wei_label"] = wei_label

    local small_bg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/biaotiditu_guoqingxinxi.png",cc.rect(70,15,4,4))
    small_bg:setSize(cc.size(400,34))
    small_bg:setAnchorPoint(cc.p(0.5,0.5))
    guo_qing:appendComponent(small_bg)
    small_bg:setPositionInContainer(cc.p(725,315))
    table_guo_qing["small_bg"] = small_bg

    local small_bg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/biaotiditu_guoqingxinxi.png",cc.rect(70,15,4,4))
    small_bg:setSize(cc.size(400,34))
    small_bg:setAnchorPoint(cc.p(0.5,0.5))
    guo_qing:appendComponent(small_bg)
    small_bg:setPositionInContainer(cc.p(725,490))
    table_guo_qing["small_bg"] = small_bg

    local temp_image = fc.FExtensionsImage:create()
    temp_image:setImage("batch_ui/ditu2_guoqingxinxi.png")
    temp_image:setSize(cc.size(400,4))
    temp_image:setAnchorPoint(cc.p(0.5,0.5))
    guo_qing:appendComponent(temp_image)
    temp_image:setPositionInContainer(cc.p(725,466))
    table_guo_qing["temp_image"] = temp_image

    local temp_image2 = fc.FExtensionsImage:create()
    temp_image2:setImage("batch_ui/ditu2_guoqingxinxi.png")
    temp_image2:setSize(cc.size(114,4))
    temp_image2:setAnchorPoint(cc.p(0.5,0.5))
    guo_qing:appendComponent(temp_image2)
    temp_image2:setPositionInContainer(cc.p(659,261))
    table_guo_qing["temp_image2"] = temp_image2

    local temp_image2 = fc.FExtensionsImage:create()
    temp_image2:setImage("batch_ui/ditu2_guoqingxinxi.png")
    temp_image2:setSize(cc.size(114,4))
    temp_image2:setAnchorPoint(cc.p(0.5,0.5))
    guo_qing:appendComponent(temp_image2)
    temp_image2:setPositionInContainer(cc.p(809,261))
    table_guo_qing["temp_image2"] = temp_image2

    local mingchen_label = fc.FLabel:createBMFont()
    mingchen_label:setSize(cc.size(200,30))
    mingchen_label:setAnchorPoint(cc.p(0.5,0.5))
    mingchen_label:setFontSize(20)
    if LANGUAGE_TYPE == 3 then
    	mingchen_label:setString("名臣陣容概況：")
    else
	    mingchen_label:setString("名臣阵容概况：")
    end
    mingchen_label:setColor(cc.c3b(255,255,255))
    guo_qing:appendComponent(mingchen_label)
    mingchen_label:setPositionInContainer(cc.p(644,92))
    table_guo_qing["mingchen_label"] = mingchen_label

    local meinv_label = fc.FLabel:createBMFont()
    meinv_label:setSize(cc.size(200,30))
    meinv_label:setAnchorPoint(cc.p(0.5,0.5))
    meinv_label:setFontSize(20)
    if LANGUAGE_TYPE == 3 then
    	meinv_label:setString("後宮美女概況：")
    else
    	meinv_label:setString("后宫美女概况：")
    end
    meinv_label:setColor(cc.c3b(255,255,255))
    guo_qing:appendComponent(meinv_label)
    meinv_label:setPositionInContainer(cc.p(642,311))
    table_guo_qing["meinv_label"] = meinv_label

    local huangzi_label = fc.FLabel:createBMFont()
    huangzi_label:setSize(cc.size(200,30))
    huangzi_label:setAnchorPoint(cc.p(0.5,0.5))
    huangzi_label:setFontSize(20)
    if LANGUAGE_TYPE == 3 then
    	huangzi_label:setString("皇子督軍概況：")
    else
	    huangzi_label:setString("皇子督军概况：")
    end
    huangzi_label:setColor(cc.c3b(255,255,255))
    guo_qing:appendComponent(huangzi_label)
    huangzi_label:setPositionInContainer(cc.p(644,486))
    table_guo_qing["huangzi_label"] = huangzi_label

    local mingchen_num = fc.FLabel:createBMFont()
    mingchen_num:setSize(cc.size(60,30))
    mingchen_num:setAnchorPoint(cc.p(0.5,0.5))
    mingchen_num:setFontSize(20)
    mingchen_num:setString("(1/1)")
    mingchen_num:setColor(cc.c3b(140,27,4))
    guo_qing:appendComponent(mingchen_num)
    mingchen_num:setPositionInContainer(cc.p(789,92))
    table_guo_qing["mingchen_num"] = mingchen_num

    local meinv_num = fc.FLabel:createBMFont()
    meinv_num:setSize(cc.size(60,30))
    meinv_num:setAnchorPoint(cc.p(0.5,0.5))
    meinv_num:setFontSize(20)
    meinv_num:setString("(1/1)")
    meinv_num:setColor(cc.c3b(140,27,4))
    guo_qing:appendComponent(meinv_num)
    meinv_num:setPositionInContainer(cc.p(789,311))
    table_guo_qing["meinv_num"] = meinv_num

    local huangzi_num = fc.FLabel:createBMFont()
    huangzi_num:setSize(cc.size(60,30))
    huangzi_num:setAnchorPoint(cc.p(0.5,0.5))
    huangzi_num:setFontSize(20)
    huangzi_num:setString("(1/1)")
    huangzi_num:setColor(cc.c3b(140,27,4))
    guo_qing:appendComponent(huangzi_num)
    huangzi_num:setPositionInContainer(cc.p(789,486))
    table_guo_qing["huangzi_num"] = huangzi_num

    local mingcheng_5_num = fc.FLabel:createBMFont()
    mingcheng_5_num:setSize(cc.size(60,30))
    mingcheng_5_num:setAnchorPoint(cc.p(0.5,0.5))
    mingcheng_5_num:setFontSize(20)
    mingcheng_5_num:setString("0")
    mingcheng_5_num:setColor(cc.c3b(255,27,4))
    guo_qing:appendComponent(mingcheng_5_num)
    mingcheng_5_num:setPositionInContainer(cc.p(646,132))
    table_guo_qing["mingcheng_5_num"] = mingcheng_5_num

    local mingcheng_4_num = fc.FLabel:createBMFont()
    mingcheng_4_num:setSize(cc.size(60,30))
    mingcheng_4_num:setAnchorPoint(cc.p(0.5,0.5))
    mingcheng_4_num:setFontSize(20)
    mingcheng_4_num:setString("0")
    mingcheng_4_num:setColor(cc.c3b(255,27,4))
    guo_qing:appendComponent(mingcheng_4_num)
    mingcheng_4_num:setPositionInContainer(cc.p(832,131))
    table_guo_qing["mingcheng_4_num"] = mingcheng_4_num

    local mingcheng_3_num = fc.FLabel:createBMFont()
    mingcheng_3_num:setSize(cc.size(60,30))
    mingcheng_3_num:setAnchorPoint(cc.p(0.5,0.5))
    mingcheng_3_num:setFontSize(20)
    mingcheng_3_num:setString("0")
    mingcheng_3_num:setColor(cc.c3b(255,27,4))
    guo_qing:appendComponent(mingcheng_3_num)
    mingcheng_3_num:setPositionInContainer(cc.p(646,170))
    table_guo_qing["mingcheng_3_num"] = mingcheng_3_num

    local mingcheng_2_num = fc.FLabel:createBMFont()
    mingcheng_2_num:setSize(cc.size(60,30))
    mingcheng_2_num:setAnchorPoint(cc.p(0.5,0.5))
    mingcheng_2_num:setFontSize(20)
    mingcheng_2_num:setString("0")
    mingcheng_2_num:setColor(cc.c3b(255,27,4))
    guo_qing:appendComponent(mingcheng_2_num)
    mingcheng_2_num:setPositionInContainer(cc.p(832,167))
    table_guo_qing["mingcheng_2_num"] = mingcheng_2_num

    local mingcheng_1_num = fc.FLabel:createBMFont()
    mingcheng_1_num:setSize(cc.size(60,30))
    mingcheng_1_num:setAnchorPoint(cc.p(0.5,0.5))
    mingcheng_1_num:setFontSize(20)
    mingcheng_1_num:setString("0")
    mingcheng_1_num:setColor(cc.c3b(255,27,4))
    guo_qing:appendComponent(mingcheng_1_num)
    mingcheng_1_num:setPositionInContainer(cc.p(646,208))
    table_guo_qing["mingcheng_1_num"] = mingcheng_1_num

    local total_def = fc.FLabel:createBMFont()
    total_def:setSize(cc.size(60,21))
    total_def:setAnchorPoint(cc.p(0.5,0.5))
    total_def:setFontSize(20)
    total_def:setString("0")
    total_def:setColor(cc.c3b(255,27,4))
    guo_qing:appendComponent(total_def)
    total_def:setPositionInContainer(cc.p(659,270.5))
    table_guo_qing["total_def"] = total_def

    local total_atk = fc.FLabel:createBMFont()
    total_atk:setSize(cc.size(60,21))
    total_atk:setAnchorPoint(cc.p(0.5,0.5))
    total_atk:setFontSize(20)
    total_atk:setString("0")
    total_atk:setColor(cc.c3b(255,27,4))
    guo_qing:appendComponent(total_atk)
    total_atk:setPositionInContainer(cc.p(809,270.5))
    table_guo_qing["total_atk"] = total_atk

    local total_atk_des = fc.FLabel:createBMFont()
    total_atk_des:setSize(cc.size(60,21))
    total_atk_des:setAnchorPoint(cc.p(0.5,0.5))
    total_atk_des:setFontSize(20)
    if LANGUAGE_TYPE == 3 then
    	total_atk_des:setString("總攻擊：")
    else
    	total_atk_des:setString("总攻击：")
    end
    
    total_atk_des:setColor(cc.c3b(140,27,4))
    guo_qing:appendComponent(total_atk_des)
    total_atk_des:setPositionInContainer(cc.p(809,242.5))
    table_guo_qing["total_atk_des"] = total_atk_des

    local total_def_des = fc.FLabel:createBMFont()
    total_def_des:setSize(cc.size(60,21))
    total_def_des:setAnchorPoint(cc.p(0.5,0.5))
    total_def_des:setFontSize(20)
     if LANGUAGE_TYPE == 3 then
     	total_def_des:setString("總防禦：")
     else
    	total_def_des:setString("总防御：")
    end
    total_def_des:setColor(cc.c3b(140,27,4))
    guo_qing:appendComponent(total_def_des)
    total_def_des:setPositionInContainer(cc.p(659,242.5))
    table_guo_qing["total_def_des"] = total_def_des

    local meinv_1_num = fc.FLabel:createBMFont()
    meinv_1_num:setSize(cc.size(60,30))
    meinv_1_num:setAnchorPoint(cc.p(0.5,0.5))
    meinv_1_num:setFontSize(20)
    meinv_1_num:setString("0")
    meinv_1_num:setColor(cc.c3b(255,27,4))
    guo_qing:appendComponent(meinv_1_num)
    meinv_1_num:setPositionInContainer(cc.p(643,429))
    table_guo_qing["meinv_1_num"] = meinv_1_num

    local meinv_2_num = fc.FLabel:createBMFont()
    meinv_2_num:setSize(cc.size(60,30))
    meinv_2_num:setAnchorPoint(cc.p(0.5,0.5))
    meinv_2_num:setFontSize(20)
    meinv_2_num:setString("0")
    meinv_2_num:setColor(cc.c3b(255,27,4))
    guo_qing:appendComponent(meinv_2_num)
    meinv_2_num:setPositionInContainer(cc.p(832,387))
    table_guo_qing["meinv_2_num"] = meinv_2_num

    local meinv_3_num = fc.FLabel:createBMFont()
    meinv_3_num:setSize(cc.size(60,30))
    meinv_3_num:setAnchorPoint(cc.p(0.5,0.5))
    meinv_3_num:setFontSize(20)
    meinv_3_num:setString("0")
    meinv_3_num:setColor(cc.c3b(255,27,4))
    guo_qing:appendComponent(meinv_3_num)
    meinv_3_num:setPositionInContainer(cc.p(644,390))
    table_guo_qing["meinv_3_num"] = meinv_3_num

    local meinv_4_num = fc.FLabel:createBMFont()
    meinv_4_num:setSize(cc.size(60,30))
    meinv_4_num:setAnchorPoint(cc.p(0.5,0.5))
    meinv_4_num:setFontSize(20)
    meinv_4_num:setString("0")
    meinv_4_num:setColor(cc.c3b(255,27,4))
    guo_qing:appendComponent(meinv_4_num)
    meinv_4_num:setPositionInContainer(cc.p(832,351))
    table_guo_qing["meinv_4_num"] = meinv_4_num

    local meinv_5_num = fc.FLabel:createBMFont()
    meinv_5_num:setSize(cc.size(60,30))
    meinv_5_num:setAnchorPoint(cc.p(0.5,0.5))
    meinv_5_num:setFontSize(20)
    meinv_5_num:setString("0")
    meinv_5_num:setColor(cc.c3b(255,27,4))
    guo_qing:appendComponent(meinv_5_num)
    meinv_5_num:setPositionInContainer(cc.p(644,352))
    table_guo_qing["meinv_5_num"] = meinv_5_num

    local huangzi_1_num = fc.FLabel:createBMFont()
    huangzi_1_num:setSize(cc.size(60,30))
    huangzi_1_num:setAnchorPoint(cc.p(0.5,0.5))
    huangzi_1_num:setFontSize(20)
    huangzi_1_num:setString("0")
    huangzi_1_num:setColor(cc.c3b(255,27,4))
    guo_qing:appendComponent(huangzi_1_num)
    huangzi_1_num:setPositionInContainer(cc.p(642,605))
    table_guo_qing["huangzi_1_num"] = huangzi_1_num

    local huangzi_2_num = fc.FLabel:createBMFont()
    huangzi_2_num:setSize(cc.size(60,30))
    huangzi_2_num:setAnchorPoint(cc.p(0.5,0.5))
    huangzi_2_num:setFontSize(20)
    huangzi_2_num:setString("0")
    huangzi_2_num:setColor(cc.c3b(255,27,4))
    guo_qing:appendComponent(huangzi_2_num)
    huangzi_2_num:setPositionInContainer(cc.p(828,564))
    table_guo_qing["huangzi_2_num"] = huangzi_2_num

    local huangzi_3_num = fc.FLabel:createBMFont()
    huangzi_3_num:setSize(cc.size(60,30))
    huangzi_3_num:setAnchorPoint(cc.p(0.5,0.5))
    huangzi_3_num:setFontSize(20)
    huangzi_3_num:setString("0")
    huangzi_3_num:setColor(cc.c3b(255,27,4))
    guo_qing:appendComponent(huangzi_3_num)
    huangzi_3_num:setPositionInContainer(cc.p(642,567))
    table_guo_qing["huangzi_3_num"] = huangzi_3_num

    local huangzi_4_num = fc.FLabel:createBMFont()
    huangzi_4_num:setSize(cc.size(60,30))
    huangzi_4_num:setAnchorPoint(cc.p(0.5,0.5))
    huangzi_4_num:setFontSize(20)
    huangzi_4_num:setString("0")
    huangzi_4_num:setColor(cc.c3b(255,27,4))
    guo_qing:appendComponent(huangzi_4_num)
    huangzi_4_num:setPositionInContainer(cc.p(828,528))
    table_guo_qing["huangzi_4_num"] = huangzi_4_num

    local huangzi_5_num = fc.FLabel:createBMFont()
    huangzi_5_num:setSize(cc.size(60,30))
    huangzi_5_num:setAnchorPoint(cc.p(0.5,0.5))
    huangzi_5_num:setFontSize(20)
    huangzi_5_num:setString("0")
    huangzi_5_num:setColor(cc.c3b(255,27,4))
    guo_qing:appendComponent(huangzi_5_num)
    huangzi_5_num:setPositionInContainer(cc.p(642,529))
    table_guo_qing["huangzi_5_num"] = huangzi_5_num

    local vip_image = fc.FExtensionsImage:create()
    vip_image:setImage("batch_ui/VIP.png")
    vip_image:setSize(cc.size(83,42))
    vip_image:setAnchorPoint(cc.p(0.5,0.5))
    guo_qing:appendComponent(vip_image)
    vip_image:setPositionInContainer(cc.p(212.5,178))
    table_guo_qing["vip_image"] = vip_image

    local title_bg2 = fc.FExtensionsImage:create()
    title_bg2:setImage("nobatch/title_mingchen_.png")
    title_bg2:setSize(cc.size(483,67))
    title_bg2:setFlipType(2)
    title_bg2:setAnchorPoint(cc.p(0.5,0.5))
    guo_qing:appendComponent(title_bg2)
    title_bg2:setPositionInContainer(cc.p(718.5,33.5))
    table_guo_qing["title_bg2"] = title_bg2

    local title_image = fc.FContainerPanel:create()
    title_image:setSize(cc.size(201,36))
    title_image:setAnchorPoint(cc.p(0.5,0.5))
    guo_qing:appendComponent(title_image)
    title_image:setPositionInContainer(cc.p(480.5,36))
    table_guo_qing["title_image"] = title_image

    local guo = fc.FExtensionsImage:create()
    guo:setImage("batch_ui/guo.png")
    guo:setSize(cc.size(40,40))
    guo:setAnchorPoint(cc.p(0.5,0.5))
    title_image:appendComponent(guo)
    guo:setPositionInContainer(cc.p(20,20))
    table_guo_qing["guo"] = guo

    local qing = fc.FExtensionsImage:create()
    qing:setImage("batch_ui/qing.png")
    qing:setSize(cc.size(40,40))
    qing:setAnchorPoint(cc.p(0.5,0.5))
    title_image:appendComponent(qing)
    qing:setPositionInContainer(cc.p(74,20))
    table_guo_qing["qing"] = qing

    local xin = fc.FExtensionsImage:create()
    xin:setImage("batch_ui/xin.png")
    xin:setSize(cc.size(40,40))
    xin:setAnchorPoint(cc.p(0.5,0.5))
    title_image:appendComponent(xin)
    xin:setPositionInContainer(cc.p(127,20))
    table_guo_qing["xin"] = xin

    local xi = fc.FExtensionsImage:create()
    xi:setImage("batch_ui/xi_2.png")
    xi:setSize(cc.size(40,40))
    xi:setAnchorPoint(cc.p(0.5,0.5))
    title_image:appendComponent(xi)
    xi:setPositionInContainer(cc.p(181,20))
    table_guo_qing["xi"] = xi

    local close_button = fc.FScaleButton:create()
    close_button:setSize(cc.size(59,59))
    close_button:setAnchorPoint(cc.p(0.5,0.5))
    close_button:setButtonImage("batch_ui/guanbi_up.png")
    guo_qing:appendComponent(close_button)
    close_button:setPositionInContainer(cc.p(925.5,33.5))
    table_guo_qing["close_button"] = close_button

    local loading_bg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/jindutiaokuang_kapai.png",cc.rect(16,11,4,4))
    loading_bg:setSize(cc.size(320,25))
    loading_bg:setAnchorPoint(cc.p(0.5,0.5))
    guo_qing:appendComponent(loading_bg)
    loading_bg:setPositionInContainer(cc.p(210,466.5))
    table_guo_qing["loading_bg"] = loading_bg

    local loading_bg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/jindutiaokuang_kapai.png",cc.rect(16,11,4,4))
    loading_bg:setSize(cc.size(320,25))
    loading_bg:setAnchorPoint(cc.p(0.5,0.5))
    guo_qing:appendComponent(loading_bg)
    loading_bg:setPositionInContainer(cc.p(210,542.5))
    table_guo_qing["loading_bg"] = loading_bg

    local loading_bg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/jindutiaokuang_kapai.png",cc.rect(16,11,4,4))
    loading_bg:setSize(cc.size(320,25))
    loading_bg:setAnchorPoint(cc.p(0.5,0.5))
    guo_qing:appendComponent(loading_bg)
    loading_bg:setPositionInContainer(cc.p(210,611.5))
    table_guo_qing["loading_bg"] = loading_bg

    local liangcao_loading = fc.FLoadingBar:create()
    liangcao_loading:setLoadingBarImage("batch_ui/jindutiao_1.png")
    liangcao_loading:setSize(cc.size(311,19))
    liangcao_loading:setAnchorPoint(cc.p(0.5,0.5))
    liangcao_loading:setPercent(70)
    guo_qing:appendComponent(liangcao_loading)
    liangcao_loading:setPositionInContainer(cc.p(210.5,466.5))
    table_guo_qing["liangcao_loading"] = liangcao_loading

    local junling_loading = fc.FLoadingBar:create()
    junling_loading:setLoadingBarImage("batch_ui/jindutiao_2.png")
    junling_loading:setSize(cc.size(311,19))
    junling_loading:setAnchorPoint(cc.p(0.5,0.5))
    junling_loading:setPercent(70)
    guo_qing:appendComponent(junling_loading)
    junling_loading:setPositionInContainer(cc.p(210.5,542.5))
    table_guo_qing["junling_loading"] = junling_loading

    local jingli_loading = fc.FLoadingBar:create()
    jingli_loading:setLoadingBarImage("batch_ui/jindutiao_3.png")
    jingli_loading:setSize(cc.size(311,19))
    jingli_loading:setAnchorPoint(cc.p(0.5,0.5))
    jingli_loading:setPercent(70)
    guo_qing:appendComponent(jingli_loading)
    jingli_loading:setPositionInContainer(cc.p(210.5,611.5))
    table_guo_qing["jingli_loading"] = jingli_loading

    local cur_liangcao_label = fc.FLabel:createBMFont()
    cur_liangcao_label:setSize(cc.size(50,30))
    cur_liangcao_label:setAnchorPoint(cc.p(0.5,0.5))
    cur_liangcao_label:setFontSize(20)
    cur_liangcao_label:setString("1/1")
    cur_liangcao_label:setColor(cc.c3b(254,255,232))
    guo_qing:appendComponent(cur_liangcao_label)
    cur_liangcao_label:setPositionInContainer(cc.p(196,462))
    table_guo_qing["cur_liangcao_label"] = cur_liangcao_label

    local cur_junling_label = fc.FLabel:createBMFont()
    cur_junling_label:setSize(cc.size(50,30))
    cur_junling_label:setAnchorPoint(cc.p(0.5,0.5))
    cur_junling_label:setFontSize(20)
    cur_junling_label:setString("1/1")
    cur_junling_label:setColor(cc.c3b(254,255,232))
    guo_qing:appendComponent(cur_junling_label)
    cur_junling_label:setPositionInContainer(cc.p(196,538))
    table_guo_qing["cur_junling_label"] = cur_junling_label

    local cur_jingli_label = fc.FLabel:createBMFont()
    cur_jingli_label:setSize(cc.size(50,30))
    cur_jingli_label:setAnchorPoint(cc.p(0.5,0.5))
    cur_jingli_label:setFontSize(20)
    cur_jingli_label:setString("1/1")
    cur_jingli_label:setColor(cc.c3b(254,255,232))
    guo_qing:appendComponent(cur_jingli_label)
    cur_jingli_label:setPositionInContainer(cc.p(196,609))
    table_guo_qing["cur_jingli_label"] = cur_jingli_label

    return table_guo_qing

end

