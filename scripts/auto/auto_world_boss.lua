function createworld_boss()

    local table_world_boss = {}

    local world_boss = fc.FContainerPanel:create()
    world_boss:setSize(cc.size(960,640))
    table_world_boss["world_boss"] = world_boss

    local up_bar = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongbiankuang3_ciguan.png",cc.rect(40,0,2,13))
    up_bar:setSize(cc.size(960,13))
    up_bar:setAnchorPoint(cc.p(0.5,0.5))
    world_boss:appendComponent(up_bar)
    up_bar:setPositionInContainer(cc.p(480,141.5))
    table_world_boss["up_bar"] = up_bar

    local up_bar = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongbiankuang3_ciguan.png",cc.rect(40,0,2,13))
    up_bar:setSize(cc.size(960,13))
    up_bar:setAnchorPoint(cc.p(0.5,0.5))
    world_boss:appendComponent(up_bar)
    up_bar:setPositionInContainer(cc.p(480,613.5))
    table_world_boss["up_bar"] = up_bar

    local mid_bar = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tangquanxinggongbar_tangquanxinggong.png",cc.rect(0,56,25,2))
    mid_bar:setSize(cc.size(25,485))
    mid_bar:setAnchorPoint(cc.p(0.5,0.5))
    world_boss:appendComponent(mid_bar)
    mid_bar:setPositionInContainer(cc.p(2.5,377.5))
    table_world_boss["mid_bar"] = mid_bar

    local bg_1 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyonga_100_1.png",cc.rect(7,7,2,2))
    bg_1:setSize(cc.size(300,405))
    bg_1:setAnchorPoint(cc.p(0.5,0.5))
    world_boss:appendComponent(bg_1)
    bg_1:setPositionInContainer(cc.p(156,404.5))
    table_world_boss["bg_1"] = bg_1

    local boss_title_bg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/mingzikuang.png",cc.rect(43,25,1,1))
    boss_title_bg:setSize(cc.size(265,63))
    boss_title_bg:setAnchorPoint(cc.p(0.5,0.5))
    world_boss:appendComponent(boss_title_bg)
    boss_title_bg:setPositionInContainer(cc.p(157,177.5))
    table_world_boss["boss_title_bg"] = boss_title_bg

    local boss_title = fc.FLabel:createBMFont()
    boss_title:setSize(cc.size(120,35))
    boss_title:setAnchorPoint(cc.p(0.5,0.5))
    boss_title:setFontSize(32)
    boss_title:setString("秦王嬴政")
    boss_title:setColor(cc.c3b(255,255,0))
    world_boss:appendComponent(boss_title)
    boss_title:setPositionInContainer(cc.p(157,170.5))
    table_world_boss["boss_title"] = boss_title

    local big_bg = fc.FExtensionsImage:create()
    big_bg:setImage("nobatch/shijieboss_ditu.png")
    big_bg:setSize(cc.size(640,460))
    big_bg:setAnchorPoint(cc.p(0.5,0.5))
    world_boss:appendComponent(big_bg)
    big_bg:setPositionInContainer(cc.p(633,377))
    table_world_boss["big_bg"] = big_bg

    local mid_bar = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tangquanxinggongbar_tangquanxinggong.png",cc.rect(0,56,25,2))
    mid_bar:setSize(cc.size(25,485))
    mid_bar:setAnchorPoint(cc.p(0.5,0.5))
    world_boss:appendComponent(mid_bar)
    mid_bar:setPositionInContainer(cc.p(314.5,377.5))
    table_world_boss["mid_bar"] = mid_bar

    local mid_bar = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tangquanxinggongbar_tangquanxinggong.png",cc.rect(0,56,25,2))
    mid_bar:setSize(cc.size(25,485))
    mid_bar:setAnchorPoint(cc.p(0.5,0.5))
    world_boss:appendComponent(mid_bar)
    mid_bar:setPositionInContainer(cc.p(956.5,377.5))
    table_world_boss["mid_bar"] = mid_bar

    local long_bar = fc.FScale9Image:createWithBatchUIFrame("batch_ui/xingjikuang_tangquanxinggong.png",cc.rect(72,16,5,5))
    long_bar:setSize(cc.size(615,42))
    long_bar:setAnchorPoint(cc.p(0.5,0.5))
    long_bar:setRotation(180)
    world_boss:appendComponent(long_bar)
    long_bar:setPositionInContainer(cc.p(636.5,168))
    table_world_boss["long_bar"] = long_bar

    local title_des_label = fc.FLabel:createBMFont()
    title_des_label:setSize(cc.size(320,35))
    title_des_label:setAnchorPoint(cc.p(0.5,0.5))
    title_des_label:setFontSize(21)
    if LANGUAGE_TYPE == 3 then
    	title_des_label:setString("挑戰古代帝王，贏取海量功績值！")
    else
	    title_des_label:setString("挑战古代帝王，赢取海量功绩值！")
    end
    title_des_label:setColor(cc.c3b(255,255,0))
    world_boss:appendComponent(title_des_label)
    title_des_label:setPositionInContainer(cc.p(636,163.5))
    table_world_boss["title_des_label"] = title_des_label

    return table_world_boss

end

