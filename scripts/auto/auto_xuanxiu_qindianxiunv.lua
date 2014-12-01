function createxuanxiu_qindianxiunv()

    local table_xuanxiu_qindianxiunv = {}

    local xuanxiu_qindianxiunv = fc.FContainerPanel:create()
    xuanxiu_qindianxiunv:setSize(cc.size(960,640))
    table_xuanxiu_qindianxiunv["xuanxiu_qindianxiunv"] = xuanxiu_qindianxiunv

    local xx_qdxn_bantouming = fc.FScale9Image:createWithBatchUIFrame("batch_ui/juezhan_heiseditu.png",cc.rect(2,2,1,1))
    xx_qdxn_bantouming:setSize(cc.size(960,640))
    xx_qdxn_bantouming:setAnchorPoint(cc.p(0.5,0.5))
    xuanxiu_qindianxiunv:appendComponent(xx_qdxn_bantouming)
    xx_qdxn_bantouming:setPositionInContainer(cc.p(480,320))
    table_xuanxiu_qindianxiunv["xx_qdxn_bantouming"] = xx_qdxn_bantouming

    return table_xuanxiu_qindianxiunv

end

