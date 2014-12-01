function createnanzhengbeitao_book()

    local table_nanzhengbeitao_book = {}

    local nanzhengbeitao_book = fc.FContainerPanel:create()
    nanzhengbeitao_book:setSize(cc.size(150,232))
    table_nanzhengbeitao_book["nanzhengbeitao_book"] = nanzhengbeitao_book

    local nzbt_book_bg_image = fc.FShaderExtensionsImage:create(0)
    nzbt_book_bg_image:setAnchorPoint(cc.p(0.5,0.5))
    nzbt_book_bg_image:setImage("nobatch/zouzhang.png")
    nzbt_book_bg_image:setSize(cc.size(155,238))
    nanzhengbeitao_book:appendComponent(nzbt_book_bg_image)
    nzbt_book_bg_image:setPositionInContainer(cc.p(77.5,119))
    table_nanzhengbeitao_book["nzbt_book_bg_image"] = nzbt_book_bg_image

    local nzbt_book_label = fc.FLabel:createBMFont()
    nzbt_book_label:setSize(cc.size(40,120))
    nzbt_book_label:setWidth(40)
    nzbt_book_label:setAnchorPoint(cc.p(0.5,0.5))
    nzbt_book_label:setFontSize(32)
    nzbt_book_label:setString("防守")
    nzbt_book_label:setColor(cc.c3b(104,47,16))
    nanzhengbeitao_book:appendComponent(nzbt_book_label)
    nzbt_book_label:setPositionInContainer(cc.p(74,111))
    table_nanzhengbeitao_book["nzbt_book_label"] = nzbt_book_label

    local nzbt_book_tongguan_image = fc.FShaderExtensionsImage:create(0)
    nzbt_book_tongguan_image:setAnchorPoint(cc.p(0.5,0.5))
    nzbt_book_tongguan_image:setImage("batch_ui/tongguan_yinzhang.png")
    nzbt_book_tongguan_image:setSize(cc.size(76,67))
    nanzhengbeitao_book:appendComponent(nzbt_book_tongguan_image)
    nzbt_book_tongguan_image:setPositionInContainer(cc.p(101,196.5))
    table_nanzhengbeitao_book["nzbt_book_tongguan_image"] = nzbt_book_tongguan_image

    local special_tag = fc.FShaderExtensionsImage:create(0)
    special_tag:setAnchorPoint(cc.p(0.5,0.5))
    special_tag:setImage("batch_ui/jingying_jiaobiao.png")
    special_tag:setSize(cc.size(63,68))
    nanzhengbeitao_book:appendComponent(special_tag)
    special_tag:setPositionInContainer(cc.p(124.5,33))
    table_nanzhengbeitao_book["special_tag"] = special_tag

    local nzbt_book_weikaiqi_image = fc.FShaderExtensionsImage:create(0)
    nzbt_book_weikaiqi_image:setAnchorPoint(cc.p(0.5,0.5))
    nzbt_book_weikaiqi_image:setImage("batch_ui/weikaiqi.png")
    nzbt_book_weikaiqi_image:setSize(cc.size(158,136))
    nanzhengbeitao_book:appendComponent(nzbt_book_weikaiqi_image)
    nzbt_book_weikaiqi_image:setPositionInContainer(cc.p(74,116))
    table_nanzhengbeitao_book["nzbt_book_weikaiqi_image"] = nzbt_book_weikaiqi_image

    return table_nanzhengbeitao_book

end

