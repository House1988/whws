function createpublic_bingzhong_xiangqing_pop()

    local table_public_bingzhong_xiangqing_pop = {}

    local public_bingzhong_xiangqing_pop = fc.FContainerPanel:create()
    public_bingzhong_xiangqing_pop:setSize(cc.size(960,640))
    table_public_bingzhong_xiangqing_pop["public_bingzhong_xiangqing_pop"] = public_bingzhong_xiangqing_pop

    local bz_bottom_panel = fc.FContainerPanel:create()
    bz_bottom_panel:setSize(cc.size(534,550))
    bz_bottom_panel:setAnchorPoint(cc.p(0.5,0.5))
    public_bingzhong_xiangqing_pop:appendComponent(bz_bottom_panel)
    bz_bottom_panel:setPositionInContainer(cc.p(480.5,320))
    table_public_bingzhong_xiangqing_pop["bz_bottom_panel"] = bz_bottom_panel

    local bz_bg_image = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shengzhi_ditu.png",cc.rect(40,63,4,4))
    bz_bg_image:setSize(cc.size(412,520))
    bz_bg_image:setAnchorPoint(cc.p(0.5,0.5))
    bz_bottom_panel:appendComponent(bz_bg_image)
    bz_bg_image:setPositionInContainer(cc.p(267,278))
    table_public_bingzhong_xiangqing_pop["bz_bg_image"] = bz_bg_image

    local bz_zhou_up = fc.FExtensionsImage:create()
    bz_zhou_up:setImage("nobatch/shengzhi_zhou.png")
    bz_zhou_up:setSize(cc.size(52,534))
    bz_zhou_up:setRotation(90)
    bz_zhou_up:setAnchorPoint(cc.p(0.5,0.5))
    bz_bottom_panel:appendComponent(bz_zhou_up)
    bz_zhou_up:setPositionInContainer(cc.p(268,27))
    table_public_bingzhong_xiangqing_pop["bz_zhou_up"] = bz_zhou_up

    local close_btn = fc.FScaleButton:create()
    close_btn:setSize(cc.size(34,33))
    close_btn:setAnchorPoint(cc.p(0.5,0.5))
    close_btn:setButtonImage("batch_ui/guanbi_anniu2.png")
    bz_bottom_panel:appendComponent(close_btn)
    close_btn:setPositionInContainer(cc.p(495,27.5))
    table_public_bingzhong_xiangqing_pop["close_btn"] = close_btn

    local bz_zhou_down = fc.FExtensionsImage:create()
    bz_zhou_down:setImage("nobatch/shengzhi_zhou.png")
    bz_zhou_down:setSize(cc.size(52,534))
    bz_zhou_down:setRotation(90)
    bz_zhou_down:setAnchorPoint(cc.p(0.5,0.5))
    bz_bottom_panel:appendComponent(bz_zhou_down)
    bz_zhou_down:setPositionInContainer(cc.p(267,524))
    table_public_bingzhong_xiangqing_pop["bz_zhou_down"] = bz_zhou_down

    local bz_title_bg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/xingjikuang_tangquanxinggong.png",cc.rect(72,0,2,29))
    bz_title_bg:setSize(cc.size(260,50))
    bz_title_bg:setAnchorPoint(cc.p(0.5,0.5))
    bz_title_bg:setRotation(180)
    bz_bottom_panel:appendComponent(bz_title_bg)
    bz_title_bg:setPositionInContainer(cc.p(278,25))
    table_public_bingzhong_xiangqing_pop["bz_title_bg"] = bz_title_bg

    local ui_bing = fc.FExtensionsImage:create()
    ui_bing:setImage("batch_ui/bing_uizi.png")
    ui_bing:setSize(cc.size(32,32))
    ui_bing:setAnchorPoint(cc.p(0.5,0.5))
    bz_bottom_panel:appendComponent(ui_bing)
    ui_bing:setPositionInContainer(cc.p(224,25))
    table_public_bingzhong_xiangqing_pop["ui_bing"] = ui_bing

    local ui_zhong = fc.FExtensionsImage:create()
    ui_zhong:setImage("batch_ui/zhong1_uizi.png")
    ui_zhong:setSize(cc.size(32,32))
    ui_zhong:setAnchorPoint(cc.p(0.5,0.5))
    bz_bottom_panel:appendComponent(ui_zhong)
    ui_zhong:setPositionInContainer(cc.p(254,25))
    table_public_bingzhong_xiangqing_pop["ui_zhong"] = ui_zhong

    local ui_xiang = fc.FExtensionsImage:create()
    ui_xiang:setImage("batch_ui/xiang_uizi.png")
    ui_xiang:setSize(cc.size(32,32))
    ui_xiang:setAnchorPoint(cc.p(0.5,0.5))
    bz_bottom_panel:appendComponent(ui_xiang)
    ui_xiang:setPositionInContainer(cc.p(282,25))
    table_public_bingzhong_xiangqing_pop["ui_xiang"] = ui_xiang

    local ui_qing = fc.FExtensionsImage:create()
    ui_qing:setImage("batch_ui/qing_uizi.png")
    ui_qing:setSize(cc.size(32,32))
    ui_qing:setAnchorPoint(cc.p(0.5,0.5))
    bz_bottom_panel:appendComponent(ui_qing)
    ui_qing:setPositionInContainer(cc.p(312,25))
    table_public_bingzhong_xiangqing_pop["ui_qing"] = ui_qing

    local bg_kuang4 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongditu2_huodong.png",cc.rect(1,1,1,1))
    bg_kuang4:setSize(cc.size(384,454))
    bg_kuang4:setAnchorPoint(cc.p(0.5,0.5))
    bz_bottom_panel:appendComponent(bg_kuang4)
    bg_kuang4:setPositionInContainer(cc.p(267,277))
    table_public_bingzhong_xiangqing_pop["bg_kuang4"] = bg_kuang4

    local bg_kuang1 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongbiankuang2_ciguan.png",cc.rect(44,15,1,1))
    bg_kuang1:setSize(cc.size(384,454))
    bg_kuang1:setAnchorPoint(cc.p(0.5,0.5))
    bz_bottom_panel:appendComponent(bg_kuang1)
    bg_kuang1:setPositionInContainer(cc.p(267,277))
    table_public_bingzhong_xiangqing_pop["bg_kuang1"] = bg_kuang1

    local bg_kuang2 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongbiankuang2_ciguan.png",cc.rect(44,15,1,1))
    bg_kuang2:setSize(cc.size(384,307))
    bg_kuang2:setAnchorPoint(cc.p(0.5,0.5))
    bz_bottom_panel:appendComponent(bg_kuang2)
    bg_kuang2:setPositionInContainer(cc.p(267,350.5))
    table_public_bingzhong_xiangqing_pop["bg_kuang2"] = bg_kuang2

    local bg_kuang3 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongbiankuang2_ciguan.png",cc.rect(44,15,1,1))
    bg_kuang3:setSize(cc.size(384,205))
    bg_kuang3:setAnchorPoint(cc.p(0.5,0.5))
    bz_bottom_panel:appendComponent(bg_kuang3)
    bg_kuang3:setPositionInContainer(cc.p(267,401.5))
    table_public_bingzhong_xiangqing_pop["bg_kuang3"] = bg_kuang3

    local blank_area1 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongditu_huodong.png",cc.rect(3,3,2,2))
    blank_area1:setSize(cc.size(380,109))
    blank_area1:setAnchorPoint(cc.p(0.5,0.5))
    bz_bottom_panel:appendComponent(blank_area1)
    blank_area1:setPositionInContainer(cc.p(266,142.5))
    table_public_bingzhong_xiangqing_pop["blank_area1"] = blank_area1

    local icon_name_label = fc.FLabel:createBMFont()
    icon_name_label:setSize(cc.size(120,30))
    icon_name_label:setAnchorPoint(cc.p(0.5,0.5))
    icon_name_label:setFontSize(20)
    icon_name_label:setString("道具名字")
    icon_name_label:setColor(cc.c3b(91,24,6))
    bz_bottom_panel:appendComponent(icon_name_label)
    icon_name_label:setPositionInContainer(cc.p(266,70))
    table_public_bingzhong_xiangqing_pop["icon_name_label"] = icon_name_label

    local icon_bg = fc.FExtensionsImage:create()
    icon_bg:setImage("batch_ui/baipinzhi_kuang.png")
    icon_bg:setSize(cc.size(104,104))
    icon_bg:setAnchorPoint(cc.p(0.5,0.5))
    bz_bottom_panel:appendComponent(icon_bg)
    icon_bg:setPositionInContainer(cc.p(266,142))
    table_public_bingzhong_xiangqing_pop["icon_bg"] = icon_bg

    local icon_image = fc.FExtensionsImage:create()
    icon_image:setAnchorPoint(cc.p(0.5,0.5))
    bz_bottom_panel:appendComponent(icon_image)
    icon_image:setPositionInContainer(cc.p(266,142))
    table_public_bingzhong_xiangqing_pop["icon_image"] = icon_image

    local icon_desc1 = fc.FLabel:createBMFont()
    icon_desc1:setSize(cc.size(300,25))
    icon_desc1:setAnchorPoint(cc.p(0.5,0.5))
    icon_desc1:setFontSize(20)
    icon_desc1:setString("道具名字")
    icon_desc1:setColor(cc.c3b(0,113,48))
    icon_desc1:setAlignment(0)
    bz_bottom_panel:appendComponent(icon_desc1)
    icon_desc1:setPositionInContainer(cc.p(266,218.5))
    table_public_bingzhong_xiangqing_pop["icon_desc1"] = icon_desc1

    local blank_area2 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongditu_huodong.png",cc.rect(3,3,2,2))
    blank_area2:setSize(cc.size(380,30))
    blank_area2:setAnchorPoint(cc.p(0.5,0.5))
    bz_bottom_panel:appendComponent(blank_area2)
    blank_area2:setPositionInContainer(cc.p(266,254))
    table_public_bingzhong_xiangqing_pop["blank_area2"] = blank_area2

    local blank_area2 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongditu_huodong.png",cc.rect(3,3,2,2))
    blank_area2:setSize(cc.size(380,30))
    blank_area2:setAnchorPoint(cc.p(0.5,0.5))
    bz_bottom_panel:appendComponent(blank_area2)
    blank_area2:setPositionInContainer(cc.p(266,284))
    table_public_bingzhong_xiangqing_pop["blank_area2"] = blank_area2

    local icon_desc2 = fc.FLabel:createBMFont()
    icon_desc2:setSize(cc.size(300,25))
    icon_desc2:setAnchorPoint(cc.p(0.5,0.5))
    icon_desc2:setFontSize(20)
    icon_desc2:setString("道具名字")
    icon_desc2:setColor(cc.c3b(0,113,48))
    icon_desc2:setAlignment(0)
    bz_bottom_panel:appendComponent(icon_desc2)
    icon_desc2:setPositionInContainer(cc.p(266,253.5))
    table_public_bingzhong_xiangqing_pop["icon_desc2"] = icon_desc2

    local icon_desc3 = fc.FLabel:createBMFont()
    icon_desc3:setSize(cc.size(300,25))
    icon_desc3:setAnchorPoint(cc.p(0.5,0.5))
    icon_desc3:setFontSize(20)
    icon_desc3:setString("道具名字")
    icon_desc3:setColor(cc.c3b(0,113,48))
    icon_desc3:setAlignment(0)
    bz_bottom_panel:appendComponent(icon_desc3)
    icon_desc3:setPositionInContainer(cc.p(266,283.5))
    table_public_bingzhong_xiangqing_pop["icon_desc3"] = icon_desc3

    local icon_desc6 = fc.FLabel:createBMFont()
    icon_desc6:setSize(cc.size(300,25))
    icon_desc6:setAnchorPoint(cc.p(0.5,0.5))
    icon_desc6:setFontSize(20)
    icon_desc6:setString("道具名字")
    icon_desc6:setColor(cc.c3b(206,53,0))
    icon_desc6:setAlignment(0)
    bz_bottom_panel:appendComponent(icon_desc6)
    icon_desc6:setPositionInContainer(cc.p(266,325.5))
    table_public_bingzhong_xiangqing_pop["icon_desc6"] = icon_desc6

    local blank_area2 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongditu_huodong.png",cc.rect(3,3,2,2))
    blank_area2:setSize(cc.size(380,30))
    blank_area2:setAnchorPoint(cc.p(0.5,0.5))
    bz_bottom_panel:appendComponent(blank_area2)
    blank_area2:setPositionInContainer(cc.p(266,359))
    table_public_bingzhong_xiangqing_pop["blank_area2"] = blank_area2

    local blank_area2 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongditu_huodong.png",cc.rect(3,3,2,2))
    blank_area2:setSize(cc.size(380,30))
    blank_area2:setAnchorPoint(cc.p(0.5,0.5))
    bz_bottom_panel:appendComponent(blank_area2)
    blank_area2:setPositionInContainer(cc.p(266,389))
    table_public_bingzhong_xiangqing_pop["blank_area2"] = blank_area2

    local icon_desc5 = fc.FLabel:createBMFont()
    icon_desc5:setSize(cc.size(300,25))
    icon_desc5:setAnchorPoint(cc.p(0.5,0.5))
    icon_desc5:setFontSize(20)
    icon_desc5:setString("道具名字")
    icon_desc5:setColor(cc.c3b(206,53,0))
    icon_desc5:setAlignment(0)
    bz_bottom_panel:appendComponent(icon_desc5)
    icon_desc5:setPositionInContainer(cc.p(266,388.5))
    table_public_bingzhong_xiangqing_pop["icon_desc5"] = icon_desc5

    local icon_desc4 = fc.FLabel:createBMFont()
    icon_desc4:setSize(cc.size(300,25))
    icon_desc4:setAnchorPoint(cc.p(0.5,0.5))
    icon_desc4:setFontSize(20)
    icon_desc4:setString("道具名字")
    icon_desc4:setColor(cc.c3b(206,53,0))
    icon_desc4:setAlignment(0)
    bz_bottom_panel:appendComponent(icon_desc4)
    icon_desc4:setPositionInContainer(cc.p(266,358.5))
    table_public_bingzhong_xiangqing_pop["icon_desc4"] = icon_desc4

    local bz_queding = fc.FScaleButton:create()
    bz_queding:setSize(cc.size(144,53))
    bz_queding:setAnchorPoint(cc.p(0.5,0.5))
    bz_queding:setButtonImage("batch_ui/putonganniu1_up.png")
    bz_bottom_panel:appendComponent(bz_queding)
    bz_queding:setPositionInContainer(cc.p(267,447.5))
    table_public_bingzhong_xiangqing_pop["bz_queding"] = bz_queding

    local bz_ui_que = fc.FShaderExtensionsImage:create(0)
    bz_ui_que:setAnchorPoint(cc.p(0.5,0.5))
    bz_ui_que:setImage("batch_ui/que_uizi.png")
    bz_ui_que:setSize(cc.size(32,32))
    bz_queding:appendComponent(bz_ui_que)
    bz_ui_que:setPositionInContainer(cc.p(54,26))
    table_public_bingzhong_xiangqing_pop["bz_ui_que"] = bz_ui_que

    local bz_ui_ding = fc.FShaderExtensionsImage:create(0)
    bz_ui_ding:setAnchorPoint(cc.p(0.5,0.5))
    bz_ui_ding:setImage("batch_ui/ding_uizi.png")
    bz_ui_ding:setSize(cc.size(32,32))
    bz_queding:appendComponent(bz_ui_ding)
    bz_ui_ding:setPositionInContainer(cc.p(90,26))
    table_public_bingzhong_xiangqing_pop["bz_ui_ding"] = bz_ui_ding

    local num_di = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shuruwenzi.png",cc.rect(11,9,47,7))
    num_di:setSize(cc.size(60,28))
    num_di:setAnchorPoint(cc.p(0.5,0.5))
    bz_bottom_panel:appendComponent(num_di)
    num_di:setPositionInContainer(cc.p(356,284))
    table_public_bingzhong_xiangqing_pop["num_di"] = num_di

    local num_di = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shuruwenzi.png",cc.rect(11,9,47,7))
    num_di:setSize(cc.size(60,28))
    num_di:setAnchorPoint(cc.p(0.5,0.5))
    bz_bottom_panel:appendComponent(num_di)
    num_di:setPositionInContainer(cc.p(356,253))
    table_public_bingzhong_xiangqing_pop["num_di"] = num_di

    local num_di = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shuruwenzi.png",cc.rect(11,9,47,7))
    num_di:setSize(cc.size(60,28))
    num_di:setAnchorPoint(cc.p(0.5,0.5))
    bz_bottom_panel:appendComponent(num_di)
    num_di:setPositionInContainer(cc.p(356,359))
    table_public_bingzhong_xiangqing_pop["num_di"] = num_di

    local num_di = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shuruwenzi.png",cc.rect(11,9,47,7))
    num_di:setSize(cc.size(60,28))
    num_di:setAnchorPoint(cc.p(0.5,0.5))
    bz_bottom_panel:appendComponent(num_di)
    num_di:setPositionInContainer(cc.p(356,389))
    table_public_bingzhong_xiangqing_pop["num_di"] = num_di

    local num1 = fc.FLabel:createBMFont()
    num1:setSize(cc.size(80,25))
    num1:setAnchorPoint(cc.p(0.5,0.5))
    num1:setFontSize(20)
    num1:setString("11")
    num1:setColor(cc.c3b(0,255,0))
    num1:setAlignment(0)
    bz_bottom_panel:appendComponent(num1)
    num1:setPositionInContainer(cc.p(370,252.5))
    table_public_bingzhong_xiangqing_pop["num1"] = num1

    local num2 = fc.FLabel:createBMFont()
    num2:setSize(cc.size(80,25))
    num2:setAnchorPoint(cc.p(0.5,0.5))
    num2:setFontSize(20)
    num2:setString("11")
    num2:setColor(cc.c3b(0,255,0))
    num2:setAlignment(0)
    bz_bottom_panel:appendComponent(num2)
    num2:setPositionInContainer(cc.p(370,284.5))
    table_public_bingzhong_xiangqing_pop["num2"] = num2

    local num3 = fc.FLabel:createBMFont()
    num3:setSize(cc.size(80,25))
    num3:setAnchorPoint(cc.p(0.5,0.5))
    num3:setFontSize(20)
    num3:setString("11")
    num3:setColor(cc.c3b(139,255,240))
    num3:setAlignment(0)
    bz_bottom_panel:appendComponent(num3)
    num3:setPositionInContainer(cc.p(370,358.5))
    table_public_bingzhong_xiangqing_pop["num3"] = num3

    local num4 = fc.FLabel:createBMFont()
    num4:setSize(cc.size(80,25))
    num4:setAnchorPoint(cc.p(0.5,0.5))
    num4:setFontSize(20)
    num4:setString("11")
    num4:setColor(cc.c3b(139,255,240))
    num4:setAlignment(0)
    bz_bottom_panel:appendComponent(num4)
    num4:setPositionInContainer(cc.p(370,388.5))
    table_public_bingzhong_xiangqing_pop["num4"] = num4

    return table_public_bingzhong_xiangqing_pop

end

