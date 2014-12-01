function createhuangzishuxing_info()

    local table_huangzishuxing_info = {}

    local huangzishuxing_info = fc.FContainerPanel:create()
    huangzishuxing_info:setSize(cc.size(640,560))
    table_huangzishuxing_info["huangzishuxing_info"] = huangzishuxing_info

    local hzsi_bg1 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongditu3_ciguan.png",cc.rect(3,3,2,2))
    hzsi_bg1:setSize(cc.size(632,514))
    hzsi_bg1:setAnchorPoint(cc.p(0.5,0.5))
    huangzishuxing_info:appendComponent(hzsi_bg1)
    hzsi_bg1:setPositionInContainer(cc.p(320,303))
    table_huangzishuxing_info["hzsi_bg1"] = hzsi_bg1

    local hzsi_bg2 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongbiankuang2_ciguan.png",cc.rect(43,15,2,2))
    hzsi_bg2:setSize(cc.size(632,514))
    hzsi_bg2:setAnchorPoint(cc.p(0.5,0.5))
    huangzishuxing_info:appendComponent(hzsi_bg2)
    hzsi_bg2:setPositionInContainer(cc.p(320,303))
    table_huangzishuxing_info["hzsi_bg2"] = hzsi_bg2

    local hzsi_bg5 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongdikuang1.png",cc.rect(26,26,2,2))
    hzsi_bg5:setSize(cc.size(589,108))
    hzsi_bg5:setAnchorPoint(cc.p(0.5,0.5))
    huangzishuxing_info:appendComponent(hzsi_bg5)
    hzsi_bg5:setPositionInContainer(cc.p(320.5,496))
    table_huangzishuxing_info["hzsi_bg5"] = hzsi_bg5

    local hzsi_bg4 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongdikuang1.png",cc.rect(26,26,2,2))
    hzsi_bg4:setSize(cc.size(589,108))
    hzsi_bg4:setAnchorPoint(cc.p(0.5,0.5))
    huangzishuxing_info:appendComponent(hzsi_bg4)
    hzsi_bg4:setPositionInContainer(cc.p(320.5,357))
    table_huangzishuxing_info["hzsi_bg4"] = hzsi_bg4

    local hzsi_bg3 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongdikuang1.png",cc.rect(26,26,2,2))
    hzsi_bg3:setSize(cc.size(589,192))
    hzsi_bg3:setAnchorPoint(cc.p(0.5,0.5))
    huangzishuxing_info:appendComponent(hzsi_bg3)
    hzsi_bg3:setPositionInContainer(cc.p(320.5,178))
    table_huangzishuxing_info["hzsi_bg3"] = hzsi_bg3

    local info_bg_image = fc.FScale9Image:createWithBatchUIFrame("batch_ui/zongjiachengdikuang_paibingbuzhen.png",cc.rect(55,0,2,29))
    info_bg_image:setSize(cc.size(640,42))
    info_bg_image:setAnchorPoint(cc.p(0.5,0.5))
    huangzishuxing_info:appendComponent(info_bg_image)
    info_bg_image:setPositionInContainer(cc.p(320,21))
    table_huangzishuxing_info["info_bg_image"] = info_bg_image

    local hzsx_gaiming_button = fc.FScaleButton:create()
    hzsx_gaiming_button:setSize(cc.size(144,53))
    hzsx_gaiming_button:setAnchorPoint(cc.p(0.5,0.5))
    hzsx_gaiming_button:setButtonImage("batch_ui/putonganniu1_up.png")
    huangzishuxing_info:appendComponent(hzsx_gaiming_button)
    hzsx_gaiming_button:setPositionInContainer(cc.p(520,126.5))
    table_huangzishuxing_info["hzsx_gaiming_button"] = hzsx_gaiming_button

    local gai = fc.FShaderExtensionsImage:create(0)
    gai:setAnchorPoint(cc.p(0.5,0.5))
    gai:setImage("batch_ui/gai_uizi.png")
    gai:setSize(cc.size(32,32))
    hzsx_gaiming_button:appendComponent(gai)
    gai:setPositionInContainer(cc.p(43,26))
    table_huangzishuxing_info["gai"] = gai

    local ming = fc.FShaderExtensionsImage:create(0)
    ming:setAnchorPoint(cc.p(0.5,0.5))
    ming:setImage("batch_ui/ming_uizi.png")
    ming:setSize(cc.size(32,32))
    hzsx_gaiming_button:appendComponent(ming)
    ming:setPositionInContainer(cc.p(102,26))
    table_huangzishuxing_info["ming"] = ming

    local hzsx_info_name_zhi_label = fc.FLabel:createSystemFont()
    hzsx_info_name_zhi_label:setSize(cc.size(120,25))
    hzsx_info_name_zhi_label:setAnchorPoint(cc.p(0.5,0.5))
    hzsx_info_name_zhi_label:setFontSize(20)
    hzsx_info_name_zhi_label:setString("皇子的名字")
    hzsx_info_name_zhi_label:setColor(cc.c3b(91,24,6))
    hzsx_info_name_zhi_label:setAlignment(0)
    huangzishuxing_info:appendComponent(hzsx_info_name_zhi_label)
    hzsx_info_name_zhi_label:setPositionInContainer(cc.p(304,126.5))
    table_huangzishuxing_info["hzsx_info_name_zhi_label"] = hzsx_info_name_zhi_label

    local hzsx_info_exp_zhi_label = fc.FLabel:createBMFont()
    hzsx_info_exp_zhi_label:setSize(cc.size(90,25))
    hzsx_info_exp_zhi_label:setAnchorPoint(cc.p(0.5,0.5))
    hzsx_info_exp_zhi_label:setFontSize(21)
    hzsx_info_exp_zhi_label:setString("经验99")
    hzsx_info_exp_zhi_label:setColor(cc.c3b(91,24,6))
    hzsx_info_exp_zhi_label:setAlignment(0)
    huangzishuxing_info:appendComponent(hzsx_info_exp_zhi_label)
    hzsx_info_exp_zhi_label:setPositionInContainer(cc.p(289,200.5))
    table_huangzishuxing_info["hzsx_info_exp_zhi_label"] = hzsx_info_exp_zhi_label

    local hzsx_info_eniang_name_label = fc.FLabel:createBMFont()
    hzsx_info_eniang_name_label:setSize(cc.size(120,25))
    hzsx_info_eniang_name_label:setAnchorPoint(cc.p(0.5,0.5))
    hzsx_info_eniang_name_label:setFontSize(20)
    hzsx_info_eniang_name_label:setString("额娘的名字")
    hzsx_info_eniang_name_label:setColor(cc.c3b(91,24,6))
    hzsx_info_eniang_name_label:setAlignment(0)
    huangzishuxing_info:appendComponent(hzsx_info_eniang_name_label)
    hzsx_info_eniang_name_label:setPositionInContainer(cc.p(304,237.5))
    table_huangzishuxing_info["hzsx_info_eniang_name_label"] = hzsx_info_eniang_name_label

    local hzsx_info_jiachengms_label = fc.FLabel:createBMFont()
    hzsx_info_jiachengms_label:setSize(cc.size(470,68))
    hzsx_info_jiachengms_label:setAnchorPoint(cc.p(0.5,0.5))
    hzsx_info_jiachengms_label:setFontSize(20)
    hzsx_info_jiachengms_label:setString("步兵步兵步步兵步兵步步兵步兵步步兵步兵步步兵步兵步步兵步兵步步兵步兵步")
    hzsx_info_jiachengms_label:setColor(cc.c3b(91,24,6))
    hzsx_info_jiachengms_label:setAlignment(0)
    huangzishuxing_info:appendComponent(hzsx_info_jiachengms_label)
    hzsx_info_jiachengms_label:setPositionInContainer(cc.p(343,501))
    table_huangzishuxing_info["hzsx_info_jiachengms_label"] = hzsx_info_jiachengms_label

    local skill_label_des = fc.FLabel:createBMFont()
    skill_label_des:setSize(cc.size(470,68))
    skill_label_des:setAnchorPoint(cc.p(0.5,0.5))
    skill_label_des:setFontSize(20)
    skill_label_des:setString("皇子技能皇子技能皇子技能皇子技能皇子技能皇子技能皇子技能皇子技能")
    skill_label_des:setColor(cc.c3b(91,24,6))
    skill_label_des:setAlignment(0)
    huangzishuxing_info:appendComponent(skill_label_des)
    skill_label_des:setPositionInContainer(cc.p(343,362))
    table_huangzishuxing_info["skill_label_des"] = skill_label_des

    local hzsi_tiltle_bg1 = fc.FExtensionsImage:create()
    hzsi_tiltle_bg1:setImage("batch_ui/xiaobiaotikuang.png")
    hzsi_tiltle_bg1:setSize(cc.size(203,54))
    hzsi_tiltle_bg1:setAnchorPoint(cc.p(0.5,0.5))
    huangzishuxing_info:appendComponent(hzsi_tiltle_bg1)
    hzsi_tiltle_bg1:setPositionInContainer(cc.p(125.5,81))
    table_huangzishuxing_info["hzsi_tiltle_bg1"] = hzsi_tiltle_bg1

    local hzsi_tiltle_bg2 = fc.FExtensionsImage:create()
    hzsi_tiltle_bg2:setImage("batch_ui/xiaobiaotikuang.png")
    hzsi_tiltle_bg2:setSize(cc.size(203,54))
    hzsi_tiltle_bg2:setAnchorPoint(cc.p(0.5,0.5))
    huangzishuxing_info:appendComponent(hzsi_tiltle_bg2)
    hzsi_tiltle_bg2:setPositionInContainer(cc.p(125.5,303))
    table_huangzishuxing_info["hzsi_tiltle_bg2"] = hzsi_tiltle_bg2

    local hzsi_tiltle_bg3 = fc.FExtensionsImage:create()
    hzsi_tiltle_bg3:setImage("batch_ui/xiaobiaotikuang.png")
    hzsi_tiltle_bg3:setSize(cc.size(203,54))
    hzsi_tiltle_bg3:setAnchorPoint(cc.p(0.5,0.5))
    huangzishuxing_info:appendComponent(hzsi_tiltle_bg3)
    hzsi_tiltle_bg3:setPositionInContainer(cc.p(125.5,442))
    table_huangzishuxing_info["hzsi_tiltle_bg3"] = hzsi_tiltle_bg3

    local hzsi_tiltle_1 = fc.FContainerPanel:create()
    hzsi_tiltle_1:setSize(cc.size(128,32))
    hzsi_tiltle_1:setAnchorPoint(cc.p(0.5,0.5))
    huangzishuxing_info:appendComponent(hzsi_tiltle_1)
    hzsi_tiltle_1:setPositionInContainer(cc.p(147,85))
    table_huangzishuxing_info["hzsi_tiltle_1"] = hzsi_tiltle_1

    local hzxq_huang = fc.FExtensionsImage:create()
    hzxq_huang:setImage("batch_ui/huang_uizi.png")
    hzxq_huang:setSize(cc.size(32,32))
    hzxq_huang:setAnchorPoint(cc.p(0.5,0.5))
    hzsi_tiltle_1:appendComponent(hzxq_huang)
    hzxq_huang:setPositionInContainer(cc.p(16,16))
    table_huangzishuxing_info["hzxq_huang"] = hzxq_huang

    local hzxq_zi = fc.FExtensionsImage:create()
    hzxq_zi:setImage("batch_ui/zi_uizi.png")
    hzxq_zi:setSize(cc.size(32,32))
    hzxq_zi:setAnchorPoint(cc.p(0.5,0.5))
    hzsi_tiltle_1:appendComponent(hzxq_zi)
    hzxq_zi:setPositionInContainer(cc.p(48,16))
    table_huangzishuxing_info["hzxq_zi"] = hzxq_zi

    local hzxq_xiang = fc.FExtensionsImage:create()
    hzxq_xiang:setImage("batch_ui/xiang_uizi.png")
    hzxq_xiang:setSize(cc.size(32,32))
    hzxq_xiang:setAnchorPoint(cc.p(0.5,0.5))
    hzsi_tiltle_1:appendComponent(hzxq_xiang)
    hzxq_xiang:setPositionInContainer(cc.p(80,16))
    table_huangzishuxing_info["hzxq_xiang"] = hzxq_xiang

    local hzxq_qing = fc.FExtensionsImage:create()
    hzxq_qing:setImage("batch_ui/qing_uizi.png")
    hzxq_qing:setSize(cc.size(32,32))
    hzxq_qing:setAnchorPoint(cc.p(0.5,0.5))
    hzsi_tiltle_1:appendComponent(hzxq_qing)
    hzxq_qing:setPositionInContainer(cc.p(112,16))
    table_huangzishuxing_info["hzxq_qing"] = hzxq_qing

    local hzsi_tiltle_2 = fc.FContainerPanel:create()
    hzsi_tiltle_2:setSize(cc.size(128,32))
    hzsi_tiltle_2:setAnchorPoint(cc.p(0.5,0.5))
    huangzishuxing_info:appendComponent(hzsi_tiltle_2)
    hzsi_tiltle_2:setPositionInContainer(cc.p(147,307))
    table_huangzishuxing_info["hzsi_tiltle_2"] = hzsi_tiltle_2

    local hzjn_huang = fc.FExtensionsImage:create()
    hzjn_huang:setImage("batch_ui/huang_uizi.png")
    hzjn_huang:setSize(cc.size(32,32))
    hzjn_huang:setAnchorPoint(cc.p(0.5,0.5))
    hzsi_tiltle_2:appendComponent(hzjn_huang)
    hzjn_huang:setPositionInContainer(cc.p(16,16))
    table_huangzishuxing_info["hzjn_huang"] = hzjn_huang

    local hzjn_zi = fc.FExtensionsImage:create()
    hzjn_zi:setImage("batch_ui/zi_uizi.png")
    hzjn_zi:setSize(cc.size(32,32))
    hzjn_zi:setAnchorPoint(cc.p(0.5,0.5))
    hzsi_tiltle_2:appendComponent(hzjn_zi)
    hzjn_zi:setPositionInContainer(cc.p(48,16))
    table_huangzishuxing_info["hzjn_zi"] = hzjn_zi

    local hzjn_ji = fc.FExtensionsImage:create()
    hzjn_ji:setImage("batch_ui/ji7_uizi.png")
    hzjn_ji:setSize(cc.size(32,32))
    hzjn_ji:setAnchorPoint(cc.p(0.5,0.5))
    hzsi_tiltle_2:appendComponent(hzjn_ji)
    hzjn_ji:setPositionInContainer(cc.p(80,16))
    table_huangzishuxing_info["hzjn_ji"] = hzjn_ji

    local hzjn_neng = fc.FExtensionsImage:create()
    hzjn_neng:setImage("batch_ui/neng_uizi.png")
    hzjn_neng:setSize(cc.size(32,32))
    hzjn_neng:setAnchorPoint(cc.p(0.5,0.5))
    hzsi_tiltle_2:appendComponent(hzjn_neng)
    hzjn_neng:setPositionInContainer(cc.p(112,16))
    table_huangzishuxing_info["hzjn_neng"] = hzjn_neng

    local hzsi_tiltle_3 = fc.FContainerPanel:create()
    hzsi_tiltle_3:setSize(cc.size(128,32))
    hzsi_tiltle_3:setAnchorPoint(cc.p(0.5,0.5))
    huangzishuxing_info:appendComponent(hzsi_tiltle_3)
    hzsi_tiltle_3:setPositionInContainer(cc.p(147,446))
    table_huangzishuxing_info["hzsi_tiltle_3"] = hzsi_tiltle_3

    local hzjc_huang = fc.FExtensionsImage:create()
    hzjc_huang:setImage("batch_ui/huang_uizi.png")
    hzjc_huang:setSize(cc.size(32,32))
    hzjc_huang:setAnchorPoint(cc.p(0.5,0.5))
    hzsi_tiltle_3:appendComponent(hzjc_huang)
    hzjc_huang:setPositionInContainer(cc.p(16,16))
    table_huangzishuxing_info["hzjc_huang"] = hzjc_huang

    local hzjc_zi = fc.FExtensionsImage:create()
    hzjc_zi:setImage("batch_ui/zi_uizi.png")
    hzjc_zi:setSize(cc.size(32,32))
    hzjc_zi:setAnchorPoint(cc.p(0.5,0.5))
    hzsi_tiltle_3:appendComponent(hzjc_zi)
    hzjc_zi:setPositionInContainer(cc.p(48,16))
    table_huangzishuxing_info["hzjc_zi"] = hzjc_zi

    local hzjc_jia = fc.FExtensionsImage:create()
    hzjc_jia:setImage("batch_ui/jia_uizi.png")
    hzjc_jia:setSize(cc.size(32,32))
    hzjc_jia:setAnchorPoint(cc.p(0.5,0.5))
    hzsi_tiltle_3:appendComponent(hzjc_jia)
    hzjc_jia:setPositionInContainer(cc.p(80,16))
    table_huangzishuxing_info["hzjc_jia"] = hzjc_jia

    local hzjc_cheng = fc.FExtensionsImage:create()
    hzjc_cheng:setImage("batch_ui/cheng_uizi.png")
    hzjc_cheng:setSize(cc.size(32,32))
    hzjc_cheng:setAnchorPoint(cc.p(0.5,0.5))
    hzsi_tiltle_3:appendComponent(hzjc_cheng)
    hzjc_cheng:setPositionInContainer(cc.p(112,16))
    table_huangzishuxing_info["hzjc_cheng"] = hzjc_cheng

    local hzsi_name_title = fc.FLabel:createBMFont()
    hzsi_name_title:setSize(cc.size(120,25))
    hzsi_name_title:setAnchorPoint(cc.p(0.5,0.5))
    hzsi_name_title:setFontSize(21)
    if LANGUAGE_TYPE == 3 then
    	hzsi_name_title:setString("皇子名稱：")
    else
    	hzsi_name_title:setString("皇子名称：")
    end
    hzsi_name_title:setColor(cc.c3b(91,24,6))
    hzsi_name_title:setAlignment(0)
    huangzishuxing_info:appendComponent(hzsi_name_title)
    hzsi_name_title:setPositionInContainer(cc.p(138,126.5))
    table_huangzishuxing_info["hzsi_name_title"] = hzsi_name_title

    local hzsi_level_title = fc.FLabel:createBMFont()
    hzsi_level_title:setSize(cc.size(120,25))
    hzsi_level_title:setAnchorPoint(cc.p(0.5,0.5))
    hzsi_level_title:setFontSize(21)
    if LANGUAGE_TYPE == 3 then
    	 hzsi_level_title:setString("等級：")
    else
    	 hzsi_level_title:setString("等级：")
    end
    hzsi_level_title:setColor(cc.c3b(91,24,6))
    hzsi_level_title:setAlignment(0)
    huangzishuxing_info:appendComponent(hzsi_level_title)
    hzsi_level_title:setPositionInContainer(cc.p(138,163.5))
    table_huangzishuxing_info["hzsi_level_title"] = hzsi_level_title

    local hzsi_exp_title = fc.FLabel:createBMFont()
    hzsi_exp_title:setSize(cc.size(120,25))
    hzsi_exp_title:setAnchorPoint(cc.p(0.5,0.5))
    hzsi_exp_title:setFontSize(21)
    if LANGUAGE_TYPE == 3 then
    	 hzsi_exp_title:setString("經驗值：")
    else
    	 hzsi_exp_title:setString("经验值：")
    end
    hzsi_exp_title:setColor(cc.c3b(91,24,6))
    hzsi_exp_title:setAlignment(0)
    huangzishuxing_info:appendComponent(hzsi_exp_title)
    hzsi_exp_title:setPositionInContainer(cc.p(138,200.5))
    table_huangzishuxing_info["hzsi_exp_title"] = hzsi_exp_title

    local hzsi_mother_title = fc.FLabel:createBMFont()
    hzsi_mother_title:setSize(cc.size(120,25))
    hzsi_mother_title:setAnchorPoint(cc.p(0.5,0.5))
    hzsi_mother_title:setFontSize(21)
    if LANGUAGE_TYPE == 3 then
    	hzsi_mother_title:setString("額娘：")
    else
    	hzsi_mother_title:setString("额娘：")
    end
    hzsi_mother_title:setColor(cc.c3b(91,24,6))
    hzsi_mother_title:setAlignment(0)
    huangzishuxing_info:appendComponent(hzsi_mother_title)
    hzsi_mother_title:setPositionInContainer(cc.p(138,237.5))
    table_huangzishuxing_info["hzsi_mother_title"] = hzsi_mother_title

    local hzsx_info_level_zhi_label = fc.FLabel:createSystemFont()
    hzsx_info_level_zhi_label:setSize(cc.size(120,25))
    hzsx_info_level_zhi_label:setAnchorPoint(cc.p(0.5,0.5))
    hzsx_info_level_zhi_label:setFontSize(20)
    hzsx_info_level_zhi_label:setString("等级10")
    hzsx_info_level_zhi_label:setColor(cc.c3b(91,24,6))
    hzsx_info_level_zhi_label:setAlignment(0)
    huangzishuxing_info:appendComponent(hzsx_info_level_zhi_label)
    hzsx_info_level_zhi_label:setPositionInContainer(cc.p(304,163.5))
    table_huangzishuxing_info["hzsx_info_level_zhi_label"] = hzsx_info_level_zhi_label

    return table_huangzishuxing_info

end

