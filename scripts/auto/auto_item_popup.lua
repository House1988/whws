function createitem_popup()

    local table_item_popup = {}

    local item_popup = fc.FContainerPanel:create()
    item_popup:setSize(cc.size(960,640))
    table_item_popup["item_popup"] = item_popup

    local item_popup_panel = fc.FContainerPanel:create()
    item_popup_panel:setSize(cc.size(534,500))
    item_popup_panel:setAnchorPoint(cc.p(0.5,0.5))
    item_popup:appendComponent(item_popup_panel)
    item_popup_panel:setPositionInContainer(cc.p(480,320))
    table_item_popup["item_popup_panel"] = item_popup_panel

    local wen_la = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shengzhi_ditu.png",cc.rect(40,63,4,4))
    wen_la:setSize(cc.size(412,435))
    wen_la:setAnchorPoint(cc.p(0.5,0.5))
    item_popup_panel:appendComponent(wen_la)
    wen_la:setPositionInContainer(cc.p(267,249.5))
    table_item_popup["wen_la"] = wen_la

    local zhou_u = fc.FExtensionsImage:create()
    zhou_u:setImage("nobatch/shengzhi_zhou.png")
    zhou_u:setSize(cc.size(52,534))
    zhou_u:setRotation(90)
    zhou_u:setAnchorPoint(cc.p(0.5,0.5))
    item_popup_panel:appendComponent(zhou_u)
    zhou_u:setPositionInContainer(cc.p(267,26))
    table_item_popup["zhou_u"] = zhou_u

    local zhou_d = fc.FExtensionsImage:create()
    zhou_d:setImage("nobatch/shengzhi_zhou.png")
    zhou_d:setSize(cc.size(52,534))
    zhou_d:setRotation(90)
    zhou_d:setAnchorPoint(cc.p(0.5,0.5))
    item_popup_panel:appendComponent(zhou_d)
    zhou_d:setPositionInContainer(cc.p(267,473))
    table_item_popup["zhou_d"] = zhou_d

    local ui_rect5 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongditu2_huodong.png",cc.rect(1,1,1,1))
    ui_rect5:setSize(cc.size(384,400))
    ui_rect5:setAnchorPoint(cc.p(0.5,0.5))
    item_popup_panel:appendComponent(ui_rect5)
    ui_rect5:setPositionInContainer(cc.p(267,250))
    table_item_popup["ui_rect5"] = ui_rect5

    local ui_rect1 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongbiankuang2_ciguan.png",cc.rect(44,15,1,1))
    ui_rect1:setSize(cc.size(384,400))
    ui_rect1:setAnchorPoint(cc.p(0.5,0.5))
    item_popup_panel:appendComponent(ui_rect1)
    ui_rect1:setPositionInContainer(cc.p(267,250))
    table_item_popup["ui_rect1"] = ui_rect1

    local ui_rect2 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongbiankuang2_ciguan.png",cc.rect(44,15,1,1))
    ui_rect2:setSize(cc.size(384,300))
    ui_rect2:setAnchorPoint(cc.p(0.5,0.5))
    item_popup_panel:appendComponent(ui_rect2)
    ui_rect2:setPositionInContainer(cc.p(267,300))
    table_item_popup["ui_rect2"] = ui_rect2

    local ui_rect3 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongbiankuang2_ciguan.png",cc.rect(44,15,1,1))
    ui_rect3:setSize(cc.size(384,190))
    ui_rect3:setAnchorPoint(cc.p(0.5,0.5))
    item_popup_panel:appendComponent(ui_rect3)
    ui_rect3:setPositionInContainer(cc.p(267,355))
    table_item_popup["ui_rect3"] = ui_rect3

    local ui_rect4 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongditu_huodong.png",cc.rect(3,3,2,2))
    ui_rect4:setSize(cc.size(380,60))
    ui_rect4:setAnchorPoint(cc.p(0.5,0.5))
    item_popup_panel:appendComponent(ui_rect4)
    ui_rect4:setPositionInContainer(cc.p(267,341))
    table_item_popup["ui_rect4"] = ui_rect4

    local buy_btn = fc.FScaleButton:create()
    buy_btn:setSize(cc.size(144,53))
    buy_btn:setAnchorPoint(cc.p(0.5,0.5))
    buy_btn:setButtonImage("batch_ui/putonganniu1_up.png")
    item_popup_panel:appendComponent(buy_btn)
    buy_btn:setPositionInContainer(cc.p(349,412.5))
    table_item_popup["buy_btn"] = buy_btn

    local ui_gou = fc.FExtensionsImage:create()
    ui_gou:setImage("batch_ui/gou_uizi.png")
    ui_gou:setSize(cc.size(32,32))
    ui_gou:setAnchorPoint(cc.p(0.5,0.5))
    buy_btn:appendComponent(ui_gou)
    ui_gou:setPositionInContainer(cc.p(44,26))
    table_item_popup["ui_gou"] = ui_gou

    local ui_mai = fc.FExtensionsImage:create()
    ui_mai:setImage("batch_ui/mai_uizi.png")
    ui_mai:setSize(cc.size(32,32))
    ui_mai:setAnchorPoint(cc.p(0.5,0.5))
    buy_btn:appendComponent(ui_mai)
    ui_mai:setPositionInContainer(cc.p(98,26))
    table_item_popup["ui_mai"] = ui_mai

    local close_btn = fc.FScaleButton:create()
    close_btn:setSize(cc.size(144,53))
    close_btn:setAnchorPoint(cc.p(0.5,0.5))
    close_btn:setButtonImage("batch_ui/putonganniu1_up.png")
    item_popup_panel:appendComponent(close_btn)
    close_btn:setPositionInContainer(cc.p(185,412.5))
    table_item_popup["close_btn"] = close_btn

    local ui_guan = fc.FExtensionsImage:create()
    ui_guan:setImage("batch_ui/guan_uizi.png")
    ui_guan:setSize(cc.size(32,32))
    ui_guan:setAnchorPoint(cc.p(0.5,0.5))
    close_btn:appendComponent(ui_guan)
    ui_guan:setPositionInContainer(cc.p(44,26))
    table_item_popup["ui_guan"] = ui_guan

    local ui_bi = fc.FExtensionsImage:create()
    ui_bi:setImage("batch_ui/bi_uizi.png")
    ui_bi:setSize(cc.size(32,32))
    ui_bi:setAnchorPoint(cc.p(0.5,0.5))
    close_btn:appendComponent(ui_bi)
    ui_bi:setPositionInContainer(cc.p(99,26))
    table_item_popup["ui_bi"] = ui_bi

    local title_bg_img1 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/zongjiachengdikuang_tangquanxinggong.png",cc.rect(66,18,2,2))
    title_bg_img1:setSize(cc.size(240,50))
    title_bg_img1:setAnchorPoint(cc.p(0.5,0.5))
    item_popup_panel:appendComponent(title_bg_img1)
    title_bg_img1:setPositionInContainer(cc.p(267,25))
    table_item_popup["title_bg_img1"] = title_bg_img1

    local ui_gou = fc.FExtensionsImage:create()
    ui_gou:setImage("batch_ui/gou_uizi.png")
    ui_gou:setSize(cc.size(32,32))
    ui_gou:setAnchorPoint(cc.p(0.5,0.5))
    item_popup_panel:appendComponent(ui_gou)
    ui_gou:setPositionInContainer(cc.p(219,25))
    table_item_popup["ui_gou"] = ui_gou

    local ui_mai = fc.FExtensionsImage:create()
    ui_mai:setImage("batch_ui/mai_uizi.png")
    ui_mai:setSize(cc.size(32,32))
    ui_mai:setAnchorPoint(cc.p(0.5,0.5))
    item_popup_panel:appendComponent(ui_mai)
    ui_mai:setPositionInContainer(cc.p(251,25))
    table_item_popup["ui_mai"] = ui_mai

    local ui_dao = fc.FExtensionsImage:create()
    ui_dao:setImage("batch_ui/dao_uizi.png")
    ui_dao:setSize(cc.size(32,32))
    ui_dao:setAnchorPoint(cc.p(0.5,0.5))
    item_popup_panel:appendComponent(ui_dao)
    ui_dao:setPositionInContainer(cc.p(283,25))
    table_item_popup["ui_dao"] = ui_dao

    local ui_ju = fc.FExtensionsImage:create()
    ui_ju:setImage("batch_ui/ju1_uizi.png")
    ui_ju:setSize(cc.size(32,32))
    ui_ju:setAnchorPoint(cc.p(0.5,0.5))
    item_popup_panel:appendComponent(ui_ju)
    ui_ju:setPositionInContainer(cc.p(315,25))
    table_item_popup["ui_ju"] = ui_ju

    local mid_label_left = fc.FLabel:createBMFont()
    mid_label_left:setSize(cc.size(120,30))
    mid_label_left:setAnchorPoint(cc.p(0.5,0.5))
    mid_label_left:setFontSize(20)
    mid_label_left:setString("请选择购买")
    mid_label_left:setColor(cc.c3b(91,24,6))
    item_popup_panel:appendComponent(mid_label_left)
    mid_label_left:setPositionInContainer(cc.p(176,90))
    table_item_popup["mid_label_left"] = mid_label_left

    local mid_label_mid = fc.FLabel:createBMFont()
    mid_label_mid:setSize(cc.size(100,30))
    mid_label_mid:setAnchorPoint(cc.p(0.5,0.5))
    mid_label_mid:setFontSize(20)
    mid_label_mid:setString("国子监祭酒")
    mid_label_mid:setColor(cc.c3b(255,0,0))
    item_popup_panel:appendComponent(mid_label_mid)
    mid_label_mid:setPositionInContainer(cc.p(288,90))
    table_item_popup["mid_label_mid"] = mid_label_mid

    local mid_label_right = fc.FLabel:createBMFont()
    mid_label_right:setSize(cc.size(80,30))
    mid_label_right:setAnchorPoint(cc.p(0.5,0.5))
    mid_label_right:setFontSize(20)
    mid_label_right:setString("的个数")
    mid_label_right:setColor(cc.c3b(91,24,6))
    item_popup_panel:appendComponent(mid_label_right)
    mid_label_right:setPositionInContainer(cc.p(378,90))
    table_item_popup["mid_label_right"] = mid_label_right

    local jiantou_left = fc.FScaleButton:create()
    jiantou_left:setSize(cc.size(38,60))
    jiantou_left:setAnchorPoint(cc.p(0.5,0.5))
    jiantou_left:setButtonImage("batch_ui/jiantou2.png")
    item_popup_panel:appendComponent(jiantou_left)
    jiantou_left:setPositionInContainer(cc.p(83,208))
    table_item_popup["jiantou_left"] = jiantou_left

    local jiantou_right = fc.FScaleButton:create()
    jiantou_right:setSize(cc.size(38,60))
    jiantou_right:setAnchorPoint(cc.p(0.5,0.5))
    jiantou_right:setButtonImage("batch_ui/jiantou2.png")
    jiantou_right:setScaleX(-1)
    item_popup_panel:appendComponent(jiantou_right)
    jiantou_right:setPositionInContainer(cc.p(451,208))
    table_item_popup["jiantou_right"] = jiantou_right

    local count_slider = fc.FSlider:create()
    count_slider:setAnchorPoint(cc.p(0.5,0.5))
    count_slider:setBackGroundImage("batch_ui/jindutiao2_goumai.png")
    count_slider:setProgressBarImage("batch_ui/jindutiao1_goumai.png")
    count_slider:setBlockImage("batch_ui/touxiangkuang_huangguan.png","batch_ui/touxiangkuang_huangguan.png","batch_ui/touxiangkuang_huangguan.png")
    count_slider:setSize(cc.size(317,25))
    count_slider:setPercent(50)
    item_popup_panel:appendComponent(count_slider)
    count_slider:setPositionInContainer(cc.p(266.5,208.5))
    table_item_popup["count_slider"] = count_slider

    local shuliang_label = fc.FLabel:createBMFont()
    shuliang_label:setSize(cc.size(60,30))
    shuliang_label:setAnchorPoint(cc.p(0.5,0.5))
    shuliang_label:setFontSize(20)
    if LANGUAGE_TYPE == 3 then
    	shuliang_label:setString("數量：")    
    else
    	shuliang_label:setString("数量：")
    end
    shuliang_label:setColor(cc.c3b(91,24,6))
    item_popup_panel:appendComponent(shuliang_label)
    shuliang_label:setPositionInContainer(cc.p(178,286))
    table_item_popup["shuliang_label"] = shuliang_label

    local yuabao_image = fc.FExtensionsImage:create()
    yuabao_image:setImage("batch_ui/yuanbao.png")
    yuabao_image:setSize(cc.size(58,43))
    yuabao_image:setAnchorPoint(cc.p(0.5,0.5))
    item_popup_panel:appendComponent(yuabao_image)
    yuabao_image:setPositionInContainer(cc.p(257,341.5))
    table_item_popup["yuabao_image"] = yuabao_image

    local zongjia_label = fc.FLabel:createBMFont()
    zongjia_label:setSize(cc.size(60,30))
    zongjia_label:setAnchorPoint(cc.p(0.5,0.5))
    zongjia_label:setFontSize(20)
    if LANGUAGE_TYPE == 3 then
    	zongjia_label:setString("總價：")
    else
    	zongjia_label:setString("总价：")
    end
    zongjia_label:setColor(cc.c3b(91,24,6))
    item_popup_panel:appendComponent(zongjia_label)
    zongjia_label:setPositionInContainer(cc.p(178,341))
    table_item_popup["zongjia_label"] = zongjia_label

    local ui_label_di = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shuruwenzi.png",cc.rect(11,9,47,7))
    ui_label_di:setSize(cc.size(100,30))
    ui_label_di:setAnchorPoint(cc.p(0.5,0.5))
    item_popup_panel:appendComponent(ui_label_di)
    ui_label_di:setPositionInContainer(cc.p(337,291))
    table_item_popup["ui_label_di"] = ui_label_di

    local lingqu_num = fc.FLabel:createBMFont()
    lingqu_num:setSize(cc.size(100,30))
    lingqu_num:setAnchorPoint(cc.p(0.5,0.5))
    lingqu_num:setFontSize(20)
    lingqu_num:setString("1")
    lingqu_num:setColor(cc.c3b(139,255,240))
    item_popup_panel:appendComponent(lingqu_num)
    lingqu_num:setPositionInContainer(cc.p(337,286))
    table_item_popup["lingqu_num"] = lingqu_num

    local ui_label_di = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shuruwenzi.png",cc.rect(11,9,47,7))
    ui_label_di:setSize(cc.size(100,30))
    ui_label_di:setAnchorPoint(cc.p(0.5,0.5))
    item_popup_panel:appendComponent(ui_label_di)
    ui_label_di:setPositionInContainer(cc.p(336,344))
    table_item_popup["ui_label_di"] = ui_label_di

    local yuanbao_num = fc.FLabel:createBMFont()
    yuanbao_num:setSize(cc.size(100,30))
    yuanbao_num:setAnchorPoint(cc.p(0.5,0.5))
    yuanbao_num:setFontSize(20)
    yuanbao_num:setString("1")
    yuanbao_num:setColor(cc.c3b(139,255,240))
    item_popup_panel:appendComponent(yuanbao_num)
    yuanbao_num:setPositionInContainer(cc.p(338,344))
    table_item_popup["yuanbao_num"] = yuanbao_num

    return table_item_popup

end

