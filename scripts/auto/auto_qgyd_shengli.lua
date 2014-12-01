function createqgyd_shengli()

    local table_qgyd_shengli = {}

    local qgyd_shengli = fc.FContainerPanel:create()
    qgyd_shengli:setSize(cc.size(960,640))
    table_qgyd_shengli["qgyd_shengli"] = qgyd_shengli

    local qgyd_shengli_bottom = fc.FContainerPanel:create()
    qgyd_shengli_bottom:setSize(cc.size(700,600))
    qgyd_shengli_bottom:setAnchorPoint(cc.p(0.5,0.5))
    qgyd_shengli:appendComponent(qgyd_shengli_bottom)
    qgyd_shengli_bottom:setPositionInContainer(cc.p(506,300))
    table_qgyd_shengli["qgyd_shengli_bottom"] = qgyd_shengli_bottom

    local shengli_bg_l = fc.FExtensionsImage:create()
    shengli_bg_l:setImage("nobatch/shengli.png")
    shengli_bg_l:setSize(cc.size(202,488))
    shengli_bg_l:setAnchorPoint(cc.p(0.5,0.5))
    qgyd_shengli_bottom:appendComponent(shengli_bg_l)
    shengli_bg_l:setPositionInContainer(cc.p(230,337))
    table_qgyd_shengli["shengli_bg_l"] = shengli_bg_l

    local shengli_bg_r = fc.FExtensionsImage:create()
    shengli_bg_r:setImage("nobatch/shengli.png")
    shengli_bg_r:setSize(cc.size(202,488))
    shengli_bg_r:setFlipType(2)
    shengli_bg_r:setAnchorPoint(cc.p(0.5,0.5))
    qgyd_shengli_bottom:appendComponent(shengli_bg_r)
    shengli_bg_r:setPositionInContainer(cc.p(432,337))
    table_qgyd_shengli["shengli_bg_r"] = shengli_bg_r

    local title_bg_image = fc.FScale9Image:createWithBatchUIFrame("nobatch/shengli_biaotikuang.png",cc.rect(233,30,5,5))
    title_bg_image:setSize(cc.size(578,87))
    title_bg_image:setAnchorPoint(cc.p(0.5,0.5))
    qgyd_shengli_bottom:appendComponent(title_bg_image)
    title_bg_image:setPositionInContainer(cc.p(327,84.5))
    table_qgyd_shengli["title_bg_image"] = title_bg_image

    local line_l = fc.FExtensionsImage:create()
    line_l:setImage("batch_ui/sheng_shengli.png")
    line_l:setSize(cc.size(27,73))
    line_l:setAnchorPoint(cc.p(0.5,0.5))
    qgyd_shengli_bottom:appendComponent(line_l)
    line_l:setPositionInContainer(cc.p(182.5,36.5))
    table_qgyd_shengli["line_l"] = line_l

    local line_r = fc.FExtensionsImage:create()
    line_r:setImage("batch_ui/sheng_shengli.png")
    line_r:setSize(cc.size(27,73))
    line_r:setAnchorPoint(cc.p(0.5,0.5))
    qgyd_shengli_bottom:appendComponent(line_r)
    line_r:setPositionInContainer(cc.p(488.5,36.5))
    table_qgyd_shengli["line_r"] = line_r

    local sui1 = fc.FExtensionsImage:create()
    sui1:setImage("batch_ui/sui_shengli.png")
    sui1:setSize(cc.size(80,179))
    sui1:setAnchorPoint(cc.p(0.5,0.5))
    qgyd_shengli_bottom:appendComponent(sui1)
    sui1:setPositionInContainer(cc.p(86,175.5))
    table_qgyd_shengli["sui1"] = sui1

    local sui2 = fc.FExtensionsImage:create()
    sui2:setImage("batch_ui/sui_shengli.png")
    sui2:setSize(cc.size(80,179))
    sui2:setFlipType(2)
    sui2:setAnchorPoint(cc.p(0.5,0.5))
    qgyd_shengli_bottom:appendComponent(sui2)
    sui2:setPositionInContainer(cc.p(574,175.5))
    table_qgyd_shengli["sui2"] = sui2

    local qgyd_shengli_yuanbao_image = fc.FExtensionsImage:create()
    qgyd_shengli_yuanbao_image:setImage("batch_ui/yuanbao_da.png")
    qgyd_shengli_yuanbao_image:setSize(cc.size(58,43))
    qgyd_shengli_yuanbao_image:setAnchorPoint(cc.p(0.5,0.5))
    qgyd_shengli_bottom:appendComponent(qgyd_shengli_yuanbao_image)
    qgyd_shengli_yuanbao_image:setPositionInContainer(cc.p(204,327.5))
    table_qgyd_shengli["qgyd_shengli_yuanbao_image"] = qgyd_shengli_yuanbao_image

    local qgyd_shengli_yuanbao_num_label = fc.FLabel:createBMFont()
    qgyd_shengli_yuanbao_num_label:setSize(cc.size(80,30))
    qgyd_shengli_yuanbao_num_label:setAnchorPoint(cc.p(0.5,0.5))
    qgyd_shengli_yuanbao_num_label:setFontSize(21)
    qgyd_shengli_yuanbao_num_label:setString("+99999")
    qgyd_shengli_yuanbao_num_label:setColor(cc.c3b(137,32,18))
    qgyd_shengli_bottom:appendComponent(qgyd_shengli_yuanbao_num_label)
    qgyd_shengli_yuanbao_num_label:setPositionInContainer(cc.p(273,328))
    table_qgyd_shengli["qgyd_shengli_yuanbao_num_label"] = qgyd_shengli_yuanbao_num_label

    local qgyd_shengli_tishengzhi_image = fc.FContainerPanel:create()
    qgyd_shengli_tishengzhi_image:setSize(cc.size(155,30))
    qgyd_shengli_tishengzhi_image:setAnchorPoint(cc.p(0.5,0.5))
    qgyd_shengli_bottom:appendComponent(qgyd_shengli_tishengzhi_image)
    qgyd_shengli_tishengzhi_image:setPositionInContainer(cc.p(273.5,178))
    table_qgyd_shengli["qgyd_shengli_tishengzhi_image"] = qgyd_shengli_tishengzhi_image

    local pai = fc.FExtensionsImage:create()
    pai:setImage("batch_ui/pai_uizi.png")
    pai:setSize(cc.size(32,32))
    pai:setAnchorPoint(cc.p(0.5,0.5))
    qgyd_shengli_tishengzhi_image:appendComponent(pai)
    pai:setPositionInContainer(cc.p(16,16))
    table_qgyd_shengli["pai"] = pai

    local ming = fc.FExtensionsImage:create()
    ming:setImage("batch_ui/ming_uizi.png")
    ming:setSize(cc.size(32,32))
    ming:setAnchorPoint(cc.p(0.5,0.5))
    qgyd_shengli_tishengzhi_image:appendComponent(ming)
    ming:setPositionInContainer(cc.p(47,16))
    table_qgyd_shengli["ming"] = ming

    local ti = fc.FExtensionsImage:create()
    ti:setImage("batch_ui/ti2_uizi.png")
    ti:setSize(cc.size(32,32))
    ti:setAnchorPoint(cc.p(0.5,0.5))
    qgyd_shengli_tishengzhi_image:appendComponent(ti)
    ti:setPositionInContainer(cc.p(78,16))
    table_qgyd_shengli["ti"] = ti

    local sheng = fc.FExtensionsImage:create()
    sheng:setImage("batch_ui/sheng1_uizi.png")
    sheng:setSize(cc.size(32,32))
    sheng:setAnchorPoint(cc.p(0.5,0.5))
    qgyd_shengli_tishengzhi_image:appendComponent(sheng)
    sheng:setPositionInContainer(cc.p(108,16))
    table_qgyd_shengli["sheng"] = sheng

    local zhi1 = fc.FExtensionsImage:create()
    zhi1:setImage("batch_ui/zhi2_uizi.png")
    zhi1:setSize(cc.size(32,32))
    zhi1:setAnchorPoint(cc.p(0.5,0.5))
    qgyd_shengli_tishengzhi_image:appendComponent(zhi1)
    zhi1:setPositionInContainer(cc.p(139,16))
    table_qgyd_shengli["zhi1"] = zhi1

    local qgyd_shengli_tishengzhi_num_label = fc.FLabel:createBMFont()
    qgyd_shengli_tishengzhi_num_label:setSize(cc.size(80,30))
    qgyd_shengli_tishengzhi_num_label:setAnchorPoint(cc.p(0.5,0.5))
    qgyd_shengli_tishengzhi_num_label:setFontSize(21)
    qgyd_shengli_tishengzhi_num_label:setString("+99999")
    qgyd_shengli_tishengzhi_num_label:setColor(cc.c3b(137,32,18))
    qgyd_shengli_bottom:appendComponent(qgyd_shengli_tishengzhi_num_label)
    qgyd_shengli_tishengzhi_num_label:setPositionInContainer(cc.p(402,175))
    table_qgyd_shengli["qgyd_shengli_tishengzhi_num_label"] = qgyd_shengli_tishengzhi_num_label

    local qgyd_shengli_gongji_num_label = fc.FLabel:createBMFont()
    qgyd_shengli_gongji_num_label:setSize(cc.size(80,30))
    qgyd_shengli_gongji_num_label:setAnchorPoint(cc.p(0.5,0.5))
    qgyd_shengli_gongji_num_label:setFontSize(21)
    qgyd_shengli_gongji_num_label:setString("+99999")
    qgyd_shengli_gongji_num_label:setColor(cc.c3b(137,32,18))
    qgyd_shengli_bottom:appendComponent(qgyd_shengli_gongji_num_label)
    qgyd_shengli_gongji_num_label:setPositionInContainer(cc.p(403,250))
    table_qgyd_shengli["qgyd_shengli_gongji_num_label"] = qgyd_shengli_gongji_num_label

    local qgyd_shengli_exp_num_label = fc.FLabel:createBMFont()
    qgyd_shengli_exp_num_label:setSize(cc.size(80,30))
    qgyd_shengli_exp_num_label:setAnchorPoint(cc.p(0.5,0.5))
    qgyd_shengli_exp_num_label:setFontSize(21)
    qgyd_shengli_exp_num_label:setString("+99999")
    qgyd_shengli_exp_num_label:setColor(cc.c3b(137,32,18))
    qgyd_shengli_bottom:appendComponent(qgyd_shengli_exp_num_label)
    qgyd_shengli_exp_num_label:setPositionInContainer(cc.p(466,327))
    table_qgyd_shengli["qgyd_shengli_exp_num_label"] = qgyd_shengli_exp_num_label

    local qgyd_shengli_queding_button = fc.FScaleButton:create()
    qgyd_shengli_queding_button:setSize(cc.size(144,53))
    qgyd_shengli_queding_button:setAnchorPoint(cc.p(0.5,0.5))
    qgyd_shengli_queding_button:setButtonImage("batch_ui/putonganniu1_up.png")
    qgyd_shengli_bottom:appendComponent(qgyd_shengli_queding_button)
    qgyd_shengli_queding_button:setPositionInContainer(cc.p(327,424.5))
    table_qgyd_shengli["qgyd_shengli_queding_button"] = qgyd_shengli_queding_button

    local que = fc.FExtensionsImage:create()
    que:setImage("batch_ui/que_uizi.png")
    que:setSize(cc.size(32,32))
    que:setAnchorPoint(cc.p(0.5,0.5))
    qgyd_shengli_queding_button:appendComponent(que)
    que:setPositionInContainer(cc.p(43,26))
    table_qgyd_shengli["que"] = que

    local ding = fc.FExtensionsImage:create()
    ding:setImage("batch_ui/ding_uizi.png")
    ding:setSize(cc.size(32,32))
    ding:setAnchorPoint(cc.p(0.5,0.5))
    qgyd_shengli_queding_button:appendComponent(ding)
    ding:setPositionInContainer(cc.p(99,26))
    table_qgyd_shengli["ding"] = ding

    local gongjizhi_label = fc.FContainerPanel:create()
    gongjizhi_label:setSize(cc.size(100,30))
    gongjizhi_label:setAnchorPoint(cc.p(0.5,0.5))
    qgyd_shengli_bottom:appendComponent(gongjizhi_label)
    gongjizhi_label:setPositionInContainer(cc.p(281,251))
    table_qgyd_shengli["gongjizhi_label"] = gongjizhi_label

    local gong = fc.FExtensionsImage:create()
    gong:setImage("batch_ui/gong2_uizi.png")
    gong:setSize(cc.size(32,32))
    gong:setAnchorPoint(cc.p(0.5,0.5))
    gongjizhi_label:appendComponent(gong)
    gong:setPositionInContainer(cc.p(16,16))
    table_qgyd_shengli["gong"] = gong

    local ji = fc.FExtensionsImage:create()
    ji:setImage("batch_ui/ji6_uizi.png")
    ji:setSize(cc.size(32,32))
    ji:setAnchorPoint(cc.p(0.5,0.5))
    gongjizhi_label:appendComponent(ji)
    ji:setPositionInContainer(cc.p(50,16))
    table_qgyd_shengli["ji"] = ji

    local zhi = fc.FExtensionsImage:create()
    zhi:setImage("batch_ui/zhi_uizi.png")
    zhi:setSize(cc.size(32,32))
    zhi:setAnchorPoint(cc.p(0.5,0.5))
    gongjizhi_label:appendComponent(zhi)
    zhi:setPositionInContainer(cc.p(84,16))
    table_qgyd_shengli["zhi"] = zhi

    local jingyan_label = fc.FContainerPanel:create()
    jingyan_label:setSize(cc.size(60,30))
    jingyan_label:setAnchorPoint(cc.p(0.5,0.5))
    qgyd_shengli_bottom:appendComponent(jingyan_label)
    jingyan_label:setPositionInContainer(cc.p(388,329))
    table_qgyd_shengli["jingyan_label"] = jingyan_label

    local jing = fc.FExtensionsImage:create()
    jing:setImage("batch_ui/jing2_uizi.png")
    jing:setSize(cc.size(32,32))
    jing:setAnchorPoint(cc.p(0.5,0.5))
    jingyan_label:appendComponent(jing)
    jing:setPositionInContainer(cc.p(16,16))
    table_qgyd_shengli["jing"] = jing

    local yan = fc.FExtensionsImage:create()
    yan:setImage("batch_ui/yan_uizi.png")
    yan:setSize(cc.size(32,32))
    yan:setAnchorPoint(cc.p(0.5,0.5))
    jingyan_label:appendComponent(yan)
    yan:setPositionInContainer(cc.p(44,16))
    table_qgyd_shengli["yan"] = yan

    return table_qgyd_shengli

end

