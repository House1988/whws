function createworld_boss_rank_show()

    local table_world_boss_rank_show = {}

    local world_boss_rank_show = fc.FContainerPanel:create()
    world_boss_rank_show:setSize(cc.size(960,640))
    table_world_boss_rank_show["world_boss_rank_show"] = world_boss_rank_show

    local wb_bg1 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyonga_100_1.png",cc.rect(7,7,2,2))
    wb_bg1:setSize(cc.size(750,540))
    wb_bg1:setAnchorPoint(cc.p(0.5,0.5))
    world_boss_rank_show:appendComponent(wb_bg1)
    wb_bg1:setPositionInContainer(cc.p(479,344))
    table_world_boss_rank_show["wb_bg1"] = wb_bg1

    local world_boss_hor_bar = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongbiankuang3_ciguan.png",cc.rect(40,0,2,13))
    world_boss_hor_bar:setSize(cc.size(764,13))
    world_boss_hor_bar:setAnchorPoint(cc.p(0.5,0.5))
    world_boss_rank_show:appendComponent(world_boss_hor_bar)
    world_boss_hor_bar:setPositionInContainer(cc.p(480,74.5))
    table_world_boss_rank_show["world_boss_hor_bar"] = world_boss_hor_bar

    local world_boss_hor_bar = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongbiankuang3_ciguan.png",cc.rect(40,0,2,13))
    world_boss_hor_bar:setSize(cc.size(764,13))
    world_boss_hor_bar:setAnchorPoint(cc.p(0.5,0.5))
    world_boss_rank_show:appendComponent(world_boss_hor_bar)
    world_boss_hor_bar:setPositionInContainer(cc.p(480,609.5))
    table_world_boss_rank_show["world_boss_hor_bar"] = world_boss_hor_bar

    local world_boss_ver_bar = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tangquanxinggongbar_tangquanxinggong.png",cc.rect(0,56,25,2))
    world_boss_ver_bar:setSize(cc.size(25,548))
    world_boss_ver_bar:setAnchorPoint(cc.p(0.5,0.5))
    world_boss_rank_show:appendComponent(world_boss_ver_bar)
    world_boss_ver_bar:setPositionInContainer(cc.p(98.5,342))
    table_world_boss_rank_show["world_boss_ver_bar"] = world_boss_ver_bar

    local world_boss_ver_bar = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tangquanxinggongbar_tangquanxinggong.png",cc.rect(0,56,25,2))
    world_boss_ver_bar:setSize(cc.size(25,548))
    world_boss_ver_bar:setAnchorPoint(cc.p(0.5,0.5))
    world_boss_rank_show:appendComponent(world_boss_ver_bar)
    world_boss_ver_bar:setPositionInContainer(cc.p(860.5,342))
    table_world_boss_rank_show["world_boss_ver_bar"] = world_boss_ver_bar

    local world_boss_ver_bar = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tangquanxinggongbar_tangquanxinggong.png",cc.rect(0,56,25,2))
    world_boss_ver_bar:setSize(cc.size(25,548))
    world_boss_ver_bar:setAnchorPoint(cc.p(0.5,0.5))
    world_boss_rank_show:appendComponent(world_boss_ver_bar)
    world_boss_ver_bar:setPositionInContainer(cc.p(348.5,342))
    table_world_boss_rank_show["world_boss_ver_bar"] = world_boss_ver_bar

    local wb_bg2 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyonga_70_1.png",cc.rect(7,7,2,2))
    wb_bg2:setSize(cc.size(231,184))
    wb_bg2:setAnchorPoint(cc.p(0.5,0.5))
    world_boss_rank_show:appendComponent(wb_bg2)
    wb_bg2:setPositionInContainer(cc.p(223.5,180))
    table_world_boss_rank_show["wb_bg2"] = wb_bg2

    local wb_bg3 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyonga_70_1.png",cc.rect(7,7,2,2))
    wb_bg3:setSize(cc.size(231,305))
    wb_bg3:setAnchorPoint(cc.p(0.5,0.5))
    world_boss_rank_show:appendComponent(wb_bg3)
    wb_bg3:setPositionInContainer(cc.p(223.5,438.5))
    table_world_boss_rank_show["wb_bg3"] = wb_bg3

    local wb_bg4 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyonga_k_1.png",cc.rect(7,7,2,2))
    wb_bg4:setSize(cc.size(200,34))
    wb_bg4:setAnchorPoint(cc.p(0.5,0.5))
    world_boss_rank_show:appendComponent(wb_bg4)
    wb_bg4:setPositionInContainer(cc.p(224,112))
    table_world_boss_rank_show["wb_bg4"] = wb_bg4

    local wb_bg4 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyonga_k_1.png",cc.rect(7,7,2,2))
    wb_bg4:setSize(cc.size(200,34))
    wb_bg4:setAnchorPoint(cc.p(0.5,0.5))
    world_boss_rank_show:appendComponent(wb_bg4)
    wb_bg4:setPositionInContainer(cc.p(224,311))
    table_world_boss_rank_show["wb_bg4"] = wb_bg4

    local myTip1 = fc.FLabel:createBMFont()
    myTip1:setSize(cc.size(114,25))
    myTip1:setAnchorPoint(cc.p(0.5,0.5))
    myTip1:setFontSize(20)
    myTip1:setString("朕的战绩")
    myTip1:setColor(cc.c3b(0,255,0))
    world_boss_rank_show:appendComponent(myTip1)
    myTip1:setPositionInContainer(cc.p(224,109.5))
    table_world_boss_rank_show["myTip1"] = myTip1

    local myTip2 = fc.FLabel:createBMFont()
    myTip2:setSize(cc.size(114,25))
    myTip2:setAnchorPoint(cc.p(0.5,0.5))
    myTip2:setFontSize(20)
    myTip2:setString("朕的奖励")
    myTip2:setColor(cc.c3b(0,255,0))
    world_boss_rank_show:appendComponent(myTip2)
    myTip2:setPositionInContainer(cc.p(224,308.5))
    table_world_boss_rank_show["myTip2"] = myTip2

    local wb_bg5 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyonga_k_1.png",cc.rect(7,7,2,2))
    wb_bg5:setSize(cc.size(400,34))
    wb_bg5:setAnchorPoint(cc.p(0.5,0.5))
    world_boss_rank_show:appendComponent(wb_bg5)
    wb_bg5:setPositionInContainer(cc.p(605,103))
    table_world_boss_rank_show["wb_bg5"] = wb_bg5

    local reward_1 = fc.FExtensionsImage:create()
    reward_1:setImage("batch_ui/chengpinzhi_kuang.png")
    reward_1:setSize(cc.size(73,73))
    reward_1:setAnchorPoint(cc.p(0.5,0.5))
    world_boss_rank_show:appendComponent(reward_1)
    reward_1:setPositionInContainer(cc.p(172.5,377.5))
    table_world_boss_rank_show["reward_1"] = reward_1

    local reward_2 = fc.FExtensionsImage:create()
    reward_2:setImage("batch_ui/chengpinzhi_kuang.png")
    reward_2:setSize(cc.size(73,73))
    reward_2:setAnchorPoint(cc.p(0.5,0.5))
    world_boss_rank_show:appendComponent(reward_2)
    reward_2:setPositionInContainer(cc.p(275.5,377.5))
    table_world_boss_rank_show["reward_2"] = reward_2

    local reward_3 = fc.FExtensionsImage:create()
    reward_3:setImage("batch_ui/chengpinzhi_kuang.png")
    reward_3:setSize(cc.size(73,73))
    reward_3:setAnchorPoint(cc.p(0.5,0.5))
    world_boss_rank_show:appendComponent(reward_3)
    reward_3:setPositionInContainer(cc.p(172.5,489.5))
    table_world_boss_rank_show["reward_3"] = reward_3

    local reward_4 = fc.FExtensionsImage:create()
    reward_4:setImage("batch_ui/chengpinzhi_kuang.png")
    reward_4:setSize(cc.size(73,73))
    reward_4:setAnchorPoint(cc.p(0.5,0.5))
    world_boss_rank_show:appendComponent(reward_4)
    reward_4:setPositionInContainer(cc.p(275.5,489.5))
    table_world_boss_rank_show["reward_4"] = reward_4

    local reward_namedi1 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shuruwenzi.png",cc.rect(11,9,47,7))
    reward_namedi1:setSize(cc.size(73,25))
    reward_namedi1:setAnchorPoint(cc.p(0.5,0.5))
    world_boss_rank_show:appendComponent(reward_namedi1)
    reward_namedi1:setPositionInContainer(cc.p(172.5,434.5))
    table_world_boss_rank_show["reward_namedi1"] = reward_namedi1

    local reward_name1 = fc.FLabel:createBMFont()
    reward_name1:setSize(cc.size(80,25))
    reward_name1:setAnchorPoint(cc.p(0.5,0.5))
    reward_name1:setFontSize(20)
    reward_name1:setString("柳如是")
    reward_name1:setColor(cc.c3b(0,255,255))
    world_boss_rank_show:appendComponent(reward_name1)
    reward_name1:setPositionInContainer(cc.p(172,431.5))
    table_world_boss_rank_show["reward_name1"] = reward_name1

    local shuchu_label = fc.FLabel:createBMFont()
    shuchu_label:setSize(cc.size(90,25))
    shuchu_label:setAnchorPoint(cc.p(0.5,0.5))
    shuchu_label:setFontSize(20)
    shuchu_label:setString("输出伤害：")
    shuchu_label:setColor(cc.c3b(255,255,0))
    shuchu_label:setAlignment(0)
    world_boss_rank_show:appendComponent(shuchu_label)
    shuchu_label:setPositionInContainer(cc.p(174,157.5))
    table_world_boss_rank_show["shuchu_label"] = shuchu_label

    local zongxueliang_label = fc.FLabel:createBMFont()
    zongxueliang_label:setSize(cc.size(110,25))
    zongxueliang_label:setAnchorPoint(cc.p(0.5,0.5))
    zongxueliang_label:setFontSize(20)
    zongxueliang_label:setString("占BOSS总血量：")
    zongxueliang_label:setColor(cc.c3b(255,255,0))
    zongxueliang_label:setAlignment(0)
    world_boss_rank_show:appendComponent(zongxueliang_label)
    zongxueliang_label:setPositionInContainer(cc.p(182,201.5))
    table_world_boss_rank_show["zongxueliang_label"] = zongxueliang_label

    local rank_rank = fc.FLabel:createBMFont()
    rank_rank:setSize(cc.size(90,25))
    rank_rank:setAnchorPoint(cc.p(0.5,0.5))
    rank_rank:setFontSize(20)
    rank_rank:setString("未进入排行")
    rank_rank:setColor(cc.c3b(0,255,255))
    rank_rank:setAlignment(0)
    world_boss_rank_show:appendComponent(rank_rank)
    rank_rank:setPositionInContainer(cc.p(303,245.5))
    table_world_boss_rank_show["rank_rank"] = rank_rank

    local shuchu_hurt = fc.FLabel:createBMFont()
    shuchu_hurt:setSize(cc.size(90,25))
    shuchu_hurt:setAnchorPoint(cc.p(0.5,0.5))
    shuchu_hurt:setFontSize(20)
    shuchu_hurt:setString("1000000")
    shuchu_hurt:setColor(cc.c3b(0,255,255))
    shuchu_hurt:setAlignment(0)
    world_boss_rank_show:appendComponent(shuchu_hurt)
    shuchu_hurt:setPositionInContainer(cc.p(302,157.5))
    table_world_boss_rank_show["shuchu_hurt"] = shuchu_hurt

    local xueliang_percent = fc.FLabel:createBMFont()
    xueliang_percent:setSize(cc.size(90,25))
    xueliang_percent:setAnchorPoint(cc.p(0.5,0.5))
    xueliang_percent:setFontSize(20)
    xueliang_percent:setString("999.9%")
    xueliang_percent:setColor(cc.c3b(0,255,255))
    xueliang_percent:setAlignment(0)
    world_boss_rank_show:appendComponent(xueliang_percent)
    xueliang_percent:setPositionInContainer(cc.p(303,201.5))
    table_world_boss_rank_show["xueliang_percent"] = xueliang_percent

    local myTip3 = fc.FLabel:createBMFont()
    myTip3:setSize(cc.size(114,25))
    myTip3:setAnchorPoint(cc.p(0.5,0.5))
    myTip3:setFontSize(20)
    myTip3:setString("BOSS伤害排行")
    myTip3:setColor(cc.c3b(0,255,0))
    world_boss_rank_show:appendComponent(myTip3)
    myTip3:setPositionInContainer(cc.p(605,98.5))
    table_world_boss_rank_show["myTip3"] = myTip3

    local title_t_image = fc.FScale9Image:createWithBatchUIFrame("batch_ui/mingzikuang.png",cc.rect(43,25,1,1))
    title_t_image:setSize(cc.size(500,63))
    title_t_image:setAnchorPoint(cc.p(0.5,0.5))
    world_boss_rank_show:appendComponent(title_t_image)
    title_t_image:setPositionInContainer(cc.p(480,54.5))
    table_world_boss_rank_show["title_t_image"] = title_t_image

    local popClose = fc.FScaleButton:create()
    popClose:setSize(cc.size(56,56))
    popClose:setAnchorPoint(cc.p(0.5,0.5))
    popClose:setButtonImage("batch_ui/guanbi_up.png")
    world_boss_rank_show:appendComponent(popClose)
    popClose:setPositionInContainer(cc.p(860,72))
    table_world_boss_rank_show["popClose"] = popClose

    local sure_btn = fc.FScaleButton:create()
    sure_btn:setSize(cc.size(144,53))
    sure_btn:setAnchorPoint(cc.p(0.5,0.5))
    sure_btn:setButtonImage("batch_ui/putonganniu1_up.png")
    world_boss_rank_show:appendComponent(sure_btn)
    sure_btn:setPositionInContainer(cc.p(605,574.5))
    table_world_boss_rank_show["sure_btn"] = sure_btn

    local que = fc.FExtensionsImage:create()
    que:setImage("batch_ui/que_uizi.png")
    que:setSize(cc.size(32,32))
    que:setAnchorPoint(cc.p(0.5,0.5))
    sure_btn:appendComponent(que)
    que:setPositionInContainer(cc.p(46,25))
    table_world_boss_rank_show["que"] = que

    local ding = fc.FExtensionsImage:create()
    ding:setImage("batch_ui/ding_uizi.png")
    ding:setSize(cc.size(32,32))
    ding:setAnchorPoint(cc.p(0.5,0.5))
    sure_btn:appendComponent(ding)
    ding:setPositionInContainer(cc.p(98,25))
    table_world_boss_rank_show["ding"] = ding

    local wb_bg6 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyonga_k_1.png",cc.rect(7,7,2,2))
    wb_bg6:setSize(cc.size(500,34))
    wb_bg6:setAnchorPoint(cc.p(0.5,0.5))
    world_boss_rank_show:appendComponent(wb_bg6)
    wb_bg6:setPositionInContainer(cc.p(605,529))
    table_world_boss_rank_show["wb_bg6"] = wb_bg6

    local myTip4 = fc.FLabel:createBMFont()
    myTip4:setSize(cc.size(114,25))
    myTip4:setAnchorPoint(cc.p(0.5,0.5))
    myTip4:setFontSize(20)
    myTip4:setString("最后击杀的玩家：")
    myTip4:setColor(cc.c3b(0,255,0))
    world_boss_rank_show:appendComponent(myTip4)
    myTip4:setPositionInContainer(cc.p(452,525.5))
    table_world_boss_rank_show["myTip4"] = myTip4

    local killName = fc.FLabel:createBMFont()
    killName:setSize(cc.size(114,25))
    killName:setAnchorPoint(cc.p(0.5,0.5))
    killName:setFontSize(20)
    killName:setString("名字五个字")
    killName:setColor(cc.c3b(0,255,0))
    world_boss_rank_show:appendComponent(killName)
    killName:setPositionInContainer(cc.p(575,525.5))
    table_world_boss_rank_show["killName"] = killName

    local myTip5 = fc.FLabel:createBMFont()
    myTip5:setSize(cc.size(100,25))
    myTip5:setAnchorPoint(cc.p(0.5,0.5))
    myTip5:setFontSize(20)
    myTip5:setString("额外获得：")
    myTip5:setColor(cc.c3b(0,255,255))
    world_boss_rank_show:appendComponent(myTip5)
    myTip5:setPositionInContainer(cc.p(708,525.5))
    table_world_boss_rank_show["myTip5"] = myTip5

    local ewai_get = fc.FLabel:createBMFont()
    ewai_get:setSize(cc.size(60,25))
    ewai_get:setAnchorPoint(cc.p(0.5,0.5))
    ewai_get:setFontSize(20)
    ewai_get:setString("12345")
    ewai_get:setColor(cc.c3b(0,255,255))
    ewai_get:setAlignment(0)
    world_boss_rank_show:appendComponent(ewai_get)
    ewai_get:setPositionInContainer(cc.p(788,525.5))
    table_world_boss_rank_show["ewai_get"] = ewai_get

    local main_tiao = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyonga_70_1.png",cc.rect(7,7,2,2))
    main_tiao:setSize(cc.size(500,39))
    main_tiao:setAnchorPoint(cc.p(0.5,0.5))
    world_boss_rank_show:appendComponent(main_tiao)
    main_tiao:setPositionInContainer(cc.p(604,140.5))
    table_world_boss_rank_show["main_tiao"] = main_tiao

    local main_tiao = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyonga_70_1.png",cc.rect(7,7,2,2))
    main_tiao:setSize(cc.size(500,39))
    main_tiao:setAnchorPoint(cc.p(0.5,0.5))
    world_boss_rank_show:appendComponent(main_tiao)
    main_tiao:setPositionInContainer(cc.p(604,218.5))
    table_world_boss_rank_show["main_tiao"] = main_tiao

    local main_tiao = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyonga_70_1.png",cc.rect(7,7,2,2))
    main_tiao:setSize(cc.size(500,39))
    main_tiao:setAnchorPoint(cc.p(0.5,0.5))
    world_boss_rank_show:appendComponent(main_tiao)
    main_tiao:setPositionInContainer(cc.p(604,296.5))
    table_world_boss_rank_show["main_tiao"] = main_tiao

    local main_tiao = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyonga_70_1.png",cc.rect(7,7,2,2))
    main_tiao:setSize(cc.size(500,39))
    main_tiao:setAnchorPoint(cc.p(0.5,0.5))
    world_boss_rank_show:appendComponent(main_tiao)
    main_tiao:setPositionInContainer(cc.p(604,374.5))
    table_world_boss_rank_show["main_tiao"] = main_tiao

    local main_tiao = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyonga_70_1.png",cc.rect(7,7,2,2))
    main_tiao:setSize(cc.size(500,39))
    main_tiao:setAnchorPoint(cc.p(0.5,0.5))
    world_boss_rank_show:appendComponent(main_tiao)
    main_tiao:setPositionInContainer(cc.p(604,452.5))
    table_world_boss_rank_show["main_tiao"] = main_tiao

    local myTip6 = fc.FLabel:createBMFont()
    myTip6:setSize(cc.size(200,33))
    myTip6:setAnchorPoint(cc.p(0.5,0.5))
    myTip6:setFontSize(32)
    myTip6:setString("挑战击杀BOSS排行")
    myTip6:setColor(cc.c3b(255,255,0))
    world_boss_rank_show:appendComponent(myTip6)
    myTip6:setPositionInContainer(cc.p(480,48.5))
    table_world_boss_rank_show["myTip6"] = myTip6

    local reward_card1 = fc.FExtensionsImage:create()
    reward_card1:setAnchorPoint(cc.p(0.5,0.5))
    world_boss_rank_show:appendComponent(reward_card1)
    reward_card1:setPositionInContainer(cc.p(172.5,376.5))
    table_world_boss_rank_show["reward_card1"] = reward_card1

    local num1 = fc.FAnimationLabel:create("",g_game.g_resourceManager:getImageFontPath(g_game.g_f_image_font_type.F_YELLOW_TYPE))
    num1:setAnchorPoint(cc.p(0.5,0.5))
    num1:setSize(cc.size(28,20))
    num1:setAlignment(0)
    num1:setScale(0.8)
    world_boss_rank_show:appendComponent(num1)
    num1:setPositionInContainer(cc.p(145,403))
    table_world_boss_rank_show["num1"] = num1

    local flag1 = fc.FExtensionsImage:create()
    flag1:setAnchorPoint(cc.p(0.5,0.5))
    world_boss_rank_show:appendComponent(flag1)
    flag1:setPositionInContainer(cc.p(205,404))
    table_world_boss_rank_show["flag1"] = flag1

    local reward_card2 = fc.FExtensionsImage:create()
    reward_card2:setAnchorPoint(cc.p(0.5,0.5))
    world_boss_rank_show:appendComponent(reward_card2)
    reward_card2:setPositionInContainer(cc.p(275.5,377.5))
    table_world_boss_rank_show["reward_card2"] = reward_card2

    local num2 = fc.FAnimationLabel:create("",g_game.g_resourceManager:getImageFontPath(g_game.g_f_image_font_type.F_YELLOW_TYPE))
    num2:setAnchorPoint(cc.p(0.5,0.5))
    num2:setSize(cc.size(28,20))
    num2:setAlignment(0)
    num2:setScale(0.8)
    world_boss_rank_show:appendComponent(num2)
    num2:setPositionInContainer(cc.p(248,403))
    table_world_boss_rank_show["num2"] = num2

    local flag2 = fc.FExtensionsImage:create()
    flag2:setAnchorPoint(cc.p(0.5,0.5))
    world_boss_rank_show:appendComponent(flag2)
    flag2:setPositionInContainer(cc.p(308,404))
    table_world_boss_rank_show["flag2"] = flag2

    local reward_card3 = fc.FExtensionsImage:create()
    reward_card3:setAnchorPoint(cc.p(0.5,0.5))
    world_boss_rank_show:appendComponent(reward_card3)
    reward_card3:setPositionInContainer(cc.p(172.5,489.5))
    table_world_boss_rank_show["reward_card3"] = reward_card3

    local reward_card4 = fc.FExtensionsImage:create()
    reward_card4:setAnchorPoint(cc.p(0.5,0.5))
    world_boss_rank_show:appendComponent(reward_card4)
    reward_card4:setPositionInContainer(cc.p(275.5,489.5))
    table_world_boss_rank_show["reward_card4"] = reward_card4

    local num4 = fc.FAnimationLabel:create("",g_game.g_resourceManager:getImageFontPath(g_game.g_f_image_font_type.F_YELLOW_TYPE))
    num4:setAnchorPoint(cc.p(0.5,0.5))
    num4:setSize(cc.size(28,20))
    num4:setAlignment(0)
    num4:setScale(0.8)
    world_boss_rank_show:appendComponent(num4)
    num4:setPositionInContainer(cc.p(248,515))
    table_world_boss_rank_show["num4"] = num4

    local flag4 = fc.FExtensionsImage:create()
    flag4:setAnchorPoint(cc.p(0.5,0.5))
    world_boss_rank_show:appendComponent(flag4)
    flag4:setPositionInContainer(cc.p(308,515))
    table_world_boss_rank_show["flag4"] = flag4

    local num3 = fc.FAnimationLabel:create("",g_game.g_resourceManager:getImageFontPath(g_game.g_f_image_font_type.F_YELLOW_TYPE))
    num3:setAnchorPoint(cc.p(0.5,0.5))
    num3:setSize(cc.size(28,20))
    num3:setAlignment(0)
    num3:setScale(0.8)
    world_boss_rank_show:appendComponent(num3)
    num3:setPositionInContainer(cc.p(145,515))
    table_world_boss_rank_show["num3"] = num3

    local flag3 = fc.FExtensionsImage:create()
    flag3:setAnchorPoint(cc.p(0.5,0.5))
    world_boss_rank_show:appendComponent(flag3)
    flag3:setPositionInContainer(cc.p(203,515))
    table_world_boss_rank_show["flag3"] = flag3

    local temp_label = fc.FLabel:createBMFont()
    temp_label:setSize(cc.size(80,25))
    temp_label:setAnchorPoint(cc.p(0.5,0.5))
    temp_label:setFontSize(20)
    temp_label:setString("朕的排名：")
    temp_label:setColor(cc.c3b(255,255,0))
    temp_label:setAlignment(0)
    world_boss_rank_show:appendComponent(temp_label)
    temp_label:setPositionInContainer(cc.p(168,245.5))
    table_world_boss_rank_show["temp_label"] = temp_label

    local reward_namedi2 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shuruwenzi.png",cc.rect(11,9,47,7))
    reward_namedi2:setSize(cc.size(73,25))
    reward_namedi2:setAnchorPoint(cc.p(0.5,0.5))
    world_boss_rank_show:appendComponent(reward_namedi2)
    reward_namedi2:setPositionInContainer(cc.p(275.5,434.5))
    table_world_boss_rank_show["reward_namedi2"] = reward_namedi2

    local reward_name2 = fc.FLabel:createBMFont()
    reward_name2:setSize(cc.size(80,25))
    reward_name2:setAnchorPoint(cc.p(0.5,0.5))
    reward_name2:setFontSize(20)
    reward_name2:setString("柳如是")
    reward_name2:setColor(cc.c3b(0,255,255))
    world_boss_rank_show:appendComponent(reward_name2)
    reward_name2:setPositionInContainer(cc.p(275,431.5))
    table_world_boss_rank_show["reward_name2"] = reward_name2

    local reward_namedi3 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shuruwenzi.png",cc.rect(11,9,47,7))
    reward_namedi3:setSize(cc.size(73,25))
    reward_namedi3:setAnchorPoint(cc.p(0.5,0.5))
    world_boss_rank_show:appendComponent(reward_namedi3)
    reward_namedi3:setPositionInContainer(cc.p(172.5,545.5))
    table_world_boss_rank_show["reward_namedi3"] = reward_namedi3

    local reward_name3 = fc.FLabel:createBMFont()
    reward_name3:setSize(cc.size(80,25))
    reward_name3:setAnchorPoint(cc.p(0.5,0.5))
    reward_name3:setFontSize(20)
    reward_name3:setString("柳如是")
    reward_name3:setColor(cc.c3b(0,255,255))
    world_boss_rank_show:appendComponent(reward_name3)
    reward_name3:setPositionInContainer(cc.p(172,541.5))
    table_world_boss_rank_show["reward_name3"] = reward_name3

    local reward_namedi4 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shuruwenzi.png",cc.rect(11,9,47,7))
    reward_namedi4:setSize(cc.size(73,25))
    reward_namedi4:setAnchorPoint(cc.p(0.5,0.5))
    world_boss_rank_show:appendComponent(reward_namedi4)
    reward_namedi4:setPositionInContainer(cc.p(275.5,545.5))
    table_world_boss_rank_show["reward_namedi4"] = reward_namedi4

    local reward_name4 = fc.FLabel:createBMFont()
    reward_name4:setSize(cc.size(80,25))
    reward_name4:setAnchorPoint(cc.p(0.5,0.5))
    reward_name4:setFontSize(20)
    reward_name4:setString("柳如是")
    reward_name4:setColor(cc.c3b(0,255,255))
    world_boss_rank_show:appendComponent(reward_name4)
    reward_name4:setPositionInContainer(cc.p(275,541.5))
    table_world_boss_rank_show["reward_name4"] = reward_name4

    return table_world_boss_rank_show

end

