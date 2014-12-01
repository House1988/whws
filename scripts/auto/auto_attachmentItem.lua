function createattachmentItem()

    local table_attachmentItem = {}

    local attachmentItem = fc.FContainerPanel:create()
    attachmentItem:setSize(cc.size(150,200))
    table_attachmentItem["attachmentItem"] = attachmentItem

    local bg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongdikuang1.png",cc.rect(25,25,4,4))
    bg:setSize(cc.size(150,200))
    bg:setAnchorPoint(cc.p(0.5,0.5))
    attachmentItem:appendComponent(bg)
    bg:setPositionInContainer(cc.p(75,100))
    table_attachmentItem["bg"] = bg

    local frame = fc.FExtensionsImage:create()
    frame:setImage("batch_ui/baipinzhi_kuang.png")
    frame:setSize(cc.size(104,104))
    frame:setAnchorPoint(cc.p(0.5,0.5))
    attachmentItem:appendComponent(frame)
    frame:setPositionInContainer(cc.p(75.5,75))
    table_attachmentItem["frame"] = frame

    local line = fc.FExtensionsImage:create()
    line:setImage("batch_ui/ditu2_guoqingxinxi.png")
    line:setSize(cc.size(114,4))
    line:setAnchorPoint(cc.p(0.5,0.5))
    attachmentItem:appendComponent(line)
    line:setPositionInContainer(cc.p(75,139))
    table_attachmentItem["line"] = line

    local line = fc.FExtensionsImage:create()
    line:setImage("batch_ui/ditu2_guoqingxinxi.png")
    line:setSize(cc.size(114,4))
    line:setAnchorPoint(cc.p(0.5,0.5))
    attachmentItem:appendComponent(line)
    line:setPositionInContainer(cc.p(75,181))
    table_attachmentItem["line"] = line

    local name = fc.FLabel:createSystemFont()
    name:setSize(cc.size(100,25))
    name:setAnchorPoint(cc.p(0.5,0.5))
    name:setFontSize(20)
    name:setString("")
    name:setColor(cc.c3b(0, 0, 0))
    attachmentItem:appendComponent(name)
    name:setPositionInContainer(cc.p(75,156.5))
    table_attachmentItem["name"] = name

    local image = fc.FExtensionsImage:create()
    image:setImage("batch_ui/baipinzhi_kuang.png")
    image:setSize(cc.size(90,90))
    image:setAnchorPoint(cc.p(0.5,0.5))
    attachmentItem:appendComponent(image)
    image:setPositionInContainer(cc.p(75.5,75))
    table_attachmentItem["image"] = image

    local piece = fc.FExtensionsImage:create()
    piece:setImage("batch_ui/hunpi_biaozhi.png")
    piece:setSize(cc.size(42,61))
    piece:setAnchorPoint(cc.p(0.5,0.5))
    attachmentItem:appendComponent(piece)
    piece:setPositionInContainer(cc.p(114,95.5))
    table_attachmentItem["piece"] = piece

    return table_attachmentItem

end

