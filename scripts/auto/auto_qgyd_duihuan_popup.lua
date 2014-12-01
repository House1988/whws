function createqgyd_duihuan_popup()

    local table_qgyd_duihuan_popup = {}

    local qgyd_duihuan_popup = fc.FContainerPanel:create()
    qgyd_duihuan_popup:setSize(cc.size(960,640))
    table_qgyd_duihuan_popup["qgyd_duihuan_popup"] = qgyd_duihuan_popup

    local item_popup_panel = fc.FContainerPanel:create()
    item_popup_panel:setSize(cc.size(534,500))
    item_popup_panel:setAnchorPoint(cc.p(0.5,0.5))
    qgyd_duihuan_popup:appendComponent(item_popup_panel)
    item_popup_panel:setPositionInContainer(cc.p(480,320))
    table_qgyd_duihuan_popup["item_popup_panel"] = item_popup_panel

    local wen_la = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shengzhi_ditu.png",cc.rect(40,63,4,4))
    wen_la:setSize(cc.size(412,450))
    wen_la:setAnchorPoint(cc.p(0.5,0.5))
    item_popup_panel:appendComponent(wen_la)
    wen_la:setPositionInContainer(cc.p(267,250))
    table_qgyd_duihuan_popup["wen_la"] = wen_la

    local zhou_u = fc.FExtensionsImage:create()
    zhou_u:setImage("nobatch/shengzhi_zhou.png")
    zhou_u:setSize(cc.size(52,534))
    zhou_u:setRotation(90)
    zhou_u:setAnchorPoint(cc.p(0.5,0.5))
    item_popup_panel:appendComponent(zhou_u)
    zhou_u:setPositionInContainer(cc.p(267,26))
    table_qgyd_duihuan_popup["zhou_u"] = zhou_u

    local zhou_d = fc.FExtensionsImage:create()
    zhou_d:setImage("nobatch/shengzhi_zhou.png")
    zhou_d:setSize(cc.size(52,534))
    zhou_d:setRotation(90)
    zhou_d:setAnchorPoint(cc.p(0.5,0.5))
    item_popup_panel:appendComponent(zhou_d)
    zhou_d:setPositionInContainer(cc.p(267,474))
    table_qgyd_duihuan_popup["zhou_d"] = zhou_d

    local close_btn = fc.FScaleButton:create()
    close_btn:setSize(cc.size(35,35))
    close_btn:setAnchorPoint(cc.p(0.5,0.5))
    close_btn:setButtonImage("batch_ui/guanbi_anniu2.png")
    item_popup_panel:appendComponent(close_btn)
    close_btn:setPositionInContainer(cc.p(493.5,25.5))
    table_qgyd_duihuan_popup["close_btn"] = close_btn

    local title_bg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/zongjiachengdikuang_tangquanxinggong.png",cc.rect(66,18,2,2))
    title_bg:setSize(cc.size(240,50))
    title_bg:setAnchorPoint(cc.p(0.5,0.5))
    item_popup_panel:appendComponent(title_bg)
    title_bg:setPositionInContainer(cc.p(267,25))
    table_qgyd_duihuan_popup["title_bg"] = title_bg

    local ui_dui = fc.FExtensionsImage:create()
    ui_dui:setImage("batch_ui/dui2_uizi.png")
    ui_dui:setSize(cc.size(32,32))
    ui_dui:setAnchorPoint(cc.p(0.5,0.5))
    item_popup_panel:appendComponent(ui_dui)
    ui_dui:setPositionInContainer(cc.p(219,25))
    table_qgyd_duihuan_popup["ui_dui"] = ui_dui

    local ui_huan = fc.FExtensionsImage:create()
    ui_huan:setImage("batch_ui/huan_uizi.png")
    ui_huan:setSize(cc.size(32,32))
    ui_huan:setAnchorPoint(cc.p(0.5,0.5))
    item_popup_panel:appendComponent(ui_huan)
    ui_huan:setPositionInContainer(cc.p(251,25))
    table_qgyd_duihuan_popup["ui_huan"] = ui_huan

    local ui_dao = fc.FExtensionsImage:create()
    ui_dao:setImage("batch_ui/dao_uizi.png")
    ui_dao:setSize(cc.size(32,32))
    ui_dao:setAnchorPoint(cc.p(0.5,0.5))
    item_popup_panel:appendComponent(ui_dao)
    ui_dao:setPositionInContainer(cc.p(283,25))
    table_qgyd_duihuan_popup["ui_dao"] = ui_dao

    local ui_ju = fc.FExtensionsImage:create()
    ui_ju:setImage("batch_ui/ju1_uizi.png")
    ui_ju:setSize(cc.size(32,32))
    ui_ju:setAnchorPoint(cc.p(0.5,0.5))
    item_popup_panel:appendComponent(ui_ju)
    ui_ju:setPositionInContainer(cc.p(315,25))
    table_qgyd_duihuan_popup["ui_ju"] = ui_ju

    local ui_rect1 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongditu2_huodong.png",cc.rect(1,1,1,1))
    ui_rect1:setSize(cc.size(384,400))
    ui_rect1:setAnchorPoint(cc.p(0.5,0.5))
    item_popup_panel:appendComponent(ui_rect1)
    ui_rect1:setPositionInContainer(cc.p(267,250))
    table_qgyd_duihuan_popup["ui_rect1"] = ui_rect1

    local ui_rect2 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongbiankuang2_ciguan.png",cc.rect(44,15,1,1))
    ui_rect2:setSize(cc.size(384,400))
    ui_rect2:setAnchorPoint(cc.p(0.5,0.5))
    item_popup_panel:appendComponent(ui_rect2)
    ui_rect2:setPositionInContainer(cc.p(267,250))
    table_qgyd_duihuan_popup["ui_rect2"] = ui_rect2

    local ui_rect3 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongbiankuang2_ciguan.png",cc.rect(44,15,1,1))
    ui_rect3:setSize(cc.size(384,300))
    ui_rect3:setAnchorPoint(cc.p(0.5,0.5))
    item_popup_panel:appendComponent(ui_rect3)
    ui_rect3:setPositionInContainer(cc.p(267,300))
    table_qgyd_duihuan_popup["ui_rect3"] = ui_rect3

    local ui_rect4 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongbiankuang2_ciguan.png",cc.rect(44,15,1,1))
    ui_rect4:setSize(cc.size(384,190))
    ui_rect4:setAnchorPoint(cc.p(0.5,0.5))
    item_popup_panel:appendComponent(ui_rect4)
    ui_rect4:setPositionInContainer(cc.p(267,355))
    table_qgyd_duihuan_popup["ui_rect4"] = ui_rect4

    local ui_rect5 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongditu_huodong.png",cc.rect(3,3,2,2))
    ui_rect5:setSize(cc.size(380,60))
    ui_rect5:setAnchorPoint(cc.p(0.5,0.5))
    item_popup_panel:appendComponent(ui_rect5)
    ui_rect5:setPositionInContainer(cc.p(269,341))
    table_qgyd_duihuan_popup["ui_rect5"] = ui_rect5

    local buy_btn = fc.FScaleButton:create()
    buy_btn:setSize(cc.size(144,53))
    buy_btn:setAnchorPoint(cc.p(0.5,0.5))
    buy_btn:setButtonImage("batch_ui/putonganniu1_up.png")
    item_popup_panel:appendComponent(buy_btn)
    buy_btn:setPositionInContainer(cc.p(267,411.5))
    table_qgyd_duihuan_popup["buy_btn"] = buy_btn

    local ui_dui = fc.FExtensionsImage:create()
    ui_dui:setImage("batch_ui/dui2_uizi.png")
    ui_dui:setSize(cc.size(32,32))
    ui_dui:setAnchorPoint(cc.p(0.5,0.5))
    buy_btn:appendComponent(ui_dui)
    ui_dui:setPositionInContainer(cc.p(43,26))
    table_qgyd_duihuan_popup["ui_dui"] = ui_dui

    local ui_huan = fc.FExtensionsImage:create()
    ui_huan:setImage("batch_ui/huan_uizi.png")
    ui_huan:setSize(cc.size(32,32))
    ui_huan:setAnchorPoint(cc.p(0.5,0.5))
    buy_btn:appendComponent(ui_huan)
    ui_huan:setPositionInContainer(cc.p(98,26))
    table_qgyd_duihuan_popup["ui_huan"] = ui_huan

    local mid_label_left = fc.FLabel:createBMFont()
    mid_label_left:setSize(cc.size(120,30))
    mid_label_left:setAnchorPoint(cc.p(0.5,0.5))
    mid_label_left:setFontSize(20)
    mid_label_left:setString("请选择兑换")
    mid_label_left:setColor(cc.c3b(91,24,6))
    item_popup_panel:appendComponent(mid_label_left)
    mid_label_left:setPositionInContainer(cc.p(166,102))
    table_qgyd_duihuan_popup["mid_label_left"] = mid_label_left

    local mid_label_mid = fc.FLabel:createBMFont()
    mid_label_mid:setSize(cc.size(100,30))
    mid_label_mid:setAnchorPoint(cc.p(0.5,0.5))
    mid_label_mid:setFontSize(20)
    mid_label_mid:setString("国子监祭酒")
    mid_label_mid:setColor(cc.c3b(255,0,0))
    item_popup_panel:appendComponent(mid_label_mid)
    mid_label_mid:setPositionInContainer(cc.p(278,102))
    table_qgyd_duihuan_popup["mid_label_mid"] = mid_label_mid

    local mid_label_right = fc.FLabel:createBMFont()
    mid_label_right:setSize(cc.size(80,30))
    mid_label_right:setAnchorPoint(cc.p(0.5,0.5))
    mid_label_right:setFontSize(20)
    mid_label_right:setString("的个数")
    mid_label_right:setColor(cc.c3b(91,24,6))
    item_popup_panel:appendComponent(mid_label_right)
    mid_label_right:setPositionInContainer(cc.p(368,102))
    table_qgyd_duihuan_popup["mid_label_right"] = mid_label_right

    local jiantou_left = fc.FScaleButton:create()
    jiantou_left:setSize(cc.size(38,60))
    jiantou_left:setAnchorPoint(cc.p(0.5,0.5))
    jiantou_left:setButtonImage("batch_ui/jiantou2.png")
    item_popup_panel:appendComponent(jiantou_left)
    jiantou_left:setPositionInContainer(cc.p(79,208))
    table_qgyd_duihuan_popup["jiantou_left"] = jiantou_left

    local jiantou_right = fc.FScaleButton:create()
    jiantou_right:setSize(cc.size(38,60))
    jiantou_right:setAnchorPoint(cc.p(0.5,0.5))
    jiantou_right:setButtonImage("batch_ui/jiantou2.png")
    jiantou_right:setScaleX(-1)
    item_popup_panel:appendComponent(jiantou_right)
    jiantou_right:setPositionInContainer(cc.p(455,208))
    table_qgyd_duihuan_popup["jiantou_right"] = jiantou_right

    local count_slider = fc.FSlider:create()
    count_slider:setAnchorPoint(cc.p(0.5,0.5))
    count_slider:setBackGroundImage("batch_ui/jindutiao2_goumai.png")
    count_slider:setProgressBarImage("batch_ui/jindutiao1_goumai.png")
    count_slider:setBlockImage("batch_ui/touxiangkuang_huangguan.png","batch_ui/touxiangkuang_huangguan.png","batch_ui/touxiangkuang_huangguan.png")
    count_slider:setSize(cc.size(317,25))
    count_slider:setPercent(0)
    item_popup_panel:appendComponent(count_slider)
    count_slider:setPositionInContainer(cc.p(266.5,208.5))
    table_qgyd_duihuan_popup["count_slider"] = count_slider

    local shuliang_label = fc.FLabel:createBMFont()
    shuliang_label:setSize(cc.size(60,30))
    shuliang_label:setAnchorPoint(cc.p(0.5,0.5))
    shuliang_label:setFontSize(20)
    shuliang_label:setString("数量：")
    shuliang_label:setColor(cc.c3b(91,24,6))
    item_popup_panel:appendComponent(shuliang_label)
    shuliang_label:setPositionInContainer(cc.p(184,285))
    table_qgyd_duihuan_popup["shuliang_label"] = shuliang_label

    local yuanbao_label = fc.FLabel:createBMFont()
    yuanbao_label:setSize(cc.size(60,30))
    yuanbao_label:setAnchorPoint(cc.p(0.5,0.5))
    yuanbao_label:setFontSize(20)
    yuanbao_label:setString("消耗功绩值：")
    yuanbao_label:setColor(cc.c3b(91,24,6))
    item_popup_panel:appendComponent(yuanbao_label)
    yuanbao_label:setPositionInContainer(cc.p(184,341))
    table_qgyd_duihuan_popup["yuanbao_label"] = yuanbao_label

    local ui_label_di = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shuruwenzi.png",cc.rect(11,9,47,7))
    ui_label_di:setSize(cc.size(60,25))
    ui_label_di:setAnchorPoint(cc.p(0.5,0.5))
    item_popup_panel:appendComponent(ui_label_di)
    ui_label_di:setPositionInContainer(cc.p(337,287.5))
    table_qgyd_duihuan_popup["ui_label_di"] = ui_label_di

    local lingqu_num = fc.FLabel:createBMFont()
    lingqu_num:setSize(cc.size(60,30))
    lingqu_num:setAnchorPoint(cc.p(0.5,0.5))
    lingqu_num:setFontSize(20)
    lingqu_num:setString("1")
    lingqu_num:setColor(cc.c3b(139,255,240))
    item_popup_panel:appendComponent(lingqu_num)
    lingqu_num:setPositionInContainer(cc.p(340,287))
    table_qgyd_duihuan_popup["lingqu_num"] = lingqu_num

    local ui_label_di = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shuruwenzi.png",cc.rect(11,9,47,7))
    ui_label_di:setSize(cc.size(60,25))
    ui_label_di:setAnchorPoint(cc.p(0.5,0.5))
    item_popup_panel:appendComponent(ui_label_di)
    ui_label_di:setPositionInContainer(cc.p(337,340.5))
    table_qgyd_duihuan_popup["ui_label_di"] = ui_label_di

    local yuanbao_num = fc.FLabel:createBMFont()
    yuanbao_num:setSize(cc.size(60,30))
    yuanbao_num:setAnchorPoint(cc.p(0.5,0.5))
    yuanbao_num:setFontSize(20)
    yuanbao_num:setString("1")
    yuanbao_num:setColor(cc.c3b(139,255,240))
    item_popup_panel:appendComponent(yuanbao_num)
    yuanbao_num:setPositionInContainer(cc.p(340,340))
    table_qgyd_duihuan_popup["yuanbao_num"] = yuanbao_num

    return table_qgyd_duihuan_popup

end

