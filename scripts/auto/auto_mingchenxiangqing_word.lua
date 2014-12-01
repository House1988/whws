function createmingchenxiangqing_word()

    local table_mingchenxiangqing_word = {}

    local mingchenxiangqing_word = fc.FContainerPanel:create()
    mingchenxiangqing_word:setSize(cc.size(610,535))
    table_mingchenxiangqing_word["mingchenxiangqing_word"] = mingchenxiangqing_word

    local xq_word_bg2_scale9 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongditu3_ciguan.png",cc.rect(1,1,1,1))
    xq_word_bg2_scale9:setSize(cc.size(610,483))
    xq_word_bg2_scale9:setAnchorPoint(cc.p(0.5,0.5))
    mingchenxiangqing_word:appendComponent(xq_word_bg2_scale9)
    xq_word_bg2_scale9:setPositionInContainer(cc.p(305,293.5))
    table_mingchenxiangqing_word["xq_word_bg2_scale9"] = xq_word_bg2_scale9

    local xq_word_bg_scale9 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongbiankuang2_ciguan.png",cc.rect(43,15,2,2))
    xq_word_bg_scale9:setSize(cc.size(610,483))
    xq_word_bg_scale9:setAnchorPoint(cc.p(0.5,0.5))
    mingchenxiangqing_word:appendComponent(xq_word_bg_scale9)
    xq_word_bg_scale9:setPositionInContainer(cc.p(305,293.5))
    table_mingchenxiangqing_word["xq_word_bg_scale9"] = xq_word_bg_scale9

    local btnJieshao = fc.FRadioButton:create()
    btnJieshao:setRadioButtonImage("batch_ui/qieyeanniu_down1.png","batch_ui/qieyeanniu_up1.png")
    btnJieshao:setSize(cc.size(120,40))
    btnJieshao:setAnchorPoint(cc.p(0.5,0.5))
    mingchenxiangqing_word:appendComponent(btnJieshao)
    btnJieshao:setPositionInContainer(cc.p(420,32))
    table_mingchenxiangqing_word["btnJieshao"] = btnJieshao

    local btnZuhe = fc.FRadioButton:create()
    btnZuhe:setRadioButtonImage("batch_ui/qieyeanniu_down1.png","batch_ui/qieyeanniu_up1.png")
    btnZuhe:setSize(cc.size(120,40))
    btnZuhe:setAnchorPoint(cc.p(0.5,0.5))
    mingchenxiangqing_word:appendComponent(btnZuhe)
    btnZuhe:setPositionInContainer(cc.p(180,32))
    table_mingchenxiangqing_word["btnZuhe"] = btnZuhe

    local btnTianfu = fc.FRadioButton:create()
    btnTianfu:setRadioButtonImage("batch_ui/qieyeanniu_down1.png","batch_ui/qieyeanniu_up1.png")
    btnTianfu:setSize(cc.size(120,40))
    btnTianfu:setAnchorPoint(cc.p(0.5,0.5))
    mingchenxiangqing_word:appendComponent(btnTianfu)
    btnTianfu:setPositionInContainer(cc.p(300,32))
    table_mingchenxiangqing_word["btnTianfu"] = btnTianfu

    local JieshaoPanel = fc.FContainerPanel:create()
    JieshaoPanel:setSize(cc.size(610,483))
    JieshaoPanel:setAnchorPoint(cc.p(0.5,0.5))
    mingchenxiangqing_word:appendComponent(JieshaoPanel)
    JieshaoPanel:setPositionInContainer(cc.p(305,293.5))
    table_mingchenxiangqing_word["JieshaoPanel"] = JieshaoPanel

    local jieshao_upbg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongdikuang1.png",cc.rect(25,25,4,4))
    jieshao_upbg:setSize(cc.size(580,226))
    jieshao_upbg:setAnchorPoint(cc.p(0.5,0.5))
    JieshaoPanel:appendComponent(jieshao_upbg)
    jieshao_upbg:setPositionInContainer(cc.p(305,149))
    table_mingchenxiangqing_word["jieshao_upbg"] = jieshao_upbg

    local jieshao_downBG = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongdikuang1.png",cc.rect(25,25,4,4))
    jieshao_downBG:setSize(cc.size(580,170))
    jieshao_downBG:setAnchorPoint(cc.p(0.5,0.5))
    JieshaoPanel:appendComponent(jieshao_downBG)
    jieshao_downBG:setPositionInContainer(cc.p(305,388))
    table_mingchenxiangqing_word["jieshao_downBG"] = jieshao_downBG

    local des_label = fc.FLabel:createBMFont()
    des_label:setSize(cc.size(550,180))
    des_label:setWidth(550)
    des_label:setAnchorPoint(cc.p(0.5,0.5))
    des_label:setFontSize(20)
    des_label:setString("步兵")
    des_label:setColor(cc.c3b(91,24,6))
    des_label:setAlignment(0)
    JieshaoPanel:appendComponent(des_label)
    des_label:setPositionInContainer(cc.p(305,153))
    table_mingchenxiangqing_word["des_label"] = des_label

    local skill_panel1 = fc.FContainerPanel:create()
    skill_panel1:setSize(cc.size(102,102))
    skill_panel1:setAnchorPoint(cc.p(0.5,0.5))
    JieshaoPanel:appendComponent(skill_panel1)
    skill_panel1:setPositionInContainer(cc.p(124,381.5))
    table_mingchenxiangqing_word["skill_panel1"] = skill_panel1

    local frame1 = fc.FExtensionsImage:create()
    frame1:setImage("batch_ui/baipinzhi_kuang.png")
    frame1:setSize(cc.size(104,104))
    frame1:setAnchorPoint(cc.p(0.5,0.5))
    skill_panel1:appendComponent(frame1)
    frame1:setPositionInContainer(cc.p(52,52))
    table_mingchenxiangqing_word["frame1"] = frame1

    local skill1 = fc.FExtensionsImage:create()
    skill1:setAnchorPoint(cc.p(0.5,0.5))
    skill_panel1:appendComponent(skill1)
    skill1:setPositionInContainer(cc.p(52,51))
    table_mingchenxiangqing_word["skill1"] = skill1

    local skillName1 = fc.FLabel:createBMFont()
    skillName1:setSize(cc.size(59,19))
    skillName1:setAnchorPoint(cc.p(0.5,0.5))
    skillName1:setFontSize(20)
    skillName1:setString("经验：")
    skillName1:setColor(cc.c3b(91,24,6))
    skill_panel1:appendComponent(skillName1)
    skillName1:setPositionInContainer(cc.p(51.5,113.5))
    table_mingchenxiangqing_word["skillName1"] = skillName1

    local skillLocak1 = fc.FLabel:createBMFont()
    skillLocak1:setSize(cc.size(59,19))
    skillLocak1:setAnchorPoint(cc.p(0.5,0.5))
    skillLocak1:setFontSize(22)
    if LANGUAGE_TYPE == 3 then
    	skillLocak1:setString("天賦解鎖")
    else
    	skillLocak1:setString("天赋解锁")
    end
    skillLocak1:setColor(cc.c3b(0,255,0))
    skill_panel1:appendComponent(skillLocak1)
    skillLocak1:setPositionInContainer(cc.p(51.5,82.5))
    table_mingchenxiangqing_word["skillLocak1"] = skillLocak1

    local skill_panel2 = fc.FContainerPanel:create()
    skill_panel2:setSize(cc.size(102,102))
    skill_panel2:setAnchorPoint(cc.p(0.5,0.5))
    JieshaoPanel:appendComponent(skill_panel2)
    skill_panel2:setPositionInContainer(cc.p(304,381.5))
    table_mingchenxiangqing_word["skill_panel2"] = skill_panel2

    local frame2 = fc.FExtensionsImage:create()
    frame2:setImage("batch_ui/baipinzhi_kuang.png")
    frame2:setSize(cc.size(104,104))
    frame2:setAnchorPoint(cc.p(0.5,0.5))
    skill_panel2:appendComponent(frame2)
    frame2:setPositionInContainer(cc.p(52,52))
    table_mingchenxiangqing_word["frame2"] = frame2

    local skill2 = fc.FExtensionsImage:create()
    skill2:setAnchorPoint(cc.p(0.5,0.5))
    skill_panel2:appendComponent(skill2)
    skill2:setPositionInContainer(cc.p(51,52))
    table_mingchenxiangqing_word["skill2"] = skill2

    local skillName2 = fc.FLabel:createBMFont()
    skillName2:setSize(cc.size(59,19))
    skillName2:setAnchorPoint(cc.p(0.5,0.5))
    skillName2:setFontSize(20)
    skillName2:setString("经验：")
    skillName2:setColor(cc.c3b(91,24,6))
    skill_panel2:appendComponent(skillName2)
    skillName2:setPositionInContainer(cc.p(51.5,113.5))
    table_mingchenxiangqing_word["skillName2"] = skillName2

    local skillLocak2 = fc.FLabel:createBMFont()
    skillLocak2:setSize(cc.size(59,19))
    skillLocak2:setAnchorPoint(cc.p(0.5,0.5))
    skillLocak2:setFontSize(22)
     if LANGUAGE_TYPE == 3 then
    	skillLocak2:setString("天賦解鎖")
    else
    	skillLocak2:setString("天赋解锁")
    end
    skillLocak2:setColor(cc.c3b(0,255,0))
    skill_panel2:appendComponent(skillLocak2)
    skillLocak2:setPositionInContainer(cc.p(51.5,82.5))
    table_mingchenxiangqing_word["skillLocak2"] = skillLocak2

    local skill_panel3 = fc.FContainerPanel:create()
    skill_panel3:setSize(cc.size(102,102))
    skill_panel3:setAnchorPoint(cc.p(0.5,0.5))
    JieshaoPanel:appendComponent(skill_panel3)
    skill_panel3:setPositionInContainer(cc.p(485,381.5))
    table_mingchenxiangqing_word["skill_panel3"] = skill_panel3

    local frame3 = fc.FExtensionsImage:create()
    frame3:setImage("batch_ui/baipinzhi_kuang.png")
    frame3:setSize(cc.size(104,104))
    frame3:setAnchorPoint(cc.p(0.5,0.5))
    skill_panel3:appendComponent(frame3)
    frame3:setPositionInContainer(cc.p(52,52))
    table_mingchenxiangqing_word["frame3"] = frame3

    local skill3 = fc.FExtensionsImage:create()
    skill3:setAnchorPoint(cc.p(0.5,0.5))
    skill_panel3:appendComponent(skill3)
    skill3:setPositionInContainer(cc.p(51,51))
    table_mingchenxiangqing_word["skill3"] = skill3

    local skillName3 = fc.FLabel:createBMFont()
    skillName3:setSize(cc.size(59,19))
    skillName3:setAnchorPoint(cc.p(0.5,0.5))
    skillName3:setFontSize(20)
    skillName3:setString("经验：")
    skillName3:setColor(cc.c3b(91,24,6))
    skill_panel3:appendComponent(skillName3)
    skillName3:setPositionInContainer(cc.p(51.5,113.5))
    table_mingchenxiangqing_word["skillName3"] = skillName3

    local skillLocak3 = fc.FLabel:createBMFont()
    skillLocak3:setSize(cc.size(59,19))
    skillLocak3:setAnchorPoint(cc.p(0.5,0.5))
    skillLocak3:setFontSize(22)
    if LANGUAGE_TYPE == 3 then
    	skillLocak3:setString("天賦解鎖")
    else
    	skillLocak3:setString("天赋解锁")
    end
    skillLocak3:setColor(cc.c3b(0,255,0))
    skill_panel3:appendComponent(skillLocak3)
    skillLocak3:setPositionInContainer(cc.p(51.5,82.5))
    table_mingchenxiangqing_word["skillLocak3"] = skillLocak3

    local titleBg = fc.FExtensionsImage:create()
    titleBg:setImage("batch_ui/xiaobiaotikuang.png")
    titleBg:setSize(cc.size(245,65))
    titleBg:setAnchorPoint(cc.p(0.5,0.5))
    JieshaoPanel:appendComponent(titleBg)
    titleBg:setPositionInContainer(cc.p(137.5,34.5))
    table_mingchenxiangqing_word["titleBg"] = titleBg

    local titleBg = fc.FExtensionsImage:create()
    titleBg:setImage("batch_ui/xiaobiaotikuang.png")
    titleBg:setSize(cc.size(245,65))
    titleBg:setAnchorPoint(cc.p(0.5,0.5))
    JieshaoPanel:appendComponent(titleBg)
    titleBg:setPositionInContainer(cc.p(137.5,298.5))
    table_mingchenxiangqing_word["titleBg"] = titleBg

    local jieshao_title = fc.FContainerPanel:create()
    jieshao_title:setSize(cc.size(121,31))
    jieshao_title:setAnchorPoint(cc.p(0.5,0.5))
    JieshaoPanel:appendComponent(jieshao_title)
    jieshao_title:setPositionInContainer(cc.p(158.5,40))
    table_mingchenxiangqing_word["jieshao_title"] = jieshao_title

    local ming1 = fc.FExtensionsImage:create()
    ming1:setImage("batch_ui/ming_uizi.png")
    ming1:setSize(cc.size(32,32))
    ming1:setAnchorPoint(cc.p(0.5,0.5))
    jieshao_title:appendComponent(ming1)
    ming1:setPositionInContainer(cc.p(16,16))
    table_mingchenxiangqing_word["ming1"] = ming1

    local chen1 = fc.FExtensionsImage:create()
    chen1:setImage("batch_ui/chen_uizi.png")
    chen1:setSize(cc.size(32,32))
    chen1:setAnchorPoint(cc.p(0.5,0.5))
    jieshao_title:appendComponent(chen1)
    chen1:setPositionInContainer(cc.p(45,16))
    table_mingchenxiangqing_word["chen1"] = chen1

    local jie1 = fc.FExtensionsImage:create()
    jie1:setImage("batch_ui/jie2_uizi.png")
    jie1:setSize(cc.size(32,32))
    jie1:setAnchorPoint(cc.p(0.5,0.5))
    jieshao_title:appendComponent(jie1)
    jie1:setPositionInContainer(cc.p(75,16))
    table_mingchenxiangqing_word["jie1"] = jie1

    local shao1 = fc.FExtensionsImage:create()
    shao1:setImage("batch_ui/shao2_uizi.png")
    shao1:setSize(cc.size(32,32))
    shao1:setAnchorPoint(cc.p(0.5,0.5))
    jieshao_title:appendComponent(shao1)
    shao1:setPositionInContainer(cc.p(105,16))
    table_mingchenxiangqing_word["shao1"] = shao1

    local jineng_title = fc.FContainerPanel:create()
    jineng_title:setSize(cc.size(120,31))
    jineng_title:setAnchorPoint(cc.p(0.5,0.5))
    JieshaoPanel:appendComponent(jineng_title)
    jineng_title:setPositionInContainer(cc.p(158,304))
    table_mingchenxiangqing_word["jineng_title"] = jineng_title

    local ji = fc.FExtensionsImage:create()
    ji:setImage("batch_ui/ji7_uizi.png")
    ji:setSize(cc.size(32,32))
    ji:setAnchorPoint(cc.p(0.5,0.5))
    jineng_title:appendComponent(ji)
    ji:setPositionInContainer(cc.p(74,16))
    table_mingchenxiangqing_word["ji"] = ji

    local neng = fc.FExtensionsImage:create()
    neng:setImage("batch_ui/neng_uizi.png")
    neng:setSize(cc.size(32,32))
    neng:setAnchorPoint(cc.p(0.5,0.5))
    jineng_title:appendComponent(neng)
    neng:setPositionInContainer(cc.p(104,16))
    table_mingchenxiangqing_word["neng"] = neng

    local ming1 = fc.FExtensionsImage:create()
    ming1:setImage("batch_ui/ming_uizi.png")
    ming1:setSize(cc.size(32,32))
    ming1:setAnchorPoint(cc.p(0.5,0.5))
    jineng_title:appendComponent(ming1)
    ming1:setPositionInContainer(cc.p(16,16))
    table_mingchenxiangqing_word["ming1"] = ming1

    local chen1 = fc.FExtensionsImage:create()
    chen1:setImage("batch_ui/chen_uizi.png")
    chen1:setSize(cc.size(32,32))
    chen1:setAnchorPoint(cc.p(0.5,0.5))
    jineng_title:appendComponent(chen1)
    chen1:setPositionInContainer(cc.p(44,16))
    table_mingchenxiangqing_word["chen1"] = chen1

    local ZuhePanel = fc.FContainerPanel:create()
    ZuhePanel:setSize(cc.size(610,483))
    ZuhePanel:setAnchorPoint(cc.p(0.5,0.5))
    mingchenxiangqing_word:appendComponent(ZuhePanel)
    ZuhePanel:setPositionInContainer(cc.p(305,293.5))
    table_mingchenxiangqing_word["ZuhePanel"] = ZuhePanel

    local titleBg = fc.FExtensionsImage:create()
    titleBg:setImage("batch_ui/xiaobiaotikuang.png")
    titleBg:setSize(cc.size(245,65))
    titleBg:setAnchorPoint(cc.p(0.5,0.5))
    ZuhePanel:appendComponent(titleBg)
    titleBg:setPositionInContainer(cc.p(137.5,34.5))
    table_mingchenxiangqing_word["titleBg"] = titleBg

    local zuhe_title = fc.FContainerPanel:create()
    zuhe_title:setSize(cc.size(120,31))
    zuhe_title:setAnchorPoint(cc.p(0.5,0.5))
    ZuhePanel:appendComponent(zuhe_title)
    zuhe_title:setPositionInContainer(cc.p(161,39.5))
    table_mingchenxiangqing_word["zuhe_title"] = zuhe_title

    local zu1 = fc.FExtensionsImage:create()
    zu1:setImage("batch_ui/zu_uizi.png")
    zu1:setSize(cc.size(32,32))
    zu1:setAnchorPoint(cc.p(0.5,0.5))
    zuhe_title:appendComponent(zu1)
    zu1:setPositionInContainer(cc.p(16,16))
    table_mingchenxiangqing_word["zu1"] = zu1

    local he1 = fc.FExtensionsImage:create()
    he1:setImage("batch_ui/he_uizi.png")
    he1:setSize(cc.size(32,32))
    he1:setAnchorPoint(cc.p(0.5,0.5))
    zuhe_title:appendComponent(he1)
    he1:setPositionInContainer(cc.p(44,16))
    table_mingchenxiangqing_word["he1"] = he1

    local xiang1 = fc.FExtensionsImage:create()
    xiang1:setImage("batch_ui/xiang_uizi.png")
    xiang1:setSize(cc.size(32,32))
    xiang1:setAnchorPoint(cc.p(0.5,0.5))
    zuhe_title:appendComponent(xiang1)
    xiang1:setPositionInContainer(cc.p(73,16))
    table_mingchenxiangqing_word["xiang1"] = xiang1

    local qing1 = fc.FExtensionsImage:create()
    qing1:setImage("batch_ui/qing_uizi.png")
    qing1:setSize(cc.size(32,32))
    qing1:setAnchorPoint(cc.p(0.5,0.5))
    zuhe_title:appendComponent(qing1)
    qing1:setPositionInContainer(cc.p(101,17))
    table_mingchenxiangqing_word["qing1"] = qing1

    local TianfuPanel = fc.FContainerPanel:create()
    TianfuPanel:setSize(cc.size(610,483))
    TianfuPanel:setAnchorPoint(cc.p(0.5,0.5))
    mingchenxiangqing_word:appendComponent(TianfuPanel)
    TianfuPanel:setPositionInContainer(cc.p(305,293.5))
    table_mingchenxiangqing_word["TianfuPanel"] = TianfuPanel

    local bingzhong_bg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongdikuang1.png",cc.rect(25,25,4,4))
    bingzhong_bg:setSize(cc.size(570,420))
    bingzhong_bg:setAnchorPoint(cc.p(0.5,0.5))
    TianfuPanel:appendComponent(bingzhong_bg)
    bingzhong_bg:setPositionInContainer(cc.p(300,246))
    table_mingchenxiangqing_word["bingzhong_bg"] = bingzhong_bg

    local titleBg = fc.FExtensionsImage:create()
    titleBg:setImage("batch_ui/xiaobiaotikuang.png")
    titleBg:setSize(cc.size(245,65))
    titleBg:setAnchorPoint(cc.p(0.5,0.5))
    TianfuPanel:appendComponent(titleBg)
    titleBg:setPositionInContainer(cc.p(137.5,34.5))
    table_mingchenxiangqing_word["titleBg"] = titleBg

    local bingzhong_title = fc.FContainerPanel:create()
    bingzhong_title:setSize(cc.size(120,31))
    bingzhong_title:setAnchorPoint(cc.p(0.5,0.5))
    TianfuPanel:appendComponent(bingzhong_title)
    bingzhong_title:setPositionInContainer(cc.p(161,40.5))
    table_mingchenxiangqing_word["bingzhong_title"] = bingzhong_title

    local bing1 = fc.FExtensionsImage:create()
    bing1:setImage("batch_ui/bing_uizi.png")
    bing1:setSize(cc.size(32,32))
    bing1:setAnchorPoint(cc.p(0.5,0.5))
    bingzhong_title:appendComponent(bing1)
    bing1:setPositionInContainer(cc.p(16,16))
    table_mingchenxiangqing_word["bing1"] = bing1

    local zhong1 = fc.FExtensionsImage:create()
    zhong1:setImage("batch_ui/zhong1_uizi.png")
    zhong1:setSize(cc.size(32,32))
    zhong1:setAnchorPoint(cc.p(0.5,0.5))
    bingzhong_title:appendComponent(zhong1)
    zhong1:setPositionInContainer(cc.p(45,15))
    table_mingchenxiangqing_word["zhong1"] = zhong1

    local xiang1 = fc.FExtensionsImage:create()
    xiang1:setImage("batch_ui/xiang_uizi.png")
    xiang1:setSize(cc.size(32,32))
    xiang1:setAnchorPoint(cc.p(0.5,0.5))
    bingzhong_title:appendComponent(xiang1)
    xiang1:setPositionInContainer(cc.p(74,15))
    table_mingchenxiangqing_word["xiang1"] = xiang1

    local qing1 = fc.FExtensionsImage:create()
    qing1:setImage("batch_ui/qing_uizi.png")
    qing1:setSize(cc.size(32,32))
    qing1:setAnchorPoint(cc.p(0.5,0.5))
    bingzhong_title:appendComponent(qing1)
    qing1:setPositionInContainer(cc.p(104,16))
    table_mingchenxiangqing_word["qing1"] = qing1

    local icon_desc1 = fc.FLabel:createBMFont()
    icon_desc1:setSize(cc.size(300,25))
    icon_desc1:setAnchorPoint(cc.p(0.5,0.5))
    icon_desc1:setFontSize(20)
    icon_desc1:setString("道具名字")
    icon_desc1:setColor(cc.c3b(0,113,48))
    icon_desc1:setAlignment(0)
    TianfuPanel:appendComponent(icon_desc1)
    icon_desc1:setPositionInContainer(cc.p(200,238.5))
    table_mingchenxiangqing_word["icon_desc1"] = icon_desc1

    local blank_area2 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongditu_huodong.png",cc.rect(3,3,2,2))
    blank_area2:setSize(cc.size(510,30))
    blank_area2:setAnchorPoint(cc.p(0.5,0.5))
    TianfuPanel:appendComponent(blank_area2)
    blank_area2:setPositionInContainer(cc.p(300,276))
    table_mingchenxiangqing_word["blank_area2"] = blank_area2

    local blank_area2 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongditu_huodong.png",cc.rect(3,3,2,2))
    blank_area2:setSize(cc.size(510,30))
    blank_area2:setAnchorPoint(cc.p(0.5,0.5))
    TianfuPanel:appendComponent(blank_area2)
    blank_area2:setPositionInContainer(cc.p(300,306))
    table_mingchenxiangqing_word["blank_area2"] = blank_area2

    local icon_desc2 = fc.FLabel:createBMFont()
    icon_desc2:setSize(cc.size(300,25))
    icon_desc2:setAnchorPoint(cc.p(0.5,0.5))
    icon_desc2:setFontSize(20)
    icon_desc2:setString("道具名字")
    icon_desc2:setColor(cc.c3b(0,113,48))
    icon_desc2:setAlignment(0)
    TianfuPanel:appendComponent(icon_desc2)
    icon_desc2:setPositionInContainer(cc.p(300,273.5))
    table_mingchenxiangqing_word["icon_desc2"] = icon_desc2

    local icon_desc3 = fc.FLabel:createBMFont()
    icon_desc3:setSize(cc.size(300,25))
    icon_desc3:setAnchorPoint(cc.p(0.5,0.5))
    icon_desc3:setFontSize(20)
    icon_desc3:setString("道具名字")
    icon_desc3:setColor(cc.c3b(0,113,48))
    icon_desc3:setAlignment(0)
    TianfuPanel:appendComponent(icon_desc3)
    icon_desc3:setPositionInContainer(cc.p(300,303.5))
    table_mingchenxiangqing_word["icon_desc3"] = icon_desc3

    local icon_desc6 = fc.FLabel:createBMFont()
    icon_desc6:setSize(cc.size(300,25))
    icon_desc6:setAnchorPoint(cc.p(0.5,0.5))
    icon_desc6:setFontSize(20)
    icon_desc6:setString("道具名字")
    icon_desc6:setColor(cc.c3b(206,0,0))
    icon_desc6:setAlignment(0)
    TianfuPanel:appendComponent(icon_desc6)
    icon_desc6:setPositionInContainer(cc.p(200,343.5))
    table_mingchenxiangqing_word["icon_desc6"] = icon_desc6

    local blank_area2 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongditu_huodong.png",cc.rect(3,3,2,2))
    blank_area2:setSize(cc.size(510,30))
    blank_area2:setAnchorPoint(cc.p(0.5,0.5))
    TianfuPanel:appendComponent(blank_area2)
    blank_area2:setPositionInContainer(cc.p(300,378))
    table_mingchenxiangqing_word["blank_area2"] = blank_area2

    local blank_area2 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongditu_huodong.png",cc.rect(3,3,2,2))
    blank_area2:setSize(cc.size(510,30))
    blank_area2:setAnchorPoint(cc.p(0.5,0.5))
    TianfuPanel:appendComponent(blank_area2)
    blank_area2:setPositionInContainer(cc.p(300,408))
    table_mingchenxiangqing_word["blank_area2"] = blank_area2

    local icon_desc5 = fc.FLabel:createBMFont()
    icon_desc5:setSize(cc.size(300,25))
    icon_desc5:setAnchorPoint(cc.p(0.5,0.5))
    icon_desc5:setFontSize(20)
    icon_desc5:setString("道具名字")
    icon_desc5:setColor(cc.c3b(206,0,0))
    icon_desc5:setAlignment(0)
    TianfuPanel:appendComponent(icon_desc5)
    icon_desc5:setPositionInContainer(cc.p(300,405.5))
    table_mingchenxiangqing_word["icon_desc5"] = icon_desc5

    local icon_desc4 = fc.FLabel:createBMFont()
    icon_desc4:setSize(cc.size(300,25))
    icon_desc4:setAnchorPoint(cc.p(0.5,0.5))
    icon_desc4:setFontSize(20)
    icon_desc4:setString("道具名字")
    icon_desc4:setColor(cc.c3b(206,0,0))
    icon_desc4:setAlignment(0)
    TianfuPanel:appendComponent(icon_desc4)
    icon_desc4:setPositionInContainer(cc.p(300,375.5))
    table_mingchenxiangqing_word["icon_desc4"] = icon_desc4

    local num_di = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shuruwenzi.png",cc.rect(11,9,47,7))
    num_di:setSize(cc.size(60,28))
    num_di:setAnchorPoint(cc.p(0.5,0.5))
    TianfuPanel:appendComponent(num_di)
    num_di:setPositionInContainer(cc.p(390,305))
    table_mingchenxiangqing_word["num_di"] = num_di

    local num_di = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shuruwenzi.png",cc.rect(11,9,47,7))
    num_di:setSize(cc.size(60,28))
    num_di:setAnchorPoint(cc.p(0.5,0.5))
    TianfuPanel:appendComponent(num_di)
    num_di:setPositionInContainer(cc.p(390,276))
    table_mingchenxiangqing_word["num_di"] = num_di

    local num_di = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shuruwenzi.png",cc.rect(11,9,47,7))
    num_di:setSize(cc.size(60,28))
    num_di:setAnchorPoint(cc.p(0.5,0.5))
    TianfuPanel:appendComponent(num_di)
    num_di:setPositionInContainer(cc.p(390,379))
    table_mingchenxiangqing_word["num_di"] = num_di

    local num_di = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shuruwenzi.png",cc.rect(11,9,47,7))
    num_di:setSize(cc.size(60,28))
    num_di:setAnchorPoint(cc.p(0.5,0.5))
    TianfuPanel:appendComponent(num_di)
    num_di:setPositionInContainer(cc.p(390,407))
    table_mingchenxiangqing_word["num_di"] = num_di

    local num1 = fc.FLabel:createBMFont()
    num1:setSize(cc.size(80,25))
    num1:setAnchorPoint(cc.p(0.5,0.5))
    num1:setFontSize(20)
    num1:setString("11")
    num1:setColor(cc.c3b(0,255,0))
    num1:setAlignment(1)
    TianfuPanel:appendComponent(num1)
    num1:setPositionInContainer(cc.p(390,274.5))
    table_mingchenxiangqing_word["num1"] = num1

    local num2 = fc.FLabel:createBMFont()
    num2:setSize(cc.size(80,25))
    num2:setAnchorPoint(cc.p(0.5,0.5))
    num2:setFontSize(20)
    num2:setString("11")
    num2:setColor(cc.c3b(0,255,0))
    num2:setAlignment(1)
    TianfuPanel:appendComponent(num2)
    num2:setPositionInContainer(cc.p(390,303.5))
    table_mingchenxiangqing_word["num2"] = num2

    local num3 = fc.FLabel:createBMFont()
    num3:setSize(cc.size(80,25))
    num3:setAnchorPoint(cc.p(0.5,0.5))
    num3:setFontSize(20)
    num3:setString("11")
    num3:setColor(cc.c3b(139,255,240))
    num3:setAlignment(1)
    TianfuPanel:appendComponent(num3)
    num3:setPositionInContainer(cc.p(390,375.5))
    table_mingchenxiangqing_word["num3"] = num3

    local num4 = fc.FLabel:createBMFont()
    num4:setSize(cc.size(80,25))
    num4:setAnchorPoint(cc.p(0.5,0.5))
    num4:setFontSize(20)
    num4:setString("11")
    num4:setColor(cc.c3b(139,255,240))
    num4:setAlignment(1)
    TianfuPanel:appendComponent(num4)
    num4:setPositionInContainer(cc.p(390,405.5))
    table_mingchenxiangqing_word["num4"] = num4

    local icon_name_label = fc.FLabel:createBMFont()
    icon_name_label:setSize(cc.size(120,30))
    icon_name_label:setAnchorPoint(cc.p(0.5,0.5))
    icon_name_label:setFontSize(20)
    icon_name_label:setString("道具名字")
    icon_name_label:setColor(cc.c3b(91,24,6))
    TianfuPanel:appendComponent(icon_name_label)
    icon_name_label:setPositionInContainer(cc.p(300,90))
    table_mingchenxiangqing_word["icon_name_label"] = icon_name_label

    local blank_area3 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongditu_huodong.png",cc.rect(3,3,2,2))
    blank_area3:setSize(cc.size(510,110))
    blank_area3:setAnchorPoint(cc.p(0.5,0.5))
    TianfuPanel:appendComponent(blank_area3)
    blank_area3:setPositionInContainer(cc.p(300,164))
    table_mingchenxiangqing_word["blank_area3"] = blank_area3

    local bingzhongFrame = fc.FExtensionsImage:create()
    bingzhongFrame:setImage("batch_ui/baipinzhi_kuang.png")
    bingzhongFrame:setSize(cc.size(104,104))
    bingzhongFrame:setAnchorPoint(cc.p(0.5,0.5))
    TianfuPanel:appendComponent(bingzhongFrame)
    bingzhongFrame:setPositionInContainer(cc.p(300,164))
    table_mingchenxiangqing_word["bingzhongFrame"] = bingzhongFrame

    local soldier_btn = fc.FExtensionsImage:create()
    soldier_btn:setImage("batch_ui/bu_bingzhong_anniu.png")
    soldier_btn:setSize(cc.size(77,77))
    soldier_btn:setAnchorPoint(cc.p(0.5,0.5))
    TianfuPanel:appendComponent(soldier_btn)
    soldier_btn:setPositionInContainer(cc.p(300.5,163.5))
    table_mingchenxiangqing_word["soldier_btn"] = soldier_btn

    local outFrame = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongbiankuang2_ciguan.png",cc.rect(44,15,1,1))
    outFrame:setSize(cc.size(510,375))
    outFrame:setAnchorPoint(cc.p(0.5,0.5))
    TianfuPanel:appendComponent(outFrame)
    outFrame:setPositionInContainer(cc.p(300,254.5))
    table_mingchenxiangqing_word["outFrame"] = outFrame

    local tianfu_btn_label = fc.FContainerPanel:create()
    tianfu_btn_label:setSize(cc.size(77,31))
    tianfu_btn_label:setAnchorPoint(cc.p(0.5,0.5))
    mingchenxiangqing_word:appendComponent(tianfu_btn_label)
    tianfu_btn_label:setPositionInContainer(cc.p(298.5,33.5))
    table_mingchenxiangqing_word["tianfu_btn_label"] = tianfu_btn_label

    local bing = fc.FExtensionsImage:create()
    bing:setImage("batch_ui/bing_uizi.png")
    bing:setSize(cc.size(26,26))
    bing:setAnchorPoint(cc.p(0.5,0.5))
    tianfu_btn_label:appendComponent(bing)
    bing:setPositionInContainer(cc.p(22,14))
    table_mingchenxiangqing_word["bing"] = bing

    local zhong = fc.FExtensionsImage:create()
    zhong:setImage("batch_ui/zhong1_uizi.png")
    zhong:setSize(cc.size(26,26))
    zhong:setAnchorPoint(cc.p(0.5,0.5))
    tianfu_btn_label:appendComponent(zhong)
    zhong:setPositionInContainer(cc.p(56,13))
    table_mingchenxiangqing_word["zhong"] = zhong

    local btnTianfu2 = fc.FRadioButton:create()
    btnTianfu2:setRadioButtonImage("batch_ui/qieyeanniu_down1.png","batch_ui/qieyeanniu_up1.png")
    btnTianfu2:setSize(cc.size(120,40))
    btnTianfu2:setAnchorPoint(cc.p(0.5,0.5))
    mingchenxiangqing_word:appendComponent(btnTianfu2)
    btnTianfu2:setPositionInContainer(cc.p(60,32))
    table_mingchenxiangqing_word["btnTianfu2"] = btnTianfu2

    local tian = fc.FExtensionsImage:create()
    tian:setImage("batch_ui/tian_uizi.png")
    tian:setSize(cc.size(26,26))
    tian:setAnchorPoint(cc.p(0.5,0.5))
    mingchenxiangqing_word:appendComponent(tian)
    tian:setPositionInContainer(cc.p(40,31))
    table_mingchenxiangqing_word["tian"] = tian

    local fu = fc.FExtensionsImage:create()
    fu:setImage("batch_ui/fu2_uizi.png")
    fu:setSize(cc.size(26,26))
    fu:setAnchorPoint(cc.p(0.5,0.5))
    mingchenxiangqing_word:appendComponent(fu)
    fu:setPositionInContainer(cc.p(74,31))
    table_mingchenxiangqing_word["fu"] = fu

    local ming = fc.FExtensionsImage:create()
    ming:setImage("batch_ui/ming_uizi.png")
    ming:setSize(cc.size(26,26))
    ming:setAnchorPoint(cc.p(0.5,0.5))
    mingchenxiangqing_word:appendComponent(ming)
    ming:setPositionInContainer(cc.p(388,31))
    table_mingchenxiangqing_word["ming"] = ming

    local chen = fc.FExtensionsImage:create()
    chen:setImage("batch_ui/chen_uizi.png")
    chen:setSize(cc.size(26,26))
    chen:setAnchorPoint(cc.p(0.5,0.5))
    mingchenxiangqing_word:appendComponent(chen)
    chen:setPositionInContainer(cc.p(408,31))
    table_mingchenxiangqing_word["chen"] = chen

    local jie = fc.FExtensionsImage:create()
    jie:setImage("batch_ui/jie2_uizi.png")
    jie:setSize(cc.size(26,26))
    jie:setAnchorPoint(cc.p(0.5,0.5))
    mingchenxiangqing_word:appendComponent(jie)
    jie:setPositionInContainer(cc.p(429,31))
    table_mingchenxiangqing_word["jie"] = jie

    local shao = fc.FExtensionsImage:create()
    shao:setImage("batch_ui/shao2_uizi.png")
    shao:setSize(cc.size(26,26))
    shao:setAnchorPoint(cc.p(0.5,0.5))
    mingchenxiangqing_word:appendComponent(shao)
    shao:setPositionInContainer(cc.p(451,31))
    table_mingchenxiangqing_word["shao"] = shao

    local zu = fc.FExtensionsImage:create()
    zu:setImage("batch_ui/zu_uizi.png")
    zu:setSize(cc.size(26,26))
    zu:setAnchorPoint(cc.p(0.5,0.5))
    mingchenxiangqing_word:appendComponent(zu)
    zu:setPositionInContainer(cc.p(145,31))
    table_mingchenxiangqing_word["zu"] = zu

    local he = fc.FExtensionsImage:create()
    he:setImage("batch_ui/he_uizi.png")
    he:setSize(cc.size(26,26))
    he:setAnchorPoint(cc.p(0.5,0.5))
    mingchenxiangqing_word:appendComponent(he)
    he:setPositionInContainer(cc.p(168,31))
    table_mingchenxiangqing_word["he"] = he

    local xiang = fc.FExtensionsImage:create()
    xiang:setImage("batch_ui/xiang_uizi.png")
    xiang:setSize(cc.size(26,26))
    xiang:setAnchorPoint(cc.p(0.5,0.5))
    mingchenxiangqing_word:appendComponent(xiang)
    xiang:setPositionInContainer(cc.p(192,31))
    table_mingchenxiangqing_word["xiang"] = xiang

    local qing = fc.FExtensionsImage:create()
    qing:setImage("batch_ui/qing_uizi.png")
    qing:setSize(cc.size(26,26))
    qing:setAnchorPoint(cc.p(0.5,0.5))
    mingchenxiangqing_word:appendComponent(qing)
    qing:setPositionInContainer(cc.p(215,32))
    table_mingchenxiangqing_word["qing"] = qing

    local tianfu2Panel = fc.FContainerPanel:create()
    tianfu2Panel:setSize(cc.size(610,483))
    tianfu2Panel:setAnchorPoint(cc.p(0.5,0.5))
    mingchenxiangqing_word:appendComponent(tianfu2Panel)
    tianfu2Panel:setPositionInContainer(cc.p(305,293.5))
    table_mingchenxiangqing_word["tianfu2Panel"] = tianfu2Panel

    local titleBg = fc.FExtensionsImage:create()
    titleBg:setImage("batch_ui/xiaobiaotikuang.png")
    titleBg:setSize(cc.size(245,65))
    titleBg:setAnchorPoint(cc.p(0.5,0.5))
    tianfu2Panel:appendComponent(titleBg)
    titleBg:setPositionInContainer(cc.p(137.5,34.5))
    table_mingchenxiangqing_word["titleBg"] = titleBg

    local tian1 = fc.FExtensionsImage:create()
    tian1:setImage("batch_ui/tian_uizi.png")
    tian1:setSize(cc.size(32,32))
    tian1:setAnchorPoint(cc.p(0.5,0.5))
    tianfu2Panel:appendComponent(tian1)
    tian1:setPositionInContainer(cc.p(108,41))
    table_mingchenxiangqing_word["tian1"] = tian1

    local fu1 = fc.FExtensionsImage:create()
    fu1:setImage("batch_ui/fu2_uizi.png")
    fu1:setSize(cc.size(32,32))
    fu1:setAnchorPoint(cc.p(0.5,0.5))
    tianfu2Panel:appendComponent(fu1)
    fu1:setPositionInContainer(cc.p(135,41))
    table_mingchenxiangqing_word["fu1"] = fu1

    local xiang1 = fc.FExtensionsImage:create()
    xiang1:setImage("batch_ui/xiang_uizi.png")
    xiang1:setSize(cc.size(32,32))
    xiang1:setAnchorPoint(cc.p(0.5,0.5))
    tianfu2Panel:appendComponent(xiang1)
    xiang1:setPositionInContainer(cc.p(163,41))
    table_mingchenxiangqing_word["xiang1"] = xiang1

    local qing1 = fc.FExtensionsImage:create()
    qing1:setImage("batch_ui/qing_uizi.png")
    qing1:setSize(cc.size(32,32))
    qing1:setAnchorPoint(cc.p(0.5,0.5))
    tianfu2Panel:appendComponent(qing1)
    qing1:setPositionInContainer(cc.p(189,42))
    table_mingchenxiangqing_word["qing1"] = qing1

    local temp_des = fc.FLabel:createBMFont()
    temp_des:setSize(cc.size(300,25))
    temp_des:setAnchorPoint(cc.p(0.5,0.5))
    temp_des:setFontSize(20)
    temp_des:setString("道具名字")
    temp_des:setColor(cc.c3b(0,0,255))
    tianfu2Panel:appendComponent(temp_des)
    temp_des:setPositionInContainer(cc.p(281,190.5))
    table_mingchenxiangqing_word["temp_des"] = temp_des

    return table_mingchenxiangqing_word

end

