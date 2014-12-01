function createmonthCardItem()

    local table_monthCardItem = {}

    local monthCardItem = fc.FContainerPanel:create()
    monthCardItem:setSize(cc.size(124,138))
    table_monthCardItem["monthCardItem"] = monthCardItem

    local mci_quality_bg = fc.FExtensionsImage:create()
    mci_quality_bg:setImage("batch_ui/baipinzhi_kuang.png")
    mci_quality_bg:setSize(cc.size(104,104))
    mci_quality_bg:setAnchorPoint(cc.p(0.5,0.5))
    monthCardItem:appendComponent(mci_quality_bg)
    mci_quality_bg:setPositionInContainer(cc.p(62,54))
    table_monthCardItem["mci_quality_bg"] = mci_quality_bg

    local mci_name_bg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shuruwenzi.png",cc.rect(20,10,3,10))
    mci_name_bg:setSize(cc.size(122,24))
    mci_name_bg:setAnchorPoint(cc.p(0.5,0.5))
    monthCardItem:appendComponent(mci_name_bg)
    mci_name_bg:setPositionInContainer(cc.p(62,122))
    table_monthCardItem["mci_name_bg"] = mci_name_bg

    local mci_img = fc.FExtensionsImage:create()
    mci_img:setImage("batch_ui/baipinzhi_kuang.png")
    mci_img:setSize(cc.size(88,88))
    mci_img:setAnchorPoint(cc.p(0.5,0.5))
    monthCardItem:appendComponent(mci_img)
    mci_img:setPositionInContainer(cc.p(62,54))
    table_monthCardItem["mci_img"] = mci_img

    local mci_count_lbl = fc.FLabel:createBMFont()
    mci_count_lbl:setSize(cc.size(94,24))
    mci_count_lbl:setAnchorPoint(cc.p(0.5,0.5))
    mci_count_lbl:setFontSize(21)
    mci_count_lbl:setString("9999")
    mci_count_lbl:setColor(cc.c3b(0,255,255))
    monthCardItem:appendComponent(mci_count_lbl)
    mci_count_lbl:setPositionInContainer(cc.p(58,85))
    table_monthCardItem["mci_count_lbl"] = mci_count_lbl

    local mci_name_lbl = fc.FLabel:createBMFont()
    mci_name_lbl:setSize(cc.size(126,24))
    mci_name_lbl:setAnchorPoint(cc.p(0.5,0.5))
    mci_name_lbl:setFontSize(21)
    mci_name_lbl:setString("9999")
    mci_name_lbl:setColor(cc.c3b(0,255,255))
    monthCardItem:appendComponent(mci_name_lbl)
    mci_name_lbl:setPositionInContainer(cc.p(63,119))
    table_monthCardItem["mci_name_lbl"] = mci_name_lbl

    return table_monthCardItem

end

