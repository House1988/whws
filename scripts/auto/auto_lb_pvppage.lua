function createlb_pvppage()

    local table_lb_pvppage = {}

    local lb_pvppage = fc.FContainerPanel:create()
    lb_pvppage:setSize(cc.size(960,640))
    table_lb_pvppage["lb_pvppage"] = lb_pvppage

    local frame = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongbiankuang2_ciguan.png",cc.rect(43,15,2,2))
    frame:setSize(cc.size(860,430))
    frame:setAnchorPoint(cc.p(0.5,0.5))
    lb_pvppage:appendComponent(frame)
    frame:setPositionInContainer(cc.p(480,327))
    table_lb_pvppage["frame"] = frame

    local title_bg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/zongjiachengdikuang_tangquanxinggong.png",cc.rect(62,0,2,29))
    title_bg:setSize(cc.size(850,40))
    title_bg:setAnchorPoint(cc.p(0.5,0.5))
    title_bg:setScaleY(-1)
    lb_pvppage:appendComponent(title_bg)
    title_bg:setPositionInContainer(cc.p(480,140))
    table_lb_pvppage["title_bg"] = title_bg

    local bottom_bg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/zongjiachengdikuang_tangquanxinggong.png",cc.rect(62,0,2,29))
    bottom_bg:setSize(cc.size(200,35))
    bottom_bg:setAnchorPoint(cc.p(0.5,0.5))
    bottom_bg:setScaleY(-1)
    lb_pvppage:appendComponent(bottom_bg)
    bottom_bg:setPositionInContainer(cc.p(484,558.5))
    table_lb_pvppage["bottom_bg"] = bottom_bg

    local page_num = fc.FLabel:createBMFont()
    page_num:setSize(cc.size(90,25))
    page_num:setAnchorPoint(cc.p(0.5,0.5))
    page_num:setFontSize(20)
    page_num:setString("兴趣值")
    page_num:setColor(cc.c3b(255,255,255))
    lb_pvppage:appendComponent(page_num)
    page_num:setPositionInContainer(cc.p(484,554.5))
    table_lb_pvppage["page_num"] = page_num

    local rank = fc.FLabel:createBMFont()
    rank:setSize(cc.size(90,25))
    rank:setAnchorPoint(cc.p(0.5,0.5))
    rank:setFontSize(20)
    rank:setString("朕的排名")
    rank:setColor(cc.c3b(0,255,0))
    lb_pvppage:appendComponent(rank)
    rank:setPositionInContainer(cc.p(216,134.5))
    table_lb_pvppage["rank"] = rank

    local rank_num = fc.FLabel:createBMFont()
    rank_num:setSize(cc.size(90,25))
    rank_num:setAnchorPoint(cc.p(0.5,0.5))
    rank_num:setFontSize(20)
    rank_num:setString("朕的排名")
    rank_num:setColor(cc.c3b(255,255,0))
    lb_pvppage:appendComponent(rank_num)
    rank_num:setPositionInContainer(cc.p(332,134.5))
    table_lb_pvppage["rank_num"] = rank_num

    local left = fc.FScaleButton:create()
    left:setSize(cc.size(38,60))
    left:setAnchorPoint(cc.p(0.5,0.5))
    left:setButtonImage("batch_ui/jiantou2.png")
    lb_pvppage:appendComponent(left)
    left:setPositionInContainer(cc.p(26,320))
    table_lb_pvppage["left"] = left

    local right = fc.FScaleButton:create()
    right:setSize(cc.size(38,60))
    right:setAnchorPoint(cc.p(0.5,0.5))
    right:setButtonImage("batch_ui/jiantou2.png")
    right:setScaleX(-1)
    lb_pvppage:appendComponent(right)
    right:setPositionInContainer(cc.p(934,320))
    table_lb_pvppage["right"] = right

    local pvpTitle = fc.FContainerPanel:create()
    pvpTitle:setSize(cc.size(860,80))
    pvpTitle:setAnchorPoint(cc.p(0.5,0.5))
    lb_pvppage:appendComponent(pvpTitle)
    pvpTitle:setPositionInContainer(cc.p(480,176))
    table_lb_pvppage["pvpTitle"] = pvpTitle

    local ming = fc.FExtensionsImage:create()
    ming:setImage("batch_ui/hao_uizi (3).png")
    ming:setSize(cc.size(32,32))
    ming:setAnchorPoint(cc.p(0.5,0.5))
    pvpTitle:appendComponent(ming)
    ming:setPositionInContainer(cc.p(64,40))
    table_lb_pvppage["ming"] = ming

    local ci = fc.FExtensionsImage:create()
    ci:setImage("batch_ui/ci_uizi (2).png")
    ci:setSize(cc.size(32,32))
    ci:setAnchorPoint(cc.p(0.5,0.5))
    pvpTitle:appendComponent(ci)
    ci:setPositionInContainer(cc.p(96,40))
    table_lb_pvppage["ci"] = ci

    local xing = fc.FExtensionsImage:create()
    xing:setImage("batch_ui/di_uizi.png")
    xing:setSize(cc.size(32,32))
    xing:setAnchorPoint(cc.p(0.5,0.5))
    pvpTitle:appendComponent(xing)
    xing:setPositionInContainer(cc.p(350,40))
    table_lb_pvppage["xing"] = xing

    local ming = fc.FExtensionsImage:create()
    ming:setImage("batch_ui/hao_uizi (3).png")
    ming:setSize(cc.size(32,32))
    ming:setAnchorPoint(cc.p(0.5,0.5))
    pvpTitle:appendComponent(ming)
    ming:setPositionInContainer(cc.p(382,40))
    table_lb_pvppage["ming"] = ming

    local deng = fc.FExtensionsImage:create()
    deng:setImage("batch_ui/deng2_uizi.png")
    deng:setSize(cc.size(32,32))
    deng:setAnchorPoint(cc.p(0.5,0.5))
    pvpTitle:appendComponent(deng)
    deng:setPositionInContainer(cc.p(748,40))
    table_lb_pvppage["deng"] = deng

    local ji = fc.FExtensionsImage:create()
    ji:setImage("batch_ui/ji1_uizi.png")
    ji:setSize(cc.size(32,32))
    ji:setAnchorPoint(cc.p(0.5,0.5))
    pvpTitle:appendComponent(ji)
    ji:setPositionInContainer(cc.p(780,40))
    table_lb_pvppage["ji"] = ji

    local levelRankTitle = fc.FContainerPanel:create()
    levelRankTitle:setSize(cc.size(860,80))
    levelRankTitle:setAnchorPoint(cc.p(0.5,0.5))
    lb_pvppage:appendComponent(levelRankTitle)
    levelRankTitle:setPositionInContainer(cc.p(480,176))
    table_lb_pvppage["levelRankTitle"] = levelRankTitle

    local ming = fc.FExtensionsImage:create()
    ming:setImage("batch_ui/hao_uizi (3).png")
    ming:setSize(cc.size(32,32))
    ming:setAnchorPoint(cc.p(0.5,0.5))
    levelRankTitle:appendComponent(ming)
    ming:setPositionInContainer(cc.p(64,40))
    table_lb_pvppage["ming"] = ming

    local ci = fc.FExtensionsImage:create()
    ci:setImage("batch_ui/ci_uizi (2).png")
    ci:setSize(cc.size(32,32))
    ci:setAnchorPoint(cc.p(0.5,0.5))
    levelRankTitle:appendComponent(ci)
    ci:setPositionInContainer(cc.p(96,40))
    table_lb_pvppage["ci"] = ci

    local xing = fc.FExtensionsImage:create()
    xing:setImage("batch_ui/di_uizi.png")
    xing:setSize(cc.size(32,32))
    xing:setAnchorPoint(cc.p(0.5,0.5))
    levelRankTitle:appendComponent(xing)
    xing:setPositionInContainer(cc.p(335,40))
    table_lb_pvppage["xing"] = xing

    local ming = fc.FExtensionsImage:create()
    ming:setImage("batch_ui/hao_uizi (3).png")
    ming:setSize(cc.size(32,32))
    ming:setAnchorPoint(cc.p(0.5,0.5))
    levelRankTitle:appendComponent(ming)
    ming:setPositionInContainer(cc.p(367,40))
    table_lb_pvppage["ming"] = ming

    local tong = fc.FExtensionsImage:create()
    tong:setImage("batch_ui/tong_uizi.png")
    tong:setSize(cc.size(32,32))
    tong:setAnchorPoint(cc.p(0.5,0.5))
    levelRankTitle:appendComponent(tong)
    tong:setPositionInContainer(cc.p(563,40))
    table_lb_pvppage["tong"] = tong

    local guan = fc.FExtensionsImage:create()
    guan:setImage("batch_ui/guan_uizi.png")
    guan:setSize(cc.size(32,32))
    guan:setAnchorPoint(cc.p(0.5,0.5))
    levelRankTitle:appendComponent(guan)
    guan:setPositionInContainer(cc.p(591,40))
    table_lb_pvppage["guan"] = guan

    local zong = fc.FExtensionsImage:create()
    zong:setImage("batch_ui/zong_uizi.png")
    zong:setSize(cc.size(32,32))
    zong:setAnchorPoint(cc.p(0.5,0.5))
    levelRankTitle:appendComponent(zong)
    zong:setPositionInContainer(cc.p(620,40))
    table_lb_pvppage["zong"] = zong

    local shu = fc.FExtensionsImage:create()
    shu:setImage("batch_ui/shu_uizi (2).png")
    shu:setSize(cc.size(32,32))
    shu:setAnchorPoint(cc.p(0.5,0.5))
    levelRankTitle:appendComponent(shu)
    shu:setPositionInContainer(cc.p(648,40))
    table_lb_pvppage["shu"] = shu

    local dang = fc.FExtensionsImage:create()
    dang:setImage("batch_ui/dang_uizi (2).png")
    dang:setSize(cc.size(32,32))
    dang:setAnchorPoint(cc.p(0.5,0.5))
    levelRankTitle:appendComponent(dang)
    dang:setPositionInContainer(cc.p(732,40))
    table_lb_pvppage["dang"] = dang

    local qian = fc.FExtensionsImage:create()
    qian:setImage("batch_ui/qian_uizi.png")
    qian:setSize(cc.size(32,32))
    qian:setAnchorPoint(cc.p(0.5,0.5))
    levelRankTitle:appendComponent(qian)
    qian:setPositionInContainer(cc.p(759,40))
    table_lb_pvppage["qian"] = qian

    local guan = fc.FExtensionsImage:create()
    guan:setImage("batch_ui/guan_uizi.png")
    guan:setSize(cc.size(32,32))
    guan:setAnchorPoint(cc.p(0.5,0.5))
    levelRankTitle:appendComponent(guan)
    guan:setPositionInContainer(cc.p(787,40))
    table_lb_pvppage["guan"] = guan

    local qia = fc.FExtensionsImage:create()
    qia:setImage("batch_ui/ka_uizi.png")
    qia:setSize(cc.size(32,32))
    qia:setAnchorPoint(cc.p(0.5,0.5))
    levelRankTitle:appendComponent(qia)
    qia:setPositionInContainer(cc.p(814,40))
    table_lb_pvppage["qia"] = qia

    local level = fc.FLabel:createBMFont()
    level:setSize(cc.size(90,25))
    level:setAnchorPoint(cc.p(0.5,0.5))
    level:setFontSize(20)
    if LANGUAGE_TYPE == 3 then
    	level:setString("通關數")    
    else
	    level:setString("通关数")
    end
    level:setColor(cc.c3b(0,255,0))
    lb_pvppage:appendComponent(level)
    level:setPositionInContainer(cc.p(592,134.5))
    table_lb_pvppage["level"] = level

    local level_num = fc.FLabel:createBMFont()
    level_num:setSize(cc.size(90,25))
    level_num:setAnchorPoint(cc.p(0.5,0.5))
    level_num:setFontSize(20)
    level_num:setString("朕的排名")
    level_num:setColor(cc.c3b(255,255,0))
    lb_pvppage:appendComponent(level_num)
    level_num:setPositionInContainer(cc.p(700,134.5))
    table_lb_pvppage["level_num"] = level_num

    return table_lb_pvppage

end

