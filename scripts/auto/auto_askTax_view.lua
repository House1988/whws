function createaskTax_view()
    local table_askTax_view = {}

    local askTax_view = fc.FContainerPanel:create()
    askTax_view:setSize(cc.size(180,50))
    table_askTax_view["askTax_view"] = askTax_view

    local yinliangimage = fc.FExtensionsImage:create()
    yinliangimage:setImage("batch_ui/yinliangDouble.png")
    yinliangimage:setSize(cc.size(54,42))
    yinliangimage:setAnchorPoint(cc.p(0.5,0.5))
    askTax_view:appendComponent(yinliangimage)
    yinliangimage:setPositionInContainer(cc.p(33,25))
    table_askTax_view["yinliangimage"] = yinliangimage

    local yinliang_di = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shuruwenzi.png",cc.rect(11,9,47,7))
    yinliang_di:setSize(cc.size(100,30))
    yinliang_di:setAnchorPoint(cc.p(0.5,0.5))
    askTax_view:appendComponent(yinliang_di)
    yinliang_di:setPositionInContainer(cc.p(120,25))
    table_askTax_view["yinliang_di"] = yinliang_di

    local add_silver_num1 = fc.FLabel:createBMFont()
    add_silver_num1:setSize(cc.size(80,30))
    add_silver_num1:setAnchorPoint(cc.p(0.5,0.5))
    add_silver_num1:setFontSize(20)
    add_silver_num1:setString("+100")
    add_silver_num1:setColor(cc.c3b(255,255,0))
    askTax_view:appendComponent(add_silver_num1)
    add_silver_num1:setPositionInContainer(cc.p(119,22))
    table_askTax_view["add_silver_num1"] = add_silver_num1

    return table_askTax_view

end

