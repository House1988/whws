function createzhandoujiemian_left_bottom()

    local table_zhandoujiemian_left_bottom = {}

    local zhandoujiemian_left_bottom = fc.FContainerPanel:create()
    zhandoujiemian_left_bottom:setSize(cc.size(960,640))
    table_zhandoujiemian_left_bottom["zhandoujiemian_left_bottom"] = zhandoujiemian_left_bottom

    local zdjm_lb_kapaibg_scale9 = fc.FScale9Image:createWithBatchUIFrame("nobatch/kapai_diwen.png",cc.rect(94,11,3,3))
    zdjm_lb_kapaibg_scale9:setSize(cc.size(551,36))
    zdjm_lb_kapaibg_scale9:setAnchorPoint(cc.p(0.5,0.5))
    zhandoujiemian_left_bottom:appendComponent(zdjm_lb_kapaibg_scale9)
    zdjm_lb_kapaibg_scale9:setPositionInContainer(cc.p(330.5,622))
    table_zhandoujiemian_left_bottom["zdjm_lb_kapaibg_scale9"] = zdjm_lb_kapaibg_scale9

    local zjjm_lb_kapai_panel = fc.FContainerPanel:create()
    zjjm_lb_kapai_panel:setSize(cc.size(551,116))
    zjjm_lb_kapai_panel:setAnchorPoint(cc.p(0.5,0.5))
    zhandoujiemian_left_bottom:appendComponent(zjjm_lb_kapai_panel)
    zjjm_lb_kapai_panel:setPositionInContainer(cc.p(302.5,582))
    table_zhandoujiemian_left_bottom["zjjm_lb_kapai_panel"] = zjjm_lb_kapai_panel

    local zdjm_lb_longzhu_image = fc.FExtensionsImage:create()
    zdjm_lb_longzhu_image:setImage("batch_ui/longzhu_1.png")
    zdjm_lb_longzhu_image:setSize(cc.size(32,32))
    zdjm_lb_longzhu_image:setAnchorPoint(cc.p(0.5,0.5))
    zhandoujiemian_left_bottom:appendComponent(zdjm_lb_longzhu_image)
    zdjm_lb_longzhu_image:setPositionInContainer(cc.p(22,399))
    table_zhandoujiemian_left_bottom["zdjm_lb_longzhu_image"] = zdjm_lb_longzhu_image

    local zdjm_lb_name_bg_image = fc.FExtensionsImage:create()
    zdjm_lb_name_bg_image:setImage("nobatch/wanjiaxingmingkuang.png")
    zdjm_lb_name_bg_image:setSize(cc.size(261,219))
    zdjm_lb_name_bg_image:setAnchorPoint(cc.p(0.5,0.5))
    zhandoujiemian_left_bottom:appendComponent(zdjm_lb_name_bg_image)
    zdjm_lb_name_bg_image:setPositionInContainer(cc.p(130.5,530.5))
    table_zhandoujiemian_left_bottom["zdjm_lb_name_bg_image"] = zdjm_lb_name_bg_image

    local zdjm_lb_huawen_image = fc.FExtensionsImage:create()
    zdjm_lb_huawen_image:setImage("batch_ui/kapai_huawen.png")
    zdjm_lb_huawen_image:setSize(cc.size(114,47))
    zdjm_lb_huawen_image:setAnchorPoint(cc.p(0.5,0.5))
    zhandoujiemian_left_bottom:appendComponent(zdjm_lb_huawen_image)
    zdjm_lb_huawen_image:setPositionInContainer(cc.p(568,616.5))
    table_zhandoujiemian_left_bottom["zdjm_lb_huawen_image"] = zdjm_lb_huawen_image

    local zdjm_lb_gong_image = fc.FExtensionsImage:create()
    zdjm_lb_gong_image:setImage("batch_ui/gong.png")
    zdjm_lb_gong_image:setSize(cc.size(37,34))
    zdjm_lb_gong_image:setAnchorPoint(cc.p(0.5,0.5))
    zhandoujiemian_left_bottom:appendComponent(zdjm_lb_gong_image)
    zdjm_lb_gong_image:setPositionInContainer(cc.p(18.5,623))
    table_zhandoujiemian_left_bottom["zdjm_lb_gong_image"] = zdjm_lb_gong_image

    local zdjm_lb_name_label = fc.FLabel:createSystemFont()
    zdjm_lb_name_label:setSize(cc.size(120,30))
    zdjm_lb_name_label:setAnchorPoint(cc.p(0.5,0.5))
    zdjm_lb_name_label:setFontSize(20)
    zdjm_lb_name_label:setString("名字五个字")
    zdjm_lb_name_label:setColor(cc.c3b(255,255,255))
    zhandoujiemian_left_bottom:appendComponent(zdjm_lb_name_label)
    zdjm_lb_name_label:setPositionInContainer(cc.p(132,494))
    table_zhandoujiemian_left_bottom["zdjm_lb_name_label"] = zdjm_lb_name_label

    return table_zhandoujiemian_left_bottom

end

