function createkeju_qindiandachen()

    local table_keju_qindiandachen = {}

    local keju_qindiandachen = fc.FContainerPanel:create()
    keju_qindiandachen:setSize(cc.size(960,640))
    table_keju_qindiandachen["keju_qindiandachen"] = keju_qindiandachen

    local kj_qddc_bantouming = fc.FScale9Image:createWithBatchUIFrame("batch_ui/juezhan_heiseditu.png",cc.rect(2,2,1,1))
    kj_qddc_bantouming:setSize(cc.size(960,640))
    kj_qddc_bantouming:setAnchorPoint(cc.p(0.5,0.5))
    keju_qindiandachen:appendComponent(kj_qddc_bantouming)
    kj_qddc_bantouming:setPositionInContainer(cc.p(480,320))
    table_keju_qindiandachen["kj_qddc_bantouming"] = kj_qddc_bantouming

    local kj_qddc_bg2_scale9 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/juanzhou_kunninggong.png",cc.rect(31,22,2,2))
    kj_qddc_bg2_scale9:setSize(cc.size(960,79))
    kj_qddc_bg2_scale9:setAnchorPoint(cc.p(0.5,0.5))
    keju_qindiandachen:appendComponent(kj_qddc_bg2_scale9)
    kj_qddc_bg2_scale9:setPositionInContainer(cc.p(480,39.5))
    table_keju_qindiandachen["kj_qddc_bg2_scale9"] = kj_qddc_bg2_scale9

    local kj_qddc_xiangxi_label = fc.FLabel:createBMFont()
    kj_qddc_xiangxi_label:setSize(cc.size(720,30))
    kj_qddc_xiangxi_label:setAnchorPoint(cc.p(0.5,0.5))
    kj_qddc_xiangxi_label:setFontSize(20)
    if LANGUAGE_TYPE == 3 then
    	kj_qddc_xiangxi_label:setString("陛下，經閱卷官們仔細考核，選出了以下四位人才四晉一，請陛下過目欽點！")
    else
    	kj_qddc_xiangxi_label:setString("陛下，经阅卷官们仔细考核，选出了以下四位人才四晋一，请陛下过目钦点！")
    end
    
    kj_qddc_xiangxi_label:setColor(cc.c3b(68,24,2))
    keju_qindiandachen:appendComponent(kj_qddc_xiangxi_label)
    kj_qddc_xiangxi_label:setPositionInContainer(cc.p(480,39))
    table_keju_qindiandachen["kj_qddc_xiangxi_label"] = kj_qddc_xiangxi_label

    return table_keju_qindiandachen

end

