function createhuangzi_yuelongmen()

    local table_huangzi_yuelongmen = {}

    local huangzi_yuelongmen = fc.FContainerPanel:create()
    huangzi_yuelongmen:setSize(cc.size(960,640))
    table_huangzi_yuelongmen["huangzi_yuelongmen"] = huangzi_yuelongmen

    local hz_ylm_bg_image = fc.FScale9Image:createWithBatchUIFrame("batch_ui/ditu_lan.png",cc.rect(2,2,1,1))
    hz_ylm_bg_image:setSize(cc.size(960,640))
    hz_ylm_bg_image:setAnchorPoint(cc.p(0.5,0.5))
    huangzi_yuelongmen:appendComponent(hz_ylm_bg_image)
    hz_ylm_bg_image:setPositionInContainer(cc.p(480,320))
    table_huangzi_yuelongmen["hz_ylm_bg_image"] = hz_ylm_bg_image

    local hz_ylm_shuoming_label = fc.FLabel:createBMFont()
    hz_ylm_shuoming_label:setSize(cc.size(350,55))
    hz_ylm_shuoming_label:setWidth(340)
    hz_ylm_shuoming_label:setAnchorPoint(cc.p(0.5,0.5))
    hz_ylm_shuoming_label:setFontSize(20)
   	local str1 = g_game.g_dictConfigManager:getLanTextById(118)
    hz_ylm_shuoming_label:setString(str1)
    hz_ylm_shuoming_label:setColor(cc.c3b(255,255,255))
    huangzi_yuelongmen:appendComponent(hz_ylm_shuoming_label)
    hz_ylm_shuoming_label:setPositionInContainer(cc.p(497,137.5))
    table_huangzi_yuelongmen["hz_ylm_shuoming_label"] = hz_ylm_shuoming_label

    local hz_ylm_title_bg_image1 = fc.FExtensionsImage:create()
    hz_ylm_title_bg_image1:setImage("nobatch/title_mingchen_.png")
    hz_ylm_title_bg_image1:setSize(cc.size(483,67))
    hz_ylm_title_bg_image1:setFlipType(2)
    hz_ylm_title_bg_image1:setAnchorPoint(cc.p(0.5,0.5))
    huangzi_yuelongmen:appendComponent(hz_ylm_title_bg_image1)
    hz_ylm_title_bg_image1:setPositionInContainer(cc.p(718.5,33.5))
    table_huangzi_yuelongmen["hz_ylm_title_bg_image1"] = hz_ylm_title_bg_image1

    local hz_ylm_title_bg_image = fc.FExtensionsImage:create()
    hz_ylm_title_bg_image:setImage("nobatch/title_mingchen_.png")
    hz_ylm_title_bg_image:setSize(cc.size(483,67))
    hz_ylm_title_bg_image:setAnchorPoint(cc.p(0.5,0.5))
    huangzi_yuelongmen:appendComponent(hz_ylm_title_bg_image)
    hz_ylm_title_bg_image:setPositionInContainer(cc.p(241.5,33.5))
    table_huangzi_yuelongmen["hz_ylm_title_bg_image"] = hz_ylm_title_bg_image

    local hz_ylm_title_image = fc.FContainerPanel:create()
    hz_ylm_title_image:setSize(cc.size(146,33))
    hz_ylm_title_image:setAnchorPoint(cc.p(0.5,0.5))
    huangzi_yuelongmen:appendComponent(hz_ylm_title_image)
    hz_ylm_title_image:setPositionInContainer(cc.p(480,36))
    table_huangzi_yuelongmen["hz_ylm_title_image"] = hz_ylm_title_image

    local yue = fc.FExtensionsImage:create()
    yue:setImage("batch_ui/yue.png")
    yue:setSize(cc.size(40,40))
    yue:setAnchorPoint(cc.p(0.5,0.5))
    hz_ylm_title_image:appendComponent(yue)
    yue:setPositionInContainer(cc.p(20,20))
    table_huangzi_yuelongmen["yue"] = yue

    local long = fc.FExtensionsImage:create()
    long:setImage("batch_ui/long.png")
    long:setSize(cc.size(40,40))
    long:setAnchorPoint(cc.p(0.5,0.5))
    hz_ylm_title_image:appendComponent(long)
    long:setPositionInContainer(cc.p(73,20))
    table_huangzi_yuelongmen["long"] = long

    local men = fc.FExtensionsImage:create()
    men:setImage("batch_ui/men.png")
    men:setSize(cc.size(40,40))
    men:setAnchorPoint(cc.p(0.5,0.5))
    hz_ylm_title_image:appendComponent(men)
    men:setPositionInContainer(cc.p(126,20))
    table_huangzi_yuelongmen["men"] = men

    local wen_l = fc.FExtensionsImage:create()
    wen_l:setImage("nobatch/banzidikuang_tongyong.png")
    wen_l:setSize(cc.size(220,163))
    wen_l:setAnchorPoint(cc.p(0.5,0.5))
    huangzi_yuelongmen:appendComponent(wen_l)
    wen_l:setPositionInContainer(cc.p(110,148.5))
    table_huangzi_yuelongmen["wen_l"] = wen_l

    local lian_left = fc.FExtensionsImage:create()
    lian_left:setImage("batch_ui/title_mingchen_2.png")
    lian_left:setSize(cc.size(62,121))
    lian_left:setAnchorPoint(cc.p(0.5,0.5))
    huangzi_yuelongmen:appendComponent(lian_left)
    lian_left:setPositionInContainer(cc.p(31,60.5))
    table_huangzi_yuelongmen["lian_left"] = lian_left

    local wen_r = fc.FExtensionsImage:create()
    wen_r:setImage("nobatch/banzidikuang_tongyong.png")
    wen_r:setSize(cc.size(220,163))
    wen_r:setFlipType(2)
    wen_r:setAnchorPoint(cc.p(0.5,0.5))
    huangzi_yuelongmen:appendComponent(wen_r)
    wen_r:setPositionInContainer(cc.p(850,148.5))
    table_huangzi_yuelongmen["wen_r"] = wen_r

    local lian_right = fc.FExtensionsImage:create()
    lian_right:setImage("batch_ui/title_mingchen_2.png")
    lian_right:setSize(cc.size(62,121))
    lian_right:setFlipType(2)
    lian_right:setAnchorPoint(cc.p(0.5,0.5))
    huangzi_yuelongmen:appendComponent(lian_right)
    lian_right:setPositionInContainer(cc.p(929,60.5))
    table_huangzi_yuelongmen["lian_right"] = lian_right

    local hz_ylm_close_button = fc.FScaleButton:create()
    hz_ylm_close_button:setSize(cc.size(52,52))
    hz_ylm_close_button:setAnchorPoint(cc.p(0.5,0.5))
    hz_ylm_close_button:setButtonImage("batch_ui/guanbi_up.png")
    huangzi_yuelongmen:appendComponent(hz_ylm_close_button)
    hz_ylm_close_button:setPositionInContainer(cc.p(931,34))
    table_huangzi_yuelongmen["hz_ylm_close_button"] = hz_ylm_close_button

    local hz_ylm_zzf_enter_button = fc.FScaleButton:create()
    hz_ylm_zzf_enter_button:setSize(cc.size(340,221))
    hz_ylm_zzf_enter_button:setAnchorPoint(cc.p(0.5,0.5))
    hz_ylm_zzf_enter_button:setButtonImage("nobatch/zongrenfu_anniu.png")
    huangzi_yuelongmen:appendComponent(hz_ylm_zzf_enter_button)
    hz_ylm_zzf_enter_button:setPositionInContainer(cc.p(680,325.5))
    table_huangzi_yuelongmen["hz_ylm_zzf_enter_button"] = hz_ylm_zzf_enter_button

    local hz_ylm_ssf_enter_button = fc.FScaleButton:create()
    hz_ylm_ssf_enter_button:setSize(cc.size(340,221))
    hz_ylm_ssf_enter_button:setAnchorPoint(cc.p(0.5,0.5))
    hz_ylm_ssf_enter_button:setButtonImage("nobatch/shangshufang_anniu.png")
    huangzi_yuelongmen:appendComponent(hz_ylm_ssf_enter_button)
    hz_ylm_ssf_enter_button:setPositionInContainer(cc.p(280,325.5))
    table_huangzi_yuelongmen["hz_ylm_ssf_enter_button"] = hz_ylm_ssf_enter_button

    local wen_lb = fc.FExtensionsImage:create()
    wen_lb:setImage("nobatch/banzidikuang_tongyong.png")
    wen_lb:setSize(cc.size(220,163))
    wen_lb:setFlipType(4)
    wen_lb:setAnchorPoint(cc.p(0.5,0.5))
    huangzi_yuelongmen:appendComponent(wen_lb)
    wen_lb:setPositionInContainer(cc.p(110,558.5))
    table_huangzi_yuelongmen["wen_lb"] = wen_lb

    local wen_rb = fc.FExtensionsImage:create()
    wen_rb:setImage("nobatch/banzidikuang_tongyong.png")
    wen_rb:setSize(cc.size(220,163))
    wen_rb:setFlipType(8)
    wen_rb:setAnchorPoint(cc.p(0.5,0.5))
    huangzi_yuelongmen:appendComponent(wen_rb)
    wen_rb:setPositionInContainer(cc.p(850,558.5))
    table_huangzi_yuelongmen["wen_rb"] = wen_rb

    local hz_ylm_zzf_shuoming_label = fc.FLabel:createBMFont()
    hz_ylm_zzf_shuoming_label:setSize(cc.size(300,100))
    hz_ylm_zzf_shuoming_label:setWidth(300)
    hz_ylm_zzf_shuoming_label:setAnchorPoint(cc.p(0.5,0.5))
    hz_ylm_zzf_shuoming_label:setFontSize(20)
    local str3 = g_game.g_dictConfigManager:getLanTextById(119)
    hz_ylm_zzf_shuoming_label:setString(str3)
    hz_ylm_zzf_shuoming_label:setColor(cc.c3b(255,255,255))
    hz_ylm_zzf_shuoming_label:setAlignment(0)
    huangzi_yuelongmen:appendComponent(hz_ylm_zzf_shuoming_label)
    hz_ylm_zzf_shuoming_label:setPositionInContainer(cc.p(682,507))
    table_huangzi_yuelongmen["hz_ylm_zzf_shuoming_label"] = hz_ylm_zzf_shuoming_label

    local hz_ylm_ssf_shuoming_label = fc.FLabel:createBMFont()
    hz_ylm_ssf_shuoming_label:setSize(cc.size(300,100))
    hz_ylm_ssf_shuoming_label:setWidth(300)
    hz_ylm_ssf_shuoming_label:setAnchorPoint(cc.p(0.5,0.5))
    hz_ylm_ssf_shuoming_label:setFontSize(20)
    local str2 = g_game.g_dictConfigManager:getLanTextById(120)
    hz_ylm_ssf_shuoming_label:setString(str2)
    hz_ylm_ssf_shuoming_label:setColor(cc.c3b(255,255,255))
    hz_ylm_ssf_shuoming_label:setAlignment(0)
    huangzi_yuelongmen:appendComponent(hz_ylm_ssf_shuoming_label)
    hz_ylm_ssf_shuoming_label:setPositionInContainer(cc.p(279,507))
    table_huangzi_yuelongmen["hz_ylm_ssf_shuoming_label"] = hz_ylm_ssf_shuoming_label

    return table_huangzi_yuelongmen

end

