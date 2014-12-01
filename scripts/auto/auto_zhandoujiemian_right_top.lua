function createzhandoujiemian_right_top()

    local table_zhandoujiemian_right_top = {}

    local zhandoujiemian_right_top = fc.FContainerPanel:create()
    zhandoujiemian_right_top:setSize(cc.size(960,640))
    table_zhandoujiemian_right_top["zhandoujiemian_right_top"] = zhandoujiemian_right_top

    local zdjm_rt_kapaibg_scale9 = fc.FScale9Image:createWithBatchUIFrame("nobatch/kapai_diwen.png",cc.rect(94,11,3,3))
    zdjm_rt_kapaibg_scale9:setSize(cc.size(551,36))
    zdjm_rt_kapaibg_scale9:setAnchorPoint(cc.p(0.5,0.5))
    zdjm_rt_kapaibg_scale9:setScaleX(-1)
    zdjm_rt_kapaibg_scale9:setScaleY(-1)
    zhandoujiemian_right_top:appendComponent(zdjm_rt_kapaibg_scale9)
    zdjm_rt_kapaibg_scale9:setPositionInContainer(cc.p(629.5,18))
    table_zhandoujiemian_right_top["zdjm_rt_kapaibg_scale9"] = zdjm_rt_kapaibg_scale9

    local zjjm_rt_kapai_panel = fc.FContainerPanel:create()
    zjjm_rt_kapai_panel:setSize(cc.size(551,116))
    zjjm_rt_kapai_panel:setAnchorPoint(cc.p(0.5,0.5))
    zhandoujiemian_right_top:appendComponent(zjjm_rt_kapai_panel)
    zjjm_rt_kapai_panel:setPositionInContainer(cc.p(657.5,58))
    table_zhandoujiemian_right_top["zjjm_rt_kapai_panel"] = zjjm_rt_kapai_panel

    local zdjm_rt_longzhu_image = fc.FExtensionsImage:create()
    zdjm_rt_longzhu_image:setImage("batch_ui/longzhu_1.png")
    zdjm_rt_longzhu_image:setSize(cc.size(32,32))
    zdjm_rt_longzhu_image:setAnchorPoint(cc.p(0.5,0.5))
    zhandoujiemian_right_top:appendComponent(zdjm_rt_longzhu_image)
    zdjm_rt_longzhu_image:setPositionInContainer(cc.p(934,245))
    table_zhandoujiemian_right_top["zdjm_rt_longzhu_image"] = zdjm_rt_longzhu_image

    local zdjm_rt_name_bg_image = fc.FExtensionsImage:create()
    zdjm_rt_name_bg_image:setImage("nobatch/wanjiaxingmingkuang.png")
    zdjm_rt_name_bg_image:setSize(cc.size(261,219))
    zdjm_rt_name_bg_image:setFlipType(8)
    zdjm_rt_name_bg_image:setAnchorPoint(cc.p(0.5,0.5))
    zhandoujiemian_right_top:appendComponent(zdjm_rt_name_bg_image)
    zdjm_rt_name_bg_image:setPositionInContainer(cc.p(829.5,109.5))
    table_zhandoujiemian_right_top["zdjm_rt_name_bg_image"] = zdjm_rt_name_bg_image

    local zdjm_rt_huawen_image = fc.FExtensionsImage:create()
    zdjm_rt_huawen_image:setImage("batch_ui/kapai_huawen.png")
    zdjm_rt_huawen_image:setSize(cc.size(114,47))
    zdjm_rt_huawen_image:setFlipType(8)
    zdjm_rt_huawen_image:setAnchorPoint(cc.p(0.5,0.5))
    zhandoujiemian_right_top:appendComponent(zdjm_rt_huawen_image)
    zdjm_rt_huawen_image:setPositionInContainer(cc.p(392,23.5))
    table_zhandoujiemian_right_top["zdjm_rt_huawen_image"] = zdjm_rt_huawen_image

    local zdjm_rt_lb_name_label = fc.FLabel:createSystemFont()
    zdjm_rt_lb_name_label:setSize(cc.size(120,30))
    zdjm_rt_lb_name_label:setAnchorPoint(cc.p(0.5,0.5))
    zdjm_rt_lb_name_label:setFontSize(20)
    zdjm_rt_lb_name_label:setString("名字五个字")
    zdjm_rt_lb_name_label:setColor(cc.c3b(215, 213, 17))
    zhandoujiemian_right_top:appendComponent(zdjm_rt_lb_name_label)
    zdjm_rt_lb_name_label:setPositionInContainer(cc.p(828,138))
    table_zhandoujiemian_right_top["zdjm_rt_lb_name_label"] = zdjm_rt_lb_name_label

    local zdjm_rt_lb_gong_image = fc.FExtensionsImage:create()
    zdjm_rt_lb_gong_image:setImage("batch_ui/fang.png")
    zdjm_rt_lb_gong_image:setSize(cc.size(37,34))
    zdjm_rt_lb_gong_image:setAnchorPoint(cc.p(0.5,0.5))
    zhandoujiemian_right_top:appendComponent(zdjm_rt_lb_gong_image)
    zdjm_rt_lb_gong_image:setPositionInContainer(cc.p(941.5,17))
    table_zhandoujiemian_right_top["zdjm_rt_lb_gong_image"] = zdjm_rt_lb_gong_image

    return table_zhandoujiemian_right_top

end

