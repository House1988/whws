function createhougong_tqg_mv_info()

    local table_hougong_tqg_mv_info = {}

    local hougong_tqg_mv_info = fc.FContainerPanel:create()
    hougong_tqg_mv_info:setSize(cc.size(960,413))
    table_hougong_tqg_mv_info["hougong_tqg_mv_info"] = hougong_tqg_mv_info

    local bg_panel = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongditu1_ciguan.png",cc.rect(1,1,1,1))
    bg_panel:setSize(cc.size(280,413))
    bg_panel:setAnchorPoint(cc.p(0.5,0.5))
    hougong_tqg_mv_info:appendComponent(bg_panel)
    bg_panel:setPositionInContainer(cc.p(144,206.5))
    table_hougong_tqg_mv_info["bg_panel"] = bg_panel

    local bg_panel = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongditu1_ciguan.png",cc.rect(1,1,1,1))
    bg_panel:setSize(cc.size(280,413))
    bg_panel:setAnchorPoint(cc.p(0.5,0.5))
    hougong_tqg_mv_info:appendComponent(bg_panel)
    bg_panel:setPositionInContainer(cc.p(815,206.5))
    table_hougong_tqg_mv_info["bg_panel"] = bg_panel

    local bg_bar = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongbiankuang3_ciguan.png",cc.rect(40,0,2,13))
    bg_bar:setSize(cc.size(300,13))
    bg_bar:setAnchorPoint(cc.p(0.5,0.5))
    hougong_tqg_mv_info:appendComponent(bg_bar)
    bg_bar:setPositionInContainer(cc.p(140,6.5))
    table_hougong_tqg_mv_info["bg_bar"] = bg_bar

    local bg_bar = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongbiankuang3_ciguan.png",cc.rect(40,0,2,13))
    bg_bar:setSize(cc.size(300,13))
    bg_bar:setAnchorPoint(cc.p(0.5,0.5))
    hougong_tqg_mv_info:appendComponent(bg_bar)
    bg_bar:setPositionInContainer(cc.p(820,6.5))
    table_hougong_tqg_mv_info["bg_bar"] = bg_bar

    local hg_tqg_huaiyun_button = fc.FScaleButton:create()
    hg_tqg_huaiyun_button:setSize(cc.size(101,92))
    hg_tqg_huaiyun_button:setAnchorPoint(cc.p(0.5,0.5))
    hg_tqg_huaiyun_button:setButtonImage("batch_ui/chongxing_anniu.png")
    if LANGUAGE_TYPE == 3 then
    	  hg_tqg_huaiyun_button:setTextImage("batch_ui/huaiyunzhong.png",cc.p(50,52))
    else
    	  hg_tqg_huaiyun_button:setTextImage("batch_ui/huaiyunzhong.png",cc.p(50,47))
    end
  
    hougong_tqg_mv_info:appendComponent(hg_tqg_huaiyun_button)
    hg_tqg_huaiyun_button:setPositionInContainer(cc.p(72.5,262))
    table_hougong_tqg_mv_info["hg_tqg_huaiyun_button"] = hg_tqg_huaiyun_button

    local label_di = fc.FExtensionsImage:create()
    label_di:setImage("nobatch/shurukuang2_tangquanxinggong.png")
    label_di:setSize(cc.size(177,33))
    label_di:setAnchorPoint(cc.p(0.5,0.5))
    hougong_tqg_mv_info:appendComponent(label_di)
    label_di:setPositionInContainer(cc.p(119.5,73.5))
    table_hougong_tqg_mv_info["label_di"] = label_di

    local label_di = fc.FExtensionsImage:create()
    label_di:setImage("nobatch/shurukuang2_tangquanxinggong.png")
    label_di:setSize(cc.size(177,33))
    label_di:setAnchorPoint(cc.p(0.5,0.5))
    hougong_tqg_mv_info:appendComponent(label_di)
    label_di:setPositionInContainer(cc.p(119.5,112.5))
    table_hougong_tqg_mv_info["label_di"] = label_di

    local label_di = fc.FExtensionsImage:create()
    label_di:setImage("nobatch/shurukuang2_tangquanxinggong.png")
    label_di:setSize(cc.size(177,33))
    label_di:setAnchorPoint(cc.p(0.5,0.5))
    hougong_tqg_mv_info:appendComponent(label_di)
    label_di:setPositionInContainer(cc.p(119.5,151.5))
    table_hougong_tqg_mv_info["label_di"] = label_di

    local label_di = fc.FExtensionsImage:create()
    label_di:setImage("nobatch/shurukuang2_tangquanxinggong.png")
    label_di:setSize(cc.size(177,33))
    label_di:setAnchorPoint(cc.p(0.5,0.5))
    hougong_tqg_mv_info:appendComponent(label_di)
    label_di:setPositionInContainer(cc.p(119.5,190.5))
    table_hougong_tqg_mv_info["label_di"] = label_di

    local hg_tqg_mvinfo_jiaoyudian_label = fc.FLabel:createBMFont()
    hg_tqg_mvinfo_jiaoyudian_label:setSize(cc.size(90,25))
    hg_tqg_mvinfo_jiaoyudian_label:setAnchorPoint(cc.p(0.5,0.5))
    hg_tqg_mvinfo_jiaoyudian_label:setFontSize(20)
    hg_tqg_mvinfo_jiaoyudian_label:setString("学 识")
    hg_tqg_mvinfo_jiaoyudian_label:setColor(cc.c3b(91,24,6))
    hougong_tqg_mv_info:appendComponent(hg_tqg_mvinfo_jiaoyudian_label)
    hg_tqg_mvinfo_jiaoyudian_label:setPositionInContainer(cc.p(92,108.5))
    table_hougong_tqg_mv_info["hg_tqg_mvinfo_jiaoyudian_label"] = hg_tqg_mvinfo_jiaoyudian_label

    local hg_tqg_mvinfo_xingquzhi_label = fc.FLabel:createBMFont()
    hg_tqg_mvinfo_xingquzhi_label:setSize(cc.size(90,25))
    hg_tqg_mvinfo_xingquzhi_label:setAnchorPoint(cc.p(0.5,0.5))
    hg_tqg_mvinfo_xingquzhi_label:setFontSize(20)
    hg_tqg_mvinfo_xingquzhi_label:setString("兴趣值")
    hg_tqg_mvinfo_xingquzhi_label:setColor(cc.c3b(91,24,6))
    hougong_tqg_mv_info:appendComponent(hg_tqg_mvinfo_xingquzhi_label)
    hg_tqg_mvinfo_xingquzhi_label:setPositionInContainer(cc.p(92,188.5))
    table_hougong_tqg_mv_info["hg_tqg_mvinfo_xingquzhi_label"] = hg_tqg_mvinfo_xingquzhi_label

    local hg_tqg_mvinfo_lv = fc.FLabel:createBMFont()
    hg_tqg_mvinfo_lv:setSize(cc.size(60,25))
    hg_tqg_mvinfo_lv:setAnchorPoint(cc.p(0.5,0.5))
    hg_tqg_mvinfo_lv:setFontSize(21)
    hg_tqg_mvinfo_lv:setString("等 级")
    hg_tqg_mvinfo_lv:setColor(cc.c3b(91,24,6))
    hougong_tqg_mv_info:appendComponent(hg_tqg_mvinfo_lv)
    hg_tqg_mvinfo_lv:setPositionInContainer(cc.p(92,69.5))
    table_hougong_tqg_mv_info["hg_tqg_mvinfo_lv"] = hg_tqg_mvinfo_lv

    local hg_tqg_mvinfo_qinmidu_label = fc.FLabel:createBMFont()
    hg_tqg_mvinfo_qinmidu_label:setSize(cc.size(90,25))
    hg_tqg_mvinfo_qinmidu_label:setAnchorPoint(cc.p(0.5,0.5))
    hg_tqg_mvinfo_qinmidu_label:setFontSize(20)
    hg_tqg_mvinfo_qinmidu_label:setString("亲密度")
    hg_tqg_mvinfo_qinmidu_label:setColor(cc.c3b(91,24,6))
    hougong_tqg_mv_info:appendComponent(hg_tqg_mvinfo_qinmidu_label)
    hg_tqg_mvinfo_qinmidu_label:setPositionInContainer(cc.p(92,148.5))
    table_hougong_tqg_mv_info["hg_tqg_mvinfo_qinmidu_label"] = hg_tqg_mvinfo_qinmidu_label

    local hg_tqg_mv_jinglizhi_num = fc.FLabel:createBMFont()
    hg_tqg_mv_jinglizhi_num:setSize(cc.size(70,40))
    hg_tqg_mv_jinglizhi_num:setAnchorPoint(cc.p(0.5,0.5))
    hg_tqg_mv_jinglizhi_num:setFontSize(32)
    hg_tqg_mv_jinglizhi_num:setString("0")
    hg_tqg_mv_jinglizhi_num:setColor(cc.c3b(137,32,18))
    hougong_tqg_mv_info:appendComponent(hg_tqg_mv_jinglizhi_num)
    hg_tqg_mv_jinglizhi_num:setPositionInContainer(cc.p(188,340))
    table_hougong_tqg_mv_info["hg_tqg_mv_jinglizhi_num"] = hg_tqg_mv_jinglizhi_num

    local text__bg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shuruwenzi.png",cc.rect(11,9,47,7))
    text__bg:setSize(cc.size(70,25))
    text__bg:setAnchorPoint(cc.p(0.5,0.5))
    hougong_tqg_mv_info:appendComponent(text__bg)
    text__bg:setPositionInContainer(cc.p(170,72.5))
    table_hougong_tqg_mv_info["text__bg"] = text__bg

    local hg_tqg_mvinfo_lvnum_label = fc.FLabel:createBMFont()
    hg_tqg_mvinfo_lvnum_label:setSize(cc.size(60,25))
    hg_tqg_mvinfo_lvnum_label:setAnchorPoint(cc.p(0.5,0.5))
    hg_tqg_mvinfo_lvnum_label:setFontSize(21)
    hg_tqg_mvinfo_lvnum_label:setString("0")
    hg_tqg_mvinfo_lvnum_label:setColor(cc.c3b(139,255,240))
    hougong_tqg_mv_info:appendComponent(hg_tqg_mvinfo_lvnum_label)
    hg_tqg_mvinfo_lvnum_label:setPositionInContainer(cc.p(170,69.5))
    table_hougong_tqg_mv_info["hg_tqg_mvinfo_lvnum_label"] = hg_tqg_mvinfo_lvnum_label

    local text__bg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shuruwenzi.png",cc.rect(11,9,47,7))
    text__bg:setSize(cc.size(70,25))
    text__bg:setAnchorPoint(cc.p(0.5,0.5))
    hougong_tqg_mv_info:appendComponent(text__bg)
    text__bg:setPositionInContainer(cc.p(170,112.5))
    table_hougong_tqg_mv_info["text__bg"] = text__bg

    local text__bg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shuruwenzi.png",cc.rect(11,9,47,7))
    text__bg:setSize(cc.size(70,25))
    text__bg:setAnchorPoint(cc.p(0.5,0.5))
    hougong_tqg_mv_info:appendComponent(text__bg)
    text__bg:setPositionInContainer(cc.p(170,152.5))
    table_hougong_tqg_mv_info["text__bg"] = text__bg

    local text__bg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shuruwenzi.png",cc.rect(11,9,47,7))
    text__bg:setSize(cc.size(70,25))
    text__bg:setAnchorPoint(cc.p(0.5,0.5))
    hougong_tqg_mv_info:appendComponent(text__bg)
    text__bg:setPositionInContainer(cc.p(170,192.5))
    table_hougong_tqg_mv_info["text__bg"] = text__bg

    local hg_tqg_jiaoyudian_num_label = fc.FLabel:createBMFont()
    hg_tqg_jiaoyudian_num_label:setSize(cc.size(50,25))
    hg_tqg_jiaoyudian_num_label:setAnchorPoint(cc.p(0.5,0.5))
    hg_tqg_jiaoyudian_num_label:setFontSize(21)
    hg_tqg_jiaoyudian_num_label:setString("0")
    hg_tqg_jiaoyudian_num_label:setColor(cc.c3b(139,255,240))
    hougong_tqg_mv_info:appendComponent(hg_tqg_jiaoyudian_num_label)
    hg_tqg_jiaoyudian_num_label:setPositionInContainer(cc.p(170,108.5))
    table_hougong_tqg_mv_info["hg_tqg_jiaoyudian_num_label"] = hg_tqg_jiaoyudian_num_label

    local hg_tqg_xingquzhi_num_label = fc.FLabel:createBMFont()
    hg_tqg_xingquzhi_num_label:setSize(cc.size(50,25))
    hg_tqg_xingquzhi_num_label:setAnchorPoint(cc.p(0.5,0.5))
    hg_tqg_xingquzhi_num_label:setFontSize(21)
    hg_tqg_xingquzhi_num_label:setString("0")
    hg_tqg_xingquzhi_num_label:setColor(cc.c3b(139,255,240))
    hougong_tqg_mv_info:appendComponent(hg_tqg_xingquzhi_num_label)
    hg_tqg_xingquzhi_num_label:setPositionInContainer(cc.p(170,188.5))
    table_hougong_tqg_mv_info["hg_tqg_xingquzhi_num_label"] = hg_tqg_xingquzhi_num_label

    local hg_tqg_qinmidu_num_label = fc.FLabel:createBMFont()
    hg_tqg_qinmidu_num_label:setSize(cc.size(50,25))
    hg_tqg_qinmidu_num_label:setAnchorPoint(cc.p(0.5,0.5))
    hg_tqg_qinmidu_num_label:setFontSize(21)
    hg_tqg_qinmidu_num_label:setString("0")
    hg_tqg_qinmidu_num_label:setColor(cc.c3b(139,255,240))
    hougong_tqg_mv_info:appendComponent(hg_tqg_qinmidu_num_label)
    hg_tqg_qinmidu_num_label:setPositionInContainer(cc.p(170,148.5))
    table_hougong_tqg_mv_info["hg_tqg_qinmidu_num_label"] = hg_tqg_qinmidu_num_label

    local jingli_label = fc.FContainerPanel:create()
    jingli_label:setSize(cc.size(130,30))
    jingli_label:setAnchorPoint(cc.p(0.5,0.5))
    hougong_tqg_mv_info:appendComponent(jingli_label)
    jingli_label:setPositionInContainer(cc.p(85,347))
    table_hougong_tqg_mv_info["jingli_label"] = jingli_label

    local huang = fc.FExtensionsImage:create()
    huang:setImage("batch_ui/huang_uizi.png")
    huang:setSize(cc.size(32,32))
    huang:setAnchorPoint(cc.p(0.5,0.5))
    jingli_label:appendComponent(huang)
    huang:setPositionInContainer(cc.p(16,16))
    table_hougong_tqg_mv_info["huang"] = huang

    local shang = fc.FExtensionsImage:create()
    shang:setImage("batch_ui/shang1_uizi.png")
    shang:setSize(cc.size(32,32))
    shang:setAnchorPoint(cc.p(0.5,0.5))
    jingli_label:appendComponent(shang)
    shang:setPositionInContainer(cc.p(41,18))
    table_hougong_tqg_mv_info["shang"] = shang

    local jing = fc.FExtensionsImage:create()
    jing:setImage("batch_ui/jing_uizi.png")
    jing:setSize(cc.size(32,32))
    jing:setAnchorPoint(cc.p(0.5,0.5))
    jingli_label:appendComponent(jing)
    jing:setPositionInContainer(cc.p(67,16))
    table_hougong_tqg_mv_info["jing"] = jing

    local li = fc.FExtensionsImage:create()
    li:setImage("batch_ui/li4_uizi.png")
    li:setSize(cc.size(32,32))
    li:setAnchorPoint(cc.p(0.5,0.5))
    jingli_label:appendComponent(li)
    li:setPositionInContainer(cc.p(91,17))
    table_hougong_tqg_mv_info["li"] = li

    local zhi = fc.FExtensionsImage:create()
    zhi:setImage("batch_ui/zhi_uizi.png")
    zhi:setSize(cc.size(32,32))
    zhi:setAnchorPoint(cc.p(0.5,0.5))
    jingli_label:appendComponent(zhi)
    zhi:setPositionInContainer(cc.p(114,16))
    table_hougong_tqg_mv_info["zhi"] = zhi

    local nameLabel = fc.FLabel:createBMFont()
    nameLabel:setSize(cc.size(90,25))
    nameLabel:setAnchorPoint(cc.p(0.5,0.5))
    nameLabel:setFontSize(20)
    nameLabel:setString("姓名：")
    nameLabel:setColor(cc.c3b(91,24,6))
    hougong_tqg_mv_info:appendComponent(nameLabel)
    nameLabel:setPositionInContainer(cc.p(84,35.5))
    table_hougong_tqg_mv_info["nameLabel"] = nameLabel

    local nameText = fc.FLabel:createBMFont()
    nameText:setSize(cc.size(90,25))
    nameText:setAnchorPoint(cc.p(0.5,0.5))
    nameText:setFontSize(20)
    nameText:setString("")
    nameText:setColor(cc.c3b(91,24,6))
    hougong_tqg_mv_info:appendComponent(nameText)
    nameText:setPositionInContainer(cc.p(170,35.5))
    table_hougong_tqg_mv_info["nameText"] = nameText

    local conLT = fc.FExtensionsImage:create()
    conLT:setImage("batch_ui/tongyongbiankuang4_tangquanxinggong.png")
    conLT:setSize(cc.size(25,27))
    conLT:setFlipType(2)
    conLT:setAnchorPoint(cc.p(0.5,0.5))
    hougong_tqg_mv_info:appendComponent(conLT)
    conLT:setPositionInContainer(cc.p(16.5,22.5))
    table_hougong_tqg_mv_info["conLT"] = conLT

    local bottom_Bar = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongbiankuang3_ciguan.png",cc.rect(40,0,2,13))
    bottom_Bar:setSize(cc.size(300,13))
    bottom_Bar:setAnchorPoint(cc.p(0.5,0.5))
    bottom_Bar:setScaleY(-1)
    hougong_tqg_mv_info:appendComponent(bottom_Bar)
    bottom_Bar:setPositionInContainer(cc.p(150,406.5))
    table_hougong_tqg_mv_info["bottom_Bar"] = bottom_Bar

    local bottom_Bar = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongbiankuang3_ciguan.png",cc.rect(40,0,2,13))
    bottom_Bar:setSize(cc.size(300,13))
    bottom_Bar:setAnchorPoint(cc.p(0.5,0.5))
    bottom_Bar:setScaleY(-1)
    hougong_tqg_mv_info:appendComponent(bottom_Bar)
    bottom_Bar:setPositionInContainer(cc.p(805,406.5))
    table_hougong_tqg_mv_info["bottom_Bar"] = bottom_Bar

    local bottomBg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/zongjiachengdikuang_tangquanxinggong.png",cc.rect(62,0,2,29))
    bottomBg:setSize(cc.size(600,43))
    bottomBg:setAnchorPoint(cc.p(0.5,0.5))
    hougong_tqg_mv_info:appendComponent(bottomBg)
    bottomBg:setPositionInContainer(cc.p(480,391.5))
    table_hougong_tqg_mv_info["bottomBg"] = bottomBg

    local zhuzhenjiacheng_label = fc.FLabel:createBMFont()
    zhuzhenjiacheng_label:setSize(cc.size(160,25))
    zhuzhenjiacheng_label:setAnchorPoint(cc.p(0.5,0.5))
    zhuzhenjiacheng_label:setFontSize(20)
    zhuzhenjiacheng_label:setString("")
    zhuzhenjiacheng_label:setColor(cc.c3b(137,32,18))
    hougong_tqg_mv_info:appendComponent(zhuzhenjiacheng_label)
    zhuzhenjiacheng_label:setPositionInContainer(cc.p(480,387.5))
    table_hougong_tqg_mv_info["zhuzhenjiacheng_label"] = zhuzhenjiacheng_label

    local conRT = fc.FExtensionsImage:create()
    conRT:setImage("batch_ui/tongyongbiankuang4_tangquanxinggong.png")
    conRT:setSize(cc.size(25,27))
    conRT:setAnchorPoint(cc.p(0.5,0.5))
    hougong_tqg_mv_info:appendComponent(conRT)
    conRT:setPositionInContainer(cc.p(942.5,22.5))
    table_hougong_tqg_mv_info["conRT"] = conRT

    local conRB = fc.FExtensionsImage:create()
    conRB:setImage("batch_ui/tongyongbiankuang4_tangquanxinggong.png")
    conRB:setSize(cc.size(25,27))
    conRB:setFlipType(4)
    conRB:setAnchorPoint(cc.p(0.5,0.5))
    hougong_tqg_mv_info:appendComponent(conRB)
    conRB:setPositionInContainer(cc.p(942.5,389.5))
    table_hougong_tqg_mv_info["conRB"] = conRB

    local conLB = fc.FExtensionsImage:create()
    conLB:setImage("batch_ui/tongyongbiankuang4_tangquanxinggong.png")
    conLB:setSize(cc.size(25,27))
    conLB:setFlipType(8)
    conLB:setAnchorPoint(cc.p(0.5,0.5))
    hougong_tqg_mv_info:appendComponent(conLB)
    conLB:setPositionInContainer(cc.p(16.5,387.5))
    table_hougong_tqg_mv_info["conLB"] = conLB

    local side_bar = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tangquanxinggongbar_tangquanxinggong.png",cc.rect(0,56,25,2))
    side_bar:setSize(cc.size(25,413))
    side_bar:setAnchorPoint(cc.p(0.5,0.5))
    hougong_tqg_mv_info:appendComponent(side_bar)
    side_bar:setPositionInContainer(cc.p(2.5,206.5))
    table_hougong_tqg_mv_info["side_bar"] = side_bar

    local side_bar = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tangquanxinggongbar_tangquanxinggong.png",cc.rect(0,56,25,2))
    side_bar:setSize(cc.size(25,413))
    side_bar:setAnchorPoint(cc.p(0.5,0.5))
    hougong_tqg_mv_info:appendComponent(side_bar)
    side_bar:setPositionInContainer(cc.p(957.5,206.5))
    table_hougong_tqg_mv_info["side_bar"] = side_bar

    local hg_tqg_gongdou_button = fc.FScaleButton:create()
    hg_tqg_gongdou_button:setSize(cc.size(144,53))
    hg_tqg_gongdou_button:setAnchorPoint(cc.p(0.5,0.5))
    hg_tqg_gongdou_button:setButtonImage("batch_ui/putonganniu1_up.png")
    hougong_tqg_mv_info:appendComponent(hg_tqg_gongdou_button)
    hg_tqg_gongdou_button:setPositionInContainer(cc.p(815,77.5))
    table_hougong_tqg_mv_info["hg_tqg_gongdou_button"] = hg_tqg_gongdou_button

    local gong = fc.FShaderExtensionsImage:create(0)
    gong:setAnchorPoint(cc.p(0.5,0.5))
    gong:setImage("batch_ui/gong_uizi.png")
    gong:setSize(cc.size(32,32))
    hg_tqg_gongdou_button:appendComponent(gong)
    gong:setPositionInContainer(cc.p(43,26))
    table_hougong_tqg_mv_info["gong"] = gong

    local dou = fc.FShaderExtensionsImage:create(0)
    dou:setAnchorPoint(cc.p(0.5,0.5))
    dou:setImage("batch_ui/dou_uizi.png")
    dou:setSize(cc.size(32,32))
    hg_tqg_gongdou_button:appendComponent(dou)
    dou:setPositionInContainer(cc.p(98,26))
    table_hougong_tqg_mv_info["dou"] = dou

    local hg_tqg_mv_chakan_button = fc.FScaleButton:create()
    hg_tqg_mv_chakan_button:setSize(cc.size(144,53))
    hg_tqg_mv_chakan_button:setAnchorPoint(cc.p(0.5,0.5))
    hg_tqg_mv_chakan_button:setButtonImage("batch_ui/putonganniu1_up.png")
    hougong_tqg_mv_info:appendComponent(hg_tqg_mv_chakan_button)
    hg_tqg_mv_chakan_button:setPositionInContainer(cc.p(815,225.5))
    table_hougong_tqg_mv_info["hg_tqg_mv_chakan_button"] = hg_tqg_mv_chakan_button

    local cha = fc.FShaderExtensionsImage:create(0)
    cha:setAnchorPoint(cc.p(0.5,0.5))
    cha:setImage("batch_ui/cha_uizi.png")
    cha:setSize(cc.size(32,32))
    hg_tqg_mv_chakan_button:appendComponent(cha)
    cha:setPositionInContainer(cc.p(33,26))
    table_hougong_tqg_mv_info["cha"] = cha

    local kan = fc.FShaderExtensionsImage:create(0)
    kan:setAnchorPoint(cc.p(0.5,0.5))
    kan:setImage("batch_ui/kan_uizi.png")
    kan:setSize(cc.size(32,32))
    hg_tqg_mv_chakan_button:appendComponent(kan)
    kan:setPositionInContainer(cc.p(59,26))
    table_hougong_tqg_mv_info["kan"] = kan

    local xiang = fc.FShaderExtensionsImage:create(0)
    xiang:setAnchorPoint(cc.p(0.5,0.5))
    xiang:setImage("batch_ui/xiang_uizi.png")
    xiang:setSize(cc.size(32,32))
    hg_tqg_mv_chakan_button:appendComponent(xiang)
    xiang:setPositionInContainer(cc.p(85,26))
    table_hougong_tqg_mv_info["xiang"] = xiang

    local qing = fc.FShaderExtensionsImage:create(0)
    qing:setAnchorPoint(cc.p(0.5,0.5))
    qing:setImage("batch_ui/qing_uizi.png")
    qing:setSize(cc.size(32,32))
    hg_tqg_mv_chakan_button:appendComponent(qing)
    qing:setPositionInContainer(cc.p(111,26))
    table_hougong_tqg_mv_info["qing"] = qing

    local hg_tqg_zzmv_henghuan_button = fc.FScaleButton:create()
    hg_tqg_zzmv_henghuan_button:setSize(cc.size(144,53))
    hg_tqg_zzmv_henghuan_button:setAnchorPoint(cc.p(0.5,0.5))
    hg_tqg_zzmv_henghuan_button:setButtonImage("batch_ui/putonganniu1_up.png")
    hougong_tqg_mv_info:appendComponent(hg_tqg_zzmv_henghuan_button)
    hg_tqg_zzmv_henghuan_button:setPositionInContainer(cc.p(815,299.5))
    table_hougong_tqg_mv_info["hg_tqg_zzmv_henghuan_button"] = hg_tqg_zzmv_henghuan_button

    local geng = fc.FShaderExtensionsImage:create(0)
    geng:setAnchorPoint(cc.p(0.5,0.5))
    geng:setImage("batch_ui/geng_uizi.png")
    geng:setSize(cc.size(32,32))
    hg_tqg_zzmv_henghuan_button:appendComponent(geng)
    geng:setPositionInContainer(cc.p(47,26))
    table_hougong_tqg_mv_info["geng"] = geng

    local huan = fc.FShaderExtensionsImage:create(0)
    huan:setAnchorPoint(cc.p(0.5,0.5))
    huan:setImage("batch_ui/huan_uizi.png")
    huan:setSize(cc.size(32,32))
    hg_tqg_zzmv_henghuan_button:appendComponent(huan)
    huan:setPositionInContainer(cc.p(97,26))
    table_hougong_tqg_mv_info["huan"] = huan

    local tqg_cefeng_btn = fc.FScaleButton:create()
    tqg_cefeng_btn:setSize(cc.size(144,53))
    tqg_cefeng_btn:setAnchorPoint(cc.p(0.5,0.5))
    tqg_cefeng_btn:setButtonImage("batch_ui/putonganniu1_up.png")
    hougong_tqg_mv_info:appendComponent(tqg_cefeng_btn)
    tqg_cefeng_btn:setPositionInContainer(cc.p(815,151.5))
    table_hougong_tqg_mv_info["tqg_cefeng_btn"] = tqg_cefeng_btn

    local ce = fc.FShaderExtensionsImage:create(0)
    ce:setAnchorPoint(cc.p(0.5,0.5))
    ce:setImage("batch_ui/ce_uizi.png")
    ce:setSize(cc.size(32,32))
    tqg_cefeng_btn:appendComponent(ce)
    ce:setPositionInContainer(cc.p(49,26))
    table_hougong_tqg_mv_info["ce"] = ce

    local feng = fc.FShaderExtensionsImage:create(0)
    feng:setAnchorPoint(cc.p(0.5,0.5))
    feng:setImage("batch_ui/feng1_uizi.png")
    feng:setSize(cc.size(32,32))
    tqg_cefeng_btn:appendComponent(feng)
    feng:setPositionInContainer(cc.p(97,26))
    table_hougong_tqg_mv_info["feng"] = feng

    local hg_tqg_chongxing_button = fc.FScaleButton:create()
    hg_tqg_chongxing_button:setSize(cc.size(101,92))
    hg_tqg_chongxing_button:setAnchorPoint(cc.p(0.5,0.5))
    hg_tqg_chongxing_button:setButtonImage("batch_ui/chongxing_anniu.png")
    hg_tqg_chongxing_button:setTextImage("batch_ui/chongxing.png",cc.p(50,55))
    hougong_tqg_mv_info:appendComponent(hg_tqg_chongxing_button)
    hg_tqg_chongxing_button:setPositionInContainer(cc.p(72.5,262))
    table_hougong_tqg_mv_info["hg_tqg_chongxing_button"] = hg_tqg_chongxing_button

    local hg_tqg_arard_button = fc.FScaleButton:create()
    hg_tqg_arard_button:setSize(cc.size(101,92))
    hg_tqg_arard_button:setAnchorPoint(cc.p(0.5,0.5))
    hg_tqg_arard_button:setButtonImage("batch_ui/shangci_anniu.png")
    hougong_tqg_mv_info:appendComponent(hg_tqg_arard_button)
    hg_tqg_arard_button:setPositionInContainer(cc.p(203.5,262))
    table_hougong_tqg_mv_info["hg_tqg_arard_button"] = hg_tqg_arard_button

    local shangciimage = fc.FExtensionsImage:create()
    shangciimage:setImage("batch_ui/shangci.png")
    shangciimage:setSize(cc.size(76,49))
    shangciimage:setAnchorPoint(cc.p(0.5,0.5))
    hg_tqg_arard_button:appendComponent(shangciimage)
    shangciimage:setPositionInContainer(cc.p(52,38.5))
    table_hougong_tqg_mv_info["shangciimage"] = shangciimage

    return table_hougong_tqg_mv_info

end

