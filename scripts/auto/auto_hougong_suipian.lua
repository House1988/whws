function createhougong_suipian()

    local table_hougong_suipian = {}

    local hougong_suipian = fc.FContainerPanel:create()
    hougong_suipian:setSize(cc.size(960,640))
    table_hougong_suipian["hougong_suipian"] = hougong_suipian

    local hg_sp_bottom_panel = fc.FContainerPanel:create()
    hg_sp_bottom_panel:setSize(cc.size(604,425))
    hg_sp_bottom_panel:setAnchorPoint(cc.p(0.5,0.5))
    hougong_suipian:appendComponent(hg_sp_bottom_panel)
    hg_sp_bottom_panel:setPositionInContainer(cc.p(480,320))
    table_hougong_suipian["hg_sp_bottom_panel"] = hg_sp_bottom_panel

    local hg_sz_la = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shengzhi_ditu.png",cc.rect(40,63,4,4))
    hg_sz_la:setSize(cc.size(482,365))
    hg_sz_la:setAnchorPoint(cc.p(0.5,0.5))
    hg_sp_bottom_panel:appendComponent(hg_sz_la)
    hg_sz_la:setPositionInContainer(cc.p(302,215.5))
    table_hougong_suipian["hg_sz_la"] = hg_sz_la

    local hg_zhou_u = fc.FExtensionsImage:create()
    hg_zhou_u:setImage("nobatch/shengzhi_zhou.png")
    hg_zhou_u:setSize(cc.size(52,604))
    hg_zhou_u:setRotation(90)
    hg_zhou_u:setAnchorPoint(cc.p(0.5,0.5))
    hg_sp_bottom_panel:appendComponent(hg_zhou_u)
    hg_zhou_u:setPositionInContainer(cc.p(302,26))
    table_hougong_suipian["hg_zhou_u"] = hg_zhou_u

    local hg_zhou_d = fc.FExtensionsImage:create()
    hg_zhou_d:setImage("nobatch/shengzhi_zhou.png")
    hg_zhou_d:setSize(cc.size(52,604))
    hg_zhou_d:setRotation(90)
    hg_zhou_d:setAnchorPoint(cc.p(0.5,0.5))
    hg_sp_bottom_panel:appendComponent(hg_zhou_d)
    hg_zhou_d:setPositionInContainer(cc.p(302,398))
    table_hougong_suipian["hg_zhou_d"] = hg_zhou_d

    local hg_sp_close_button = fc.FScaleButton:create()
    hg_sp_close_button:setSize(cc.size(35,35))
    hg_sp_close_button:setAnchorPoint(cc.p(0.5,0.5))
    hg_sp_close_button:setButtonImage("batch_ui/guanbi_anniu2.png")
    hg_sp_bottom_panel:appendComponent(hg_sp_close_button)
    hg_sp_close_button:setPositionInContainer(cc.p(560.5,25.5))
    table_hougong_suipian["hg_sp_close_button"] = hg_sp_close_button

    local hg_sp_title_bg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/xingjikuang_tangquanxinggong.png",cc.rect(72,17,2,2))
    hg_sp_title_bg:setSize(cc.size(260,50))
    hg_sp_title_bg:setAnchorPoint(cc.p(0.5,0.5))
    hg_sp_title_bg:setScaleY(-1)
    hg_sp_bottom_panel:appendComponent(hg_sp_title_bg)
    hg_sp_title_bg:setPositionInContainer(cc.p(302,25))
    table_hougong_suipian["hg_sp_title_bg"] = hg_sp_title_bg

    local hg_sp_gong = fc.FExtensionsImage:create()
    hg_sp_gong:setImage("batch_ui/gong6.png")
    hg_sp_gong:setSize(cc.size(59,59))
    hg_sp_gong:setAnchorPoint(cc.p(0.5,0.5))
    hg_sp_bottom_panel:appendComponent(hg_sp_gong)
    hg_sp_gong:setPositionInContainer(cc.p(218.5,22.5))
    table_hougong_suipian["hg_sp_gong"] = hg_sp_gong

    local hg_sp_xi = fc.FExtensionsImage:create()
    hg_sp_xi:setImage("batch_ui/xi.png")
    hg_sp_xi:setSize(cc.size(59,59))
    hg_sp_xi:setAnchorPoint(cc.p(0.5,0.5))
    hg_sp_bottom_panel:appendComponent(hg_sp_xi)
    hg_sp_xi:setPositionInContainer(cc.p(274.5,22.5))
    table_hougong_suipian["hg_sp_xi"] = hg_sp_xi

    local hg_sp_huang = fc.FExtensionsImage:create()
    hg_sp_huang:setImage("batch_ui/huang2.png")
    hg_sp_huang:setSize(cc.size(59,59))
    hg_sp_huang:setAnchorPoint(cc.p(0.5,0.5))
    hg_sp_bottom_panel:appendComponent(hg_sp_huang)
    hg_sp_huang:setPositionInContainer(cc.p(329.5,22.5))
    table_hougong_suipian["hg_sp_huang"] = hg_sp_huang

    local hg_sp_shang = fc.FExtensionsImage:create()
    hg_sp_shang:setImage("batch_ui/shang1.png")
    hg_sp_shang:setSize(cc.size(59,59))
    hg_sp_shang:setAnchorPoint(cc.p(0.5,0.5))
    hg_sp_bottom_panel:appendComponent(hg_sp_shang)
    hg_sp_shang:setPositionInContainer(cc.p(385.5,22.5))
    table_hougong_suipian["hg_sp_shang"] = hg_sp_shang

    local hg_sp_rect11 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongditu2_huodong.png",cc.rect(1,1,1,1))
    hg_sp_rect11:setSize(cc.size(474,330))
    hg_sp_rect11:setAnchorPoint(cc.p(0.5,0.5))
    hg_sp_bottom_panel:appendComponent(hg_sp_rect11)
    hg_sp_rect11:setPositionInContainer(cc.p(302,213))
    table_hougong_suipian["hg_sp_rect11"] = hg_sp_rect11

    local hg_sp_content_di1 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongbiankuang2_ciguan.png",cc.rect(44,15,1,1))
    hg_sp_content_di1:setSize(cc.size(474,330))
    hg_sp_content_di1:setAnchorPoint(cc.p(0.5,0.5))
    hg_sp_bottom_panel:appendComponent(hg_sp_content_di1)
    hg_sp_content_di1:setPositionInContainer(cc.p(302,213))
    table_hougong_suipian["hg_sp_content_di1"] = hg_sp_content_di1

    local hg_sp_huode_suipian_label = fc.FLabel:createBMFont()
    hg_sp_huode_suipian_label:setSize(cc.size(450,30))
    hg_sp_huode_suipian_label:setWidth(450)
    hg_sp_huode_suipian_label:setAnchorPoint(cc.p(0.5,0.5))
    hg_sp_huode_suipian_label:setFontSize(20)
    hg_sp_huode_suipian_label:setString("获得获得装备碎片")
    hg_sp_huode_suipian_label:setColor(cc.c3b(106,68,19))
    hg_sp_bottom_panel:appendComponent(hg_sp_huode_suipian_label)
    hg_sp_huode_suipian_label:setPositionInContainer(cc.p(302,86))
    table_hougong_suipian["hg_sp_huode_suipian_label"] = hg_sp_huode_suipian_label

    local hg_sp_content_di2 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongditu_huodong.png",cc.rect(3,3,2,2))
    hg_sp_content_di2:setSize(cc.size(470,140))
    hg_sp_content_di2:setAnchorPoint(cc.p(0.5,0.5))
    hg_sp_bottom_panel:appendComponent(hg_sp_content_di2)
    hg_sp_content_di2:setPositionInContainer(cc.p(302,189))
    table_hougong_suipian["hg_sp_content_di2"] = hg_sp_content_di2

    local star1 = fc.FExtensionsImage:create()
    star1:setImage("batch_ui/xingxing.png")
    star1:setSize(cc.size(20,19))
    star1:setAnchorPoint(cc.p(0.5,0.5))
    hg_sp_bottom_panel:appendComponent(star1)
    star1:setPositionInContainer(cc.p(242,277.5))
    table_hougong_suipian["star1"] = star1

    local star2 = fc.FExtensionsImage:create()
    star2:setImage("batch_ui/xingxing.png")
    star2:setSize(cc.size(20,19))
    star2:setAnchorPoint(cc.p(0.5,0.5))
    hg_sp_bottom_panel:appendComponent(star2)
    star2:setPositionInContainer(cc.p(272,277.5))
    table_hougong_suipian["star2"] = star2

    local star3 = fc.FExtensionsImage:create()
    star3:setImage("batch_ui/xingxing.png")
    star3:setSize(cc.size(20,19))
    star3:setAnchorPoint(cc.p(0.5,0.5))
    hg_sp_bottom_panel:appendComponent(star3)
    star3:setPositionInContainer(cc.p(302,277.5))
    table_hougong_suipian["star3"] = star3

    local star4 = fc.FExtensionsImage:create()
    star4:setImage("batch_ui/xingxing.png")
    star4:setSize(cc.size(20,19))
    star4:setAnchorPoint(cc.p(0.5,0.5))
    hg_sp_bottom_panel:appendComponent(star4)
    star4:setPositionInContainer(cc.p(332,277.5))
    table_hougong_suipian["star4"] = star4

    local star5 = fc.FExtensionsImage:create()
    star5:setImage("batch_ui/xingxing.png")
    star5:setSize(cc.size(20,19))
    star5:setAnchorPoint(cc.p(0.5,0.5))
    hg_sp_bottom_panel:appendComponent(star5)
    star5:setPositionInContainer(cc.p(362,277.5))
    table_hougong_suipian["star5"] = star5

    local hg_sp_queding_button = fc.FScaleButton:create()
    hg_sp_queding_button:setSize(cc.size(144,53))
    hg_sp_queding_button:setAnchorPoint(cc.p(0.5,0.5))
    hg_sp_queding_button:setButtonImage("batch_ui/putonganniu1_up.png")
    hg_sp_bottom_panel:appendComponent(hg_sp_queding_button)
    hg_sp_queding_button:setPositionInContainer(cc.p(302,323.5))
    table_hougong_suipian["hg_sp_queding_button"] = hg_sp_queding_button

    local hg_sp_que = fc.FShaderExtensionsImage:create(0)
    hg_sp_que:setAnchorPoint(cc.p(0.5,0.5))
    hg_sp_que:setImage("batch_ui/que_uizi.png")
    hg_sp_que:setSize(cc.size(32,32))
    hg_sp_queding_button:appendComponent(hg_sp_que)
    hg_sp_que:setPositionInContainer(cc.p(44,26))
    table_hougong_suipian["hg_sp_que"] = hg_sp_que

    local hg_sp_ren = fc.FShaderExtensionsImage:create(0)
    hg_sp_ren:setAnchorPoint(cc.p(0.5,0.5))
    hg_sp_ren:setImage("batch_ui/ding_uizi.png")
    hg_sp_ren:setSize(cc.size(32,32))
    hg_sp_queding_button:appendComponent(hg_sp_ren)
    hg_sp_ren:setPositionInContainer(cc.p(99,26))
    table_hougong_suipian["hg_sp_ren"] = hg_sp_ren

    local hg_sp_quality_image = fc.FExtensionsImage:create()
    hg_sp_quality_image:setImage("batch_ui/baipinzhi_kuang.png")
    hg_sp_quality_image:setSize(cc.size(104,104))
    hg_sp_quality_image:setAnchorPoint(cc.p(0.5,0.5))
    hg_sp_bottom_panel:appendComponent(hg_sp_quality_image)
    hg_sp_quality_image:setPositionInContainer(cc.p(302,189))
    table_hougong_suipian["hg_sp_quality_image"] = hg_sp_quality_image

    local hg_sp_suipian_image = fc.FExtensionsImage:create()
    hg_sp_suipian_image:setImage("nobatch/tupian.png")
    hg_sp_suipian_image:setSize(cc.size(90,90))
    hg_sp_suipian_image:setAnchorPoint(cc.p(0.5,0.5))
    hg_sp_bottom_panel:appendComponent(hg_sp_suipian_image)
    hg_sp_suipian_image:setPositionInContainer(cc.p(302,189))
    table_hougong_suipian["hg_sp_suipian_image"] = hg_sp_suipian_image

    local hg_flag_image = fc.FExtensionsImage:create()
    hg_flag_image:setAnchorPoint(cc.p(0.5,0.5))
    hg_sp_bottom_panel:appendComponent(hg_flag_image)
    hg_flag_image:setPositionInContainer(cc.p(343,229))
    table_hougong_suipian["hg_flag_image"] = hg_flag_image

    return table_hougong_suipian

end

