function createjinluandian_zouzhangtanchu()

    local table_jinluandian_zouzhangtanchu = {}

    local jinluandian_zouzhangtanchu = fc.FContainerPanel:create()
    jinluandian_zouzhangtanchu:setSize(cc.size(960,640))
    table_jinluandian_zouzhangtanchu["jinluandian_zouzhangtanchu"] = jinluandian_zouzhangtanchu

    local jld_bantouming_image = fc.FScale9Image:createWithBatchUIFrame("batch_ui/juezhan_heiseditu.png",cc.rect(2,2,1,1))
    jld_bantouming_image:setSize(cc.size(960,640))
    jld_bantouming_image:setAnchorPoint(cc.p(0.5,0.5))
    jinluandian_zouzhangtanchu:appendComponent(jld_bantouming_image)
    jld_bantouming_image:setPositionInContainer(cc.p(480,320))
    table_jinluandian_zouzhangtanchu["jld_bantouming_image"] = jld_bantouming_image

    local jld_zztc_tc_panel = fc.FContainerPanel:create()
    jld_zztc_tc_panel:setSize(cc.size(490,288))
    jld_zztc_tc_panel:setAnchorPoint(cc.p(0.5,0.5))
    jinluandian_zouzhangtanchu:appendComponent(jld_zztc_tc_panel)
    jld_zztc_tc_panel:setPositionInContainer(cc.p(480,320))
    table_jinluandian_zouzhangtanchu["jld_zztc_tc_panel"] = jld_zztc_tc_panel

    local jld_zztc_zouzhang1_scale9 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/zouzhe_1.png",cc.rect(101,41,5,5))
    jld_zztc_zouzhang1_scale9:setSize(cc.size(127,288))
    jld_zztc_zouzhang1_scale9:setAnchorPoint(cc.p(0.5,0.5))
    jld_zztc_tc_panel:appendComponent(jld_zztc_zouzhang1_scale9)
    jld_zztc_zouzhang1_scale9:setPositionInContainer(cc.p(66.5,144))
    table_jinluandian_zouzhangtanchu["jld_zztc_zouzhang1_scale9"] = jld_zztc_zouzhang1_scale9

    local jld_zztc_zouzhang2_scale9 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/zouzhe_2.png",cc.rect(24,42,5,5))
    jld_zztc_zouzhang2_scale9:setSize(cc.size(118,277))
    jld_zztc_zouzhang2_scale9:setAnchorPoint(cc.p(0.5,0.5))
    jld_zztc_tc_panel:appendComponent(jld_zztc_zouzhang2_scale9)
    jld_zztc_zouzhang2_scale9:setPositionInContainer(cc.p(186,144.5))
    table_jinluandian_zouzhangtanchu["jld_zztc_zouzhang2_scale9"] = jld_zztc_zouzhang2_scale9

    local jld_zztc_zouzhang3_scale9 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/zouzhe_2.png",cc.rect(24,42,5,5))
    jld_zztc_zouzhang3_scale9:setSize(cc.size(118,277))
    jld_zztc_zouzhang3_scale9:setAnchorPoint(cc.p(0.5,0.5))
    jld_zztc_tc_panel:appendComponent(jld_zztc_zouzhang3_scale9)
    jld_zztc_zouzhang3_scale9:setPositionInContainer(cc.p(304,144.5))
    table_jinluandian_zouzhangtanchu["jld_zztc_zouzhang3_scale9"] = jld_zztc_zouzhang3_scale9

    local jld_zztc_zouzhang4_scale9 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/zouzhe_1.png",cc.rect(101,41,5,5))
    jld_zztc_zouzhang4_scale9:setSize(cc.size(127,288))
    jld_zztc_zouzhang4_scale9:setAnchorPoint(cc.p(0.5,0.5))
    jld_zztc_zouzhang4_scale9:setScaleX(-1)
    jld_zztc_tc_panel:appendComponent(jld_zztc_zouzhang4_scale9)
    jld_zztc_zouzhang4_scale9:setPositionInContainer(cc.p(424.5,144))
    table_jinluandian_zouzhangtanchu["jld_zztc_zouzhang4_scale9"] = jld_zztc_zouzhang4_scale9

    local jld_zztc_button1 = fc.FTextButton:create()
    jld_zztc_button1:setSize(cc.size(144,53))
    jld_zztc_button1:setAnchorPoint(cc.p(0.5,0.5))
    jld_zztc_button1:setTextButtonImage("batch_ui/putonganniu1_up.png","batch_ui/putonganniu1_up.png","batch_ui/putonganniu1_up.png")
    jld_zztc_button1:setSelectActionEnbaled(true)
    jld_zztc_tc_panel:appendComponent(jld_zztc_button1)
    jld_zztc_button1:setPositionInContainer(cc.p(94,142.5))
    table_jinluandian_zouzhangtanchu["jld_zztc_button1"] = jld_zztc_button1

    local jld_zztc_button3 = fc.FTextButton:create()
    jld_zztc_button3:setSize(cc.size(144,53))
    jld_zztc_button3:setAnchorPoint(cc.p(0.5,0.5))
    jld_zztc_button3:setTextButtonImage("batch_ui/putonganniu1_up.png","batch_ui/putonganniu1_up.png","batch_ui/putonganniu1_up.png")
    jld_zztc_button3:setSelectActionEnbaled(true)
    jld_zztc_tc_panel:appendComponent(jld_zztc_button3)
    jld_zztc_button3:setPositionInContainer(cc.p(402,142.5))
    table_jinluandian_zouzhangtanchu["jld_zztc_button3"] = jld_zztc_button3

    local jld_zztc_button4 = fc.FTextButton:create()
    jld_zztc_button4:setSize(cc.size(343,48))
    jld_zztc_button4:setAnchorPoint(cc.p(0.5,0.5))
    jld_zztc_button4:setTextButtonImage("nobatch/anniu_jinluandian.png","nobatch/anniu_jinluandian.png","nobatch/anniu_jinluandian.png")
   	if LANGUAGE_TYPE == 3 then
   		jld_zztc_button4:setText("沒事，朕就是想看看你",cc.c3b(138,70,28))
   	else
   		jld_zztc_button4:setText("没事，朕就是想看看你",cc.c3b(138,70,28))
   	end
    jld_zztc_button4:setSelectActionEnbaled(true)
    jld_zztc_tc_panel:appendComponent(jld_zztc_button4)
    jld_zztc_button4:setPositionInContainer(cc.p(252.5,215))
    table_jinluandian_zouzhangtanchu["jld_zztc_button4"] = jld_zztc_button4

    local jld_zztc_button2 = fc.FTextButton:create()
    jld_zztc_button2:setSize(cc.size(144,53))
    jld_zztc_button2:setAnchorPoint(cc.p(0.5,0.5))
    jld_zztc_button2:setTextButtonImage("batch_ui/putonganniu1_up.png","batch_ui/putonganniu1_up.png","batch_ui/putonganniu1_up.png")
    jld_zztc_button2:setSelectActionEnbaled(true)
    jld_zztc_tc_panel:appendComponent(jld_zztc_button2)
    jld_zztc_button2:setPositionInContainer(cc.p(248,142.5))
    table_jinluandian_zouzhangtanchu["jld_zztc_button2"] = jld_zztc_button2

    local jld_zztc_fenfu_label = fc.FLabel:createBMFont()
    jld_zztc_fenfu_label:setSize(cc.size(210,30))
    jld_zztc_fenfu_label:setAnchorPoint(cc.p(0.5,0.5))
    jld_zztc_fenfu_label:setFontSize(20)
    jld_zztc_fenfu_label:setString("礼部大臣：请皇上吩咐")
    jld_zztc_fenfu_label:setColor(cc.c3b(0,0,0))
    jld_zztc_tc_panel:appendComponent(jld_zztc_fenfu_label)
    jld_zztc_fenfu_label:setPositionInContainer(cc.p(245,75))
    table_jinluandian_zouzhangtanchu["jld_zztc_fenfu_label"] = jld_zztc_fenfu_label

    return table_jinluandian_zouzhangtanchu

end

