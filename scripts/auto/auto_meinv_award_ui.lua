function createmeinv_award_ui()

    local table_meinv_award_ui = {}

    local meinv_award_ui = fc.FContainerPanel:create()
    meinv_award_ui:setSize(cc.size(960,640))
    table_meinv_award_ui["meinv_award_ui"] = meinv_award_ui

    local image_bg_lt = fc.FExtensionsImage:create()
    image_bg_lt:setImage("nobatch/shengzhi2.png")
    image_bg_lt:setSize(cc.size(370,216))
    image_bg_lt:setFlipType(2)
    image_bg_lt:setAnchorPoint(cc.p(0.5,0.5))
    meinv_award_ui:appendComponent(image_bg_lt)
    image_bg_lt:setPositionInContainer(cc.p(295,216))
    table_meinv_award_ui["image_bg_lt"] = image_bg_lt

    local image_bg_lb = fc.FExtensionsImage:create()
    image_bg_lb:setImage("nobatch/shengzhi2.png")
    image_bg_lb:setSize(cc.size(370,216))
    image_bg_lb:setFlipType(8)
    image_bg_lb:setAnchorPoint(cc.p(0.5,0.5))
    meinv_award_ui:appendComponent(image_bg_lb)
    image_bg_lb:setPositionInContainer(cc.p(295,432))
    table_meinv_award_ui["image_bg_lb"] = image_bg_lb

    local image_bg_rt = fc.FExtensionsImage:create()
    image_bg_rt:setImage("nobatch/shengzhi2.png")
    image_bg_rt:setSize(cc.size(370,216))
    image_bg_rt:setAnchorPoint(cc.p(0.5,0.5))
    meinv_award_ui:appendComponent(image_bg_rt)
    image_bg_rt:setPositionInContainer(cc.p(665,216))
    table_meinv_award_ui["image_bg_rt"] = image_bg_rt

    local image_bg_rb = fc.FExtensionsImage:create()
    image_bg_rb:setImage("nobatch/shengzhi2.png")
    image_bg_rb:setSize(cc.size(370,216))
    image_bg_rb:setFlipType(4)
    image_bg_rb:setAnchorPoint(cc.p(0.5,0.5))
    meinv_award_ui:appendComponent(image_bg_rb)
    image_bg_rb:setPositionInContainer(cc.p(665,432))
    table_meinv_award_ui["image_bg_rb"] = image_bg_rb

    local ma_zhou_l = fc.FExtensionsImage:create()
    ma_zhou_l:setImage("nobatch/shengzhi_zhou.png")
    ma_zhou_l:setSize(cc.size(54,536))
    ma_zhou_l:setAnchorPoint(cc.p(0.5,0.5))
    meinv_award_ui:appendComponent(ma_zhou_l)
    ma_zhou_l:setPositionInContainer(cc.p(90,323))
    table_meinv_award_ui["ma_zhou_l"] = ma_zhou_l

    local ma_zhou_r = fc.FExtensionsImage:create()
    ma_zhou_r:setImage("nobatch/shengzhi_zhou.png")
    ma_zhou_r:setSize(cc.size(54,537))
    ma_zhou_r:setAnchorPoint(cc.p(0.5,0.5))
    meinv_award_ui:appendComponent(ma_zhou_r)
    ma_zhou_r:setPositionInContainer(cc.p(869,323.5))
    table_meinv_award_ui["ma_zhou_r"] = ma_zhou_r

    local scale9_bg = fc.FScale9Image:createWithBatchUIFrame("nobatch/banzidikuangmeinv3_tongyong.png",cc.rect(75,75,10,10))
    scale9_bg:setSize(cc.size(700,382))
    scale9_bg:setAnchorPoint(cc.p(0.5,0.5))
    meinv_award_ui:appendComponent(scale9_bg)
    scale9_bg:setPositionInContainer(cc.p(480,323))
    table_meinv_award_ui["scale9_bg"] = scale9_bg

    local title_bg = fc.FExtensionsImage:create()
    title_bg:setImage("nobatch/shengli_biaotikuang.png")
    title_bg:setSize(cc.size(340,52))
    title_bg:setAnchorPoint(cc.p(0.5,0.5))
    meinv_award_ui:appendComponent(title_bg)
    title_bg:setPositionInContainer(cc.p(480,110))
    table_meinv_award_ui["title_bg"] = title_bg

    local ma_shang = fc.FExtensionsImage:create()
    ma_shang:setImage("batch_ui/shangci_shang.png")
    ma_shang:setSize(cc.size(49,54))
    ma_shang:setAnchorPoint(cc.p(0.5,0.5))
    meinv_award_ui:appendComponent(ma_shang)
    ma_shang:setPositionInContainer(cc.p(455.5,101))
    table_meinv_award_ui["ma_shang"] = ma_shang

    local ma_ci = fc.FExtensionsImage:create()
    ma_ci:setImage("batch_ui/shangci_ci.png")
    ma_ci:setSize(cc.size(49,54))
    ma_ci:setAnchorPoint(cc.p(0.5,0.5))
    meinv_award_ui:appendComponent(ma_ci)
    ma_ci:setPositionInContainer(cc.p(504.5,101))
    table_meinv_award_ui["ma_ci"] = ma_ci

    local ma_title_bg1 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/zongjiachengdikuang_tangquanxinggong.png",cc.rect(62,0,22,9))
    ma_title_bg1:setSize(cc.size(688,29))
    ma_title_bg1:setAnchorPoint(cc.p(0.5,0.5))
    meinv_award_ui:appendComponent(ma_title_bg1)
    ma_title_bg1:setPositionInContainer(cc.p(480,152.5))
    table_meinv_award_ui["ma_title_bg1"] = ma_title_bg1

    local ma_title_bg2 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/zongjiachengdikuang_tangquanxinggong.png",cc.rect(62,0,22,9))
    ma_title_bg2:setSize(cc.size(688,29))
    ma_title_bg2:setAnchorPoint(cc.p(0.5,0.5))
    meinv_award_ui:appendComponent(ma_title_bg2)
    ma_title_bg2:setPositionInContainer(cc.p(479,341.5))
    table_meinv_award_ui["ma_title_bg2"] = ma_title_bg2

    local ma_close_btn = fc.FTextButton:create()
    ma_close_btn:setSize(cc.size(52,52))
    ma_close_btn:setAnchorPoint(cc.p(0.5,0.5))
    ma_close_btn:setTextButtonImage("batch_ui/guanbi_up.png","batch_ui/guanbi_up.png","batch_ui/guanbi_up.png")
    ma_close_btn:setSelectActionEnbaled(true)
    meinv_award_ui:appendComponent(ma_close_btn)
    ma_close_btn:setPositionInContainer(cc.p(868,132))
    table_meinv_award_ui["ma_close_btn"] = ma_close_btn

    local ma_title_1 = fc.FLabel:createBMFont()
    ma_title_1:setSize(cc.size(120,25))
    ma_title_1:setAnchorPoint(cc.p(0.5,0.5))
    ma_title_1:setFontSize(21)
    if LANGUAGE_TYPE == 3 then
    	ma_title_1:setString("當前興趣點：")
    else
    	ma_title_1:setString("当前兴趣点：")
    end
    ma_title_1:setColor(cc.c3b(255, 255, 255))
    meinv_award_ui:appendComponent(ma_title_1)
    ma_title_1:setPositionInContainer(cc.p(460,150.5))
    table_meinv_award_ui["ma_title_1"] = ma_title_1

    local ma_title_2 = fc.FLabel:createBMFont()
    ma_title_2:setSize(cc.size(120,25))
    ma_title_2:setAnchorPoint(cc.p(0.5,0.5))
    ma_title_2:setFontSize(21)
    if LANGUAGE_TYPE == 3 then
    	 ma_title_2:setString("當前親密度：")
    else
    	 ma_title_2:setString("当前亲密度：")
    end
    ma_title_2:setColor(cc.c3b(255, 255, 255))
    meinv_award_ui:appendComponent(ma_title_2)
    ma_title_2:setPositionInContainer(cc.p(460,338.5))
    table_meinv_award_ui["ma_title_2"] = ma_title_2

    local ma_interest_value_lbl = fc.FLabel:createBMFont()
    ma_interest_value_lbl:setSize(cc.size(40,25))
    ma_interest_value_lbl:setAnchorPoint(cc.p(0.5,0.5))
    ma_interest_value_lbl:setFontSize(21)
    ma_interest_value_lbl:setString("")
    ma_interest_value_lbl:setColor(cc.c3b(138,228,219))
    meinv_award_ui:appendComponent(ma_interest_value_lbl)
    ma_interest_value_lbl:setPositionInContainer(cc.p(540,150.5))
    table_meinv_award_ui["ma_interest_value_lbl"] = ma_interest_value_lbl

    local ma_intimate_value_lbl = fc.FLabel:createBMFont()
    ma_intimate_value_lbl:setSize(cc.size(40,25))
    ma_intimate_value_lbl:setAnchorPoint(cc.p(0.5,0.5))
    ma_intimate_value_lbl:setFontSize(21)
    ma_intimate_value_lbl:setString("")
    ma_intimate_value_lbl:setColor(cc.c3b(138,228,219))
    meinv_award_ui:appendComponent(ma_intimate_value_lbl)
    ma_intimate_value_lbl:setPositionInContainer(cc.p(540,338.5))
    table_meinv_award_ui["ma_intimate_value_lbl"] = ma_intimate_value_lbl

    local ma_interest_list = fc.FContainerList:create(2)
    ma_interest_list:setSize(cc.size(640,140))
    ma_interest_list:setAnchorPoint(cc.p(0.5,0.5))
    meinv_award_ui:appendComponent(ma_interest_list)
    ma_interest_list:setPositionInContainer(cc.p(480,245))
    table_meinv_award_ui["ma_interest_list"] = ma_interest_list

    local ma_intimate_list = fc.FContainerList:create(2)
    ma_intimate_list:setSize(cc.size(640,140))
    ma_intimate_list:setAnchorPoint(cc.p(0.5,0.5))
    meinv_award_ui:appendComponent(ma_intimate_list)
    ma_intimate_list:setPositionInContainer(cc.p(480,433))
    table_meinv_award_ui["ma_intimate_list"] = ma_intimate_list

    return table_meinv_award_ui

end

