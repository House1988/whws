function createuser_item_view()

    local table_user_item_view = {}

    local user_item_view = fc.FContainerPanel:create()
    user_item_view:setSize(cc.size(960,578))
    table_user_item_view["user_item_view"] = user_item_view

    local all_use_btn = fc.FTextButton:create()
    all_use_btn:setSize(cc.size(144,51))
    all_use_btn:setAnchorPoint(cc.p(0.5,0.5))
    all_use_btn:setTextButtonImage("batch_ui/gongjizhiduihuan_anniu.png","batch_ui/gongjizhiduihuan_anniu.png","batch_ui/gongjizhiduihuan_anniu.png")
    all_use_btn:setText("全部使用",cc.c3b(166,72,29))
    all_use_btn:setSelectActionEnbaled(true)
    user_item_view:appendComponent(all_use_btn)
    all_use_btn:setPositionInContainer(cc.p(97,540.5))
    table_user_item_view["all_use_btn"] = all_use_btn

    local use_select_btn = fc.FTextButton:create()
    use_select_btn:setSize(cc.size(144,51))
    use_select_btn:setAnchorPoint(cc.p(0.5,0.5))
    use_select_btn:setTextButtonImage("batch_ui/gongjizhiduihuan_anniu.png","batch_ui/gongjizhiduihuan_anniu.png","batch_ui/gongjizhiduihuan_anniu.png")
    use_select_btn:setText("使用",cc.c3b(166,72,29))
    use_select_btn:setSelectActionEnbaled(true)
    user_item_view:appendComponent(use_select_btn)
    use_select_btn:setPositionInContainer(cc.p(871,540.5))
    table_user_item_view["use_select_btn"] = use_select_btn

    local upgrade_btn = fc.FTextButton:create()
    upgrade_btn:setSize(cc.size(144,51))
    upgrade_btn:setAnchorPoint(cc.p(0.5,0.5))
    upgrade_btn:setTextButtonImage("batch_ui/gongjizhiduihuan_anniu.png","batch_ui/gongjizhiduihuan_anniu.png","batch_ui/gongjizhiduihuan_anniu.png")
    if  LANGUAGE_TYPE == 3 then
    	upgrade_btn:setText("升級",cc.c3b(166,72,29))    
    else
  	  	upgrade_btn:setText("升级",cc.c3b(166,72,29))
    end 
    upgrade_btn:setSelectActionEnbaled(true)
    user_item_view:appendComponent(upgrade_btn)
    upgrade_btn:setPositionInContainer(cc.p(717,540.5))
    table_user_item_view["upgrade_btn"] = upgrade_btn

    local pagebg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shuruwenzi.png",cc.rect(11,9,47,7))
    pagebg:setSize(cc.size(100,30))
    pagebg:setAnchorPoint(cc.p(0.5,0.5))
    user_item_view:appendComponent(pagebg)
    pagebg:setPositionInContainer(cc.p(480,541))
    table_user_item_view["pagebg"] = pagebg

    local pageText = fc.FLabel:createSystemFont()
    pageText:setSize(cc.size(100,25))
    pageText:setAnchorPoint(cc.p(0.5,0.5))
    pageText:setFontSize(20)
    pageText:setString("")
    pageText:setColor(cc.c3b(255, 255, 255))
    user_item_view:appendComponent(pageText)
    pageText:setPositionInContainer(cc.p(480,536.5))
    table_user_item_view["pageText"] = pageText

    return table_user_item_view

end

