function createjuezhan()

    local table_juezhan = {}

    local juezhan = fc.FContainerPanel:create()
    juezhan:setSize(cc.size(960,640))
    table_juezhan["juezhan"] = juezhan

    local juzhan_ditu_scale9Image = fc.FScale9Image:createWithBatchUIFrame("batch_ui/juezhan_heiseditu.png",cc.rect(1,1,3,3))
    juzhan_ditu_scale9Image:setSize(cc.size(960,640))
    juzhan_ditu_scale9Image:setAnchorPoint(cc.p(0.5,0.5))
    juezhan:appendComponent(juzhan_ditu_scale9Image)
    juzhan_ditu_scale9Image:setPositionInContainer(cc.p(480,320))
    table_juezhan["juzhan_ditu_scale9Image"] = juzhan_ditu_scale9Image

    local juzhan_player1_name_label = fc.FLabel:createSystemFont()
    juzhan_player1_name_label:setSize(cc.size(110,30))
    juzhan_player1_name_label:setAnchorPoint(cc.p(0.5,0.5))
    juzhan_player1_name_label:setFontSize(20)
    juzhan_player1_name_label:setString("玩家的姓名")
    juzhan_player1_name_label:setColor(cc.c3b(255,255,255))
    juezhan:appendComponent(juzhan_player1_name_label)
    juzhan_player1_name_label:setPositionInContainer(cc.p(805,25))
    table_juezhan["juzhan_player1_name_label"] = juzhan_player1_name_label

    local juzhan_player2_name_label = fc.FLabel:createSystemFont()
    juzhan_player2_name_label:setSize(cc.size(110,30))
    juzhan_player2_name_label:setAnchorPoint(cc.p(0.5,0.5))
    juzhan_player2_name_label:setFontSize(20)
    juzhan_player2_name_label:setString("玩家的姓名")
    juzhan_player2_name_label:setColor(cc.c3b(255,255,255))
    juezhan:appendComponent(juzhan_player2_name_label)
    juzhan_player2_name_label:setPositionInContainer(cc.p(145,615))
    table_juezhan["juzhan_player2_name_label"] = juzhan_player2_name_label

    local juezhan_ditu4_image = fc.FExtensionsImage:create()
    juezhan_ditu4_image:setImage("nobatch/juezhan_ditu4.png")
    juezhan_ditu4_image:setSize(cc.size(532,352))
    juezhan_ditu4_image:setAnchorPoint(cc.p(0.5,0.5))
    juezhan:appendComponent(juezhan_ditu4_image)
    juezhan_ditu4_image:setPositionInContainer(cc.p(490,397))
    table_juezhan["juezhan_ditu4_image"] = juezhan_ditu4_image

    local juezhan_ditu3_image = fc.FExtensionsImage:create()
    juezhan_ditu3_image:setImage("nobatch/juezhan_ditu3.png")
    juezhan_ditu3_image:setSize(cc.size(424,360))
    juezhan_ditu3_image:setAnchorPoint(cc.p(0.5,0.5))
    juezhan:appendComponent(juezhan_ditu3_image)
    juezhan_ditu3_image:setPositionInContainer(cc.p(519,206))
    table_juezhan["juezhan_ditu3_image"] = juezhan_ditu3_image

    local juezhan_ditu2_image = fc.FExtensionsImage:create()
    juezhan_ditu2_image:setImage("batch_ui/juezhan_ditu2.png")
    juezhan_ditu2_image:setSize(cc.size(254,208))
    juezhan_ditu2_image:setAnchorPoint(cc.p(0.5,0.5))
    juezhan:appendComponent(juezhan_ditu2_image)
    juezhan_ditu2_image:setPositionInContainer(cc.p(391,406))
    table_juezhan["juezhan_ditu2_image"] = juezhan_ditu2_image

    local juezhan_ditu1_image = fc.FExtensionsImage:create()
    juezhan_ditu1_image:setImage("batch_ui/juezhan_ditu1.png")
    juezhan_ditu1_image:setSize(cc.size(232,221))
    juezhan_ditu1_image:setAnchorPoint(cc.p(0.5,0.5))
    juezhan:appendComponent(juezhan_ditu1_image)
    juezhan_ditu1_image:setPositionInContainer(cc.p(576,226))
    table_juezhan["juezhan_ditu1_image"] = juezhan_ditu1_image

    return table_juezhan

end

