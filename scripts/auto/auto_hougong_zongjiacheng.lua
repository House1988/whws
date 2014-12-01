function createhougong_zongjiacheng()

    local table_hougong_zongjiacheng = {}

    local hougong_zongjiacheng = fc.FContainerPanel:create()
    hougong_zongjiacheng:setSize(cc.size(960,640))
    table_hougong_zongjiacheng["hougong_zongjiacheng"] = hougong_zongjiacheng

    local hg_zjc_bantouming_scale9 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/juezhan_heiseditu.png",cc.rect(2,2,1,1))
    hg_zjc_bantouming_scale9:setSize(cc.size(960,640))
    hg_zjc_bantouming_scale9:setAnchorPoint(cc.p(0.5,0.5))
    hougong_zongjiacheng:appendComponent(hg_zjc_bantouming_scale9)
    hg_zjc_bantouming_scale9:setPositionInContainer(cc.p(480,320))
    table_hougong_zongjiacheng["hg_zjc_bantouming_scale9"] = hg_zjc_bantouming_scale9

    local hg_zjc_juanmian_scale9 = fc.FScale9Image:createWithBatchUIFrame("nobatch/juanzhou_di.png",cc.rect(52,289,5,5))
    hg_zjc_juanmian_scale9:setSize(cc.size(447,536))
    hg_zjc_juanmian_scale9:setAnchorPoint(cc.p(0.5,0.5))
    hougong_zongjiacheng:appendComponent(hg_zjc_juanmian_scale9)
    hg_zjc_juanmian_scale9:setPositionInContainer(cc.p(480,322))
    table_hougong_zongjiacheng["hg_zjc_juanmian_scale9"] = hg_zjc_juanmian_scale9

    local hougong_juanzhougan_top_image = fc.FExtensionsImage:create()
    hougong_juanzhougan_top_image:setImage("nobatch/juanzhou_zhou.png")
    hougong_juanzhougan_top_image:setSize(cc.size(514,63))
    hougong_juanzhougan_top_image:setAnchorPoint(cc.p(0.5,0.5))
    hougong_zongjiacheng:appendComponent(hougong_juanzhougan_top_image)
    hougong_juanzhougan_top_image:setPositionInContainer(cc.p(476,50))
    table_hougong_zongjiacheng["hougong_juanzhougan_top_image"] = hougong_juanzhougan_top_image

    local hougong_juanzhougan_bottom_image = fc.FExtensionsImage:create()
    hougong_juanzhougan_bottom_image:setImage("nobatch/juanzhou_zhou.png")
    hougong_juanzhougan_bottom_image:setSize(cc.size(514,63))
    hougong_juanzhougan_bottom_image:setFlipType(4)
    hougong_juanzhougan_bottom_image:setAnchorPoint(cc.p(0.5,0.5))
    hougong_zongjiacheng:appendComponent(hougong_juanzhougan_bottom_image)
    hougong_juanzhougan_bottom_image:setPositionInContainer(cc.p(476,590))
    table_hougong_zongjiacheng["hougong_juanzhougan_bottom_image"] = hougong_juanzhougan_bottom_image

    local hg_zongjiacheng_label = fc.FLabel:createBMFont()
    hg_zongjiacheng_label:setSize(cc.size(180,57))
    hg_zongjiacheng_label:setAnchorPoint(cc.p(0.5,0.5))
    hg_zongjiacheng_label:setFontSize(20)
    hg_zongjiacheng_label:setString("总加成")
    hg_zongjiacheng_label:setColor(cc.c3b(185,31,6))
    hougong_zongjiacheng:appendComponent(hg_zongjiacheng_label)
    hg_zongjiacheng_label:setPositionInContainer(cc.p(476,124))
    table_hougong_zongjiacheng["hg_zongjiacheng_label"] = hg_zongjiacheng_label

    local hg_zjc_close_button = fc.FScaleButton:create()
    hg_zjc_close_button:setSize(cc.size(35,35))
    hg_zjc_close_button:setAnchorPoint(cc.p(0.5,0.5))
    hg_zjc_close_button:setButtonImage("batch_ui/guanbi_anniu2.png")
    hougong_zongjiacheng:appendComponent(hg_zjc_close_button)
    hg_zjc_close_button:setPositionInContainer(cc.p(648,102))
    table_hougong_zongjiacheng["hg_zjc_close_button"] = hg_zjc_close_button

    local hg_zjc_queding_button = fc.FScaleButton:create()
    hg_zjc_queding_button:setSize(cc.size(144,53))
    hg_zjc_queding_button:setAnchorPoint(cc.p(0.5,0.5))
    hg_zjc_queding_button:setButtonImage("batch_ui/putonganniu1_up.png")
    hg_zjc_queding_button:setTextImage("batch_ui/queding.png",cc.p(72,27))
    hougong_zongjiacheng:appendComponent(hg_zjc_queding_button)
    hg_zjc_queding_button:setPositionInContainer(cc.p(484,512))
    table_hougong_zongjiacheng["hg_zjc_queding_button"] = hg_zjc_queding_button

    local hg_zjc_info_list = fc.FContainerList:create(1)
    hg_zjc_info_list:setSize(cc.size(390,310))
    hg_zjc_info_list:setAnchorPoint(cc.p(0.5,0.5))
    hougong_zongjiacheng:appendComponent(hg_zjc_info_list)
    hg_zjc_info_list:setPositionInContainer(cc.p(481,314))
    table_hougong_zongjiacheng["hg_zjc_info_list"] = hg_zjc_info_list

    return table_hougong_zongjiacheng

end

