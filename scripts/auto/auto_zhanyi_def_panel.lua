function createzhanyi_def_panel()

    local table_zhanyi_def_panel = {}

    local zhanyi_def_panel = fc.FContainerPanel:create()
    zhanyi_def_panel:setSize(cc.size(265,130))
    table_zhanyi_def_panel["zhanyi_def_panel"] = zhanyi_def_panel

    local solider_position_bg8 = fc.FExtensionsImage:create()
    solider_position_bg8:setImage("batch_ui/zhenxingyulan.png")
    solider_position_bg8:setSize(cc.size(74,34))
    solider_position_bg8:setAnchorPoint(cc.p(0.5,0.5))
    zhanyi_def_panel:appendComponent(solider_position_bg8)
    solider_position_bg8:setPositionInContainer(cc.p(41,45))
    table_zhanyi_def_panel["solider_position_bg8"] = solider_position_bg8

    local enemy_pos21 = fc.FExtensionsImage:create()
    enemy_pos21:setImage("batch_ui/bu_bingzhong_anniu.png")
    enemy_pos21:setSize(cc.size(35,35))
    enemy_pos21:setAnchorPoint(cc.p(0.5,0.5))
    zhanyi_def_panel:appendComponent(enemy_pos21)
    enemy_pos21:setPositionInContainer(cc.p(43.5,36.5))
    table_zhanyi_def_panel["enemy_pos21"] = enemy_pos21

    local solider_position_bg9 = fc.FExtensionsImage:create()
    solider_position_bg9:setImage("batch_ui/zhenxingyulan.png")
    solider_position_bg9:setSize(cc.size(74,34))
    solider_position_bg9:setAnchorPoint(cc.p(0.5,0.5))
    zhanyi_def_panel:appendComponent(solider_position_bg9)
    solider_position_bg9:setPositionInContainer(cc.p(89,66))
    table_zhanyi_def_panel["solider_position_bg9"] = solider_position_bg9

    local solider_position_bg10 = fc.FExtensionsImage:create()
    solider_position_bg10:setImage("batch_ui/zhenxingyulan.png")
    solider_position_bg10:setSize(cc.size(74,34))
    solider_position_bg10:setAnchorPoint(cc.p(0.5,0.5))
    zhanyi_def_panel:appendComponent(solider_position_bg10)
    solider_position_bg10:setPositionInContainer(cc.p(136,88))
    table_zhanyi_def_panel["solider_position_bg10"] = solider_position_bg10

    local solider_position_bg11 = fc.FExtensionsImage:create()
    solider_position_bg11:setImage("batch_ui/zhenxingyulan.png")
    solider_position_bg11:setSize(cc.size(74,34))
    solider_position_bg11:setAnchorPoint(cc.p(0.5,0.5))
    zhanyi_def_panel:appendComponent(solider_position_bg11)
    solider_position_bg11:setPositionInContainer(cc.p(184,109))
    table_zhanyi_def_panel["solider_position_bg11"] = solider_position_bg11

    local solider_position_bg12 = fc.FExtensionsImage:create()
    solider_position_bg12:setImage("batch_ui/zhenxingyulan.png")
    solider_position_bg12:setSize(cc.size(74,34))
    solider_position_bg12:setAnchorPoint(cc.p(0.5,0.5))
    zhanyi_def_panel:appendComponent(solider_position_bg12)
    solider_position_bg12:setPositionInContainer(cc.p(111,33))
    table_zhanyi_def_panel["solider_position_bg12"] = solider_position_bg12

    local enemy_pos25 = fc.FExtensionsImage:create()
    enemy_pos25:setImage("batch_ui/bu_bingzhong_anniu.png")
    enemy_pos25:setSize(cc.size(35,35))
    enemy_pos25:setAnchorPoint(cc.p(0.5,0.5))
    zhanyi_def_panel:appendComponent(enemy_pos25)
    enemy_pos25:setPositionInContainer(cc.p(109.5,25.5))
    table_zhanyi_def_panel["enemy_pos25"] = enemy_pos25

    local solider_position_bg13 = fc.FExtensionsImage:create()
    solider_position_bg13:setImage("batch_ui/zhenxingyulan.png")
    solider_position_bg13:setSize(cc.size(74,34))
    solider_position_bg13:setAnchorPoint(cc.p(0.5,0.5))
    zhanyi_def_panel:appendComponent(solider_position_bg13)
    solider_position_bg13:setPositionInContainer(cc.p(158,55))
    table_zhanyi_def_panel["solider_position_bg13"] = solider_position_bg13

    local enemy_pos26 = fc.FExtensionsImage:create()
    enemy_pos26:setImage("batch_ui/bu_bingzhong_anniu.png")
    enemy_pos26:setSize(cc.size(35,35))
    enemy_pos26:setAnchorPoint(cc.p(0.5,0.5))
    zhanyi_def_panel:appendComponent(enemy_pos26)
    enemy_pos26:setPositionInContainer(cc.p(157.5,46.5))
    table_zhanyi_def_panel["enemy_pos26"] = enemy_pos26

    local solider_position_bg14 = fc.FExtensionsImage:create()
    solider_position_bg14:setImage("batch_ui/zhenxingyulan.png")
    solider_position_bg14:setSize(cc.size(74,34))
    solider_position_bg14:setAnchorPoint(cc.p(0.5,0.5))
    zhanyi_def_panel:appendComponent(solider_position_bg14)
    solider_position_bg14:setPositionInContainer(cc.p(205,77))
    table_zhanyi_def_panel["solider_position_bg14"] = solider_position_bg14

    local enemy_pos27 = fc.FExtensionsImage:create()
    enemy_pos27:setImage("batch_ui/bu_bingzhong_anniu.png")
    enemy_pos27:setSize(cc.size(35,35))
    enemy_pos27:setAnchorPoint(cc.p(0.5,0.5))
    zhanyi_def_panel:appendComponent(enemy_pos27)
    enemy_pos27:setPositionInContainer(cc.p(205.5,67.5))
    table_zhanyi_def_panel["enemy_pos27"] = enemy_pos27

    local enemy_pos24 = fc.FExtensionsImage:create()
    enemy_pos24:setImage("batch_ui/bu_bingzhong_anniu.png")
    enemy_pos24:setSize(cc.size(35,35))
    enemy_pos24:setAnchorPoint(cc.p(0.5,0.5))
    zhanyi_def_panel:appendComponent(enemy_pos24)
    enemy_pos24:setPositionInContainer(cc.p(182.5,99.5))
    table_zhanyi_def_panel["enemy_pos24"] = enemy_pos24

    local enemy_pos23 = fc.FExtensionsImage:create()
    enemy_pos23:setImage("batch_ui/bu_bingzhong_anniu.png")
    enemy_pos23:setSize(cc.size(35,35))
    enemy_pos23:setAnchorPoint(cc.p(0.5,0.5))
    zhanyi_def_panel:appendComponent(enemy_pos23)
    enemy_pos23:setPositionInContainer(cc.p(136.5,78.5))
    table_zhanyi_def_panel["enemy_pos23"] = enemy_pos23

    local enemy_pos22 = fc.FExtensionsImage:create()
    enemy_pos22:setImage("batch_ui/bu_bingzhong_anniu.png")
    enemy_pos22:setSize(cc.size(35,35))
    enemy_pos22:setAnchorPoint(cc.p(0.5,0.5))
    zhanyi_def_panel:appendComponent(enemy_pos22)
    enemy_pos22:setPositionInContainer(cc.p(89.5,57.5))
    table_zhanyi_def_panel["enemy_pos22"] = enemy_pos22

    return table_zhanyi_def_panel

end

