function createvip_xiangqing()

    local table_vip_xiangqing = {}

    local vip_xiangqing = fc.FContainerPanel:create()
    vip_xiangqing:setSize(cc.size(882,450))
    table_vip_xiangqing["vip_xiangqing"] = vip_xiangqing

    local vip_xq_bg1 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongditu2_ciguan.png",cc.rect(1,1,2,2))
    vip_xq_bg1:setSize(cc.size(430,450))
    vip_xq_bg1:setAnchorPoint(cc.p(0.5,0.5))
    vip_xiangqing:appendComponent(vip_xq_bg1)
    vip_xq_bg1:setPositionInContainer(cc.p(667,225))
    table_vip_xiangqing["vip_xq_bg1"] = vip_xq_bg1

    local button_bg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongditu_huodong.png",cc.rect(2,2,3,3))
    button_bg:setSize(cc.size(430,60))
    button_bg:setAnchorPoint(cc.p(0.5,0.5))
    vip_xiangqing:appendComponent(button_bg)
    button_bg:setPositionInContainer(cc.p(667,198))
    table_vip_xiangqing["button_bg"] = button_bg

    local vip_xq_bg1 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongditu2_ciguan.png",cc.rect(1,1,2,2))
    vip_xq_bg1:setSize(cc.size(430,450))
    vip_xq_bg1:setAnchorPoint(cc.p(0.5,0.5))
    vip_xiangqing:appendComponent(vip_xq_bg1)
    vip_xq_bg1:setPositionInContainer(cc.p(215,225))
    table_vip_xiangqing["vip_xq_bg1"] = vip_xq_bg1

    local vip_xq_xiangqing_content = fc.FLabel:createBMFont()
    vip_xq_xiangqing_content:setSize(cc.size(393,319))
    vip_xq_xiangqing_content:setAnchorPoint(cc.p(0.5,0.5))
    vip_xq_xiangqing_content:setFontSize(20)
    vip_xq_xiangqing_content:setString("1.需要累计需要累计需要累计\n需要累计需要累计需要累计需要累计需要\n累计需要累计需要累计\n需要累计需要累计需要累计需要\n2.累计需要累\n计需要累计需要累计需要\n累计需要累计需要累计需要累\n计需要累计需要累计需要累计需要累计\n需要累计需要累计\n3.需要累计需要累计\n需要累计需要累计需要累计需要\n累计需要累计需要累计需要累计需要\n累计需要累计需要累计需要累\n计需要累计需要")
    vip_xq_xiangqing_content:setColor(cc.c3b(91,24,6))
    vip_xiangqing:appendComponent(vip_xq_xiangqing_content)
    vip_xq_xiangqing_content:setPositionInContainer(cc.p(214.5,261.5))
    table_vip_xiangqing["vip_xq_xiangqing_content"] = vip_xq_xiangqing_content

    local vip_xq_libao_image = fc.FExtensionsImage:create()
    vip_xq_libao_image:setImage("batch_ui/libao_vip.png")
    vip_xq_libao_image:setSize(cc.size(198,131))
    vip_xq_libao_image:setAnchorPoint(cc.p(0.5,0.5))
    vip_xiangqing:appendComponent(vip_xq_libao_image)
    vip_xq_libao_image:setPositionInContainer(cc.p(567,117.5))
    table_vip_xiangqing["vip_xq_libao_image"] = vip_xq_libao_image

    local vip_xq_libao_yuanjia_label = fc.FLabel:createBMFont()
    vip_xq_libao_yuanjia_label:setSize(cc.size(70,30))
    vip_xq_libao_yuanjia_label:setAnchorPoint(cc.p(0.5,0.5))
    vip_xq_libao_yuanjia_label:setFontSize(20)
    if LANGUAGE_TYPE == 3 then
    	vip_xq_libao_yuanjia_label:setString("原價：")
    else
	    vip_xq_libao_yuanjia_label:setString("原价：")
    end
    vip_xq_libao_yuanjia_label:setColor(cc.c3b(210,0,0))
    vip_xiangqing:appendComponent(vip_xq_libao_yuanjia_label)
    vip_xq_libao_yuanjia_label:setPositionInContainer(cc.p(709,78))
    table_vip_xiangqing["vip_xq_libao_yuanjia_label"] = vip_xq_libao_yuanjia_label

    local vip_xq_libao_yaobao_image = fc.FExtensionsImage:create()
    vip_xq_libao_yaobao_image:setImage("batch_ui/yuanbao2_shangcheng.png")
    vip_xq_libao_yaobao_image:setSize(cc.size(40,30))
    vip_xq_libao_yaobao_image:setAnchorPoint(cc.p(0.5,0.5))
    vip_xiangqing:appendComponent(vip_xq_libao_yaobao_image)
    vip_xq_libao_yaobao_image:setPositionInContainer(cc.p(764,83))
    table_vip_xiangqing["vip_xq_libao_yaobao_image"] = vip_xq_libao_yaobao_image

    local vip_xq_libao_yuanjia_num_label = fc.FLabel:createBMFont()
    vip_xq_libao_yuanjia_num_label:setSize(cc.size(60,30))
    vip_xq_libao_yuanjia_num_label:setAnchorPoint(cc.p(0.5,0.5))
    vip_xq_libao_yuanjia_num_label:setFontSize(21)
    vip_xq_libao_yuanjia_num_label:setString("500")
    vip_xq_libao_yuanjia_num_label:setColor(cc.c3b(210,0,0))
    vip_xiangqing:appendComponent(vip_xq_libao_yuanjia_num_label)
    vip_xq_libao_yuanjia_num_label:setPositionInContainer(cc.p(814,78))
    table_vip_xiangqing["vip_xq_libao_yuanjia_num_label"] = vip_xq_libao_yuanjia_num_label

    local vip_xq_goumai_button = fc.FScaleButton:create()
    vip_xq_goumai_button:setSize(cc.size(144,51))
    vip_xq_goumai_button:setAnchorPoint(cc.p(0.5,0.5))
    vip_xq_goumai_button:setButtonImage("batch_ui/goumai_anniu.png")
    vip_xiangqing:appendComponent(vip_xq_goumai_button)
    vip_xq_goumai_button:setPositionInContainer(cc.p(757,201.5))
    table_vip_xiangqing["vip_xq_goumai_button"] = vip_xq_goumai_button

    local gou = fc.FShaderExtensionsImage:create(0)
    gou:setAnchorPoint(cc.p(0.5,0.5))
    gou:setImage("batch_ui/gou_uizi.png")
    gou:setSize(cc.size(32,32))
    vip_xq_goumai_button:appendComponent(gou)
    gou:setPositionInContainer(cc.p(47,23))
    table_vip_xiangqing["gou"] = gou

    local mai = fc.FShaderExtensionsImage:create(0)
    mai:setAnchorPoint(cc.p(0.5,0.5))
    mai:setImage("batch_ui/mai_uizi.png")
    mai:setSize(cc.size(32,32))
    vip_xq_goumai_button:appendComponent(mai)
    mai:setPositionInContainer(cc.p(95,23))
    table_vip_xiangqing["mai"] = mai

    local vip_xq_lipin_name1_label = fc.FLabel:createBMFont()
    vip_xq_lipin_name1_label:setSize(cc.size(170,30))
    vip_xq_lipin_name1_label:setAnchorPoint(cc.p(0.5,0.5))
    vip_xq_lipin_name1_label:setFontSize(20)
    vip_xq_lipin_name1_label:setString("礼品名称礼品名称")
    vip_xq_lipin_name1_label:setColor(cc.c3b(134,32,15))
    vip_xiangqing:appendComponent(vip_xq_lipin_name1_label)
    vip_xq_lipin_name1_label:setPositionInContainer(cc.p(580,290))
    table_vip_xiangqing["vip_xq_lipin_name1_label"] = vip_xq_lipin_name1_label

    local vip_xq_lipin_name2_label = fc.FLabel:createBMFont()
    vip_xq_lipin_name2_label:setSize(cc.size(170,30))
    vip_xq_lipin_name2_label:setAnchorPoint(cc.p(0.5,0.5))
    vip_xq_lipin_name2_label:setFontSize(20)
    vip_xq_lipin_name2_label:setString("礼品名称礼品名称")
    vip_xq_lipin_name2_label:setColor(cc.c3b(134,32,15))
    vip_xiangqing:appendComponent(vip_xq_lipin_name2_label)
    vip_xq_lipin_name2_label:setPositionInContainer(cc.p(760,290))
    table_vip_xiangqing["vip_xq_lipin_name2_label"] = vip_xq_lipin_name2_label

    local vip_xq_lipin_name3_label = fc.FLabel:createBMFont()
    vip_xq_lipin_name3_label:setSize(cc.size(170,30))
    vip_xq_lipin_name3_label:setAnchorPoint(cc.p(0.5,0.5))
    vip_xq_lipin_name3_label:setFontSize(20)
    vip_xq_lipin_name3_label:setString("礼品名称礼品名称")
    vip_xq_lipin_name3_label:setColor(cc.c3b(134,32,15))
    vip_xiangqing:appendComponent(vip_xq_lipin_name3_label)
    vip_xq_lipin_name3_label:setPositionInContainer(cc.p(580,323))
    table_vip_xiangqing["vip_xq_lipin_name3_label"] = vip_xq_lipin_name3_label

    local vip_xq_lipin_name4_label = fc.FLabel:createBMFont()
    vip_xq_lipin_name4_label:setSize(cc.size(170,30))
    vip_xq_lipin_name4_label:setAnchorPoint(cc.p(0.5,0.5))
    vip_xq_lipin_name4_label:setFontSize(20)
    vip_xq_lipin_name4_label:setString("礼品名称礼品名称")
    vip_xq_lipin_name4_label:setColor(cc.c3b(134,32,15))
    vip_xiangqing:appendComponent(vip_xq_lipin_name4_label)
    vip_xq_lipin_name4_label:setPositionInContainer(cc.p(760,323))
    table_vip_xiangqing["vip_xq_lipin_name4_label"] = vip_xq_lipin_name4_label

    local vip_xq_lipin_name5_label = fc.FLabel:createBMFont()
    vip_xq_lipin_name5_label:setSize(cc.size(170,30))
    vip_xq_lipin_name5_label:setAnchorPoint(cc.p(0.5,0.5))
    vip_xq_lipin_name5_label:setFontSize(20)
    vip_xq_lipin_name5_label:setString("礼品名称礼品名称")
    vip_xq_lipin_name5_label:setColor(cc.c3b(134,32,15))
    vip_xiangqing:appendComponent(vip_xq_lipin_name5_label)
    vip_xq_lipin_name5_label:setPositionInContainer(cc.p(580,356))
    table_vip_xiangqing["vip_xq_lipin_name5_label"] = vip_xq_lipin_name5_label

    local vip_xq_lipin_name6_label = fc.FLabel:createBMFont()
    vip_xq_lipin_name6_label:setSize(cc.size(170,30))
    vip_xq_lipin_name6_label:setAnchorPoint(cc.p(0.5,0.5))
    vip_xq_lipin_name6_label:setFontSize(20)
    vip_xq_lipin_name6_label:setString("礼品名称礼品名称")
    vip_xq_lipin_name6_label:setColor(cc.c3b(134,32,15))
    vip_xiangqing:appendComponent(vip_xq_lipin_name6_label)
    vip_xq_lipin_name6_label:setPositionInContainer(cc.p(760,357))
    table_vip_xiangqing["vip_xq_lipin_name6_label"] = vip_xq_lipin_name6_label

    local vip_xq_lipin_name7_label = fc.FLabel:createBMFont()
    vip_xq_lipin_name7_label:setSize(cc.size(170,30))
    vip_xq_lipin_name7_label:setAnchorPoint(cc.p(0.5,0.5))
    vip_xq_lipin_name7_label:setFontSize(20)
    vip_xq_lipin_name7_label:setString("礼品名称礼品名称")
    vip_xq_lipin_name7_label:setColor(cc.c3b(134,32,15))
    vip_xiangqing:appendComponent(vip_xq_lipin_name7_label)
    vip_xq_lipin_name7_label:setPositionInContainer(cc.p(580,390))
    table_vip_xiangqing["vip_xq_lipin_name7_label"] = vip_xq_lipin_name7_label

    local vip_xq_lipin_name8_label = fc.FLabel:createBMFont()
    vip_xq_lipin_name8_label:setSize(cc.size(170,30))
    vip_xq_lipin_name8_label:setAnchorPoint(cc.p(0.5,0.5))
    vip_xq_lipin_name8_label:setFontSize(20)
    vip_xq_lipin_name8_label:setString("礼品名称礼品名称")
    vip_xq_lipin_name8_label:setColor(cc.c3b(134,32,15))
    vip_xiangqing:appendComponent(vip_xq_lipin_name8_label)
    vip_xq_lipin_name8_label:setPositionInContainer(cc.p(760,390))
    table_vip_xiangqing["vip_xq_lipin_name8_label"] = vip_xq_lipin_name8_label

    local vip_xq_lipin_name9_label = fc.FLabel:createBMFont()
    vip_xq_lipin_name9_label:setSize(cc.size(170,30))
    vip_xq_lipin_name9_label:setAnchorPoint(cc.p(0.5,0.5))
    vip_xq_lipin_name9_label:setFontSize(20)
    vip_xq_lipin_name9_label:setString("礼品名称礼品名称")
    vip_xq_lipin_name9_label:setColor(cc.c3b(134,32,15))
    vip_xiangqing:appendComponent(vip_xq_lipin_name9_label)
    vip_xq_lipin_name9_label:setPositionInContainer(cc.p(580,424))
    table_vip_xiangqing["vip_xq_lipin_name9_label"] = vip_xq_lipin_name9_label

    local vip_xq_lipin_name10_label = fc.FLabel:createBMFont()
    vip_xq_lipin_name10_label:setSize(cc.size(170,30))
    vip_xq_lipin_name10_label:setAnchorPoint(cc.p(0.5,0.5))
    vip_xq_lipin_name10_label:setFontSize(20)
    vip_xq_lipin_name10_label:setString("礼品名称礼品名称")
    vip_xq_lipin_name10_label:setColor(cc.c3b(134,32,15))
    vip_xiangqing:appendComponent(vip_xq_lipin_name10_label)
    vip_xq_lipin_name10_label:setPositionInContainer(cc.p(760,424))
    table_vip_xiangqing["vip_xq_lipin_name10_label"] = vip_xq_lipin_name10_label

    local vip_xq_xiangou_image = fc.FExtensionsImage:create()
    vip_xq_xiangou_image:setImage("batch_ui/xiangouyige_vip.png")
    vip_xq_xiangou_image:setSize(cc.size(119,79))
    vip_xq_xiangou_image:setAnchorPoint(cc.p(0.5,0.5))
    vip_xiangqing:appendComponent(vip_xq_xiangou_image)
    vip_xq_xiangou_image:setPositionInContainer(cc.p(546.5,88.5))
    table_vip_xiangqing["vip_xq_xiangou_image"] = vip_xq_xiangou_image

    local vip_xq_shanchu_image1 = fc.FExtensionsImage:create()
    vip_xq_shanchu_image1:setImage("batch_ui/yuanjiaquxiao.png")
    vip_xq_shanchu_image1:setSize(cc.size(153,22))
    vip_xq_shanchu_image1:setAnchorPoint(cc.p(0.5,0.5))
    vip_xiangqing:appendComponent(vip_xq_shanchu_image1)
    vip_xq_shanchu_image1:setPositionInContainer(cc.p(761.5,81))
    table_vip_xiangqing["vip_xq_shanchu_image1"] = vip_xq_shanchu_image1

    local xq_titlebg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/xingjikuang_tangquanxinggong.png",cc.rect(62,0,2,42))
    xq_titlebg:setSize(cc.size(430,42))
    xq_titlebg:setAnchorPoint(cc.p(0.5,0.5))
    xq_titlebg:setScaleY(-1)
    vip_xiangqing:appendComponent(xq_titlebg)
    xq_titlebg:setPositionInContainer(cc.p(215,29))
    table_vip_xiangqing["xq_titlebg"] = xq_titlebg

    local vip_xq_title1_vip = fc.FExtensionsImage:create()
    vip_xq_title1_vip:setImage("batch_ui/VIP.png")
    vip_xq_title1_vip:setSize(cc.size(83,42))
    vip_xq_title1_vip:setAnchorPoint(cc.p(0.5,0.5))
    vip_xiangqing:appendComponent(vip_xq_title1_vip)
    vip_xq_title1_vip:setPositionInContainer(cc.p(133.5,24))
    table_vip_xiangqing["vip_xq_title1_vip"] = vip_xq_title1_vip

    local xq_titlebg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/xingjikuang_tangquanxinggong.png",cc.rect(62,0,2,42))
    xq_titlebg:setSize(cc.size(430,42))
    xq_titlebg:setAnchorPoint(cc.p(0.5,0.5))
    xq_titlebg:setScaleY(-1)
    vip_xiangqing:appendComponent(xq_titlebg)
    xq_titlebg:setPositionInContainer(cc.p(667,29))
    table_vip_xiangqing["xq_titlebg"] = xq_titlebg

    local vip_xq_title2_vip = fc.FExtensionsImage:create()
    vip_xq_title2_vip:setImage("batch_ui/VIP.png")
    vip_xq_title2_vip:setSize(cc.size(83,42))
    vip_xq_title2_vip:setAnchorPoint(cc.p(0.5,0.5))
    vip_xiangqing:appendComponent(vip_xq_title2_vip)
    vip_xq_title2_vip:setPositionInContainer(cc.p(585.5,24))
    table_vip_xiangqing["vip_xq_title2_vip"] = vip_xq_title2_vip

    local xq_titlebg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/xingjikuang_tangquanxinggong.png",cc.rect(62,0,2,42))
    xq_titlebg:setSize(cc.size(430,42))
    xq_titlebg:setAnchorPoint(cc.p(0.5,0.5))
    xq_titlebg:setScaleY(-1)
    vip_xiangqing:appendComponent(xq_titlebg)
    xq_titlebg:setPositionInContainer(cc.p(667,249))
    table_vip_xiangqing["xq_titlebg"] = xq_titlebg

    local te = fc.FExtensionsImage:create()
    te:setImage("batch_ui/te_uizi.png")
    te:setSize(cc.size(32,32))
    te:setAnchorPoint(cc.p(0.5,0.5))
    vip_xiangqing:appendComponent(te)
    te:setPositionInContainer(cc.p(239,29))
    table_vip_xiangqing["te"] = te

    local quan = fc.FExtensionsImage:create()
    quan:setImage("batch_ui/quan_uizi.png")
    quan:setSize(cc.size(32,32))
    quan:setAnchorPoint(cc.p(0.5,0.5))
    vip_xiangqing:appendComponent(quan)
    quan:setPositionInContainer(cc.p(267,29))
    table_vip_xiangqing["quan"] = quan

    local xiang = fc.FExtensionsImage:create()
    xiang:setImage("batch_ui/xiang_uizi.png")
    xiang:setSize(cc.size(32,32))
    xiang:setAnchorPoint(cc.p(0.5,0.5))
    vip_xiangqing:appendComponent(xiang)
    xiang:setPositionInContainer(cc.p(296,29))
    table_vip_xiangqing["xiang"] = xiang

    local qing = fc.FExtensionsImage:create()
    qing:setImage("batch_ui/qing_uizi.png")
    qing:setSize(cc.size(32,32))
    qing:setAnchorPoint(cc.p(0.5,0.5))
    vip_xiangqing:appendComponent(qing)
    qing:setPositionInContainer(cc.p(324,29))
    table_vip_xiangqing["qing"] = qing

    local te = fc.FExtensionsImage:create()
    te:setImage("batch_ui/te_uizi.png")
    te:setSize(cc.size(32,32))
    te:setAnchorPoint(cc.p(0.5,0.5))
    vip_xiangqing:appendComponent(te)
    te:setPositionInContainer(cc.p(693,29))
    table_vip_xiangqing["te"] = te

    local quan = fc.FExtensionsImage:create()
    quan:setImage("batch_ui/quan_uizi.png")
    quan:setSize(cc.size(32,32))
    quan:setAnchorPoint(cc.p(0.5,0.5))
    vip_xiangqing:appendComponent(quan)
    quan:setPositionInContainer(cc.p(722,29))
    table_vip_xiangqing["quan"] = quan

    local li = fc.FExtensionsImage:create()
    li:setImage("batch_ui/li1_uizi.png")
    li:setSize(cc.size(32,32))
    li:setAnchorPoint(cc.p(0.5,0.5))
    vip_xiangqing:appendComponent(li)
    li:setPositionInContainer(cc.p(750,29))
    table_vip_xiangqing["li"] = li

    local bao = fc.FExtensionsImage:create()
    bao:setImage("batch_ui/bao_uizi.png")
    bao:setSize(cc.size(32,32))
    bao:setAnchorPoint(cc.p(0.5,0.5))
    vip_xiangqing:appendComponent(bao)
    bao:setPositionInContainer(cc.p(779,29))
    table_vip_xiangqing["bao"] = bao

    local li = fc.FExtensionsImage:create()
    li:setImage("batch_ui/li1_uizi.png")
    li:setSize(cc.size(32,32))
    li:setAnchorPoint(cc.p(0.5,0.5))
    vip_xiangqing:appendComponent(li)
    li:setPositionInContainer(cc.p(602,249))
    table_vip_xiangqing["li"] = li

    local bao = fc.FExtensionsImage:create()
    bao:setImage("batch_ui/bao_uizi.png")
    bao:setSize(cc.size(32,32))
    bao:setAnchorPoint(cc.p(0.5,0.5))
    vip_xiangqing:appendComponent(bao)
    bao:setPositionInContainer(cc.p(644,249))
    table_vip_xiangqing["bao"] = bao

    local xiang = fc.FExtensionsImage:create()
    xiang:setImage("batch_ui/xiang_uizi.png")
    xiang:setSize(cc.size(32,32))
    xiang:setAnchorPoint(cc.p(0.5,0.5))
    vip_xiangqing:appendComponent(xiang)
    xiang:setPositionInContainer(cc.p(687,249))
    table_vip_xiangqing["xiang"] = xiang

    local qing = fc.FExtensionsImage:create()
    qing:setImage("batch_ui/qing_uizi.png")
    qing:setSize(cc.size(32,32))
    qing:setAnchorPoint(cc.p(0.5,0.5))
    vip_xiangqing:appendComponent(qing)
    qing:setPositionInContainer(cc.p(729,249))
    table_vip_xiangqing["qing"] = qing

    local xq_upbg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongditu_huodong.png",cc.rect(2,2,3,3))
    xq_upbg:setSize(cc.size(430,40))
    xq_upbg:setAnchorPoint(cc.p(0.5,0.5))
    vip_xiangqing:appendComponent(xq_upbg)
    xq_upbg:setPositionInContainer(cc.p(215,68))
    table_vip_xiangqing["xq_upbg"] = xq_upbg

    local vip_xq_xuyao_label = fc.FLabel:createBMFont()
    vip_xq_xuyao_label:setSize(cc.size(110,30))
    vip_xq_xuyao_label:setAnchorPoint(cc.p(0.5,0.5))
    vip_xq_xuyao_label:setFontSize(20)
    if LANGUAGE_TYPE == 3 then
    	vip_xq_xuyao_label:setString("需要累計：")
    else
    	vip_xq_xuyao_label:setString("需要累计：")
    end
    vip_xq_xuyao_label:setColor(cc.c3b(255,0,0))
    vip_xiangqing:appendComponent(vip_xq_xuyao_label)
    vip_xq_xuyao_label:setPositionInContainer(cc.p(159,64))
    table_vip_xiangqing["vip_xq_xuyao_label"] = vip_xq_xuyao_label

    local textBg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shuruwenzi.png",cc.rect(11,9,47,7))
    textBg:setSize(cc.size(100,30))
    textBg:setAnchorPoint(cc.p(0.5,0.5))
    vip_xiangqing:appendComponent(textBg)
    textBg:setPositionInContainer(cc.p(269,68))
    table_vip_xiangqing["textBg"] = textBg

    local vip_xq_xuyao_yaobao_image = fc.FExtensionsImage:create()
    vip_xq_xuyao_yaobao_image:setImage("batch_ui/yuanbao2_shangcheng.png")
    vip_xq_xuyao_yaobao_image:setSize(cc.size(40,30))
    vip_xq_xuyao_yaobao_image:setAnchorPoint(cc.p(0.5,0.5))
    vip_xiangqing:appendComponent(vip_xq_xuyao_yaobao_image)
    vip_xq_xuyao_yaobao_image:setPositionInContainer(cc.p(228,69))
    table_vip_xiangqing["vip_xq_xuyao_yaobao_image"] = vip_xq_xuyao_yaobao_image

    local vip_xq_xuyao_num_label = fc.FLabel:createBMFont()
    vip_xq_xuyao_num_label:setSize(cc.size(60,30))
    vip_xq_xuyao_num_label:setAnchorPoint(cc.p(0.5,0.5))
    vip_xq_xuyao_num_label:setFontSize(21)
    vip_xq_xuyao_num_label:setString("500")
    vip_xq_xuyao_num_label:setColor(cc.c3b(0,255,255))
    vip_xiangqing:appendComponent(vip_xq_xuyao_num_label)
    vip_xq_xuyao_num_label:setPositionInContainer(cc.p(281,64))
    table_vip_xiangqing["vip_xq_xuyao_num_label"] = vip_xq_xuyao_num_label

    local bg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/jibieditu1_huodong.png",cc.rect(2,0,3,46))
    bg:setSize(cc.size(240,46))
    bg:setAnchorPoint(cc.p(0.5,0.5))
    bg:setScaleX(-1)
    vip_xiangqing:appendComponent(bg)
    bg:setPositionInContainer(cc.p(762,135))
    table_vip_xiangqing["bg"] = bg

    local vip_xq_libao_jinshou_label = fc.FLabel:createBMFont()
    vip_xq_libao_jinshou_label:setSize(cc.size(60,30))
    vip_xq_libao_jinshou_label:setAnchorPoint(cc.p(0.5,0.5))
    vip_xq_libao_jinshou_label:setFontSize(20)
    if LANGUAGE_TYPE == 3 then
    	vip_xq_libao_jinshou_label:setString("僅售")
    else
	    vip_xq_libao_jinshou_label:setString("仅售")
    end
    vip_xq_libao_jinshou_label:setColor(cc.c3b(255,255,255))
    vip_xiangqing:appendComponent(vip_xq_libao_jinshou_label)
    vip_xq_libao_jinshou_label:setPositionInContainer(cc.p(705,126))
    table_vip_xiangqing["vip_xq_libao_jinshou_label"] = vip_xq_libao_jinshou_label

    local vip_xq_jinshou_yaobao_image = fc.FExtensionsImage:create()
    vip_xq_jinshou_yaobao_image:setImage("batch_ui/yuanbao2_shangcheng.png")
    vip_xq_jinshou_yaobao_image:setSize(cc.size(40,30))
    vip_xq_jinshou_yaobao_image:setAnchorPoint(cc.p(0.5,0.5))
    vip_xiangqing:appendComponent(vip_xq_jinshou_yaobao_image)
    vip_xq_jinshou_yaobao_image:setPositionInContainer(cc.p(764,133))
    table_vip_xiangqing["vip_xq_jinshou_yaobao_image"] = vip_xq_jinshou_yaobao_image

    local vip_xq_libao_jinshou_num_label = fc.FLabel:createBMFont()
    vip_xq_libao_jinshou_num_label:setSize(cc.size(60,30))
    vip_xq_libao_jinshou_num_label:setAnchorPoint(cc.p(0.5,0.5))
    vip_xq_libao_jinshou_num_label:setFontSize(21)
    vip_xq_libao_jinshou_num_label:setString("500")
    vip_xq_libao_jinshou_num_label:setColor(cc.c3b(255,255,255))
    vip_xiangqing:appendComponent(vip_xq_libao_jinshou_num_label)
    vip_xq_libao_jinshou_num_label:setPositionInContainer(cc.p(814,128))
    table_vip_xiangqing["vip_xq_libao_jinshou_num_label"] = vip_xq_libao_jinshou_num_label

    local xq_kuang = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongbiankuang2_ciguan.png",cc.rect(43,15,2,2))
    xq_kuang:setSize(cc.size(430,450))
    xq_kuang:setAnchorPoint(cc.p(0.5,0.5))
    vip_xiangqing:appendComponent(xq_kuang)
    xq_kuang:setPositionInContainer(cc.p(215,225))
    table_vip_xiangqing["xq_kuang"] = xq_kuang

    local xq_kuang = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongbiankuang2_ciguan.png",cc.rect(43,15,2,2))
    xq_kuang:setSize(cc.size(430,450))
    xq_kuang:setAnchorPoint(cc.p(0.5,0.5))
    vip_xiangqing:appendComponent(xq_kuang)
    xq_kuang:setPositionInContainer(cc.p(667,225))
    table_vip_xiangqing["xq_kuang"] = xq_kuang

    local vip_xq_chakan_button = fc.FScaleButton:create()
    vip_xq_chakan_button:setSize(cc.size(144,51))
    vip_xq_chakan_button:setAnchorPoint(cc.p(0.5,0.5))
    vip_xq_chakan_button:setButtonImage("batch_ui/goumai_anniu.png")
    vip_xiangqing:appendComponent(vip_xq_chakan_button)
    vip_xq_chakan_button:setPositionInContainer(cc.p(588,201.5))
    table_vip_xiangqing["vip_xq_chakan_button"] = vip_xq_chakan_button

    local cha = fc.FShaderExtensionsImage:create(0)
    cha:setAnchorPoint(cc.p(0.5,0.5))
    cha:setImage("batch_ui/cha_uizi.png")
    cha:setSize(cc.size(32,32))
    vip_xq_chakan_button:appendComponent(cha)
    cha:setPositionInContainer(cc.p(44,23))
    table_vip_xiangqing["cha"] = cha

    local kan = fc.FShaderExtensionsImage:create(0)
    kan:setAnchorPoint(cc.p(0.5,0.5))
    kan:setImage("batch_ui/kan_uizi.png")
    kan:setSize(cc.size(32,32))
    vip_xq_chakan_button:appendComponent(kan)
    kan:setPositionInContainer(cc.p(94,23))
    table_vip_xiangqing["kan"] = kan

    return table_vip_xiangqing

end

