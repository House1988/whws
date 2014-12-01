function createzhanyi_atk_panel()

    local table_zhanyi_atk_panel = {}

    local zhanyi_atk_panel = fc.FContainerPanel:create()
    zhanyi_atk_panel:setSize(cc.size(265,130))
    table_zhanyi_atk_panel["zhanyi_atk_panel"] = zhanyi_atk_panel

    local solider_position_bg1 = fc.FExtensionsImage:create()
    solider_position_bg1:setImage("batch_ui/zhenxingyulan.png")
    solider_position_bg1:setSize(cc.size(74,34))
    solider_position_bg1:setAnchorPoint(cc.p(0.5,0.5))
    zhanyi_atk_panel:appendComponent(solider_position_bg1)
    solider_position_bg1:setPositionInContainer(cc.p(65,62))
    table_zhanyi_atk_panel["solider_position_bg1"] = solider_position_bg1

    local enemy_pos15 = fc.FExtensionsImage:create()
    enemy_pos15:setImage("batch_ui/bu_bingzhong_anniu.png")
    enemy_pos15:setSize(cc.size(35,35))
    enemy_pos15:setAnchorPoint(cc.p(0.5,0.5))
    zhanyi_atk_panel:appendComponent(enemy_pos15)
    enemy_pos15:setPositionInContainer(cc.p(64.5,50.5))
    table_zhanyi_atk_panel["enemy_pos15"] = enemy_pos15

    local soldier_postion_bg2 = fc.FExtensionsImage:create()
    soldier_postion_bg2:setImage("batch_ui/zhenxingyulan.png")
    soldier_postion_bg2:setSize(cc.size(74,34))
    soldier_postion_bg2:setAnchorPoint(cc.p(0.5,0.5))
    zhanyi_atk_panel:appendComponent(soldier_postion_bg2)
    soldier_postion_bg2:setPositionInContainer(cc.p(111,82))
    table_zhanyi_atk_panel["soldier_postion_bg2"] = soldier_postion_bg2

    local solider_position_bg3 = fc.FExtensionsImage:create()
    solider_position_bg3:setImage("batch_ui/zhenxingyulan.png")
    solider_position_bg3:setSize(cc.size(74,34))
    solider_position_bg3:setAnchorPoint(cc.p(0.5,0.5))
    zhanyi_atk_panel:appendComponent(solider_position_bg3)
    solider_position_bg3:setPositionInContainer(cc.p(158,104))
    table_zhanyi_atk_panel["solider_position_bg3"] = solider_position_bg3

    local solider_position_bg4 = fc.FExtensionsImage:create()
    solider_position_bg4:setImage("batch_ui/zhenxingyulan.png")
    solider_position_bg4:setSize(cc.size(74,34))
    solider_position_bg4:setAnchorPoint(cc.p(0.5,0.5))
    zhanyi_atk_panel:appendComponent(solider_position_bg4)
    solider_position_bg4:setPositionInContainer(cc.p(82,26))
    table_zhanyi_atk_panel["solider_position_bg4"] = solider_position_bg4

    local enemy_pos11 = fc.FExtensionsImage:create()
    enemy_pos11:setImage("batch_ui/bu_bingzhong_anniu.png")
    enemy_pos11:setSize(cc.size(35,35))
    enemy_pos11:setAnchorPoint(cc.p(0.5,0.5))
    zhanyi_atk_panel:appendComponent(enemy_pos11)
    enemy_pos11:setPositionInContainer(cc.p(82.5,18.5))
    table_zhanyi_atk_panel["enemy_pos11"] = enemy_pos11

    local solider_position_bg5 = fc.FExtensionsImage:create()
    solider_position_bg5:setImage("batch_ui/zhenxingyulan.png")
    solider_position_bg5:setSize(cc.size(74,34))
    solider_position_bg5:setAnchorPoint(cc.p(0.5,0.5))
    zhanyi_atk_panel:appendComponent(solider_position_bg5)
    solider_position_bg5:setPositionInContainer(cc.p(129,48))
    table_zhanyi_atk_panel["solider_position_bg5"] = solider_position_bg5

    local enemy_pos12 = fc.FExtensionsImage:create()
    enemy_pos12:setImage("batch_ui/bu_bingzhong_anniu.png")
    enemy_pos12:setSize(cc.size(35,35))
    enemy_pos12:setAnchorPoint(cc.p(0.5,0.5))
    zhanyi_atk_panel:appendComponent(enemy_pos12)
    enemy_pos12:setPositionInContainer(cc.p(129.5,38.5))
    table_zhanyi_atk_panel["enemy_pos12"] = enemy_pos12

    local enemy_pos16 = fc.FExtensionsImage:create()
    enemy_pos16:setImage("batch_ui/bu_bingzhong_anniu.png")
    enemy_pos16:setSize(cc.size(35,35))
    enemy_pos16:setAnchorPoint(cc.p(0.5,0.5))
    zhanyi_atk_panel:appendComponent(enemy_pos16)
    enemy_pos16:setPositionInContainer(cc.p(110.5,74.5))
    table_zhanyi_atk_panel["enemy_pos16"] = enemy_pos16

    local solider_position_bg6 = fc.FExtensionsImage:create()
    solider_position_bg6:setImage("batch_ui/zhenxingyulan.png")
    solider_position_bg6:setSize(cc.size(74,34))
    solider_position_bg6:setAnchorPoint(cc.p(0.5,0.5))
    zhanyi_atk_panel:appendComponent(solider_position_bg6)
    solider_position_bg6:setPositionInContainer(cc.p(176,70))
    table_zhanyi_atk_panel["solider_position_bg6"] = solider_position_bg6

    local enemy_pos13 = fc.FExtensionsImage:create()
    enemy_pos13:setImage("batch_ui/bu_bingzhong_anniu.png")
    enemy_pos13:setSize(cc.size(35,35))
    enemy_pos13:setAnchorPoint(cc.p(0.5,0.5))
    zhanyi_atk_panel:appendComponent(enemy_pos13)
    enemy_pos13:setPositionInContainer(cc.p(175.5,58.5))
    table_zhanyi_atk_panel["enemy_pos13"] = enemy_pos13

    local enemy_pos17 = fc.FExtensionsImage:create()
    enemy_pos17:setImage("batch_ui/bu_bingzhong_anniu.png")
    enemy_pos17:setSize(cc.size(35,35))
    enemy_pos17:setAnchorPoint(cc.p(0.5,0.5))
    zhanyi_atk_panel:appendComponent(enemy_pos17)
    enemy_pos17:setPositionInContainer(cc.p(155.5,94.5))
    table_zhanyi_atk_panel["enemy_pos17"] = enemy_pos17

    local solider_position_bg7 = fc.FExtensionsImage:create()
    solider_position_bg7:setImage("batch_ui/zhenxingyulan.png")
    solider_position_bg7:setSize(cc.size(74,34))
    solider_position_bg7:setAnchorPoint(cc.p(0.5,0.5))
    zhanyi_atk_panel:appendComponent(solider_position_bg7)
    solider_position_bg7:setPositionInContainer(cc.p(222,90))
    table_zhanyi_atk_panel["solider_position_bg7"] = solider_position_bg7

    local enemy_pos14 = fc.FExtensionsImage:create()
    enemy_pos14:setImage("batch_ui/bu_bingzhong_anniu.png")
    enemy_pos14:setSize(cc.size(35,35))
    enemy_pos14:setAnchorPoint(cc.p(0.5,0.5))
    zhanyi_atk_panel:appendComponent(enemy_pos14)
    enemy_pos14:setPositionInContainer(cc.p(222.5,82.5))
    table_zhanyi_atk_panel["enemy_pos14"] = enemy_pos14

    return table_zhanyi_atk_panel

end

