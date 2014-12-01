function createlb_levelRankItem()

    local table_lb_levelRankItem = {}

    local lb_levelRankItem = fc.FContainerPanel:create()
    lb_levelRankItem:setSize(cc.size(854,40))
    table_lb_levelRankItem["lb_levelRankItem"] = lb_levelRankItem

    local itembg1 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongditu2_ciguan.png",cc.rect(1,1,2,2))
    itembg1:setSize(cc.size(854,40))
    itembg1:setAnchorPoint(cc.p(0.5,0.5))
    lb_levelRankItem:appendComponent(itembg1)
    itembg1:setPositionInContainer(cc.p(427,20))
    table_lb_levelRankItem["itembg1"] = itembg1

    local itembg2 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongditu1_ciguan.png",cc.rect(1,1,1,1))
    itembg2:setSize(cc.size(854,40))
    itembg2:setAnchorPoint(cc.p(0.5,0.5))
    lb_levelRankItem:appendComponent(itembg2)
    itembg2:setPositionInContainer(cc.p(427,20))
    table_lb_levelRankItem["itembg2"] = itembg2

    local it_rank = fc.FLabel:createBMFont()
    it_rank:setSize(cc.size(90,25))
    it_rank:setAnchorPoint(cc.p(0.5,0.5))
    it_rank:setFontSize(20)
	it_rank:setString("朕的排名")
    it_rank:setColor(cc.c3b(51,24,6))
    lb_levelRankItem:appendComponent(it_rank)
    it_rank:setPositionInContainer(cc.p(78,16.5))
    table_lb_levelRankItem["it_rank"] = it_rank

    local it_name = fc.FLabel:createBMFont()
    it_name:setSize(cc.size(300,25))
    it_name:setAnchorPoint(cc.p(0.5,0.5))
    it_name:setFontSize(20)
 	it_name:setString("朕的排名")
    it_name:setColor(cc.c3b(51,24,6))
    lb_levelRankItem:appendComponent(it_name)
    it_name:setPositionInContainer(cc.p(360,16.5))
    table_lb_levelRankItem["it_name"] = it_name

    local it_level = fc.FLabel:createBMFont()
    it_level:setSize(cc.size(90,25))
    it_level:setAnchorPoint(cc.p(0.5,0.5))
    it_level:setFontSize(20)
	it_level:setString("朕的排名")
    it_level:setColor(cc.c3b(51,24,6))
    lb_levelRankItem:appendComponent(it_level)
    it_level:setPositionInContainer(cc.p(606,16.5))
    table_lb_levelRankItem["it_level"] = it_level

    local currentLevel = fc.FLabel:createBMFont()
    currentLevel:setSize(cc.size(90,25))
    currentLevel:setAnchorPoint(cc.p(0.5,0.5))
    currentLevel:setFontSize(20)
	currentLevel:setString("朕的排名")
    currentLevel:setColor(cc.c3b(51,24,6))
    lb_levelRankItem:appendComponent(currentLevel)
    currentLevel:setPositionInContainer(cc.p(768,16.5))
    table_lb_levelRankItem["currentLevel"] = currentLevel

    return table_lb_levelRankItem

end

