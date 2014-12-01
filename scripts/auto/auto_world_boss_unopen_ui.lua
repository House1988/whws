function createworld_boss_unopen_ui()

    local table_world_boss_unopen_ui = {}

    local world_boss_unopen_ui = fc.FContainerPanel:create()
    world_boss_unopen_ui:setSize(cc.size(960,640))
    table_world_boss_unopen_ui["world_boss_unopen_ui"] = world_boss_unopen_ui

    local bg_2 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyonga_k_1.png",cc.rect(7,7,2,2))
    bg_2:setSize(cc.size(240,30))
    bg_2:setAnchorPoint(cc.p(0.5,0.5))
    world_boss_unopen_ui:appendComponent(bg_2)
    bg_2:setPositionInContainer(cc.p(157,228))
    table_world_boss_unopen_ui["bg_2"] = bg_2

    local pos1 = fc.FExtensionsImage:create()
    pos1:setImage("batch_ui/chengpinzhi_kuang.png")
    pos1:setSize(cc.size(73,73))
    pos1:setAnchorPoint(cc.p(0.5,0.5))
    world_boss_unopen_ui:appendComponent(pos1)
    pos1:setPositionInContainer(cc.p(156.5,285.5))
    table_world_boss_unopen_ui["pos1"] = pos1

    local pos2 = fc.FExtensionsImage:create()
    pos2:setImage("batch_ui/chengpinzhi_kuang.png")
    pos2:setSize(cc.size(73,73))
    pos2:setAnchorPoint(cc.p(0.5,0.5))
    world_boss_unopen_ui:appendComponent(pos2)
    pos2:setPositionInContainer(cc.p(61.5,329.5))
    table_world_boss_unopen_ui["pos2"] = pos2

    local pos3 = fc.FExtensionsImage:create()
    pos3:setImage("batch_ui/chengpinzhi_kuang.png")
    pos3:setSize(cc.size(73,73))
    pos3:setAnchorPoint(cc.p(0.5,0.5))
    world_boss_unopen_ui:appendComponent(pos3)
    pos3:setPositionInContainer(cc.p(156.5,389.5))
    table_world_boss_unopen_ui["pos3"] = pos3

    local pos4 = fc.FExtensionsImage:create()
    pos4:setImage("batch_ui/chengpinzhi_kuang.png")
    pos4:setSize(cc.size(73,73))
    pos4:setAnchorPoint(cc.p(0.5,0.5))
    world_boss_unopen_ui:appendComponent(pos4)
    pos4:setPositionInContainer(cc.p(248.5,329.5))
    table_world_boss_unopen_ui["pos4"] = pos4

    local pos5 = fc.FExtensionsImage:create()
    pos5:setImage("batch_ui/chengpinzhi_kuang.png")
    pos5:setSize(cc.size(73,73))
    pos5:setAnchorPoint(cc.p(0.5,0.5))
    world_boss_unopen_ui:appendComponent(pos5)
    pos5:setPositionInContainer(cc.p(61.5,433.5))
    table_world_boss_unopen_ui["pos5"] = pos5

    local pos6 = fc.FExtensionsImage:create()
    pos6:setImage("batch_ui/chengpinzhi_kuang.png")
    pos6:setSize(cc.size(73,73))
    pos6:setAnchorPoint(cc.p(0.5,0.5))
    world_boss_unopen_ui:appendComponent(pos6)
    pos6:setPositionInContainer(cc.p(156.5,494.5))
    table_world_boss_unopen_ui["pos6"] = pos6

    local pos7 = fc.FExtensionsImage:create()
    pos7:setImage("batch_ui/chengpinzhi_kuang.png")
    pos7:setSize(cc.size(73,73))
    pos7:setAnchorPoint(cc.p(0.5,0.5))
    world_boss_unopen_ui:appendComponent(pos7)
    pos7:setPositionInContainer(cc.p(248.5,433.5))
    table_world_boss_unopen_ui["pos7"] = pos7

    local card_namedi = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shuruwenzi.png",cc.rect(11,9,47,7))
    card_namedi:setSize(cc.size(73,25))
    card_namedi:setAnchorPoint(cc.p(0.5,0.5))
    world_boss_unopen_ui:appendComponent(card_namedi)
    card_namedi:setPositionInContainer(cc.p(61.5,381.5))
    table_world_boss_unopen_ui["card_namedi"] = card_namedi

    local card_namedi = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shuruwenzi.png",cc.rect(11,9,47,7))
    card_namedi:setSize(cc.size(73,25))
    card_namedi:setAnchorPoint(cc.p(0.5,0.5))
    world_boss_unopen_ui:appendComponent(card_namedi)
    card_namedi:setPositionInContainer(cc.p(156.5,336.5))
    table_world_boss_unopen_ui["card_namedi"] = card_namedi

    local card_namedi = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shuruwenzi.png",cc.rect(11,9,47,7))
    card_namedi:setSize(cc.size(73,25))
    card_namedi:setAnchorPoint(cc.p(0.5,0.5))
    world_boss_unopen_ui:appendComponent(card_namedi)
    card_namedi:setPositionInContainer(cc.p(249.5,381.5))
    table_world_boss_unopen_ui["card_namedi"] = card_namedi

    local card_namedi = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shuruwenzi.png",cc.rect(11,9,47,7))
    card_namedi:setSize(cc.size(73,25))
    card_namedi:setAnchorPoint(cc.p(0.5,0.5))
    world_boss_unopen_ui:appendComponent(card_namedi)
    card_namedi:setPositionInContainer(cc.p(156.5,441.5))
    table_world_boss_unopen_ui["card_namedi"] = card_namedi

    local card_namedi = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shuruwenzi.png",cc.rect(11,9,47,7))
    card_namedi:setSize(cc.size(73,25))
    card_namedi:setAnchorPoint(cc.p(0.5,0.5))
    world_boss_unopen_ui:appendComponent(card_namedi)
    card_namedi:setPositionInContainer(cc.p(61.5,485.5))
    table_world_boss_unopen_ui["card_namedi"] = card_namedi

    local card_namedi = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shuruwenzi.png",cc.rect(11,9,47,7))
    card_namedi:setSize(cc.size(73,25))
    card_namedi:setAnchorPoint(cc.p(0.5,0.5))
    world_boss_unopen_ui:appendComponent(card_namedi)
    card_namedi:setPositionInContainer(cc.p(155.5,545.5))
    table_world_boss_unopen_ui["card_namedi"] = card_namedi

    local card_namedi = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shuruwenzi.png",cc.rect(11,9,47,7))
    card_namedi:setSize(cc.size(73,25))
    card_namedi:setAnchorPoint(cc.p(0.5,0.5))
    world_boss_unopen_ui:appendComponent(card_namedi)
    card_namedi:setPositionInContainer(cc.p(249.5,485.5))
    table_world_boss_unopen_ui["card_namedi"] = card_namedi

    local card_name1 = fc.FLabel:createBMFont()
    card_name1:setSize(cc.size(80,25))
    card_name1:setAnchorPoint(cc.p(0.5,0.5))
    card_name1:setFontSize(20)
    card_name1:setString("柳如是")
    card_name1:setColor(cc.c3b(0,255,255))
    world_boss_unopen_ui:appendComponent(card_name1)
    card_name1:setPositionInContainer(cc.p(157,331.5))
    table_world_boss_unopen_ui["card_name1"] = card_name1

    local card_name2 = fc.FLabel:createBMFont()
    card_name2:setSize(cc.size(80,25))
    card_name2:setAnchorPoint(cc.p(0.5,0.5))
    card_name2:setFontSize(20)
    card_name2:setString("柳如是")
    card_name2:setColor(cc.c3b(0,255,255))
    world_boss_unopen_ui:appendComponent(card_name2)
    card_name2:setPositionInContainer(cc.p(61,376.5))
    table_world_boss_unopen_ui["card_name2"] = card_name2

    local card_name3 = fc.FLabel:createBMFont()
    card_name3:setSize(cc.size(80,25))
    card_name3:setAnchorPoint(cc.p(0.5,0.5))
    card_name3:setFontSize(20)
    card_name3:setString("柳如是")
    card_name3:setColor(cc.c3b(0,255,255))
    world_boss_unopen_ui:appendComponent(card_name3)
    card_name3:setPositionInContainer(cc.p(157,436.5))
    table_world_boss_unopen_ui["card_name3"] = card_name3

    local card_name4 = fc.FLabel:createBMFont()
    card_name4:setSize(cc.size(80,25))
    card_name4:setAnchorPoint(cc.p(0.5,0.5))
    card_name4:setFontSize(20)
    card_name4:setString("柳如是")
    card_name4:setColor(cc.c3b(0,255,255))
    world_boss_unopen_ui:appendComponent(card_name4)
    card_name4:setPositionInContainer(cc.p(248,376.5))
    table_world_boss_unopen_ui["card_name4"] = card_name4

    local card_name5 = fc.FLabel:createBMFont()
    card_name5:setSize(cc.size(80,25))
    card_name5:setAnchorPoint(cc.p(0.5,0.5))
    card_name5:setFontSize(20)
    card_name5:setString("柳如是")
    card_name5:setColor(cc.c3b(0,255,255))
    world_boss_unopen_ui:appendComponent(card_name5)
    card_name5:setPositionInContainer(cc.p(61,480.5))
    table_world_boss_unopen_ui["card_name5"] = card_name5

    local card_name6 = fc.FLabel:createBMFont()
    card_name6:setSize(cc.size(80,25))
    card_name6:setAnchorPoint(cc.p(0.5,0.5))
    card_name6:setFontSize(20)
    card_name6:setString("柳如是")
    card_name6:setColor(cc.c3b(0,255,255))
    world_boss_unopen_ui:appendComponent(card_name6)
    card_name6:setPositionInContainer(cc.p(157,540.5))
    table_world_boss_unopen_ui["card_name6"] = card_name6

    local card_name7 = fc.FLabel:createBMFont()
    card_name7:setSize(cc.size(80,25))
    card_name7:setAnchorPoint(cc.p(0.5,0.5))
    card_name7:setFontSize(20)
    card_name7:setString("柳如是")
    card_name7:setColor(cc.c3b(0,255,255))
    world_boss_unopen_ui:appendComponent(card_name7)
    card_name7:setPositionInContainer(cc.p(248,480.5))
    table_world_boss_unopen_ui["card_name7"] = card_name7

    local bg_3 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyonga_k_1.png",cc.rect(7,7,2,2))
    bg_3:setSize(cc.size(275,30))
    bg_3:setAnchorPoint(cc.p(0.5,0.5))
    world_boss_unopen_ui:appendComponent(bg_3)
    bg_3:setPositionInContainer(cc.p(158.5,588))
    table_world_boss_unopen_ui["bg_3"] = bg_3

    local sub_title1 = fc.FLabel:createBMFont()
    sub_title1:setSize(cc.size(114,25))
    sub_title1:setAnchorPoint(cc.p(0.5,0.5))
    sub_title1:setFontSize(20)
    if LANGUAGE_TYPE == 3 then
	    sub_title1:setString("敵軍陣容")    
    else
	    sub_title1:setString("敌军阵容")
    end
    sub_title1:setColor(cc.c3b(250,255,165))
    world_boss_unopen_ui:appendComponent(sub_title1)
    sub_title1:setPositionInContainer(cc.p(157,224.5))
    table_world_boss_unopen_ui["sub_title1"] = sub_title1

    local sub_title2 = fc.FLabel:createBMFont()
    sub_title2:setSize(cc.size(125,25))
    sub_title2:setAnchorPoint(cc.p(0.5,0.5))
    sub_title2:setFontSize(20)
    if LANGUAGE_TYPE == 3 then
    	sub_title2:setString("朕的功績值：")
    else
	    sub_title2:setString("朕的功绩值：")
    end
    sub_title2:setColor(cc.c3b(250,255,165))
    world_boss_unopen_ui:appendComponent(sub_title2)
    sub_title2:setPositionInContainer(cc.p(116.5,584.5))
    table_world_boss_unopen_ui["sub_title2"] = sub_title2

    local cur_contribute_num = fc.FLabel:createBMFont()
    cur_contribute_num:setSize(cc.size(80,25))
    cur_contribute_num:setAnchorPoint(cc.p(0.5,0.5))
    cur_contribute_num:setFontSize(20)
    cur_contribute_num:setString("1000")
    cur_contribute_num:setColor(cc.c3b(250,255,165))
    cur_contribute_num:setAlignment(0)
    world_boss_unopen_ui:appendComponent(cur_contribute_num)
    cur_contribute_num:setPositionInContainer(cc.p(216,584.5))
    table_world_boss_unopen_ui["cur_contribute_num"] = cur_contribute_num

    local bg_4 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyonga_70_1.png",cc.rect(7,7,2,2))
    bg_4:setSize(cc.size(590,120))
    bg_4:setAnchorPoint(cc.p(0.5,0.5))
    world_boss_unopen_ui:appendComponent(bg_4)
    bg_4:setPositionInContainer(cc.p(636,257))
    table_world_boss_unopen_ui["bg_4"] = bg_4

    local bg_5 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyonga_70_1.png",cc.rect(7,7,2,2))
    bg_5:setSize(cc.size(590,90))
    bg_5:setAnchorPoint(cc.p(0.5,0.5))
    world_boss_unopen_ui:appendComponent(bg_5)
    bg_5:setPositionInContainer(cc.p(636,369))
    table_world_boss_unopen_ui["bg_5"] = bg_5

    local bg_6 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyonga_70_1.png",cc.rect(7,7,2,2))
    bg_6:setSize(cc.size(590,180))
    bg_6:setAnchorPoint(cc.p(0.5,0.5))
    world_boss_unopen_ui:appendComponent(bg_6)
    bg_6:setPositionInContainer(cc.p(636,509))
    table_world_boss_unopen_ui["bg_6"] = bg_6

    local bg_7 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyonga_k_1.png",cc.rect(7,7,2,2))
    bg_7:setSize(cc.size(390,75))
    bg_7:setAnchorPoint(cc.p(0.5,0.5))
    world_boss_unopen_ui:appendComponent(bg_7)
    bg_7:setPositionInContainer(cc.p(636,368.5))
    table_world_boss_unopen_ui["bg_7"] = bg_7

    local bg_8 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyonga_k_1.png",cc.rect(7,7,2,2))
    bg_8:setSize(cc.size(390,90))
    bg_8:setAnchorPoint(cc.p(0.5,0.5))
    world_boss_unopen_ui:appendComponent(bg_8)
    bg_8:setPositionInContainer(cc.p(636,480))
    table_world_boss_unopen_ui["bg_8"] = bg_8

    local gongji_exchange = fc.FScaleButton:create()
    gongji_exchange:setSize(cc.size(144,53))
    gongji_exchange:setAnchorPoint(cc.p(0.5,0.5))
    gongji_exchange:setButtonImage("batch_ui/putonganniu1_up.png")
    world_boss_unopen_ui:appendComponent(gongji_exchange)
    gongji_exchange:setPositionInContainer(cc.p(491,563.5))
    table_world_boss_unopen_ui["gongji_exchange"] = gongji_exchange

    local gong = fc.FExtensionsImage:create()
    gong:setImage("batch_ui/gong2_uizi.png")
    gong:setSize(cc.size(32,32))
    gong:setAnchorPoint(cc.p(0.5,0.5))
    gongji_exchange:appendComponent(gong)
    gong:setPositionInContainer(cc.p(19,26))
    table_world_boss_unopen_ui["gong"] = gong

    local ji = fc.FExtensionsImage:create()
    ji:setImage("batch_ui/ji6_uizi.png")
    ji:setSize(cc.size(32,32))
    ji:setAnchorPoint(cc.p(0.5,0.5))
    gongji_exchange:appendComponent(ji)
    ji:setPositionInContainer(cc.p(44,26))
    table_world_boss_unopen_ui["ji"] = ji

    local zhi = fc.FExtensionsImage:create()
    zhi:setImage("batch_ui/zhi_uizi.png")
    zhi:setSize(cc.size(32,32))
    zhi:setAnchorPoint(cc.p(0.5,0.5))
    gongji_exchange:appendComponent(zhi)
    zhi:setPositionInContainer(cc.p(69,26))
    table_world_boss_unopen_ui["zhi"] = zhi

    local dui = fc.FExtensionsImage:create()
    dui:setImage("batch_ui/dui2_uizi.png")
    dui:setSize(cc.size(32,32))
    dui:setAnchorPoint(cc.p(0.5,0.5))
    gongji_exchange:appendComponent(dui)
    dui:setPositionInContainer(cc.p(94,27))
    table_world_boss_unopen_ui["dui"] = dui

    local huan = fc.FExtensionsImage:create()
    huan:setImage("batch_ui/huan_uizi.png")
    huan:setSize(cc.size(32,32))
    huan:setAnchorPoint(cc.p(0.5,0.5))
    gongji_exchange:appendComponent(huan)
    huan:setPositionInContainer(cc.p(120,27))
    table_world_boss_unopen_ui["huan"] = huan

    local history_rank = fc.FScaleButton:create()
    history_rank:setSize(cc.size(144,53))
    history_rank:setAnchorPoint(cc.p(0.5,0.5))
    history_rank:setButtonImage("batch_ui/putonganniu1_up.png")
    world_boss_unopen_ui:appendComponent(history_rank)
    history_rank:setPositionInContainer(cc.p(781,563.5))
    table_world_boss_unopen_ui["history_rank"] = history_rank

    local li = fc.FExtensionsImage:create()
    li:setImage("batch_ui/li_uizi (2).png")
    li:setSize(cc.size(32,32))
    li:setAnchorPoint(cc.p(0.5,0.5))
    history_rank:appendComponent(li)
    li:setPositionInContainer(cc.p(29,26))
    table_world_boss_unopen_ui["li"] = li

    local shi = fc.FExtensionsImage:create()
    shi:setImage("batch_ui/shi_uizi (2).png")
    shi:setSize(cc.size(32,32))
    shi:setAnchorPoint(cc.p(0.5,0.5))
    history_rank:appendComponent(shi)
    shi:setPositionInContainer(cc.p(57,26))
    table_world_boss_unopen_ui["shi"] = shi

    local bang = fc.FExtensionsImage:create()
    bang:setImage("batch_ui/bang_uizi.png")
    bang:setSize(cc.size(32,32))
    bang:setAnchorPoint(cc.p(0.5,0.5))
    history_rank:appendComponent(bang)
    bang:setPositionInContainer(cc.p(84,26))
    table_world_boss_unopen_ui["bang"] = bang

    local dan = fc.FExtensionsImage:create()
    dan:setImage("batch_ui/dan_uizi.png")
    dan:setSize(cc.size(32,32))
    dan:setAnchorPoint(cc.p(0.5,0.5))
    history_rank:appendComponent(dan)
    dan:setPositionInContainer(cc.p(112,27))
    table_world_boss_unopen_ui["dan"] = dan

    local boss_des = fc.FLabel:createBMFont()
    boss_des:setSize(cc.size(580,60))
    boss_des:setWidth(580)
    boss_des:setAnchorPoint(cc.p(0.5,0.5))
    boss_des:setFontSize(20)
    boss_des:setString("描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述")
    boss_des:setColor(cc.c3b(250,255,165))
    world_boss_unopen_ui:appendComponent(boss_des)
    boss_des:setPositionInContainer(cc.p(637,244))
    table_world_boss_unopen_ui["boss_des"] = boss_des

    local activity_time = fc.FLabel:createBMFont()
    activity_time:setSize(cc.size(125,25))
    activity_time:setAnchorPoint(cc.p(0.5,0.5))
    activity_time:setFontSize(20)
    activity_time:setString("今日12:00:00")
    activity_time:setColor(cc.c3b(0,255,0))
    activity_time:setAlignment(0)
    world_boss_unopen_ui:appendComponent(activity_time)
    activity_time:setPositionInContainer(cc.p(554.5,351.5))
    table_world_boss_unopen_ui["activity_time"] = activity_time

    local des2 = fc.FLabel:createBMFont()
    des2:setSize(cc.size(160,25))
    des2:setAnchorPoint(cc.p(0.5,0.5))
    des2:setFontSize(20)
    if LANGUAGE_TYPE  == 3 then
    	des2:setString("可挑戰古代帝王")
    else
	    des2:setString("可挑战古代帝王")
    end
    des2:setColor(cc.c3b(255,0,0))
    des2:setAlignment(0)
    world_boss_unopen_ui:appendComponent(des2)
    des2:setPositionInContainer(cc.p(697,351.5))
    table_world_boss_unopen_ui["des2"] = des2

    local des3 = fc.FLabel:createBMFont()
    des3:setSize(cc.size(265,25))
    des3:setAnchorPoint(cc.p(0.5,0.5))
    des3:setFontSize(20)
    des3:setString("上次击杀boss最后一滴血的玩家是")
    des3:setColor(cc.c3b(250,255,165))
    world_boss_unopen_ui:appendComponent(des3)
    des3:setPositionInContainer(cc.p(635.5,453.5))
    table_world_boss_unopen_ui["des3"] = des3

    local kill_player_name = fc.FLabel:createBMFont()
    kill_player_name:setSize(cc.size(265,25))
    kill_player_name:setAnchorPoint(cc.p(0.5,0.5))
    kill_player_name:setFontSize(20)
    kill_player_name:setString("xzz铮哥哥")
    kill_player_name:setColor(cc.c3b(0,255,255))
    world_boss_unopen_ui:appendComponent(kill_player_name)
    kill_player_name:setPositionInContainer(cc.p(635.5,477.5))
    table_world_boss_unopen_ui["kill_player_name"] = kill_player_name

    local des4 = fc.FLabel:createBMFont()
    des4:setSize(cc.size(110,25))
    des4:setAnchorPoint(cc.p(0.5,0.5))
    des4:setFontSize(20)
    des4:setString("获得功绩值：")
    des4:setColor(cc.c3b(250,255,165))
    world_boss_unopen_ui:appendComponent(des4)
    des4:setPositionInContainer(cc.p(612,503.5))
    table_world_boss_unopen_ui["des4"] = des4

    local last_reward_contri_num = fc.FLabel:createBMFont()
    last_reward_contri_num:setSize(cc.size(60,25))
    last_reward_contri_num:setAnchorPoint(cc.p(0.5,0.5))
    last_reward_contri_num:setFontSize(20)
    last_reward_contri_num:setString("1000")
    last_reward_contri_num:setColor(cc.c3b(250,255,165))
    last_reward_contri_num:setAlignment(0)
    world_boss_unopen_ui:appendComponent(last_reward_contri_num)
    last_reward_contri_num:setPositionInContainer(cc.p(696,503.5))
    table_world_boss_unopen_ui["last_reward_contri_num"] = last_reward_contri_num

    local card1 = fc.FExtensionsImage:create()
    card1:setAnchorPoint(cc.p(0.5,0.5))
    world_boss_unopen_ui:appendComponent(card1)
    card1:setPositionInContainer(cc.p(156.5,284.5))
    table_world_boss_unopen_ui["card1"] = card1

    local card2 = fc.FExtensionsImage:create()
    card2:setAnchorPoint(cc.p(0.5,0.5))
    world_boss_unopen_ui:appendComponent(card2)
    card2:setPositionInContainer(cc.p(61.5,329.5))
    table_world_boss_unopen_ui["card2"] = card2

    local card3 = fc.FExtensionsImage:create()
    card3:setAnchorPoint(cc.p(0.5,0.5))
    world_boss_unopen_ui:appendComponent(card3)
    card3:setPositionInContainer(cc.p(156.5,388.5))
    table_world_boss_unopen_ui["card3"] = card3

    local card4 = fc.FExtensionsImage:create()
    card4:setAnchorPoint(cc.p(0.5,0.5))
    world_boss_unopen_ui:appendComponent(card4)
    card4:setPositionInContainer(cc.p(248.5,329.5))
    table_world_boss_unopen_ui["card4"] = card4

    local card5 = fc.FExtensionsImage:create()
    card5:setAnchorPoint(cc.p(0.5,0.5))
    world_boss_unopen_ui:appendComponent(card5)
    card5:setPositionInContainer(cc.p(61.5,433.5))
    table_world_boss_unopen_ui["card5"] = card5

    local card6 = fc.FExtensionsImage:create()
    card6:setAnchorPoint(cc.p(0.5,0.5))
    world_boss_unopen_ui:appendComponent(card6)
    card6:setPositionInContainer(cc.p(156.5,494.5))
    table_world_boss_unopen_ui["card6"] = card6

    local card7 = fc.FExtensionsImage:create()
    card7:setAnchorPoint(cc.p(0.5,0.5))
    world_boss_unopen_ui:appendComponent(card7)
    card7:setPositionInContainer(cc.p(248.5,433.5))
    table_world_boss_unopen_ui["card7"] = card7

    local des6 = fc.FLabel:createBMFont()
    des6:setSize(cc.size(200,25))
    des6:setAnchorPoint(cc.p(0.5,0.5))
    des6:setFontSize(20)
    if LANGUAGE_TYPE == 3 then
	    des6:setString("距離下次挑戰還剩：")    
    else
	    des6:setString("距离下次挑战还剩：")
    end
    des6:setColor(cc.c3b(255,0,0))
    des6:setAlignment(0)
    world_boss_unopen_ui:appendComponent(des6)
    des6:setPositionInContainer(cc.p(592,381.5))
    table_world_boss_unopen_ui["des6"] = des6

    local next_left_time = fc.FLabel:createBMFont()
    next_left_time:setSize(cc.size(90,25))
    next_left_time:setAnchorPoint(cc.p(0.5,0.5))
    next_left_time:setFontSize(20)
    next_left_time:setString("12:00:00")
    next_left_time:setColor(cc.c3b(0,255,0))
    next_left_time:setAlignment(0)
    world_boss_unopen_ui:appendComponent(next_left_time)
    next_left_time:setPositionInContainer(cc.p(720,381.5))
    table_world_boss_unopen_ui["next_left_time"] = next_left_time

    local boss_arr_flag = fc.FExtensionsImage:create()
    boss_arr_flag:setImage("batch_ui/gongji_tubiao.png")
    boss_arr_flag:setSize(cc.size(53,70))
    boss_arr_flag:setAnchorPoint(cc.p(0.5,0.5))
    world_boss_unopen_ui:appendComponent(boss_arr_flag)
    boss_arr_flag:setPositionInContainer(cc.p(248.5,233))
    table_world_boss_unopen_ui["boss_arr_flag"] = boss_arr_flag

    return table_world_boss_unopen_ui

end

