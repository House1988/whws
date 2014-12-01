function createlb_pvpItem()

    local table_lb_pvpItem = {}

    local lb_pvpItem = fc.FContainerPanel:create()
    lb_pvpItem:setSize(cc.size(854,40))
    table_lb_pvpItem["lb_pvpItem"] = lb_pvpItem

    local itembg1 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongditu2_ciguan.png",cc.rect(1,1,2,2))
    itembg1:setSize(cc.size(854,40))
    itembg1:setAnchorPoint(cc.p(0.5,0.5))
    lb_pvpItem:appendComponent(itembg1)
    itembg1:setPositionInContainer(cc.p(427,20))
    table_lb_pvpItem["itembg1"] = itembg1

    local itembg2 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongditu1_ciguan.png",cc.rect(1,1,1,1))
    itembg2:setSize(cc.size(854,40))
    itembg2:setAnchorPoint(cc.p(0.5,0.5))
    lb_pvpItem:appendComponent(itembg2)
    itembg2:setPositionInContainer(cc.p(427,20))
    table_lb_pvpItem["itembg2"] = itembg2

    local it_rank = fc.FLabel:createBMFont()
    it_rank:setSize(cc.size(90,25))
    it_rank:setAnchorPoint(cc.p(0.5,0.5))
    it_rank:setFontSize(20)
	it_rank:setString("朕的排名")
    it_rank:setColor(cc.c3b(51,24,6))
    lb_pvpItem:appendComponent(it_rank)
    it_rank:setPositionInContainer(cc.p(78,16.5))
    table_lb_pvpItem["it_rank"] = it_rank

    local it_name = fc.FLabel:createBMFont()
    it_name:setSize(cc.size(300,25))
    it_name:setAnchorPoint(cc.p(0.5,0.5))
    it_name:setFontSize(20)
    it_name:setString("朕的排名")
    it_name:setColor(cc.c3b(51,24,6))
    lb_pvpItem:appendComponent(it_name)
    it_name:setPositionInContainer(cc.p(369,16.5))
    table_lb_pvpItem["it_name"] = it_name

    local vip = fc.FExtensionsImage:create()
    vip:setImage("batch_ui/VIP.png")
    vip:setSize(cc.size(60,30))
    vip:setAnchorPoint(cc.p(0.5,0.5))
    lb_pvpItem:appendComponent(vip)
    vip:setPositionInContainer(cc.p(565,18))
    table_lb_pvpItem["vip"] = vip

    local it_level = fc.FLabel:createBMFont()
    it_level:setSize(cc.size(90,25))
    it_level:setAnchorPoint(cc.p(0.5,0.5))
    it_level:setFontSize(20)
 	it_level:setString("朕的排名")
    it_level:setColor(cc.c3b(51,24,6))
    lb_pvpItem:appendComponent(it_level)
    it_level:setPositionInContainer(cc.p(761,16.5))
    table_lb_pvpItem["it_level"] = it_level

    local vip_lv = fc.FAnimationLabel:create("",g_game.g_resourceManager:getImageFontPath(g_game.g_f_image_font_type.F_YELLOW_TYPE))
    vip_lv:setAnchorPoint(cc.p(0.5,0.5))
    vip_lv:setSize(cc.size(70,30))
    vip_lv:setScale(0.6)
    lb_pvpItem:appendComponent(vip_lv)
    vip_lv:setPositionInContainer(cc.p(623,23))
    table_lb_pvpItem["vip_lv"] = vip_lv

    return table_lb_pvpItem

end

