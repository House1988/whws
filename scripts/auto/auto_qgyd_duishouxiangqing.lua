function createqgyd_duishouxiangqing()

    local table_qgyd_duishouxiangqing = {}

    local qgyd_duishouxiangqing = fc.FContainerPanel:create()
    qgyd_duishouxiangqing:setSize(cc.size(960,640))
    table_qgyd_duishouxiangqing["qgyd_duishouxiangqing"] = qgyd_duishouxiangqing

    local qgyd_duishouxiangqing_bottom = fc.FContainerPanel:create()
    qgyd_duishouxiangqing_bottom:setSize(cc.size(534,550))
    qgyd_duishouxiangqing_bottom:setAnchorPoint(cc.p(0.5,0.5))
    qgyd_duishouxiangqing:appendComponent(qgyd_duishouxiangqing_bottom)
    qgyd_duishouxiangqing_bottom:setPositionInContainer(cc.p(497,295))
    table_qgyd_duishouxiangqing["qgyd_duishouxiangqing_bottom"] = qgyd_duishouxiangqing_bottom

    local sz_la = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shengzhi_ditu.png",cc.rect(40,63,4,4))
    sz_la:setSize(cc.size(412,490))
    sz_la:setAnchorPoint(cc.p(0.5,0.5))
    qgyd_duishouxiangqing_bottom:appendComponent(sz_la)
    sz_la:setPositionInContainer(cc.p(267,273))
    table_qgyd_duishouxiangqing["sz_la"] = sz_la

    local zhou_up = fc.FExtensionsImage:create()
    zhou_up:setImage("nobatch/shengzhi_zhou.png")
    zhou_up:setSize(cc.size(52,534))
    zhou_up:setRotation(90)
    zhou_up:setAnchorPoint(cc.p(0.5,0.5))
    qgyd_duishouxiangqing_bottom:appendComponent(zhou_up)
    zhou_up:setPositionInContainer(cc.p(267,26))
    table_qgyd_duishouxiangqing["zhou_up"] = zhou_up

    local zhou_down = fc.FExtensionsImage:create()
    zhou_down:setImage("nobatch/shengzhi_zhou.png")
    zhou_down:setSize(cc.size(52,534))
    zhou_down:setRotation(90)
    zhou_down:setAnchorPoint(cc.p(0.5,0.5))
    qgyd_duishouxiangqing_bottom:appendComponent(zhou_down)
    zhou_down:setPositionInContainer(cc.p(267,524))
    table_qgyd_duishouxiangqing["zhou_down"] = zhou_down

    local dsxq_close_button = fc.FScaleButton:create()
    dsxq_close_button:setSize(cc.size(34,33))
    dsxq_close_button:setAnchorPoint(cc.p(0.5,0.5))
    dsxq_close_button:setButtonImage("batch_ui/guanbi_anniu2.png")
    qgyd_duishouxiangqing_bottom:appendComponent(dsxq_close_button)
    dsxq_close_button:setPositionInContainer(cc.p(500,26.5))
    table_qgyd_duishouxiangqing["dsxq_close_button"] = dsxq_close_button

    local title_bg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/xingjikuang_tangquanxinggong.png",cc.rect(72,17,2,2))
    title_bg:setSize(cc.size(260,50))
    title_bg:setAnchorPoint(cc.p(0.5,0.5))
    title_bg:setScaleY(-1)
    qgyd_duishouxiangqing_bottom:appendComponent(title_bg)
    title_bg:setPositionInContainer(cc.p(274,25))
    table_qgyd_duishouxiangqing["title_bg"] = title_bg

    local ui_dui = fc.FExtensionsImage:create()
    ui_dui:setImage("batch_ui/dui_uizi.png")
    ui_dui:setSize(cc.size(32,32))
    ui_dui:setAnchorPoint(cc.p(0.5,0.5))
    qgyd_duishouxiangqing_bottom:appendComponent(ui_dui)
    ui_dui:setPositionInContainer(cc.p(235,25))
    table_qgyd_duishouxiangqing["ui_dui"] = ui_dui

    local ui_shou = fc.FExtensionsImage:create()
    ui_shou:setImage("batch_ui/shou2_uizi.png")
    ui_shou:setSize(cc.size(32,32))
    ui_shou:setAnchorPoint(cc.p(0.5,0.5))
    qgyd_duishouxiangqing_bottom:appendComponent(ui_shou)
    ui_shou:setPositionInContainer(cc.p(262,25))
    table_qgyd_duishouxiangqing["ui_shou"] = ui_shou

    local ui_xiang = fc.FExtensionsImage:create()
    ui_xiang:setImage("batch_ui/xiang_uizi.png")
    ui_xiang:setSize(cc.size(32,32))
    ui_xiang:setAnchorPoint(cc.p(0.5,0.5))
    qgyd_duishouxiangqing_bottom:appendComponent(ui_xiang)
    ui_xiang:setPositionInContainer(cc.p(288,25))
    table_qgyd_duishouxiangqing["ui_xiang"] = ui_xiang

    local ui_qing = fc.FExtensionsImage:create()
    ui_qing:setImage("batch_ui/qing_uizi.png")
    ui_qing:setSize(cc.size(32,32))
    ui_qing:setAnchorPoint(cc.p(0.5,0.5))
    qgyd_duishouxiangqing_bottom:appendComponent(ui_qing)
    ui_qing:setPositionInContainer(cc.p(315,25))
    table_qgyd_duishouxiangqing["ui_qing"] = ui_qing

    local ui_rect1 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongditu2_huodong.png",cc.rect(1,1,1,1))
    ui_rect1:setSize(cc.size(384,450))
    ui_rect1:setAnchorPoint(cc.p(0.5,0.5))
    qgyd_duishouxiangqing_bottom:appendComponent(ui_rect1)
    ui_rect1:setPositionInContainer(cc.p(267,276))
    table_qgyd_duishouxiangqing["ui_rect1"] = ui_rect1

    local ui_rect2 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongbiankuang2_ciguan.png",cc.rect(44,15,1,1))
    ui_rect2:setSize(cc.size(384,450))
    ui_rect2:setAnchorPoint(cc.p(0.5,0.5))
    qgyd_duishouxiangqing_bottom:appendComponent(ui_rect2)
    ui_rect2:setPositionInContainer(cc.p(267,276))
    table_qgyd_duishouxiangqing["ui_rect2"] = ui_rect2

    local ui_rect3 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongbiankuang2_ciguan.png",cc.rect(44,15,1,1))
    ui_rect3:setSize(cc.size(384,300))
    ui_rect3:setAnchorPoint(cc.p(0.5,0.5))
    qgyd_duishouxiangqing_bottom:appendComponent(ui_rect3)
    ui_rect3:setPositionInContainer(cc.p(267,351))
    table_qgyd_duishouxiangqing["ui_rect3"] = ui_rect3

    local ui_tiao1 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongditu_huodong.png",cc.rect(3,3,2,2))
    ui_tiao1:setSize(cc.size(380,40))
    ui_tiao1:setAnchorPoint(cc.p(0.5,0.5))
    qgyd_duishouxiangqing_bottom:appendComponent(ui_tiao1)
    ui_tiao1:setPositionInContainer(cc.p(267,108))
    table_qgyd_duishouxiangqing["ui_tiao1"] = ui_tiao1

    local ui_tiao1 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongditu_huodong.png",cc.rect(3,3,2,2))
    ui_tiao1:setSize(cc.size(380,40))
    ui_tiao1:setAnchorPoint(cc.p(0.5,0.5))
    qgyd_duishouxiangqing_bottom:appendComponent(ui_tiao1)
    ui_tiao1:setPositionInContainer(cc.p(267,181))
    table_qgyd_duishouxiangqing["ui_tiao1"] = ui_tiao1

    local dsxq_xiangqing_label = fc.FLabel:createBMFont()
    dsxq_xiangqing_label:setSize(cc.size(101,30))
    dsxq_xiangqing_label:setAnchorPoint(cc.p(0.5,0.5))
    dsxq_xiangqing_label:setFontSize(24)
    dsxq_xiangqing_label:setString("对手名字")
    dsxq_xiangqing_label:setColor(cc.c3b(91,24,6))
    qgyd_duishouxiangqing_bottom:appendComponent(dsxq_xiangqing_label)
    dsxq_xiangqing_label:setPositionInContainer(cc.p(274.5,67))
    table_qgyd_duishouxiangqing["dsxq_xiangqing_label"] = dsxq_xiangqing_label

    local dsxq_dengji_label = fc.FLabel:createBMFont()
    dsxq_dengji_label:setSize(cc.size(72,30))
    dsxq_dengji_label:setAnchorPoint(cc.p(0.5,0.5))
    dsxq_dengji_label:setFontSize(20)
    if LANGUAGE_TYPE == 3 then
    	dsxq_dengji_label:setString("等級：")
    else
    	dsxq_dengji_label:setString("等级：")
    end
    dsxq_dengji_label:setColor(cc.c3b(91,24,6))
    qgyd_duishouxiangqing_bottom:appendComponent(dsxq_dengji_label)
    dsxq_dengji_label:setPositionInContainer(cc.p(142,109))
    table_qgyd_duishouxiangqing["dsxq_dengji_label"] = dsxq_dengji_label

    local di_image = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shuruwenzi.png",cc.rect(11,9,47,7))
    di_image:setSize(cc.size(65,28))
    di_image:setAnchorPoint(cc.p(0.5,0.5))
    qgyd_duishouxiangqing_bottom:appendComponent(di_image)
    di_image:setPositionInContainer(cc.p(212.5,110))
    table_qgyd_duishouxiangqing["di_image"] = di_image

    local dsxq_dengji_num_label = fc.FLabel:createBMFont()
    dsxq_dengji_num_label:setSize(cc.size(56,30))
    dsxq_dengji_num_label:setAnchorPoint(cc.p(0.5,0.5))
    dsxq_dengji_num_label:setFontSize(21)
    dsxq_dengji_num_label:setString("99")
    dsxq_dengji_num_label:setColor(cc.c3b(0,255,0))
    qgyd_duishouxiangqing_bottom:appendComponent(dsxq_dengji_num_label)
    dsxq_dengji_num_label:setPositionInContainer(cc.p(213,109))
    table_qgyd_duishouxiangqing["dsxq_dengji_num_label"] = dsxq_dengji_num_label

    local dsxq_paiming_label = fc.FLabel:createBMFont()
    dsxq_paiming_label:setSize(cc.size(72,30))
    dsxq_paiming_label:setAnchorPoint(cc.p(0.5,0.5))
    dsxq_paiming_label:setFontSize(20)
    dsxq_paiming_label:setString("排名：")
    dsxq_paiming_label:setColor(cc.c3b(91,24,6))
    qgyd_duishouxiangqing_bottom:appendComponent(dsxq_paiming_label)
    dsxq_paiming_label:setPositionInContainer(cc.p(315,107))
    table_qgyd_duishouxiangqing["dsxq_paiming_label"] = dsxq_paiming_label

    local di_image = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shuruwenzi.png",cc.rect(11,9,47,7))
    di_image:setSize(cc.size(65,28))
    di_image:setAnchorPoint(cc.p(0.5,0.5))
    qgyd_duishouxiangqing_bottom:appendComponent(di_image)
    di_image:setPositionInContainer(cc.p(383.5,108))
    table_qgyd_duishouxiangqing["di_image"] = di_image

    local dsxq_paiming_num_label = fc.FLabel:createBMFont()
    dsxq_paiming_num_label:setSize(cc.size(56,30))
    dsxq_paiming_num_label:setAnchorPoint(cc.p(0.5,0.5))
    dsxq_paiming_num_label:setFontSize(21)
    dsxq_paiming_num_label:setString("20")
    dsxq_paiming_num_label:setColor(cc.c3b(0,255,0))
    qgyd_duishouxiangqing_bottom:appendComponent(dsxq_paiming_num_label)
    dsxq_paiming_num_label:setPositionInContainer(cc.p(384,107))
    table_qgyd_duishouxiangqing["dsxq_paiming_num_label"] = dsxq_paiming_num_label

    local dsxq_baochi_label = fc.FLabel:createBMFont()
    dsxq_baochi_label:setSize(cc.size(134,30))
    dsxq_baochi_label:setAnchorPoint(cc.p(0.5,0.5))
    dsxq_baochi_label:setFontSize(20)
    dsxq_baochi_label:setString("保持此排名每")
    dsxq_baochi_label:setColor(cc.c3b(92,24,6))
    qgyd_duishouxiangqing_bottom:appendComponent(dsxq_baochi_label)
    dsxq_baochi_label:setPositionInContainer(cc.p(156,143))
    table_qgyd_duishouxiangqing["dsxq_baochi_label"] = dsxq_baochi_label

    local dsxq_baochi_num_label = fc.FLabel:createBMFont()
    dsxq_baochi_num_label:setSize(cc.size(64,30))
    dsxq_baochi_num_label:setAnchorPoint(cc.p(0.5,0.5))
    dsxq_baochi_num_label:setFontSize(21)
    dsxq_baochi_num_label:setString("10min")
    dsxq_baochi_num_label:setColor(cc.c3b(92,24,6))
    qgyd_duishouxiangqing_bottom:appendComponent(dsxq_baochi_num_label)
    dsxq_baochi_num_label:setPositionInContainer(cc.p(254,143))
    table_qgyd_duishouxiangqing["dsxq_baochi_num_label"] = dsxq_baochi_num_label

    local dsxq_kehuode_label = fc.FLabel:createBMFont()
    dsxq_kehuode_label:setSize(cc.size(152,30))
    dsxq_kehuode_label:setAnchorPoint(cc.p(0.5,0.5))
    dsxq_kehuode_label:setFontSize(20)
    if LANGUAGE_TYPE == 3 then
    	dsxq_kehuode_label:setString("可獲得：")
    else
    	dsxq_kehuode_label:setString("可获得：")
    end
    dsxq_kehuode_label:setColor(cc.c3b(92,24,6))
    qgyd_duishouxiangqing_bottom:appendComponent(dsxq_kehuode_label)
    dsxq_kehuode_label:setPositionInContainer(cc.p(371,143))
    table_qgyd_duishouxiangqing["dsxq_kehuode_label"] = dsxq_kehuode_label

    local di_image = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shuruwenzi.png",cc.rect(11,9,47,7))
    di_image:setSize(cc.size(65,28))
    di_image:setAnchorPoint(cc.p(0.5,0.5))
    qgyd_duishouxiangqing_bottom:appendComponent(di_image)
    di_image:setPositionInContainer(cc.p(383.5,183))
    table_qgyd_duishouxiangqing["di_image"] = di_image

    local dsxq_gongji_num_label = fc.FLabel:createBMFont()
    dsxq_gongji_num_label:setSize(cc.size(64,30))
    dsxq_gongji_num_label:setAnchorPoint(cc.p(0.5,0.5))
    dsxq_gongji_num_label:setFontSize(21)
    dsxq_gongji_num_label:setString("999")
    dsxq_gongji_num_label:setColor(cc.c3b(255,255,255))
    qgyd_duishouxiangqing_bottom:appendComponent(dsxq_gongji_num_label)
    dsxq_gongji_num_label:setPositionInContainer(cc.p(383,182))
    table_qgyd_duishouxiangqing["dsxq_gongji_num_label"] = dsxq_gongji_num_label

    local ui_label_gongjizhi = fc.FLabel:createBMFont()
    ui_label_gongjizhi:setSize(cc.size(72,30))
    ui_label_gongjizhi:setAnchorPoint(cc.p(0.5,0.5))
    ui_label_gongjizhi:setFontSize(20)
    if LANGUAGE_TYPE == 3 then
	    ui_label_gongjizhi:setString("功績值：")    
    else
	    ui_label_gongjizhi:setString("功绩值：")
    end
    ui_label_gongjizhi:setColor(cc.c3b(206,53,0))
    qgyd_duishouxiangqing_bottom:appendComponent(ui_label_gongjizhi)
    ui_label_gongjizhi:setPositionInContainer(cc.p(303,180))
    table_qgyd_duishouxiangqing["ui_label_gongjizhi"] = ui_label_gongjizhi

    local dsxq_zr_label = fc.FLabel:createBMFont()
    dsxq_zr_label:setSize(cc.size(76,30))
    dsxq_zr_label:setAnchorPoint(cc.p(0.5,0.5))
    dsxq_zr_label:setFontSize(20)
    if LANGUAGE_TYPE == 3 then
	    dsxq_zr_label:setString("陣  容")    
    else
	    dsxq_zr_label:setString("阵  容")
    end
    dsxq_zr_label:setColor(cc.c3b(91,24,6))
    qgyd_duishouxiangqing_bottom:appendComponent(dsxq_zr_label)
    dsxq_zr_label:setPositionInContainer(cc.p(275,218))
    table_qgyd_duishouxiangqing["dsxq_zr_label"] = dsxq_zr_label

    local ui_tiao2 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongditu_huodong.png",cc.rect(3,3,2,2))
    ui_tiao2:setSize(cc.size(380,110))
    ui_tiao2:setAnchorPoint(cc.p(0.5,0.5))
    qgyd_duishouxiangqing_bottom:appendComponent(ui_tiao2)
    ui_tiao2:setPositionInContainer(cc.p(267,294))
    table_qgyd_duishouxiangqing["ui_tiao2"] = ui_tiao2

    local ui_tiao2 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongditu_huodong.png",cc.rect(3,3,2,2))
    ui_tiao2:setSize(cc.size(380,110))
    ui_tiao2:setAnchorPoint(cc.p(0.5,0.5))
    qgyd_duishouxiangqing_bottom:appendComponent(ui_tiao2)
    ui_tiao2:setPositionInContainer(cc.p(267,435))
    table_qgyd_duishouxiangqing["ui_tiao2"] = ui_tiao2

    local dsxq_tzcs_label = fc.FLabel:createBMFont()
    dsxq_tzcs_label:setSize(cc.size(155,30))
    dsxq_tzcs_label:setAnchorPoint(cc.p(0.5,0.5))
    dsxq_tzcs_label:setFontSize(20)
    if LANGUAGE_TYPE == 3 then
	    dsxq_tzcs_label:setString("今日挑戰次數：")    
    else
	    dsxq_tzcs_label:setString("今日挑战次数：")
    end
    dsxq_tzcs_label:setColor(cc.c3b(106,68,19))
    qgyd_duishouxiangqing_bottom:appendComponent(dsxq_tzcs_label)
    dsxq_tzcs_label:setPositionInContainer(cc.p(207.5,365))
    table_qgyd_duishouxiangqing["dsxq_tzcs_label"] = dsxq_tzcs_label

    local di_image = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shuruwenzi.png",cc.rect(11,9,47,7))
    di_image:setSize(cc.size(65,28))
    di_image:setAnchorPoint(cc.p(0.5,0.5))
    qgyd_duishouxiangqing_bottom:appendComponent(di_image)
    di_image:setPositionInContainer(cc.p(323.5,368))
    table_qgyd_duishouxiangqing["di_image"] = di_image

    local dsxq_tzcs_num_label = fc.FLabel:createBMFont()
    dsxq_tzcs_num_label:setSize(cc.size(64,30))
    dsxq_tzcs_num_label:setAnchorPoint(cc.p(0.5,0.5))
    dsxq_tzcs_num_label:setFontSize(21)
    dsxq_tzcs_num_label:setString("5/10")
    dsxq_tzcs_num_label:setColor(cc.c3b(0,255,0))
    qgyd_duishouxiangqing_bottom:appendComponent(dsxq_tzcs_num_label)
    dsxq_tzcs_num_label:setPositionInContainer(cc.p(326,367))
    table_qgyd_duishouxiangqing["dsxq_tzcs_num_label"] = dsxq_tzcs_num_label

    local dsxq_tz_button = fc.FScaleButton:create()
    dsxq_tz_button:setSize(cc.size(128,92))
    dsxq_tz_button:setAnchorPoint(cc.p(0.5,0.5))
    dsxq_tz_button:setButtonImage("batch_ui/kaizhan_anniu.png")
    qgyd_duishouxiangqing_bottom:appendComponent(dsxq_tz_button)
    dsxq_tz_button:setPositionInContainer(cc.p(267,444))
    table_qgyd_duishouxiangqing["dsxq_tz_button"] = dsxq_tz_button

    local dsxq_pingzhi1 = fc.FExtensionsImage:create()
    dsxq_pingzhi1:setImage("batch_ui/chengpinzhi_kuang.png")
    dsxq_pingzhi1:setSize(cc.size(102,102))
    dsxq_pingzhi1:setAnchorPoint(cc.p(0.5,0.5))
    qgyd_duishouxiangqing_bottom:appendComponent(dsxq_pingzhi1)
    dsxq_pingzhi1:setPositionInContainer(cc.p(158,293))
    table_qgyd_duishouxiangqing["dsxq_pingzhi1"] = dsxq_pingzhi1

    local dsxq_pingzhi2 = fc.FExtensionsImage:create()
    dsxq_pingzhi2:setImage("batch_ui/chengpinzhi_kuang.png")
    dsxq_pingzhi2:setSize(cc.size(102,102))
    dsxq_pingzhi2:setAnchorPoint(cc.p(0.5,0.5))
    qgyd_duishouxiangqing_bottom:appendComponent(dsxq_pingzhi2)
    dsxq_pingzhi2:setPositionInContainer(cc.p(270,293))
    table_qgyd_duishouxiangqing["dsxq_pingzhi2"] = dsxq_pingzhi2

    local dsxq_pingzhi3 = fc.FExtensionsImage:create()
    dsxq_pingzhi3:setImage("batch_ui/chengpinzhi_kuang.png")
    dsxq_pingzhi3:setSize(cc.size(102,102))
    dsxq_pingzhi3:setAnchorPoint(cc.p(0.5,0.5))
    qgyd_duishouxiangqing_bottom:appendComponent(dsxq_pingzhi3)
    dsxq_pingzhi3:setPositionInContainer(cc.p(382,293))
    table_qgyd_duishouxiangqing["dsxq_pingzhi3"] = dsxq_pingzhi3

    local dsxq_renwu1_image = fc.FExtensionsImage:create()
    dsxq_renwu1_image:setImage("nobatch/tupian.png")
    dsxq_renwu1_image:setSize(cc.size(93,93))
    dsxq_renwu1_image:setAnchorPoint(cc.p(0.5,0.5))
    qgyd_duishouxiangqing_bottom:appendComponent(dsxq_renwu1_image)
    dsxq_renwu1_image:setPositionInContainer(cc.p(155.5,292.5))
    table_qgyd_duishouxiangqing["dsxq_renwu1_image"] = dsxq_renwu1_image

    local dsxq_renwu2_image = fc.FExtensionsImage:create()
    dsxq_renwu2_image:setImage("nobatch/tupian.png")
    dsxq_renwu2_image:setSize(cc.size(93,93))
    dsxq_renwu2_image:setAnchorPoint(cc.p(0.5,0.5))
    qgyd_duishouxiangqing_bottom:appendComponent(dsxq_renwu2_image)
    dsxq_renwu2_image:setPositionInContainer(cc.p(269.5,292.5))
    table_qgyd_duishouxiangqing["dsxq_renwu2_image"] = dsxq_renwu2_image

    local dsxq_renwu3_image = fc.FExtensionsImage:create()
    dsxq_renwu3_image:setImage("nobatch/tupian.png")
    dsxq_renwu3_image:setSize(cc.size(93,93))
    dsxq_renwu3_image:setAnchorPoint(cc.p(0.5,0.5))
    qgyd_duishouxiangqing_bottom:appendComponent(dsxq_renwu3_image)
    dsxq_renwu3_image:setPositionInContainer(cc.p(381.5,292.5))
    table_qgyd_duishouxiangqing["dsxq_renwu3_image"] = dsxq_renwu3_image

    return table_qgyd_duishouxiangqing

end

