function createless_silver_tip_popup()

    local table_less_silver_tip_popup = {}

    local less_silver_tip_popup = fc.FContainerPanel:create()
    less_silver_tip_popup:setSize(cc.size(960,640))
    table_less_silver_tip_popup["less_silver_tip_popup"] = less_silver_tip_popup

    local pop_bottom_panel = fc.FContainerPanel:create()
    pop_bottom_panel:setSize(cc.size(570,404))
    pop_bottom_panel:setAnchorPoint(cc.p(0.5,0.5))
    less_silver_tip_popup:appendComponent(pop_bottom_panel)
    pop_bottom_panel:setPositionInContainer(cc.p(480,320))
    table_less_silver_tip_popup["pop_bottom_panel"] = pop_bottom_panel

    local lsp_wen_la = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shengzhi_ditu.png",cc.rect(12,38,62,58))
    lsp_wen_la:setSize(cc.size(443,350))
    lsp_wen_la:setAnchorPoint(cc.p(0.5,0.5))
    pop_bottom_panel:appendComponent(lsp_wen_la)
    lsp_wen_la:setPositionInContainer(cc.p(285.5,202))
    table_less_silver_tip_popup["lsp_wen_la"] = lsp_wen_la

    local lsp_dikuang1 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongditu2_huodong.png",cc.rect(1,1,1,1))
    lsp_dikuang1:setSize(cc.size(386,294))
    lsp_dikuang1:setAnchorPoint(cc.p(0.5,0.5))
    pop_bottom_panel:appendComponent(lsp_dikuang1)
    lsp_dikuang1:setPositionInContainer(cc.p(285,202))
    table_less_silver_tip_popup["lsp_dikuang1"] = lsp_dikuang1

    local lsp_dikuang = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongbiankuang2_ciguan.png",cc.rect(44,15,1,1))
    lsp_dikuang:setSize(cc.size(386,294))
    lsp_dikuang:setAnchorPoint(cc.p(0.5,0.5))
    pop_bottom_panel:appendComponent(lsp_dikuang)
    lsp_dikuang:setPositionInContainer(cc.p(285,202))
    table_less_silver_tip_popup["lsp_dikuang"] = lsp_dikuang

    local lsp_left_btn = fc.FScaleButton:create()
    lsp_left_btn:setSize(cc.size(144,53))
    lsp_left_btn:setAnchorPoint(cc.p(0.5,0.5))
    lsp_left_btn:setButtonImage("batch_ui/teshuanniu.png")
    pop_bottom_panel:appendComponent(lsp_left_btn)
    lsp_left_btn:setPositionInContainer(cc.p(285,298.5))
    table_less_silver_tip_popup["lsp_left_btn"] = lsp_left_btn

    local lsp_zheng = fc.FShaderExtensionsImage:create(0)
    lsp_zheng:setAnchorPoint(cc.p(0.5,0.5))
    lsp_zheng:setImage("batch_ui/zeng_uizi.png")
    lsp_zheng:setSize(cc.size(32,32))
    lsp_left_btn:appendComponent(lsp_zheng)
    lsp_zheng:setPositionInContainer(cc.p(50,26))
    table_less_silver_tip_popup["lsp_zheng"] = lsp_zheng

    local lsp_shui = fc.FShaderExtensionsImage:create(0)
    lsp_shui:setAnchorPoint(cc.p(0.5,0.5))
    lsp_shui:setImage("batch_ui/shui_uizi.png")
    lsp_shui:setSize(cc.size(32,32))
    lsp_left_btn:appendComponent(lsp_shui)
    lsp_shui:setPositionInContainer(cc.p(94,26))
    table_less_silver_tip_popup["lsp_shui"] = lsp_shui

    local lsp_wenzi_di = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongditu_huodong.png",cc.rect(3,3,2,2))
    lsp_wenzi_di:setSize(cc.size(380,102))
    lsp_wenzi_di:setAnchorPoint(cc.p(0.5,0.5))
    pop_bottom_panel:appendComponent(lsp_wenzi_di)
    lsp_wenzi_di:setPositionInContainer(cc.p(285,168))
    table_less_silver_tip_popup["lsp_wenzi_di"] = lsp_wenzi_di

    local lsp_pop_notice_label = fc.FLabel:createBMFont()
    lsp_pop_notice_label:setSize(cc.size(280,102))
    lsp_pop_notice_label:setWidth(380)
    lsp_pop_notice_label:setAnchorPoint(cc.p(0.5,0.5))
    lsp_pop_notice_label:setFontSize(20)
    lsp_pop_notice_label:setString("征税均可获得大量银两，\n是否前往？")
    lsp_pop_notice_label:setColor(cc.c3b(91,24,6))
    pop_bottom_panel:appendComponent(lsp_pop_notice_label)
    lsp_pop_notice_label:setPositionInContainer(cc.p(335,168))
    table_less_silver_tip_popup["lsp_pop_notice_label"] = lsp_pop_notice_label

    local lsp_zhou_down = fc.FExtensionsImage:create()
    lsp_zhou_down:setImage("nobatch/shengzhi_zhou.png")
    lsp_zhou_down:setSize(cc.size(47,570))
    lsp_zhou_down:setRotation(90)
    lsp_zhou_down:setAnchorPoint(cc.p(0.5,0.5))
    pop_bottom_panel:appendComponent(lsp_zhou_down)
    lsp_zhou_down:setPositionInContainer(cc.p(285,368.5))
    table_less_silver_tip_popup["lsp_zhou_down"] = lsp_zhou_down

    local lsp_zhou_up = fc.FExtensionsImage:create()
    lsp_zhou_up:setImage("nobatch/shengzhi_zhou.png")
    lsp_zhou_up:setSize(cc.size(47,570))
    lsp_zhou_up:setRotation(90)
    lsp_zhou_up:setAnchorPoint(cc.p(0.5,0.5))
    pop_bottom_panel:appendComponent(lsp_zhou_up)
    lsp_zhou_up:setPositionInContainer(cc.p(285,37.5))
    table_less_silver_tip_popup["lsp_zhou_up"] = lsp_zhou_up

    local lsp_title_bg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/xingjikuang_tangquanxinggong.png",cc.rect(72,17,2,2))
    lsp_title_bg:setSize(cc.size(288,40))
    lsp_title_bg:setAnchorPoint(cc.p(0.5,0.5))
    lsp_title_bg:setScaleY(-1)
    pop_bottom_panel:appendComponent(lsp_title_bg)
    lsp_title_bg:setPositionInContainer(cc.p(285,36))
    table_less_silver_tip_popup["lsp_title_bg"] = lsp_title_bg

    local lsp_yin = fc.FExtensionsImage:create()
    lsp_yin:setImage("batch_ui/yin.png")
    lsp_yin:setSize(cc.size(59,59))
    lsp_yin:setAnchorPoint(cc.p(0.5,0.5))
    pop_bottom_panel:appendComponent(lsp_yin)
    lsp_yin:setPositionInContainer(cc.p(196.5,29.5))
    table_less_silver_tip_popup["lsp_yin"] = lsp_yin

    local lsp_liang = fc.FExtensionsImage:create()
    lsp_liang:setImage("batch_ui/liang.png")
    lsp_liang:setSize(cc.size(59,59))
    lsp_liang:setAnchorPoint(cc.p(0.5,0.5))
    pop_bottom_panel:appendComponent(lsp_liang)
    lsp_liang:setPositionInContainer(cc.p(255.5,29.5))
    table_less_silver_tip_popup["lsp_liang"] = lsp_liang

    local lsp_close_btn = fc.FScaleButton:create()
    lsp_close_btn:setSize(cc.size(41,45))
    lsp_close_btn:setAnchorPoint(cc.p(0.5,0.5))
    lsp_close_btn:setButtonImage("batch_ui/guanbi_anniu2.png")
    pop_bottom_panel:appendComponent(lsp_close_btn)
    lsp_close_btn:setPositionInContainer(cc.p(529.5,36.5))
    table_less_silver_tip_popup["lsp_close_btn"] = lsp_close_btn

    local lsp_jinshou_img = fc.FExtensionsImage:create()
    lsp_jinshou_img:setImage("batch_ui/yinliangDouble.png")
    lsp_jinshou_img:setSize(cc.size(75,59))
    lsp_jinshou_img:setAnchorPoint(cc.p(0.5,0.5))
    pop_bottom_panel:appendComponent(lsp_jinshou_img)
    lsp_jinshou_img:setPositionInContainer(cc.p(150.5,167.5))
    table_less_silver_tip_popup["lsp_jinshou_img"] = lsp_jinshou_img

    local lsp_bu = fc.FExtensionsImage:create()
    lsp_bu:setImage("batch_ui/bu.png")
    lsp_bu:setSize(cc.size(59,59))
    lsp_bu:setAnchorPoint(cc.p(0.5,0.5))
    pop_bottom_panel:appendComponent(lsp_bu)
    lsp_bu:setPositionInContainer(cc.p(314.5,29.5))
    table_less_silver_tip_popup["lsp_bu"] = lsp_bu

    local lsp_zu = fc.FExtensionsImage:create()
    lsp_zu:setImage("batch_ui/zu.png")
    lsp_zu:setSize(cc.size(59,59))
    lsp_zu:setAnchorPoint(cc.p(0.5,0.5))
    pop_bottom_panel:appendComponent(lsp_zu)
    lsp_zu:setPositionInContainer(cc.p(373.5,29.5))
    table_less_silver_tip_popup["lsp_zu"] = lsp_zu

    return table_less_silver_tip_popup

end

