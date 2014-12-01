function createqgyd_main()

    local table_qgyd_main = {}

    local qgyd_main = fc.FContainerPanel:create()
    qgyd_main:setSize(cc.size(960,640))
    table_qgyd_main["qgyd_main"] = qgyd_main

    local qgyd_bg_image = fc.FExtensionsImage:create()
    qgyd_bg_image:setAnchorPoint(cc.p(0.5,0.5))
    qgyd_main:appendComponent(qgyd_bg_image)
    qgyd_bg_image:setPositionInContainer(cc.p(480,320))
    table_qgyd_main["qgyd_bg_image"] = qgyd_bg_image

    local qgyd_title_bg2 = fc.FExtensionsImage:create()
    qgyd_title_bg2:setImage("nobatch/title_mingchen_.png")
    qgyd_title_bg2:setSize(cc.size(480,67))
    qgyd_title_bg2:setFlipType(2)
    qgyd_title_bg2:setAnchorPoint(cc.p(0.5,0.5))
    qgyd_main:appendComponent(qgyd_title_bg2)
    qgyd_title_bg2:setPositionInContainer(cc.p(720,33.5))
    table_qgyd_main["qgyd_title_bg2"] = qgyd_title_bg2

    local qgyd_title_bg1 = fc.FExtensionsImage:create()
    qgyd_title_bg1:setImage("nobatch/title_mingchen_.png")
    qgyd_title_bg1:setSize(cc.size(480,67))
    qgyd_title_bg1:setAnchorPoint(cc.p(0.5,0.5))
    qgyd_main:appendComponent(qgyd_title_bg1)
    qgyd_title_bg1:setPositionInContainer(cc.p(240,33.5))
    table_qgyd_main["qgyd_title_bg1"] = qgyd_title_bg1

    local qgyd_close_button = fc.FScaleButton:create()
    qgyd_close_button:setSize(cc.size(56,56))
    qgyd_close_button:setAnchorPoint(cc.p(0.5,0.5))
    qgyd_close_button:setButtonImage("batch_ui/guanbi_up.png")
    qgyd_main:appendComponent(qgyd_close_button)
    qgyd_close_button:setPositionInContainer(cc.p(935,28))
    table_qgyd_main["qgyd_close_button"] = qgyd_close_button

    local qgyd_ban1 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/xiaobiaotikuang.png",cc.rect(100,0,20,54))
    qgyd_ban1:setSize(cc.size(257,54))
    qgyd_ban1:setAnchorPoint(cc.p(0.5,0.5))
    qgyd_main:appendComponent(qgyd_ban1)
    qgyd_ban1:setPositionInContainer(cc.p(139.5,31))
    table_qgyd_main["qgyd_ban1"] = qgyd_ban1

    local qgyd_xingdongli_label = fc.FLabel:createBMFont()
    qgyd_xingdongli_label:setSize(cc.size(72,30))
    qgyd_xingdongli_label:setAnchorPoint(cc.p(0.5,0.5))
    qgyd_xingdongli_label:setFontSize(20)
    if LANGUAGE_TYPE == 3 then
    	qgyd_xingdongli_label:setString("軍令：")
    else
   	 	qgyd_xingdongli_label:setString("军令：")
    end
    qgyd_xingdongli_label:setColor(cc.c3b(255,255,0))
    qgyd_main:appendComponent(qgyd_xingdongli_label)
    qgyd_xingdongli_label:setPositionInContainer(cc.p(119,31))
    table_qgyd_main["qgyd_xingdongli_label"] = qgyd_xingdongli_label

    local qgyd_ban2 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/xiaobiaotikuang.png",cc.rect(100,0,20,54))
    qgyd_ban2:setSize(cc.size(257,54))
    qgyd_ban2:setAnchorPoint(cc.p(0.5,0.5))
    qgyd_main:appendComponent(qgyd_ban2)
    qgyd_ban2:setPositionInContainer(cc.p(139.5,93))
    table_qgyd_main["qgyd_ban2"] = qgyd_ban2

    local qgyd_xinggongli_num_label = fc.FLabel:createBMFont()
    qgyd_xinggongli_num_label:setSize(cc.size(88,30))
    qgyd_xinggongli_num_label:setAnchorPoint(cc.p(0.5,0.5))
    qgyd_xinggongli_num_label:setFontSize(20)
    qgyd_xinggongli_num_label:setString("999")
    qgyd_xinggongli_num_label:setColor(cc.c3b(255,255,0))
    qgyd_main:appendComponent(qgyd_xinggongli_num_label)
    qgyd_xinggongli_num_label:setPositionInContainer(cc.p(169,31))
    table_qgyd_main["qgyd_xinggongli_num_label"] = qgyd_xinggongli_num_label

    local qgyd_tiaozhan_label = fc.FLabel:createBMFont()
    qgyd_tiaozhan_label:setSize(cc.size(148,30))
    qgyd_tiaozhan_label:setAnchorPoint(cc.p(0.5,0.5))
    qgyd_tiaozhan_label:setFontSize(20)
    if LANGUAGE_TYPE == 3 then
    	qgyd_tiaozhan_label:setString("今天挑戰次數：")
    else
	    qgyd_tiaozhan_label:setString("今天挑战次数：")
    end
    qgyd_tiaozhan_label:setColor(cc.c3b(255,255,0))
    qgyd_main:appendComponent(qgyd_tiaozhan_label)
    qgyd_tiaozhan_label:setPositionInContainer(cc.p(128,97))
    table_qgyd_main["qgyd_tiaozhan_label"] = qgyd_tiaozhan_label

    local qgyd_tiaozhan_num_label = fc.FLabel:createBMFont()
    qgyd_tiaozhan_num_label:setSize(cc.size(80,30))
    qgyd_tiaozhan_num_label:setAnchorPoint(cc.p(0.5,0.5))
    qgyd_tiaozhan_num_label:setFontSize(20)
    qgyd_tiaozhan_num_label:setString("88/100")
    qgyd_tiaozhan_num_label:setColor(cc.c3b(255,255,0))
    qgyd_main:appendComponent(qgyd_tiaozhan_num_label)
    qgyd_tiaozhan_num_label:setPositionInContainer(cc.p(220,97))
    table_qgyd_main["qgyd_tiaozhan_num_label"] = qgyd_tiaozhan_num_label

    local qgyd_zhiditu_sclale = fc.FScale9Image:createWithBatchUIFrame("batch_ui/ditu_lan.png",cc.rect(3,3,4,4))
    qgyd_zhiditu_sclale:setSize(cc.size(960,101))
    qgyd_zhiditu_sclale:setAnchorPoint(cc.p(0.5,0.5))
    qgyd_main:appendComponent(qgyd_zhiditu_sclale)
    qgyd_zhiditu_sclale:setPositionInContainer(cc.p(480,589.5))
    table_qgyd_main["qgyd_zhiditu_sclale"] = qgyd_zhiditu_sclale

    local qgyd_kuang1_scale9 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongbiankuang3_ciguan.png",cc.rect(50,0,2,13))
    qgyd_kuang1_scale9:setSize(cc.size(960,13))
    qgyd_kuang1_scale9:setAnchorPoint(cc.p(0.5,0.5))
    qgyd_main:appendComponent(qgyd_kuang1_scale9)
    qgyd_kuang1_scale9:setPositionInContainer(cc.p(480,544.5))
    table_qgyd_main["qgyd_kuang1_scale9"] = qgyd_kuang1_scale9

    local qgyd_paiming_bg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shuruwenzi.png",cc.rect(11,9,47,7))
    qgyd_paiming_bg:setSize(cc.size(86,24))
    qgyd_paiming_bg:setAnchorPoint(cc.p(0.5,0.5))
    qgyd_main:appendComponent(qgyd_paiming_bg)
    qgyd_paiming_bg:setPositionInContainer(cc.p(140,571))
    table_qgyd_main["qgyd_paiming_bg"] = qgyd_paiming_bg

    local qgyd_paiming_label = fc.FLabel:createBMFont()
    qgyd_paiming_label:setSize(cc.size(80,30))
    qgyd_paiming_label:setAnchorPoint(cc.p(0.5,0.5))
    qgyd_paiming_label:setFontSize(20)
    qgyd_paiming_label:setString("排名：")
    qgyd_paiming_label:setColor(cc.c3b(255,255,0))
    qgyd_main:appendComponent(qgyd_paiming_label)
    qgyd_paiming_label:setPositionInContainer(cc.p(66,567))
    table_qgyd_main["qgyd_paiming_label"] = qgyd_paiming_label

    local qgyd_paiming_num_label = fc.FLabel:createBMFont()
    qgyd_paiming_num_label:setSize(cc.size(80,30))
    qgyd_paiming_num_label:setAnchorPoint(cc.p(0.5,0.5))
    qgyd_paiming_num_label:setFontSize(20)
    qgyd_paiming_num_label:setString("99999")
    qgyd_paiming_num_label:setColor(cc.c3b(94,207,65))
    qgyd_main:appendComponent(qgyd_paiming_num_label)
    qgyd_paiming_num_label:setPositionInContainer(cc.p(140,567))
    table_qgyd_main["qgyd_paiming_num_label"] = qgyd_paiming_num_label

    local qgyd_gongjizhi_bg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shuruwenzi.png",cc.rect(11,9,47,7))
    qgyd_gongjizhi_bg:setSize(cc.size(120,24))
    qgyd_gongjizhi_bg:setAnchorPoint(cc.p(0.5,0.5))
    qgyd_main:appendComponent(qgyd_gongjizhi_bg)
    qgyd_gongjizhi_bg:setPositionInContainer(cc.p(408,571))
    table_qgyd_main["qgyd_gongjizhi_bg"] = qgyd_gongjizhi_bg

    local qgyd_gongji_label = fc.FLabel:createBMFont()
    qgyd_gongji_label:setSize(cc.size(90,30))
    qgyd_gongji_label:setAnchorPoint(cc.p(0.5,0.5))
    qgyd_gongji_label:setFontSize(20)
    if LANGUAGE_TYPE == 3 then
	    qgyd_gongji_label:setString("功績值：")
    else
	    qgyd_gongji_label:setString("功绩值：")
    end
    qgyd_gongji_label:setColor(cc.c3b(255,255,0))
    qgyd_main:appendComponent(qgyd_gongji_label)
    qgyd_gongji_label:setPositionInContainer(cc.p(307,567))
    table_qgyd_main["qgyd_gongji_label"] = qgyd_gongji_label

    local qgyd_gongji_num_label = fc.FLabel:createBMFont()
    qgyd_gongji_num_label:setSize(cc.size(110,30))
    qgyd_gongji_num_label:setAnchorPoint(cc.p(0.5,0.5))
    qgyd_gongji_num_label:setFontSize(20)
    qgyd_gongji_num_label:setString("99999")
    qgyd_gongji_num_label:setColor(cc.c3b(94,207,65))
    qgyd_main:appendComponent(qgyd_gongji_num_label)
    qgyd_gongji_num_label:setPositionInContainer(cc.p(407,567))
    table_qgyd_main["qgyd_gongji_num_label"] = qgyd_gongji_num_label

    local qgyd_baochi_diwen_image = fc.FExtensionsImage:create()
    qgyd_baochi_diwen_image:setImage("nobatch/jibao_diwen.png")
    qgyd_baochi_diwen_image:setSize(cc.size(469,37))
    qgyd_baochi_diwen_image:setAnchorPoint(cc.p(0.5,0.5))
    qgyd_main:appendComponent(qgyd_baochi_diwen_image)
    qgyd_baochi_diwen_image:setPositionInContainer(cc.p(234.5,614.5))
    table_qgyd_main["qgyd_baochi_diwen_image"] = qgyd_baochi_diwen_image

    local qgyd_baochi_label = fc.FLabel:createBMFont()
    qgyd_baochi_label:setSize(cc.size(310,30))
    qgyd_baochi_label:setAnchorPoint(cc.p(0.5,0.5))
    qgyd_baochi_label:setFontSize(20)
    if LANGUAGE_TYPE == 3 then
	    qgyd_baochi_label:setString("保持此排名每10分鐘獲得功績值：")
    else
	    qgyd_baochi_label:setString("保持此排名每10分钟获得功绩值：")
    end
    qgyd_baochi_label:setColor(cc.c3b(0,0,0))
    qgyd_main:appendComponent(qgyd_baochi_label)
    qgyd_baochi_label:setPositionInContainer(cc.p(159,611))
    table_qgyd_main["qgyd_baochi_label"] = qgyd_baochi_label

    local qgyd_baochi_num_label = fc.FLabel:createBMFont()
    qgyd_baochi_num_label:setSize(cc.size(80,30))
    qgyd_baochi_num_label:setAnchorPoint(cc.p(0.5,0.5))
    qgyd_baochi_num_label:setFontSize(20)
    qgyd_baochi_num_label:setString("99999")
    qgyd_baochi_num_label:setColor(cc.c3b(0,0,0))
    qgyd_main:appendComponent(qgyd_baochi_num_label)
    qgyd_baochi_num_label:setPositionInContainer(cc.p(344,611))
    table_qgyd_main["qgyd_baochi_num_label"] = qgyd_baochi_num_label

    local qgyd_duihuan_button = fc.FScaleButton:create()
    qgyd_duihuan_button:setSize(cc.size(173,53))
    qgyd_duihuan_button:setAnchorPoint(cc.p(0.5,0.5))
    qgyd_duihuan_button:setButtonImage("batch_ui/putonganniu1_up.png")
    qgyd_main:appendComponent(qgyd_duihuan_button)
    qgyd_duihuan_button:setPositionInContainer(cc.p(792.5,600.5))
    table_qgyd_main["qgyd_duihuan_button"] = qgyd_duihuan_button

    local gong = fc.FExtensionsImage:create()
    gong:setImage("batch_ui/gong2_uizi.png")
    gong:setSize(cc.size(32,32))
    gong:setAnchorPoint(cc.p(0.5,0.5))
    qgyd_duihuan_button:appendComponent(gong)
    gong:setPositionInContainer(cc.p(26,26))
    table_qgyd_main["gong"] = gong

    local ji = fc.FExtensionsImage:create()
    ji:setImage("batch_ui/ji6_uizi.png")
    ji:setSize(cc.size(32,32))
    ji:setAnchorPoint(cc.p(0.5,0.5))
    qgyd_duihuan_button:appendComponent(ji)
    ji:setPositionInContainer(cc.p(56,26))
    table_qgyd_main["ji"] = ji

    local zhi = fc.FExtensionsImage:create()
    zhi:setImage("batch_ui/zhi_uizi.png")
    zhi:setSize(cc.size(32,32))
    zhi:setAnchorPoint(cc.p(0.5,0.5))
    qgyd_duihuan_button:appendComponent(zhi)
    zhi:setPositionInContainer(cc.p(86,26))
    table_qgyd_main["zhi"] = zhi

    local dui = fc.FExtensionsImage:create()
    dui:setImage("batch_ui/dui2_uizi.png")
    dui:setSize(cc.size(32,32))
    dui:setAnchorPoint(cc.p(0.5,0.5))
    qgyd_duihuan_button:appendComponent(dui)
    dui:setPositionInContainer(cc.p(116,26))
    table_qgyd_main["dui"] = dui

    local huan = fc.FExtensionsImage:create()
    huan:setImage("batch_ui/huan_uizi.png")
    huan:setSize(cc.size(32,32))
    huan:setAnchorPoint(cc.p(0.5,0.5))
    qgyd_duihuan_button:appendComponent(huan)
    huan:setPositionInContainer(cc.p(146,26))
    table_qgyd_main["huan"] = huan

    local ba = fc.FExtensionsImage:create()
    ba:setImage("batch_ui/ba.png")
    ba:setSize(cc.size(59,59))
    ba:setAnchorPoint(cc.p(0.5,0.5))
    qgyd_main:appendComponent(ba)
    ba:setPositionInContainer(cc.p(419.5,32.5))
    table_qgyd_main["ba"] = ba

    local ye = fc.FExtensionsImage:create()
    ye:setImage("batch_ui/ye1.png")
    ye:setSize(cc.size(59,59))
    ye:setAnchorPoint(cc.p(0.5,0.5))
    qgyd_main:appendComponent(ye)
    ye:setPositionInContainer(cc.p(540.5,32.5))
    table_qgyd_main["ye"] = ye

    return table_qgyd_main

end

