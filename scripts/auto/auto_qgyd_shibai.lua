function createqgyd_shibai()

    local table_qgyd_shibai = {}

    local qgyd_shibai = fc.FContainerPanel:create()
    qgyd_shibai:setSize(cc.size(960,640))
    table_qgyd_shibai["qgyd_shibai"] = qgyd_shibai

    local qgyd_shibai_panel = fc.FContainerPanel:create()
    qgyd_shibai_panel:setSize(cc.size(700,600))
    qgyd_shibai_panel:setAnchorPoint(cc.p(0.5,0.5))
    qgyd_shibai:appendComponent(qgyd_shibai_panel)
    qgyd_shibai_panel:setPositionInContainer(cc.p(502,300))
    table_qgyd_shibai["qgyd_shibai_panel"] = qgyd_shibai_panel

    local shibai_bg_left = fc.FExtensionsImage:create()
    shibai_bg_left:setImage("nobatch/shengli.png")
    shibai_bg_left:setSize(cc.size(202,488))
    shibai_bg_left:setAnchorPoint(cc.p(0.5,0.5))
    qgyd_shibai_panel:appendComponent(shibai_bg_left)
    shibai_bg_left:setPositionInContainer(cc.p(230,337))
    table_qgyd_shibai["shibai_bg_left"] = shibai_bg_left

    local shibai_bg_right = fc.FExtensionsImage:create()
    shibai_bg_right:setImage("nobatch/shengli.png")
    shibai_bg_right:setSize(cc.size(202,488))
    shibai_bg_right:setFlipType(2)
    shibai_bg_right:setAnchorPoint(cc.p(0.5,0.5))
    qgyd_shibai_panel:appendComponent(shibai_bg_right)
    shibai_bg_right:setPositionInContainer(cc.p(432,337))
    table_qgyd_shibai["shibai_bg_right"] = shibai_bg_right

    local shibai_bg_image = fc.FScale9Image:createWithBatchUIFrame("nobatch/shengli_biaotikuang.png",cc.rect(233,30,5,5))
    shibai_bg_image:setSize(cc.size(578,87))
    shibai_bg_image:setAnchorPoint(cc.p(0.5,0.5))
    qgyd_shibai_panel:appendComponent(shibai_bg_image)
    shibai_bg_image:setPositionInContainer(cc.p(327,84.5))
    table_qgyd_shibai["shibai_bg_image"] = shibai_bg_image

    local line_left = fc.FExtensionsImage:create()
    line_left:setImage("batch_ui/sheng_shengli.png")
    line_left:setSize(cc.size(27,73))
    line_left:setAnchorPoint(cc.p(0.5,0.5))
    qgyd_shibai_panel:appendComponent(line_left)
    line_left:setPositionInContainer(cc.p(182.5,36.5))
    table_qgyd_shibai["line_left"] = line_left

    local line_right = fc.FExtensionsImage:create()
    line_right:setImage("batch_ui/sheng_shengli.png")
    line_right:setSize(cc.size(27,73))
    line_right:setAnchorPoint(cc.p(0.5,0.5))
    qgyd_shibai_panel:appendComponent(line_right)
    line_right:setPositionInContainer(cc.p(488.5,36.5))
    table_qgyd_shibai["line_right"] = line_right

    local sui1 = fc.FExtensionsImage:create()
    sui1:setImage("batch_ui/sui_shengli.png")
    sui1:setSize(cc.size(80,179))
    sui1:setAnchorPoint(cc.p(0.5,0.5))
    qgyd_shibai_panel:appendComponent(sui1)
    sui1:setPositionInContainer(cc.p(86,175.5))
    table_qgyd_shibai["sui1"] = sui1

    local sui2 = fc.FExtensionsImage:create()
    sui2:setImage("batch_ui/sui_shengli.png")
    sui2:setSize(cc.size(80,179))
    sui2:setFlipType(2)
    sui2:setAnchorPoint(cc.p(0.5,0.5))
    qgyd_shibai_panel:appendComponent(sui2)
    sui2:setPositionInContainer(cc.p(574,175.5))
    table_qgyd_shibai["sui2"] = sui2

    local qgyd_shibai_wubianhua_image = fc.FContainerPanel:create()
    qgyd_shibai_wubianhua_image:setSize(cc.size(155,30))
    qgyd_shibai_wubianhua_image:setAnchorPoint(cc.p(0.5,0.5))
    qgyd_shibai_panel:appendComponent(qgyd_shibai_wubianhua_image)
    qgyd_shibai_wubianhua_image:setPositionInContainer(cc.p(347.5,149))
    table_qgyd_shibai["qgyd_shibai_wubianhua_image"] = qgyd_shibai_wubianhua_image

    local pai = fc.FExtensionsImage:create()
    pai:setImage("batch_ui/pai_uizi.png")
    pai:setSize(cc.size(32,32))
    pai:setAnchorPoint(cc.p(0.5,0.5))
    qgyd_shibai_wubianhua_image:appendComponent(pai)
    pai:setPositionInContainer(cc.p(16,16))
    table_qgyd_shibai["pai"] = pai

    local ming = fc.FExtensionsImage:create()
    ming:setImage("batch_ui/ming_uizi.png")
    ming:setSize(cc.size(32,32))
    ming:setAnchorPoint(cc.p(0.5,0.5))
    qgyd_shibai_wubianhua_image:appendComponent(ming)
    ming:setPositionInContainer(cc.p(47,16))
    table_qgyd_shibai["ming"] = ming

    local wu = fc.FExtensionsImage:create()
    wu:setImage("batch_ui/wu3_uizi .png")
    wu:setSize(cc.size(32,32))
    wu:setAnchorPoint(cc.p(0.5,0.5))
    qgyd_shibai_wubianhua_image:appendComponent(wu)
    wu:setPositionInContainer(cc.p(78,16))
    table_qgyd_shibai["wu"] = wu

    local bian = fc.FExtensionsImage:create()
    bian:setImage("batch_ui/bian_uizi.png")
    bian:setSize(cc.size(32,32))
    bian:setAnchorPoint(cc.p(0.5,0.5))
    qgyd_shibai_wubianhua_image:appendComponent(bian)
    bian:setPositionInContainer(cc.p(108,16))
    table_qgyd_shibai["bian"] = bian

    local hua = fc.FExtensionsImage:create()
    hua:setImage("batch_ui/hua_uizi.png")
    hua:setSize(cc.size(32,32))
    hua:setAnchorPoint(cc.p(0.5,0.5))
    qgyd_shibai_wubianhua_image:appendComponent(hua)
    hua:setPositionInContainer(cc.p(139,16))
    table_qgyd_shibai["hua"] = hua

    local qgyd_shibai_exp_num_label = fc.FLabel:createBMFont()
    qgyd_shibai_exp_num_label:setSize(cc.size(80,30))
    qgyd_shibai_exp_num_label:setAnchorPoint(cc.p(0.5,0.5))
    qgyd_shibai_exp_num_label:setFontSize(21)
    qgyd_shibai_exp_num_label:setString("+99999")
    qgyd_shibai_exp_num_label:setColor(cc.c3b(137,32,18))
    qgyd_shibai_panel:appendComponent(qgyd_shibai_exp_num_label)
    qgyd_shibai_exp_num_label:setPositionInContainer(cc.p(473,265))
    table_qgyd_shibai["qgyd_shibai_exp_num_label"] = qgyd_shibai_exp_num_label

    local qgyd_shibai_gongji_num_label = fc.FLabel:createBMFont()
    qgyd_shibai_gongji_num_label:setSize(cc.size(80,30))
    qgyd_shibai_gongji_num_label:setAnchorPoint(cc.p(0.5,0.5))
    qgyd_shibai_gongji_num_label:setFontSize(21)
    qgyd_shibai_gongji_num_label:setString("+99999")
    qgyd_shibai_gongji_num_label:setColor(cc.c3b(137,32,18))
    qgyd_shibai_panel:appendComponent(qgyd_shibai_gongji_num_label)
    qgyd_shibai_gongji_num_label:setPositionInContainer(cc.p(382,206))
    table_qgyd_shibai["qgyd_shibai_gongji_num_label"] = qgyd_shibai_gongji_num_label

    local qgyd_shibai_yuanbao_image = fc.FExtensionsImage:create()
    qgyd_shibai_yuanbao_image:setImage("batch_ui/yuanbao_da.png")
    qgyd_shibai_yuanbao_image:setSize(cc.size(58,43))
    qgyd_shibai_yuanbao_image:setAnchorPoint(cc.p(0.5,0.5))
    qgyd_shibai_panel:appendComponent(qgyd_shibai_yuanbao_image)
    qgyd_shibai_yuanbao_image:setPositionInContainer(cc.p(195,264.5))
    table_qgyd_shibai["qgyd_shibai_yuanbao_image"] = qgyd_shibai_yuanbao_image

    local qgyd_shibai_yuanbao_num_label = fc.FLabel:createBMFont()
    qgyd_shibai_yuanbao_num_label:setSize(cc.size(80,30))
    qgyd_shibai_yuanbao_num_label:setAnchorPoint(cc.p(0.5,0.5))
    qgyd_shibai_yuanbao_num_label:setFontSize(21)
    qgyd_shibai_yuanbao_num_label:setString("+99999")
    qgyd_shibai_yuanbao_num_label:setColor(cc.c3b(137,32,18))
    qgyd_shibai_panel:appendComponent(qgyd_shibai_yuanbao_num_label)
    qgyd_shibai_yuanbao_num_label:setPositionInContainer(cc.p(269,267))
    table_qgyd_shibai["qgyd_shibai_yuanbao_num_label"] = qgyd_shibai_yuanbao_num_label

    local qgyd_shibai_queding_button = fc.FScaleButton:create()
    qgyd_shibai_queding_button:setSize(cc.size(144,53))
    qgyd_shibai_queding_button:setAnchorPoint(cc.p(0.5,0.5))
    qgyd_shibai_queding_button:setButtonImage("batch_ui/putonganniu1_up.png")
    qgyd_shibai_panel:appendComponent(qgyd_shibai_queding_button)
    qgyd_shibai_queding_button:setPositionInContainer(cc.p(333,439.5))
    table_qgyd_shibai["qgyd_shibai_queding_button"] = qgyd_shibai_queding_button

    local que = fc.FExtensionsImage:create()
    que:setImage("batch_ui/que_uizi.png")
    que:setSize(cc.size(32,32))
    que:setAnchorPoint(cc.p(0.5,0.5))
    qgyd_shibai_queding_button:appendComponent(que)
    que:setPositionInContainer(cc.p(47,26))
    table_qgyd_shibai["que"] = que

    local ding = fc.FExtensionsImage:create()
    ding:setImage("batch_ui/ding_uizi.png")
    ding:setSize(cc.size(32,32))
    ding:setAnchorPoint(cc.p(0.5,0.5))
    qgyd_shibai_queding_button:appendComponent(ding)
    ding:setPositionInContainer(cc.p(96,26))
    table_qgyd_shibai["ding"] = ding

    local gongjizhi_label = fc.FContainerPanel:create()
    gongjizhi_label:setSize(cc.size(100,30))
    gongjizhi_label:setAnchorPoint(cc.p(0.5,0.5))
    qgyd_shibai_panel:appendComponent(gongjizhi_label)
    gongjizhi_label:setPositionInContainer(cc.p(271,207))
    table_qgyd_shibai["gongjizhi_label"] = gongjizhi_label

    local gong = fc.FExtensionsImage:create()
    gong:setImage("batch_ui/gong2_uizi.png")
    gong:setSize(cc.size(32,32))
    gong:setAnchorPoint(cc.p(0.5,0.5))
    gongjizhi_label:appendComponent(gong)
    gong:setPositionInContainer(cc.p(16,16))
    table_qgyd_shibai["gong"] = gong

    local ji = fc.FExtensionsImage:create()
    ji:setImage("batch_ui/ji6_uizi.png")
    ji:setSize(cc.size(32,32))
    ji:setAnchorPoint(cc.p(0.5,0.5))
    gongjizhi_label:appendComponent(ji)
    ji:setPositionInContainer(cc.p(50,16))
    table_qgyd_shibai["ji"] = ji

    local zhi = fc.FExtensionsImage:create()
    zhi:setImage("batch_ui/zhi_uizi.png")
    zhi:setSize(cc.size(32,32))
    zhi:setAnchorPoint(cc.p(0.5,0.5))
    gongjizhi_label:appendComponent(zhi)
    zhi:setPositionInContainer(cc.p(84,16))
    table_qgyd_shibai["zhi"] = zhi

    local jingyan_label = fc.FContainerPanel:create()
    jingyan_label:setSize(cc.size(60,30))
    jingyan_label:setAnchorPoint(cc.p(0.5,0.5))
    qgyd_shibai_panel:appendComponent(jingyan_label)
    jingyan_label:setPositionInContainer(cc.p(393,268))
    table_qgyd_shibai["jingyan_label"] = jingyan_label

    local jing = fc.FExtensionsImage:create()
    jing:setImage("batch_ui/jing2_uizi.png")
    jing:setSize(cc.size(32,32))
    jing:setAnchorPoint(cc.p(0.5,0.5))
    jingyan_label:appendComponent(jing)
    jing:setPositionInContainer(cc.p(16,16))
    table_qgyd_shibai["jing"] = jing

    local yan = fc.FExtensionsImage:create()
    yan:setImage("batch_ui/yan_uizi.png")
    yan:setSize(cc.size(32,32))
    yan:setAnchorPoint(cc.p(0.5,0.5))
    jingyan_label:appendComponent(yan)
    yan:setPositionInContainer(cc.p(44,16))
    table_qgyd_shibai["yan"] = yan

    local qgyd_paibing_btn = fc.FScaleButton:create()
    qgyd_paibing_btn:setSize(cc.size(100,100))
    qgyd_paibing_btn:setAnchorPoint(cc.p(0.5,0.5))
    qgyd_paibing_btn:setButtonImage("batch_ui/paibingbuzhen_anniu.png")
    qgyd_shibai_panel:appendComponent(qgyd_paibing_btn)
    qgyd_paibing_btn:setPositionInContainer(cc.p(199,347))
    table_qgyd_shibai["qgyd_paibing_btn"] = qgyd_paibing_btn

    local qgyd_keju_btn = fc.FScaleButton:create()
    qgyd_keju_btn:setSize(cc.size(100,100))
    qgyd_keju_btn:setAnchorPoint(cc.p(0.5,0.5))
    qgyd_keju_btn:setButtonImage("batch_ui/kejuxuanjiang_anniu.png")
    qgyd_shibai_panel:appendComponent(qgyd_keju_btn)
    qgyd_keju_btn:setPositionInContainer(cc.p(330,347))
    table_qgyd_shibai["qgyd_keju_btn"] = qgyd_keju_btn

    local qgyd_equiplv_btn = fc.FScaleButton:create()
    qgyd_equiplv_btn:setSize(cc.size(100,100))
    qgyd_equiplv_btn:setAnchorPoint(cc.p(0.5,0.5))
    qgyd_equiplv_btn:setButtonImage("batch_ui/zhuangbeishengji_anniu.png")
    qgyd_shibai_panel:appendComponent(qgyd_equiplv_btn)
    qgyd_equiplv_btn:setPositionInContainer(cc.p(461,347))
    table_qgyd_shibai["qgyd_equiplv_btn"] = qgyd_equiplv_btn

    return table_qgyd_shibai

end

