function createlueduo_result()

    local table_lueduo_result = {}

    local lueduo_result = fc.FContainerPanel:create()
    lueduo_result:setSize(cc.size(960,640))
    table_lueduo_result["lueduo_result"] = lueduo_result

    local bottom_panel = fc.FContainerPanel:create()
    bottom_panel:setSize(cc.size(700,600))
    bottom_panel:setAnchorPoint(cc.p(0.5,0.5))
    lueduo_result:appendComponent(bottom_panel)
    bottom_panel:setPositionInContainer(cc.p(480,300))
    table_lueduo_result["bottom_panel"] = bottom_panel

    local bgL = fc.FShaderExtensionsImage:create(0)
    bgL:setAnchorPoint(cc.p(0.5,0.5))
    bgL:setImage("nobatch/shengli.png")
    bgL:setSize(cc.size(202,488))
    bottom_panel:appendComponent(bgL)
    bgL:setPositionInContainer(cc.p(249,330))
    table_lueduo_result["bgL"] = bgL

    local bgR = fc.FShaderExtensionsImage:create(0)
    bgR:setAnchorPoint(cc.p(0.5,0.5))
    bgR:setImage("nobatch/shengli.png")
    bgR:setSize(cc.size(202,488))
    bottom_panel:appendComponent(bgR)
    bgR:setPositionInContainer(cc.p(451,330))
    table_lueduo_result["bgR"] = bgR

    bgR:setFlipType(2)
    local titlebg = fc.FShaderExtensionsImage:create(0)
    titlebg:setAnchorPoint(cc.p(0.5,0.5))
    titlebg:setImage("nobatch/shengli_biaotikuang.png")
    titlebg:setSize(cc.size(578,87))
    bottom_panel:appendComponent(titlebg)
    titlebg:setPositionInContainer(cc.p(350,73.5))
    table_lueduo_result["titlebg"] = titlebg

    local lineL = fc.FShaderExtensionsImage:create(0)
    lineL:setAnchorPoint(cc.p(0.5,0.5))
    lineL:setImage("batch_ui/sheng_shengli.png")
    lineL:setSize(cc.size(27,73))
    bottom_panel:appendComponent(lineL)
    lineL:setPositionInContainer(cc.p(211.5,36.5))
    table_lueduo_result["lineL"] = lineL

    local textBg = fc.FExtensionsImage:create()
    textBg:setImage("batch_ui/shuruwenzi.png")
    textBg:setSize(cc.size(150,40))
    textBg:setAnchorPoint(cc.p(0.5,0.5))
    bottom_panel:appendComponent(textBg)
    textBg:setPositionInContainer(cc.p(249,314))
    table_lueduo_result["textBg"] = textBg

    local qgyd_shengli_yuanbao_image = fc.FExtensionsImage:create()
    qgyd_shengli_yuanbao_image:setImage("batch_ui/yuanbao_da.png")
    qgyd_shengli_yuanbao_image:setSize(cc.size(58,43))
    qgyd_shengli_yuanbao_image:setAnchorPoint(cc.p(0.5,0.5))
    bottom_panel:appendComponent(qgyd_shengli_yuanbao_image)
    qgyd_shengli_yuanbao_image:setPositionInContainer(cc.p(201,315.5))
    table_lueduo_result["qgyd_shengli_yuanbao_image"] = qgyd_shengli_yuanbao_image

    local qgyd_shengli_yuanbao_num_label = fc.FLabel:createBMFont()
    qgyd_shengli_yuanbao_num_label:setSize(cc.size(80,30))
    qgyd_shengli_yuanbao_num_label:setAnchorPoint(cc.p(0.5,0.5))
    qgyd_shengli_yuanbao_num_label:setFontSize(21)
    qgyd_shengli_yuanbao_num_label:setString("+99999")
    qgyd_shengli_yuanbao_num_label:setColor(cc.c3b(137,32,18))
    bottom_panel:appendComponent(qgyd_shengli_yuanbao_num_label)
    qgyd_shengli_yuanbao_num_label:setPositionInContainer(cc.p(271,311))
    table_lueduo_result["qgyd_shengli_yuanbao_num_label"] = qgyd_shengli_yuanbao_num_label

    local textBg = fc.FExtensionsImage:create()
    textBg:setImage("batch_ui/shuruwenzi.png")
    textBg:setSize(cc.size(150,40))
    textBg:setAnchorPoint(cc.p(0.5,0.5))
    bottom_panel:appendComponent(textBg)
    textBg:setPositionInContainer(cc.p(451,314))
    table_lueduo_result["textBg"] = textBg

    local qgyd_shengli_exp_num_label = fc.FLabel:createBMFont()
    qgyd_shengli_exp_num_label:setSize(cc.size(80,30))
    qgyd_shengli_exp_num_label:setAnchorPoint(cc.p(0.5,0.5))
    qgyd_shengli_exp_num_label:setFontSize(21)
    qgyd_shengli_exp_num_label:setString("+99999")
    qgyd_shengli_exp_num_label:setColor(cc.c3b(137,32,18))
    bottom_panel:appendComponent(qgyd_shengli_exp_num_label)
    qgyd_shengli_exp_num_label:setPositionInContainer(cc.p(478,311))
    table_lueduo_result["qgyd_shengli_exp_num_label"] = qgyd_shengli_exp_num_label

    local jingyan_label = fc.FContainerPanel:create()
    jingyan_label:setSize(cc.size(60,30))
    jingyan_label:setAnchorPoint(cc.p(0.5,0.5))
    bottom_panel:appendComponent(jingyan_label)
    jingyan_label:setPositionInContainer(cc.p(407,314))
    table_lueduo_result["jingyan_label"] = jingyan_label

    local jing = fc.FExtensionsImage:create()
    jing:setImage("batch_ui/jing2_uizi.png")
    jing:setSize(cc.size(32,32))
    jing:setAnchorPoint(cc.p(0.5,0.5))
    jingyan_label:appendComponent(jing)
    jing:setPositionInContainer(cc.p(16,16))
    table_lueduo_result["jing"] = jing

    local yan = fc.FExtensionsImage:create()
    yan:setImage("batch_ui/yan_uizi.png")
    yan:setSize(cc.size(32,32))
    yan:setAnchorPoint(cc.p(0.5,0.5))
    jingyan_label:appendComponent(yan)
    yan:setPositionInContainer(cc.p(44,16))
    table_lueduo_result["yan"] = yan

    local againBtn = fc.FScaleButton:create()
    againBtn:setSize(cc.size(144,53))
    againBtn:setAnchorPoint(cc.p(0.5,0.5))
    againBtn:setButtonImage("batch_ui/putonganniu1_up.png")
    bottom_panel:appendComponent(againBtn)
    againBtn:setPositionInContainer(cc.p(249,408.5))
    table_lueduo_result["againBtn"] = againBtn

    local ji = fc.FShaderExtensionsImage:create(0)
    ji:setAnchorPoint(cc.p(0.5,0.5))
    ji:setImage("batch_ui/ji5_uizi.png")
    ji:setSize(cc.size(32,32))
    againBtn:appendComponent(ji)
    ji:setPositionInContainer(cc.p(32,26))
    table_lueduo_result["ji"] = ji

    local xu = fc.FShaderExtensionsImage:create(0)
    xu:setAnchorPoint(cc.p(0.5,0.5))
    xu:setImage("batch_ui/xu_uizi.png")
    xu:setSize(cc.size(32,32))
    againBtn:appendComponent(xu)
    xu:setPositionInContainer(cc.p(57,26))
    table_lueduo_result["xu"] = xu

    local qiang = fc.FShaderExtensionsImage:create(0)
    qiang:setAnchorPoint(cc.p(0.5,0.5))
    qiang:setImage("batch_ui/qiang_uizi.png")
    qiang:setSize(cc.size(32,32))
    againBtn:appendComponent(qiang)
    qiang:setPositionInContainer(cc.p(83,26))
    table_lueduo_result["qiang"] = qiang

    local duo = fc.FShaderExtensionsImage:create(0)
    duo:setAnchorPoint(cc.p(0.5,0.5))
    duo:setImage("batch_ui/duo_uizi.png")
    duo:setSize(cc.size(32,32))
    againBtn:appendComponent(duo)
    duo:setPositionInContainer(cc.p(108,26))
    table_lueduo_result["duo"] = duo

    local okBtn = fc.FScaleButton:create()
    okBtn:setSize(cc.size(144,53))
    okBtn:setAnchorPoint(cc.p(0.5,0.5))
    okBtn:setButtonImage("batch_ui/putonganniu1_up.png")
    bottom_panel:appendComponent(okBtn)
    okBtn:setPositionInContainer(cc.p(451,408.5))
    table_lueduo_result["okBtn"] = okBtn

    local que = fc.FShaderExtensionsImage:create(0)
    que:setAnchorPoint(cc.p(0.5,0.5))
    que:setImage("batch_ui/que_uizi.png")
    que:setSize(cc.size(32,32))
    okBtn:appendComponent(que)
    que:setPositionInContainer(cc.p(45,26))
    table_lueduo_result["que"] = que

    local ding = fc.FShaderExtensionsImage:create(0)
    ding:setAnchorPoint(cc.p(0.5,0.5))
    ding:setImage("batch_ui/ding_uizi.png")
    ding:setSize(cc.size(32,32))
    okBtn:appendComponent(ding)
    ding:setPositionInContainer(cc.p(94,26))
    table_lueduo_result["ding"] = ding

    local midOkBtn = fc.FScaleButton:create()
    midOkBtn:setSize(cc.size(144,53))
    midOkBtn:setAnchorPoint(cc.p(0.5,0.5))
    midOkBtn:setButtonImage("batch_ui/putonganniu1_up.png")
    bottom_panel:appendComponent(midOkBtn)
    midOkBtn:setPositionInContainer(cc.p(350,408.5))
    table_lueduo_result["midOkBtn"] = midOkBtn

    local que = fc.FShaderExtensionsImage:create(0)
    que:setAnchorPoint(cc.p(0.5,0.5))
    que:setImage("batch_ui/que_uizi.png")
    que:setSize(cc.size(32,32))
    midOkBtn:appendComponent(que)
    que:setPositionInContainer(cc.p(45,26))
    table_lueduo_result["que"] = que

    local ding = fc.FShaderExtensionsImage:create(0)
    ding:setAnchorPoint(cc.p(0.5,0.5))
    ding:setImage("batch_ui/ding_uizi.png")
    ding:setSize(cc.size(32,32))
    midOkBtn:appendComponent(ding)
    ding:setPositionInContainer(cc.p(94,26))
    table_lueduo_result["ding"] = ding

    local lineR = fc.FShaderExtensionsImage:create(0)
    lineR:setAnchorPoint(cc.p(0.5,0.5))
    lineR:setImage("batch_ui/sheng_shengli.png")
    lineR:setSize(cc.size(27,73))
    bottom_panel:appendComponent(lineR)
    lineR:setPositionInContainer(cc.p(489.5,36.5))
    table_lueduo_result["lineR"] = lineR

    local shengli_panel = fc.FContainerPanel:create()
    shengli_panel:setSize(cc.size(700,600))
    shengli_panel:setAnchorPoint(cc.p(0.5,0.5))
    bottom_panel:appendComponent(shengli_panel)
    shengli_panel:setPositionInContainer(cc.p(350,300))
    table_lueduo_result["shengli_panel"] = shengli_panel

    local sui1 = fc.FExtensionsImage:create()
    sui1:setImage("batch_ui/sui_shengli.png")
    sui1:setSize(cc.size(80,179))
    sui1:setAnchorPoint(cc.p(0.5,0.5))
    shengli_panel:appendComponent(sui1)
    sui1:setPositionInContainer(cc.p(108,165.5))
    table_lueduo_result["sui1"] = sui1

    local sui2 = fc.FExtensionsImage:create()
    sui2:setImage("batch_ui/sui_shengli.png")
    sui2:setSize(cc.size(80,179))
    sui2:setFlipType(2)
    sui2:setAnchorPoint(cc.p(0.5,0.5))
    shengli_panel:appendComponent(sui2)
    sui2:setPositionInContainer(cc.p(592,165.5))
    table_lueduo_result["sui2"] = sui2

    local chenggong_label = fc.FContainerPanel:create()
    chenggong_label:setSize(cc.size(130,30))
    chenggong_label:setAnchorPoint(cc.p(0.5,0.5))
    shengli_panel:appendComponent(chenggong_label)
    chenggong_label:setPositionInContainer(cc.p(350,150))
    table_lueduo_result["chenggong_label"] = chenggong_label

    local qiang = fc.FShaderExtensionsImage:create(0)
    qiang:setAnchorPoint(cc.p(0.5,0.5))
    qiang:setImage("batch_ui/qiang_uizi.png")
    qiang:setSize(cc.size(32,32))
    chenggong_label:appendComponent(qiang)
    qiang:setPositionInContainer(cc.p(16,16))
    table_lueduo_result["qiang"] = qiang

    local duo = fc.FShaderExtensionsImage:create(0)
    duo:setAnchorPoint(cc.p(0.5,0.5))
    duo:setImage("batch_ui/duo_uizi.png")
    duo:setSize(cc.size(32,32))
    chenggong_label:appendComponent(duo)
    duo:setPositionInContainer(cc.p(49,16))
    table_lueduo_result["duo"] = duo

    local cheng = fc.FExtensionsImage:create()
    cheng:setImage("batch_ui/cheng_uizi.png")
    cheng:setSize(cc.size(32,32))
    cheng:setAnchorPoint(cc.p(0.5,0.5))
    chenggong_label:appendComponent(cheng)
    cheng:setPositionInContainer(cc.p(81,16))
    table_lueduo_result["cheng"] = cheng

    local gong = fc.FExtensionsImage:create()
    gong:setImage("batch_ui/gong2_uizi.png")
    gong:setSize(cc.size(32,32))
    gong:setAnchorPoint(cc.p(0.5,0.5))
    chenggong_label:appendComponent(gong)
    gong:setPositionInContainer(cc.p(114,16))
    table_lueduo_result["gong"] = gong

    local frame = fc.FExtensionsImage:create()
    frame:setImage("batch_ui/baipinzhi_kuang.png")
    frame:setSize(cc.size(104,104))
    frame:setAnchorPoint(cc.p(0.5,0.5))
    shengli_panel:appendComponent(frame)
    frame:setPositionInContainer(cc.p(350,227))
    table_lueduo_result["frame"] = frame

    local image = fc.FExtensionsImage:create()
    image:setImage("batch_ui/baipinzhi_kuang.png")
    image:setSize(cc.size(104,104))
    image:setAnchorPoint(cc.p(0.5,0.5))
    shengli_panel:appendComponent(image)
    image:setPositionInContainer(cc.p(350,227))
    table_lueduo_result["image"] = image

    local shengli_noitem_panel = fc.FContainerPanel:create()
    shengli_noitem_panel:setSize(cc.size(700,600))
    shengli_noitem_panel:setAnchorPoint(cc.p(0.5,0.5))
    bottom_panel:appendComponent(shengli_noitem_panel)
    shengli_noitem_panel:setPositionInContainer(cc.p(350,300))
    table_lueduo_result["shengli_noitem_panel"] = shengli_noitem_panel

    local sui1 = fc.FExtensionsImage:create()
    sui1:setImage("batch_ui/sui_shengli.png")
    sui1:setSize(cc.size(80,179))
    sui1:setAnchorPoint(cc.p(0.5,0.5))
    shengli_noitem_panel:appendComponent(sui1)
    sui1:setPositionInContainer(cc.p(108,165.5))
    table_lueduo_result["sui1"] = sui1

    local sui2 = fc.FExtensionsImage:create()
    sui2:setImage("batch_ui/sui_shengli.png")
    sui2:setSize(cc.size(80,179))
    sui2:setFlipType(2)
    sui2:setAnchorPoint(cc.p(0.5,0.5))
    shengli_noitem_panel:appendComponent(sui2)
    sui2:setPositionInContainer(cc.p(592,165.5))
    table_lueduo_result["sui2"] = sui2

    local duishou_label = fc.FContainerPanel:create()
    duishou_label:setSize(cc.size(343,30))
    duishou_label:setAnchorPoint(cc.p(0.5,0.5))
    shengli_noitem_panel:appendComponent(duishou_label)
    duishou_label:setPositionInContainer(cc.p(349.5,214))
    table_lueduo_result["duishou_label"] = duishou_label

    local dui = fc.FExtensionsImage:create()
    dui:setImage("batch_ui/dui_uizi.png")
    dui:setSize(cc.size(32,32))
    dui:setAnchorPoint(cc.p(0.5,0.5))
    duishou_label:appendComponent(dui)
    dui:setPositionInContainer(cc.p(16,16))
    table_lueduo_result["dui"] = dui

    local shou = fc.FExtensionsImage:create()
    shou:setImage("batch_ui/shou2_uizi.png")
    shou:setSize(cc.size(32,32))
    shou:setAnchorPoint(cc.p(0.5,0.5))
    duishou_label:appendComponent(shou)
    shou:setPositionInContainer(cc.p(42,16))
    table_lueduo_result["shou"] = shou

    local pao = fc.FExtensionsImage:create()
    pao:setImage("batch_ui/pao_uizi.png")
    pao:setSize(cc.size(32,32))
    pao:setAnchorPoint(cc.p(0.5,0.5))
    duishou_label:appendComponent(pao)
    pao:setPositionInContainer(cc.p(68,16))
    table_lueduo_result["pao"] = pao

    local de = fc.FExtensionsImage:create()
    de:setImage("batch_ui/de2_uizi.png")
    de:setSize(cc.size(32,32))
    de:setAnchorPoint(cc.p(0.5,0.5))
    duishou_label:appendComponent(de)
    de:setPositionInContainer(cc.p(95,16))
    table_lueduo_result["de"] = de

    local tai = fc.FExtensionsImage:create()
    tai:setImage("batch_ui/tai_uizi.png")
    tai:setSize(cc.size(32,32))
    tai:setAnchorPoint(cc.p(0.5,0.5))
    duishou_label:appendComponent(tai)
    tai:setPositionInContainer(cc.p(121,16))
    table_lueduo_result["tai"] = tai

    local kuai = fc.FExtensionsImage:create()
    kuai:setImage("batch_ui/kuai_uizi.png")
    kuai:setSize(cc.size(32,32))
    kuai:setAnchorPoint(cc.p(0.5,0.5))
    duishou_label:appendComponent(kuai)
    kuai:setPositionInContainer(cc.p(147,16))
    table_lueduo_result["kuai"] = kuai

    local mei = fc.FExtensionsImage:create()
    mei:setImage("batch_ui/mei_uizi.png")
    mei:setSize(cc.size(32,32))
    mei:setAnchorPoint(cc.p(0.5,0.5))
    duishou_label:appendComponent(mei)
    mei:setPositionInContainer(cc.p(189,16))
    table_lueduo_result["mei"] = mei

    local you = fc.FExtensionsImage:create()
    you:setImage("batch_ui/you2_uizi.png")
    you:setSize(cc.size(32,32))
    you:setAnchorPoint(cc.p(0.5,0.5))
    duishou_label:appendComponent(you)
    you:setPositionInContainer(cc.p(217,16))
    table_lueduo_result["you"] = you

    local qiang = fc.FShaderExtensionsImage:create(0)
    qiang:setAnchorPoint(cc.p(0.5,0.5))
    qiang:setImage("batch_ui/qiang_uizi.png")
    qiang:setSize(cc.size(32,32))
    duishou_label:appendComponent(qiang)
    qiang:setPositionInContainer(cc.p(244,16))
    table_lueduo_result["qiang"] = qiang

    local dao = fc.FExtensionsImage:create()
    dao:setImage("batch_ui/dao2_uizi.png")
    dao:setSize(cc.size(32,32))
    dao:setAnchorPoint(cc.p(0.5,0.5))
    duishou_label:appendComponent(dao)
    dao:setPositionInContainer(cc.p(272,16))
    table_lueduo_result["dao"] = dao

    local sui = fc.FExtensionsImage:create()
    sui:setImage("batch_ui/sui_uizi.png")
    sui:setSize(cc.size(32,32))
    sui:setAnchorPoint(cc.p(0.5,0.5))
    duishou_label:appendComponent(sui)
    sui:setPositionInContainer(cc.p(299,16))
    table_lueduo_result["sui"] = sui

    local pian = fc.FExtensionsImage:create()
    pian:setImage("batch_ui/pian_uizi.png")
    pian:setSize(cc.size(32,32))
    pian:setAnchorPoint(cc.p(0.5,0.5))
    duishou_label:appendComponent(pian)
    pian:setPositionInContainer(cc.p(327,16))
    table_lueduo_result["pian"] = pian

    local douhao = fc.FExtensionsImage:create()
    douhao:setImage("batch_ui/,_uizi.png")
    douhao:setSize(cc.size(32,32))
    douhao:setAnchorPoint(cc.p(0.5,0.5))
    duishou_label:appendComponent(douhao)
    douhao:setPositionInContainer(cc.p(174,16))
    table_lueduo_result["douhao"] = douhao

    local shibai_panel = fc.FContainerPanel:create()
    shibai_panel:setSize(cc.size(700,600))
    shibai_panel:setAnchorPoint(cc.p(0.5,0.5))
    bottom_panel:appendComponent(shibai_panel)
    shibai_panel:setPositionInContainer(cc.p(350,300))
    table_lueduo_result["shibai_panel"] = shibai_panel

    local shibai_label = fc.FContainerPanel:create()
    shibai_label:setSize(cc.size(170,30))
    shibai_label:setAnchorPoint(cc.p(0.5,0.5))
    shibai_panel:appendComponent(shibai_label)
    shibai_label:setPositionInContainer(cc.p(350,205))
    table_lueduo_result["shibai_label"] = shibai_label

    local ben = fc.FExtensionsImage:create()
    ben:setImage("batch_ui/ben_uizi.png")
    ben:setSize(cc.size(32,32))
    ben:setAnchorPoint(cc.p(0.5,0.5))
    shibai_label:appendComponent(ben)
    ben:setPositionInContainer(cc.p(16,16))
    table_lueduo_result["ben"] = ben

    local ci = fc.FExtensionsImage:create()
    ci:setImage("batch_ui/ci_uizi (2).png")
    ci:setSize(cc.size(32,32))
    ci:setAnchorPoint(cc.p(0.5,0.5))
    shibai_label:appendComponent(ci)
    ci:setPositionInContainer(cc.p(44,16))
    table_lueduo_result["ci"] = ci

    local qiang = fc.FShaderExtensionsImage:create(0)
    qiang:setAnchorPoint(cc.p(0.5,0.5))
    qiang:setImage("batch_ui/qiang_uizi.png")
    qiang:setSize(cc.size(32,32))
    shibai_label:appendComponent(qiang)
    qiang:setPositionInContainer(cc.p(71,16))
    table_lueduo_result["qiang"] = qiang

    local duo = fc.FShaderExtensionsImage:create(0)
    duo:setAnchorPoint(cc.p(0.5,0.5))
    duo:setImage("batch_ui/duo_uizi.png")
    duo:setSize(cc.size(32,32))
    shibai_label:appendComponent(duo)
    duo:setPositionInContainer(cc.p(99,16))
    table_lueduo_result["duo"] = duo

    local shi = fc.FExtensionsImage:create()
    shi:setImage("batch_ui/shi5_uizi.png")
    shi:setSize(cc.size(32,32))
    shi:setAnchorPoint(cc.p(0.5,0.5))
    shibai_label:appendComponent(shi)
    shi:setPositionInContainer(cc.p(126,16))
    table_lueduo_result["shi"] = shi

    local bai = fc.FExtensionsImage:create()
    bai:setImage("batch_ui/bai_uizi.png")
    bai:setSize(cc.size(32,32))
    bai:setAnchorPoint(cc.p(0.5,0.5))
    shibai_label:appendComponent(bai)
    bai:setPositionInContainer(cc.p(154,16))
    table_lueduo_result["bai"] = bai

    return table_lueduo_result

end

