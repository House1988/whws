function createhougong_youxi()

    local table_hougong_youxi = {}

    local hougong_youxi = fc.FContainerPanel:create()
    hougong_youxi:setSize(cc.size(960,640))
    table_hougong_youxi["hougong_youxi"] = hougong_youxi

    local hg_yx_bottom_panel = fc.FContainerPanel:create()
    hg_yx_bottom_panel:setSize(cc.size(534,370))
    hg_yx_bottom_panel:setAnchorPoint(cc.p(0.5,0.5))
    hougong_youxi:appendComponent(hg_yx_bottom_panel)
    hg_yx_bottom_panel:setPositionInContainer(cc.p(480,329.5))
    table_hougong_youxi["hg_yx_bottom_panel"] = hg_yx_bottom_panel

    local sz_la = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shengzhi_ditu.png",cc.rect(40,63,4,4))
    sz_la:setSize(cc.size(412,305))
    sz_la:setAnchorPoint(cc.p(0.5,0.5))
    hg_yx_bottom_panel:appendComponent(sz_la)
    sz_la:setPositionInContainer(cc.p(267,183.5))
    table_hougong_youxi["sz_la"] = sz_la

    local zhou_up = fc.FExtensionsImage:create()
    zhou_up:setImage("nobatch/shengzhi_zhou.png")
    zhou_up:setSize(cc.size(52,534))
    zhou_up:setRotation(90)
    zhou_up:setAnchorPoint(cc.p(0.5,0.5))
    hg_yx_bottom_panel:appendComponent(zhou_up)
    zhou_up:setPositionInContainer(cc.p(267,26))
    table_hougong_youxi["zhou_up"] = zhou_up

    local zhou_down = fc.FExtensionsImage:create()
    zhou_down:setImage("nobatch/shengzhi_zhou.png")
    zhou_down:setSize(cc.size(52,534))
    zhou_down:setRotation(90)
    zhou_down:setAnchorPoint(cc.p(0.5,0.5))
    hg_yx_bottom_panel:appendComponent(zhou_down)
    zhou_down:setPositionInContainer(cc.p(267,343))
    table_hougong_youxi["zhou_down"] = zhou_down

    local hg_yx_close_button = fc.FScaleButton:create()
    hg_yx_close_button:setSize(cc.size(35,35))
    hg_yx_close_button:setAnchorPoint(cc.p(0.5,0.5))
    hg_yx_close_button:setButtonImage("batch_ui/guanbi_anniu2.png")
    hg_yx_bottom_panel:appendComponent(hg_yx_close_button)
    hg_yx_close_button:setPositionInContainer(cc.p(500.5,25.5))
    table_hougong_youxi["hg_yx_close_button"] = hg_yx_close_button

    local hyyx_ding_bg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/xingjikuang_tangquanxinggong.png",cc.rect(72,17,2,2))
    hyyx_ding_bg:setSize(cc.size(260,50))
    hyyx_ding_bg:setAnchorPoint(cc.p(0.5,0.5))
    hyyx_ding_bg:setScaleY(-1)
    hg_yx_bottom_panel:appendComponent(hyyx_ding_bg)
    hyyx_ding_bg:setPositionInContainer(cc.p(267,25))
    table_hougong_youxi["hyyx_ding_bg"] = hyyx_ding_bg

    local title_gong = fc.FExtensionsImage:create()
    title_gong:setImage("batch_ui/gong6.png")
    title_gong:setSize(cc.size(59,59))
    title_gong:setAnchorPoint(cc.p(0.5,0.5))
    hg_yx_bottom_panel:appendComponent(title_gong)
    title_gong:setPositionInContainer(cc.p(185.5,20.5))
    table_hougong_youxi["title_gong"] = title_gong

    local title_xi = fc.FExtensionsImage:create()
    title_xi:setImage("batch_ui/xi.png")
    title_xi:setSize(cc.size(59,59))
    title_xi:setAnchorPoint(cc.p(0.5,0.5))
    hg_yx_bottom_panel:appendComponent(title_xi)
    title_xi:setPositionInContainer(cc.p(239.5,20.5))
    table_hougong_youxi["title_xi"] = title_xi

    local title_huang = fc.FExtensionsImage:create()
    title_huang:setImage("batch_ui/huang2.png")
    title_huang:setSize(cc.size(59,59))
    title_huang:setAnchorPoint(cc.p(0.5,0.5))
    hg_yx_bottom_panel:appendComponent(title_huang)
    title_huang:setPositionInContainer(cc.p(293.5,20.5))
    table_hougong_youxi["title_huang"] = title_huang

    local title_shang = fc.FExtensionsImage:create()
    title_shang:setImage("batch_ui/shang1.png")
    title_shang:setSize(cc.size(59,59))
    title_shang:setAnchorPoint(cc.p(0.5,0.5))
    hg_yx_bottom_panel:appendComponent(title_shang)
    title_shang:setPositionInContainer(cc.p(347.5,20.5))
    table_hougong_youxi["title_shang"] = title_shang

    local hyyx_rect111 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongditu2_huodong.png",cc.rect(1,1,1,1))
    hyyx_rect111:setSize(cc.size(384,269))
    hyyx_rect111:setAnchorPoint(cc.p(0.5,0.5))
    hg_yx_bottom_panel:appendComponent(hyyx_rect111)
    hyyx_rect111:setPositionInContainer(cc.p(267,184.5))
    table_hougong_youxi["hyyx_rect111"] = hyyx_rect111

    local hgjy_ditu = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongbiankuang2_ciguan.png",cc.rect(44,15,1,1))
    hgjy_ditu:setSize(cc.size(384,269))
    hgjy_ditu:setAnchorPoint(cc.p(0.5,0.5))
    hg_yx_bottom_panel:appendComponent(hgjy_ditu)
    hgjy_ditu:setPositionInContainer(cc.p(267,184.5))
    table_hougong_youxi["hgjy_ditu"] = hgjy_ditu

    local hyyx_tubiao_di = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongditu_huodong.png",cc.rect(3,3,2,2))
    hyyx_tubiao_di:setSize(cc.size(380,150))
    hyyx_tubiao_di:setAnchorPoint(cc.p(0.5,0.5))
    hg_yx_bottom_panel:appendComponent(hyyx_tubiao_di)
    hyyx_tubiao_di:setPositionInContainer(cc.p(269,164))
    table_hougong_youxi["hyyx_tubiao_di"] = hyyx_tubiao_di

    local hg_yx_laibao_label = fc.FLabel:createBMFont()
    hg_yx_laibao_label:setSize(cc.size(270,30))
    hg_yx_laibao_label:setAnchorPoint(cc.p(0.5,0.5))
    hg_yx_laibao_label:setFontSize(20)
    hg_yx_laibao_label:setString("太太院来报：娘娘有喜了！")
    hg_yx_laibao_label:setColor(cc.c3b(106,68,19))
    hg_yx_bottom_panel:appendComponent(hg_yx_laibao_label)
    hg_yx_laibao_label:setPositionInContainer(cc.p(268,68))
    table_hougong_youxi["hg_yx_laibao_label"] = hg_yx_laibao_label

    local hg_yx_touxiang_bg_image = fc.FExtensionsImage:create()
    hg_yx_touxiang_bg_image:setImage("batch_ui/niangniangyouxile.png")
    hg_yx_touxiang_bg_image:setSize(cc.size(160,126))
    hg_yx_touxiang_bg_image:setAnchorPoint(cc.p(0.5,0.5))
    hg_yx_bottom_panel:appendComponent(hg_yx_touxiang_bg_image)
    hg_yx_touxiang_bg_image:setPositionInContainer(cc.p(269,165))
    table_hougong_youxi["hg_yx_touxiang_bg_image"] = hg_yx_touxiang_bg_image

    local hg_yx_queding_button = fc.FScaleButton:create()
    hg_yx_queding_button:setSize(cc.size(144,53))
    hg_yx_queding_button:setAnchorPoint(cc.p(0.5,0.5))
    hg_yx_queding_button:setButtonImage("batch_ui/putonganniu1_up.png")
    hg_yx_bottom_panel:appendComponent(hg_yx_queding_button)
    hg_yx_queding_button:setPositionInContainer(cc.p(267,276.5))
    table_hougong_youxi["hg_yx_queding_button"] = hg_yx_queding_button

    local que_uizi = fc.FShaderExtensionsImage:create(0)
    que_uizi:setAnchorPoint(cc.p(0.5,0.5))
    que_uizi:setImage("batch_ui/que_uizi.png")
    que_uizi:setSize(cc.size(32,32))
    hg_yx_queding_button:appendComponent(que_uizi)
    que_uizi:setPositionInContainer(cc.p(46,26))
    table_hougong_youxi["que_uizi"] = que_uizi

    local ding_uizi = fc.FShaderExtensionsImage:create(0)
    ding_uizi:setAnchorPoint(cc.p(0.5,0.5))
    ding_uizi:setImage("batch_ui/ding_uizi.png")
    ding_uizi:setSize(cc.size(32,32))
    hg_yx_queding_button:appendComponent(ding_uizi)
    ding_uizi:setPositionInContainer(cc.p(96,26))
    table_hougong_youxi["ding_uizi"] = ding_uizi

    return table_hougong_youxi

end

