function createjinluandian_nianhao_new()

    local table_jinluandian_nianhao_new = {}

    local jinluandian_nianhao_new = fc.FContainerPanel:create()
    jinluandian_nianhao_new:setSize(cc.size(520,262))
    table_jinluandian_nianhao_new["jinluandian_nianhao_new"] = jinluandian_nianhao_new

    local zhou_la = fc.FExtensionsImage:create()
    zhou_la:setImage("nobatch/shengzhi2.png")
    zhou_la:setSize(cc.size(250,111))
    zhou_la:setFlipType(2)
    zhou_la:setAnchorPoint(cc.p(0.5,0.5))
    jinluandian_nianhao_new:appendComponent(zhou_la)
    zhou_la:setPositionInContainer(cc.p(136,75.5))
    table_jinluandian_nianhao_new["zhou_la"] = zhou_la

    local zhou_lb = fc.FExtensionsImage:create()
    zhou_lb:setImage("nobatch/shengzhi2.png")
    zhou_lb:setSize(cc.size(250,111))
    zhou_lb:setFlipType(8)
    zhou_lb:setAnchorPoint(cc.p(0.5,0.5))
    jinluandian_nianhao_new:appendComponent(zhou_lb)
    zhou_lb:setPositionInContainer(cc.p(136,186.5))
    table_jinluandian_nianhao_new["zhou_lb"] = zhou_lb

    local zhou_ra = fc.FExtensionsImage:create()
    zhou_ra:setImage("nobatch/shengzhi2.png")
    zhou_ra:setSize(cc.size(250,111))
    zhou_ra:setAnchorPoint(cc.p(0.5,0.5))
    jinluandian_nianhao_new:appendComponent(zhou_ra)
    zhou_ra:setPositionInContainer(cc.p(386,75.5))
    table_jinluandian_nianhao_new["zhou_ra"] = zhou_ra

    local zhou_rb = fc.FExtensionsImage:create()
    zhou_rb:setImage("nobatch/shengzhi2.png")
    zhou_rb:setSize(cc.size(250,111))
    zhou_rb:setFlipType(4)
    zhou_rb:setAnchorPoint(cc.p(0.5,0.5))
    jinluandian_nianhao_new:appendComponent(zhou_rb)
    zhou_rb:setPositionInContainer(cc.p(386,186.5))
    table_jinluandian_nianhao_new["zhou_rb"] = zhou_rb

    local jld_nh_bian1_image = fc.FExtensionsImage:create()
    jld_nh_bian1_image:setImage("nobatch/shengzhi_zhou.png")
    jld_nh_bian1_image:setSize(cc.size(39,262))
    jld_nh_bian1_image:setAnchorPoint(cc.p(0.5,0.5))
    jinluandian_nianhao_new:appendComponent(jld_nh_bian1_image)
    jld_nh_bian1_image:setPositionInContainer(cc.p(19.5,131))
    table_jinluandian_nianhao_new["jld_nh_bian1_image"] = jld_nh_bian1_image

    local jld_nh_bian2_image = fc.FExtensionsImage:create()
    jld_nh_bian2_image:setImage("nobatch/shengzhi_zhou.png")
    jld_nh_bian2_image:setSize(cc.size(39,262))
    jld_nh_bian2_image:setAnchorPoint(cc.p(0.5,0.5))
    jinluandian_nianhao_new:appendComponent(jld_nh_bian2_image)
    jld_nh_bian2_image:setPositionInContainer(cc.p(500.5,131))
    table_jinluandian_nianhao_new["jld_nh_bian2_image"] = jld_nh_bian2_image

    local jld_nh_tishiyu_label = fc.FLabel:createBMFont()
    jld_nh_tishiyu_label:setSize(cc.size(230,30))
    jld_nh_tishiyu_label:setAnchorPoint(cc.p(0.5,0.5))
    jld_nh_tishiyu_label:setFontSize(20)
    jld_nh_tishiyu_label:setString("皇上，请确定本朝年号：")
    jld_nh_tishiyu_label:setColor(cc.c3b(110,48,0))
    jinluandian_nianhao_new:appendComponent(jld_nh_tishiyu_label)
    jld_nh_tishiyu_label:setPositionInContainer(cc.p(261,68))
    table_jinluandian_nianhao_new["jld_nh_tishiyu_label"] = jld_nh_tishiyu_label

    local jld_nh_input_image = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shuruwenzi.png",cc.rect(11,9,47,7))
    jld_nh_input_image:setSize(cc.size(216,48))
    jld_nh_input_image:setAnchorPoint(cc.p(0.5,0.5))
    jinluandian_nianhao_new:appendComponent(jld_nh_input_image)
    jld_nh_input_image:setPositionInContainer(cc.p(263,128))
    table_jinluandian_nianhao_new["jld_nh_input_image"] = jld_nh_input_image

    local jld_nh_queding_button = fc.FTextButton:create()
    jld_nh_queding_button:setSize(cc.size(144,51))
    jld_nh_queding_button:setAnchorPoint(cc.p(0.5,0.5))
    jld_nh_queding_button:setTextButtonImage("batch_ui/goumai_anniu.png","batch_ui/goumai_anniu.png","batch_ui/goumai_anniu.png")
    jld_nh_queding_button:setText("确  定",cc.c3b(255,255,255))
    jld_nh_queding_button:setSelectActionEnbaled(true)
    jinluandian_nianhao_new:appendComponent(jld_nh_queding_button)
    jld_nh_queding_button:setPositionInContainer(cc.p(261,197.5))
    table_jinluandian_nianhao_new["jld_nh_queding_button"] = jld_nh_queding_button

    local jld_nh_input = fc.FInput:create()
    jld_nh_input:setSizeAndBackgroundImage(cc.size(214,48),"","","",false)
    jld_nh_input:setAnchorPoint(cc.p(0.5,0.5))
    jld_nh_input:setTouchEnabled(true)
    jld_nh_input:setFontSize(20)
    jinluandian_nianhao_new:appendComponent(jld_nh_input)
    jld_nh_input:setPositionInContainer(cc.p(264,128))
    table_jinluandian_nianhao_new["jld_nh_input"] = jld_nh_input

    local suiji = fc.FScaleButton:create()
    suiji:setSize(cc.size(61,103))
    suiji:setAnchorPoint(cc.p(0.5,0.5))
    suiji:setButtonImage("batch_ui/zhanbu_xinshouyindao.png")
    jinluandian_nianhao_new:appendComponent(suiji)
    suiji:setPositionInContainer(cc.p(97.5,116.5))
    table_jinluandian_nianhao_new["suiji"] = suiji

    local di_label = fc.FLabel:createBMFont()
    di_label:setSize(cc.size(50,40))
    di_label:setAnchorPoint(cc.p(0.5,0.5))
    di_label:setFontSize(32)
    di_label:setString("【帝】")
    di_label:setColor(cc.c3b(91,24,6))
    jinluandian_nianhao_new:appendComponent(di_label)
    di_label:setPositionInContainer(cc.p(408,124))
    table_jinluandian_nianhao_new["di_label"] = di_label

    return table_jinluandian_nianhao_new

end

