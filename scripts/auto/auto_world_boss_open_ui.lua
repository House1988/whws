function createworld_boss_open_ui()

    local table_world_boss_open_ui = {}

    local world_boss_open_ui = fc.FContainerPanel:create()
    world_boss_open_ui:setSize(cc.size(960,640))
    table_world_boss_open_ui["world_boss_open_ui"] = world_boss_open_ui

    local open_bg1 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyonga_k_1.png",cc.rect(7,7,2,2))
    open_bg1:setSize(cc.size(240,30))
    open_bg1:setAnchorPoint(cc.p(0.5,0.5))
    world_boss_open_ui:appendComponent(open_bg1)
    open_bg1:setPositionInContainer(cc.p(157,226))
    table_world_boss_open_ui["open_bg1"] = open_bg1

    local subtitle1 = fc.FLabel:createBMFont()
    subtitle1:setSize(cc.size(160,25))
    subtitle1:setAnchorPoint(cc.p(0.5,0.5))
    subtitle1:setFontSize(20)
    subtitle1:setString("当前boss伤害排行")
    subtitle1:setColor(cc.c3b(0,255,0))
    world_boss_open_ui:appendComponent(subtitle1)
    subtitle1:setPositionInContainer(cc.p(157,222.5))
    table_world_boss_open_ui["subtitle1"] = subtitle1

    local open_bg2 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyonga_k_1.png",cc.rect(7,7,2,2))
    open_bg2:setSize(cc.size(275,30))
    open_bg2:setAnchorPoint(cc.p(0.5,0.5))
    world_boss_open_ui:appendComponent(open_bg2)
    open_bg2:setPositionInContainer(cc.p(157.5,586))
    table_world_boss_open_ui["open_bg2"] = open_bg2

    local open_subt2 = fc.FLabel:createBMFont()
    open_subt2:setSize(cc.size(105,25))
    open_subt2:setAnchorPoint(cc.p(0.5,0.5))
    open_subt2:setFontSize(20)
    open_subt2:setString("朕的排名：")
    open_subt2:setColor(cc.c3b(0,255,0))
    world_boss_open_ui:appendComponent(open_subt2)
    open_subt2:setPositionInContainer(cc.p(77.5,582.5))
    table_world_boss_open_ui["open_subt2"] = open_subt2

    local open_myrank = fc.FLabel:createBMFont()
    open_myrank:setSize(cc.size(40,25))
    open_myrank:setAnchorPoint(cc.p(0.5,0.5))
    open_myrank:setFontSize(20)
    open_myrank:setString("1000")
    open_myrank:setColor(cc.c3b(0,255,0))
    open_myrank:setAlignment(0)
    world_boss_open_ui:appendComponent(open_myrank)
    open_myrank:setPositionInContainer(cc.p(148,582.5))
    table_world_boss_open_ui["open_myrank"] = open_myrank

    local open_myhurt = fc.FLabel:createBMFont()
    open_myhurt:setSize(cc.size(84,25))
    open_myhurt:setAnchorPoint(cc.p(0.5,0.5))
    open_myhurt:setFontSize(20)
    open_myhurt:setString("伤害值：")
    open_myhurt:setColor(cc.c3b(0,255,0))
    world_boss_open_ui:appendComponent(open_myhurt)
    open_myhurt:setPositionInContainer(cc.p(189,582.5))
    table_world_boss_open_ui["open_myhurt"] = open_myhurt

    local open_myhurtnum = fc.FLabel:createBMFont()
    open_myhurtnum:setSize(cc.size(40,25))
    open_myhurtnum:setAnchorPoint(cc.p(0.5,0.5))
    open_myhurtnum:setFontSize(20)
    open_myhurtnum:setString("999")
    open_myhurtnum:setColor(cc.c3b(0,255,0))
    open_myhurtnum:setAlignment(0)
    world_boss_open_ui:appendComponent(open_myhurtnum)
    open_myhurtnum:setPositionInContainer(cc.p(246,582.5))
    table_world_boss_open_ui["open_myhurtnum"] = open_myhurtnum

    local open_bg3 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyonga_70_1.png",cc.rect(7,7,2,2))
    open_bg3:setSize(cc.size(590,100))
    open_bg3:setAnchorPoint(cc.p(0.5,0.5))
    world_boss_open_ui:appendComponent(open_bg3)
    open_bg3:setPositionInContainer(cc.p(636,243))
    table_world_boss_open_ui["open_bg3"] = open_bg3

    local open_leftTime = fc.FLabel:createBMFont()
    open_leftTime:setSize(cc.size(150,25))
    open_leftTime:setAnchorPoint(cc.p(0.5,0.5))
    open_leftTime:setFontSize(20)
    open_leftTime:setString("挑战剩余时间：")
    open_leftTime:setColor(cc.c3b(250,255,165))
    world_boss_open_ui:appendComponent(open_leftTime)
    open_leftTime:setPositionInContainer(cc.p(463,218.5))
    table_world_boss_open_ui["open_leftTime"] = open_leftTime

    local open_challenge_leftTime = fc.FLabel:createBMFont()
    open_challenge_leftTime:setSize(cc.size(90,25))
    open_challenge_leftTime:setAnchorPoint(cc.p(0.5,0.5))
    open_challenge_leftTime:setFontSize(20)
    open_challenge_leftTime:setString("12:00:00")
    open_challenge_leftTime:setColor(cc.c3b(255,255,0))
    open_challenge_leftTime:setAlignment(0)
    world_boss_open_ui:appendComponent(open_challenge_leftTime)
    open_challenge_leftTime:setPositionInContainer(cc.p(584,218.5))
    table_world_boss_open_ui["open_challenge_leftTime"] = open_challenge_leftTime

    local open_cur_people = fc.FLabel:createBMFont()
    open_cur_people:setSize(cc.size(150,25))
    open_cur_people:setAnchorPoint(cc.p(0.5,0.5))
    open_cur_people:setFontSize(20)
    open_cur_people:setString("当前参与人数：")
    open_cur_people:setColor(cc.c3b(250,255,165))
    world_boss_open_ui:appendComponent(open_cur_people)
    open_cur_people:setPositionInContainer(cc.p(738,218.5))
    table_world_boss_open_ui["open_cur_people"] = open_cur_people

    local open_cur_peoplenum = fc.FLabel:createBMFont()
    open_cur_peoplenum:setSize(cc.size(60,25))
    open_cur_peoplenum:setAnchorPoint(cc.p(0.5,0.5))
    open_cur_peoplenum:setFontSize(20)
    open_cur_peoplenum:setString("1000")
    open_cur_peoplenum:setColor(cc.c3b(255,255,0))
    open_cur_peoplenum:setAlignment(0)
    world_boss_open_ui:appendComponent(open_cur_peoplenum)
    open_cur_peoplenum:setPositionInContainer(cc.p(844,218.5))
    table_world_boss_open_ui["open_cur_peoplenum"] = open_cur_peoplenum

    local open_enemy_left = fc.FLabel:createBMFont()
    open_enemy_left:setSize(cc.size(150,25))
    open_enemy_left:setAnchorPoint(cc.p(0.5,0.5))
    open_enemy_left:setFontSize(20)
    open_enemy_left:setString("敌军剩余兵力：")
    open_enemy_left:setColor(cc.c3b(250,255,165))
    world_boss_open_ui:appendComponent(open_enemy_left)
    open_enemy_left:setPositionInContainer(cc.p(464,255.5))
    table_world_boss_open_ui["open_enemy_left"] = open_enemy_left

    local open_loadingbg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/jindutiaokuang_kapai.png",cc.rect(16,11,4,4))
    open_loadingbg:setSize(cc.size(320,25))
    open_loadingbg:setAnchorPoint(cc.p(0.5,0.5))
    world_boss_open_ui:appendComponent(open_loadingbg)
    open_loadingbg:setPositionInContainer(cc.p(757,256.5))
    table_world_boss_open_ui["open_loadingbg"] = open_loadingbg

    local open_loadingBar = fc.FLoadingBar:create()
    open_loadingBar:setLoadingBarImage("batch_ui/jindutiao_1.png")
    open_loadingBar:setSize(cc.size(311,19))
    open_loadingBar:setAnchorPoint(cc.p(0.5,0.5))
    open_loadingBar:setPercent(70)
    world_boss_open_ui:appendComponent(open_loadingBar)
    open_loadingBar:setPositionInContainer(cc.p(756.5,256.5))
    table_world_boss_open_ui["open_loadingBar"] = open_loadingBar

    local enemy_hurt_show = fc.FLabel:createBMFont()
    enemy_hurt_show:setSize(cc.size(165,25))
    enemy_hurt_show:setAnchorPoint(cc.p(0.5,0.5))
    enemy_hurt_show:setFontSize(20)
    enemy_hurt_show:setString("1000/1000")
    enemy_hurt_show:setColor(cc.c3b(255,255,0))
    world_boss_open_ui:appendComponent(enemy_hurt_show)
    enemy_hurt_show:setPositionInContainer(cc.p(757.5,252.5))
    table_world_boss_open_ui["enemy_hurt_show"] = enemy_hurt_show

    local open_bg4 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyonga_70_1.png",cc.rect(7,7,2,2))
    open_bg4:setSize(cc.size(590,110))
    open_bg4:setAnchorPoint(cc.p(0.5,0.5))
    world_boss_open_ui:appendComponent(open_bg4)
    open_bg4:setPositionInContainer(cc.p(636,357))
    table_world_boss_open_ui["open_bg4"] = open_bg4

    local open_des4 = fc.FLabel:createBMFont()
    open_des4:setSize(cc.size(575,50))
    open_des4:setWidth(575)
    open_des4:setAnchorPoint(cc.p(0.5,0.5))
    open_des4:setFontSize(20)
    open_des4:setString("步兵步兵步兵步兵步兵步兵步兵步兵步兵步兵步兵步兵步兵步兵步兵步兵步兵步兵步兵步兵步兵步兵步兵步兵")
    open_des4:setColor(cc.c3b(250,255,165))
    world_boss_open_ui:appendComponent(open_des4)
    open_des4:setPositionInContainer(cc.p(633.5,351))
    table_world_boss_open_ui["open_des4"] = open_des4

    local encourage_once = fc.FScaleButton:create()
    encourage_once:setSize(cc.size(129,130))
    encourage_once:setAnchorPoint(cc.p(0.5,0.5))
    encourage_once:setButtonImage("nobatch/gulishici.png")
    world_boss_open_ui:appendComponent(encourage_once)
    encourage_once:setPositionInContainer(cc.p(441.5,489))
    table_world_boss_open_ui["encourage_once"] = encourage_once

    local encourage_multi = fc.FScaleButton:create()
    encourage_multi:setSize(cc.size(129,130))
    encourage_multi:setAnchorPoint(cc.p(0.5,0.5))
    encourage_multi:setButtonImage("nobatch/guliyici.png")
    world_boss_open_ui:appendComponent(encourage_multi)
    encourage_multi:setPositionInContainer(cc.p(614.5,489))
    table_world_boss_open_ui["encourage_multi"] = encourage_multi

    local open_bg5 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyonga_k_1.png",cc.rect(7,7,2,2))
    open_bg5:setSize(cc.size(280,40))
    open_bg5:setAnchorPoint(cc.p(0.5,0.5))
    world_boss_open_ui:appendComponent(open_bg5)
    open_bg5:setPositionInContainer(cc.p(535,579))
    table_world_boss_open_ui["open_bg5"] = open_bg5

    local curBossAdd = fc.FLabel:createBMFont()
    curBossAdd:setSize(cc.size(160,25))
    curBossAdd:setAnchorPoint(cc.p(0.5,0.5))
    curBossAdd:setFontSize(20)
    curBossAdd:setString("已鼓舞加成：所有属性+")
    curBossAdd:setColor(cc.c3b(250,255,165))
    world_boss_open_ui:appendComponent(curBossAdd)
    curBossAdd:setPositionInContainer(cc.p(509,576.5))
    table_world_boss_open_ui["curBossAdd"] = curBossAdd

    local add_num = fc.FLabel:createBMFont()
    add_num:setSize(cc.size(60,25))
    add_num:setAnchorPoint(cc.p(0.5,0.5))
    add_num:setFontSize(20)
    add_num:setString("20%")
    add_num:setColor(cc.c3b(250,255,165))
    add_num:setAlignment(0)
    world_boss_open_ui:appendComponent(add_num)
    add_num:setPositionInContainer(cc.p(649,576.5))
    table_world_boss_open_ui["add_num"] = add_num

    local guwu1_yuanbao = fc.FLabel:createBMFont()
    guwu1_yuanbao:setSize(cc.size(60,25))
    guwu1_yuanbao:setAnchorPoint(cc.p(0.5,0.5))
    guwu1_yuanbao:setFontSize(20)
    guwu1_yuanbao:setString("10")
    guwu1_yuanbao:setColor(cc.c3b(0,255,255))
    guwu1_yuanbao:setAlignment(0)
    world_boss_open_ui:appendComponent(guwu1_yuanbao)
    guwu1_yuanbao:setPositionInContainer(cc.p(456,508.5))
    table_world_boss_open_ui["guwu1_yuanbao"] = guwu1_yuanbao

    local guwuMore_yuanbao = fc.FLabel:createBMFont()
    guwuMore_yuanbao:setSize(cc.size(60,25))
    guwuMore_yuanbao:setAnchorPoint(cc.p(0.5,0.5))
    guwuMore_yuanbao:setFontSize(20)
    guwuMore_yuanbao:setString("80")
    guwuMore_yuanbao:setColor(cc.c3b(0,255,255))
    guwuMore_yuanbao:setAlignment(0)
    world_boss_open_ui:appendComponent(guwuMore_yuanbao)
    guwuMore_yuanbao:setPositionInContainer(cc.p(633,508.5))
    table_world_boss_open_ui["guwuMore_yuanbao"] = guwuMore_yuanbao

    local mid_use_bar = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyonga_70_1.png",cc.rect(7,7,2,2))
    mid_use_bar:setSize(cc.size(290,30))
    mid_use_bar:setAnchorPoint(cc.p(0.5,0.5))
    world_boss_open_ui:appendComponent(mid_use_bar)
    mid_use_bar:setPositionInContainer(cc.p(155,268))
    table_world_boss_open_ui["mid_use_bar"] = mid_use_bar

    local mid_use_bar = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyonga_70_1.png",cc.rect(7,7,2,2))
    mid_use_bar:setSize(cc.size(290,30))
    mid_use_bar:setAnchorPoint(cc.p(0.5,0.5))
    world_boss_open_ui:appendComponent(mid_use_bar)
    mid_use_bar:setPositionInContainer(cc.p(155,328))
    table_world_boss_open_ui["mid_use_bar"] = mid_use_bar

    local mid_use_bar = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyonga_70_1.png",cc.rect(7,7,2,2))
    mid_use_bar:setSize(cc.size(290,30))
    mid_use_bar:setAnchorPoint(cc.p(0.5,0.5))
    world_boss_open_ui:appendComponent(mid_use_bar)
    mid_use_bar:setPositionInContainer(cc.p(155,388))
    table_world_boss_open_ui["mid_use_bar"] = mid_use_bar

    local mid_use_bar = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyonga_70_1.png",cc.rect(7,7,2,2))
    mid_use_bar:setSize(cc.size(290,30))
    mid_use_bar:setAnchorPoint(cc.p(0.5,0.5))
    world_boss_open_ui:appendComponent(mid_use_bar)
    mid_use_bar:setPositionInContainer(cc.p(155,448))
    table_world_boss_open_ui["mid_use_bar"] = mid_use_bar

    local mid_use_bar = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyonga_70_1.png",cc.rect(7,7,2,2))
    mid_use_bar:setSize(cc.size(290,30))
    mid_use_bar:setAnchorPoint(cc.p(0.5,0.5))
    world_boss_open_ui:appendComponent(mid_use_bar)
    mid_use_bar:setPositionInContainer(cc.p(155,508))
    table_world_boss_open_ui["mid_use_bar"] = mid_use_bar

    local reborn_btn = fc.FScaleButton:create()
    reborn_btn:setSize(cc.size(160,158))
    reborn_btn:setAnchorPoint(cc.p(0.5,0.5))
    reborn_btn:setButtonImage("nobatch/tiaozhan1.png")
    world_boss_open_ui:appendComponent(reborn_btn)
    reborn_btn:setPositionInContainer(cc.p(813,500))
    table_world_boss_open_ui["reborn_btn"] = reborn_btn

    local iamge1 = fc.FExtensionsImage:create()
    iamge1:setImage("nobatch/chongshenganniu.png")
    iamge1:setSize(cc.size(107,106))
    iamge1:setAnchorPoint(cc.p(0.5,0.5))
    reborn_btn:appendComponent(iamge1)
    iamge1:setPositionInContainer(cc.p(80.5,77))
    table_world_boss_open_ui["iamge1"] = iamge1

    local uichong = fc.FExtensionsImage:create()
    uichong:setImage("batch_ui/chong4.png")
    uichong:setSize(cc.size(49,49))
    uichong:setAnchorPoint(cc.p(0.5,0.5))
    reborn_btn:appendComponent(uichong)
    uichong:setPositionInContainer(cc.p(57.5,67.5))
    table_world_boss_open_ui["uichong"] = uichong

    local uisheng = fc.FExtensionsImage:create()
    uisheng:setImage("batch_ui/sheng (4).png")
    uisheng:setSize(cc.size(49,49))
    uisheng:setAnchorPoint(cc.p(0.5,0.5))
    reborn_btn:appendComponent(uisheng)
    uisheng:setPositionInContainer(cc.p(97.5,66.5))
    table_world_boss_open_ui["uisheng"] = uisheng

    local reborn_yuanbao = fc.FLabel:createBMFont()
    reborn_yuanbao:setSize(cc.size(60,25))
    reborn_yuanbao:setAnchorPoint(cc.p(0.5,0.5))
    reborn_yuanbao:setFontSize(20)
    reborn_yuanbao:setString("1000")
    reborn_yuanbao:setColor(cc.c3b(0,255,255))
    reborn_yuanbao:setAlignment(0)
    world_boss_open_ui:appendComponent(reborn_yuanbao)
    reborn_yuanbao:setPositionInContainer(cc.p(836,531.5))
    table_world_boss_open_ui["reborn_yuanbao"] = reborn_yuanbao

    local dengdai = fc.FLabel:createBMFont()
    dengdai:setSize(cc.size(105,25))
    dengdai:setAnchorPoint(cc.p(0.5,0.5))
    dengdai:setFontSize(20)
    dengdai:setString("等待复活：")
    dengdai:setColor(cc.c3b(0,255,0))
    world_boss_open_ui:appendComponent(dengdai)
    dengdai:setPositionInContainer(cc.p(799.5,590.5))
    table_world_boss_open_ui["dengdai"] = dengdai

    local dengdai_count = fc.FLabel:createBMFont()
    dengdai_count:setSize(cc.size(30,25))
    dengdai_count:setAnchorPoint(cc.p(0.5,0.5))
    dengdai_count:setFontSize(20)
    dengdai_count:setString("30")
    dengdai_count:setColor(cc.c3b(0,255,0))
    dengdai_count:setAlignment(0)
    world_boss_open_ui:appendComponent(dengdai_count)
    dengdai_count:setPositionInContainer(cc.p(864,590.5))
    table_world_boss_open_ui["dengdai_count"] = dengdai_count

    local challenge_btn = fc.FScaleButton:create()
    challenge_btn:setSize(cc.size(160,158))
    challenge_btn:setAnchorPoint(cc.p(0.5,0.5))
    challenge_btn:setButtonImage("nobatch/tiaozhan1.png")
    world_boss_open_ui:appendComponent(challenge_btn)
    challenge_btn:setPositionInContainer(cc.p(813,500))
    table_world_boss_open_ui["challenge_btn"] = challenge_btn

    local ui_tiao = fc.FExtensionsImage:create()
    ui_tiao:setImage("batch_ui/tiao (3).png")
    ui_tiao:setSize(cc.size(49,49))
    ui_tiao:setAnchorPoint(cc.p(0.5,0.5))
    challenge_btn:appendComponent(ui_tiao)
    ui_tiao:setPositionInContainer(cc.p(52.5,76.5))
    table_world_boss_open_ui["ui_tiao"] = ui_tiao

    local ui_zhan = fc.FExtensionsImage:create()
    ui_zhan:setImage("batch_ui/zhan (4).png")
    ui_zhan:setSize(cc.size(49,49))
    ui_zhan:setAnchorPoint(cc.p(0.5,0.5))
    challenge_btn:appendComponent(ui_zhan)
    ui_zhan:setPositionInContainer(cc.p(106.5,76.5))
    table_world_boss_open_ui["ui_zhan"] = ui_zhan

    local num_baifen = fc.FLabel:createBMFont()
    num_baifen:setSize(cc.size(25,25))
    num_baifen:setAnchorPoint(cc.p(0.5,0.5))
    num_baifen:setFontSize(20)
    num_baifen:setString("%")
    num_baifen:setColor(cc.c3b(250,255,165))
    world_boss_open_ui:appendComponent(num_baifen)
    num_baifen:setPositionInContainer(cc.p(654.5,576.5))
    table_world_boss_open_ui["num_baifen"] = num_baifen

    local boss_arr_atk_flag = fc.FExtensionsImage:create()
    boss_arr_atk_flag:setImage("batch_ui/gongji_tubiao.png")
    boss_arr_atk_flag:setSize(cc.size(53,70))
    boss_arr_atk_flag:setAnchorPoint(cc.p(0.5,0.5))
    world_boss_open_ui:appendComponent(boss_arr_atk_flag)
    boss_arr_atk_flag:setPositionInContainer(cc.p(571.5,264))
    table_world_boss_open_ui["boss_arr_atk_flag"] = boss_arr_atk_flag

    return table_world_boss_open_ui

end

