function createqgyd_duihuanchenggong()

    local table_qgyd_duihuanchenggong = {}

    local qgyd_duihuanchenggong = fc.FContainerPanel:create()
    qgyd_duihuanchenggong:setSize(cc.size(960,640))
    table_qgyd_duihuanchenggong["qgyd_duihuanchenggong"] = qgyd_duihuanchenggong

    local dhcg_bantouming_scale9 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/juezhan_heiseditu.png",cc.rect(2,2,1,1))
    dhcg_bantouming_scale9:setSize(cc.size(960,640))
    dhcg_bantouming_scale9:setAnchorPoint(cc.p(0.5,0.5))
    qgyd_duihuanchenggong:appendComponent(dhcg_bantouming_scale9)
    dhcg_bantouming_scale9:setPositionInContainer(cc.p(480,320))
    table_qgyd_duihuanchenggong["dhcg_bantouming_scale9"] = dhcg_bantouming_scale9

    local dhcg_tanchu_bg_scale9 = fc.FScale9Image:createWithBatchUIFrame("nobatch/dikuang_tongyongtishikuang.png",cc.rect(210,59,2,2))
    dhcg_tanchu_bg_scale9:setSize(cc.size(447,485))
    dhcg_tanchu_bg_scale9:setAnchorPoint(cc.p(0.5,0.5))
    qgyd_duihuanchenggong:appendComponent(dhcg_tanchu_bg_scale9)
    dhcg_tanchu_bg_scale9:setPositionInContainer(cc.p(479.5,340.5))
    table_qgyd_duihuanchenggong["dhcg_tanchu_bg_scale9"] = dhcg_tanchu_bg_scale9

    local dhcg_title_bg_image = fc.FExtensionsImage:create()
    dhcg_title_bg_image:setImage("nobatch/biaotitou_tongyongtishikuang.png")
    dhcg_title_bg_image:setSize(cc.size(492,154))
    dhcg_title_bg_image:setAnchorPoint(cc.p(0.5,0.5))
    qgyd_duihuanchenggong:appendComponent(dhcg_title_bg_image)
    dhcg_title_bg_image:setPositionInContainer(cc.p(480,139))
    table_qgyd_duihuanchenggong["dhcg_title_bg_image"] = dhcg_title_bg_image

    local dhcg_close_button = fc.FScaleButton:create()
    dhcg_close_button:setSize(cc.size(34,33))
    dhcg_close_button:setAnchorPoint(cc.p(0.5,0.5))
    dhcg_close_button:setButtonImage("batch_ui/guanbi_anniu2.png")
    qgyd_duihuanchenggong:appendComponent(dhcg_close_button)
    dhcg_close_button:setPositionInContainer(cc.p(673,81.5))
    table_qgyd_duihuanchenggong["dhcg_close_button"] = dhcg_close_button

    local dhcg_pingzhi = fc.FExtensionsImage:create()
    dhcg_pingzhi:setImage("batch_ui/chengpinzhi_kuang.png")
    dhcg_pingzhi:setSize(cc.size(102,102))
    dhcg_pingzhi:setAnchorPoint(cc.p(0.5,0.5))
    qgyd_duihuanchenggong:appendComponent(dhcg_pingzhi)
    dhcg_pingzhi:setPositionInContainer(cc.p(479,165))
    table_qgyd_duihuanchenggong["dhcg_pingzhi"] = dhcg_pingzhi

    local dhcg_wupin_image = fc.FExtensionsImage:create()
    dhcg_wupin_image:setImage("nobatch/tupian.png")
    dhcg_wupin_image:setSize(cc.size(93,93))
    dhcg_wupin_image:setAnchorPoint(cc.p(0.5,0.5))
    qgyd_duihuanchenggong:appendComponent(dhcg_wupin_image)
    dhcg_wupin_image:setPositionInContainer(cc.p(478.5,164.5))
    table_qgyd_duihuanchenggong["dhcg_wupin_image"] = dhcg_wupin_image

    local dhcg_zhi_bg_scale9 = fc.FScale9Image:createWithBatchUIFrame("nobatch/biankuang2.png",cc.rect(50,50,5,5))
    dhcg_zhi_bg_scale9:setSize(cc.size(410,107))
    dhcg_zhi_bg_scale9:setAnchorPoint(cc.p(0.5,0.5))
    qgyd_duihuanchenggong:appendComponent(dhcg_zhi_bg_scale9)
    dhcg_zhi_bg_scale9:setPositionInContainer(cc.p(480,279.5))
    table_qgyd_duihuanchenggong["dhcg_zhi_bg_scale9"] = dhcg_zhi_bg_scale9

    local dhcg_tiaozhan_bg1 = fc.FExtensionsImage:create()
    dhcg_tiaozhan_bg1:setImage("nobatch/jibao_diwen.png")
    dhcg_tiaozhan_bg1:setSize(cc.size(155,37))
    dhcg_tiaozhan_bg1:setFlipType(2)
    dhcg_tiaozhan_bg1:setAnchorPoint(cc.p(0.5,0.5))
    qgyd_duihuanchenggong:appendComponent(dhcg_tiaozhan_bg1)
    dhcg_tiaozhan_bg1:setPositionInContainer(cc.p(402.5,258.5))
    table_qgyd_duihuanchenggong["dhcg_tiaozhan_bg1"] = dhcg_tiaozhan_bg1

    local dhcg_tiaozhan_bg2 = fc.FExtensionsImage:create()
    dhcg_tiaozhan_bg2:setImage("nobatch/jibao_diwen.png")
    dhcg_tiaozhan_bg2:setSize(cc.size(155,37))
    dhcg_tiaozhan_bg2:setAnchorPoint(cc.p(0.5,0.5))
    qgyd_duihuanchenggong:appendComponent(dhcg_tiaozhan_bg2)
    dhcg_tiaozhan_bg2:setPositionInContainer(cc.p(553.5,258.5))
    table_qgyd_duihuanchenggong["dhcg_tiaozhan_bg2"] = dhcg_tiaozhan_bg2

    local dhcg_wupin_label = fc.FLabel:createBMFont()
    dhcg_wupin_label:setSize(cc.size(108,30))
    dhcg_wupin_label:setAnchorPoint(cc.p(0.5,0.5))
    dhcg_wupin_label:setFontSize(20)
    dhcg_wupin_label:setString("物品名称")
    dhcg_wupin_label:setColor(cc.c3b(255,255,255))
    qgyd_duihuanchenggong:appendComponent(dhcg_wupin_label)
    dhcg_wupin_label:setPositionInContainer(cc.p(480,257))
    table_qgyd_duihuanchenggong["dhcg_wupin_label"] = dhcg_wupin_label

    local dhcg_yongyou_label = fc.FLabel:createBMFont()
    dhcg_yongyou_label:setSize(cc.size(108,30))
    dhcg_yongyou_label:setAnchorPoint(cc.p(0.5,0.5))
    dhcg_yongyou_label:setFontSize(20)
    dhcg_yongyou_label:setString("拥有数量：")
    dhcg_yongyou_label:setColor(cc.c3b(118,71,29))
    qgyd_duihuanchenggong:appendComponent(dhcg_yongyou_label)
    dhcg_yongyou_label:setPositionInContainer(cc.p(452,304))
    table_qgyd_duihuanchenggong["dhcg_yongyou_label"] = dhcg_yongyou_label

    local dhcg_yongyou_num_label = fc.FLabel:createBMFont()
    dhcg_yongyou_num_label:setSize(cc.size(56,30))
    dhcg_yongyou_num_label:setAnchorPoint(cc.p(0.5,0.5))
    dhcg_yongyou_num_label:setFontSize(21)
    dhcg_yongyou_num_label:setString("99")
    dhcg_yongyou_num_label:setColor(cc.c3b(69,16,5))
    qgyd_duihuanchenggong:appendComponent(dhcg_yongyou_num_label)
    dhcg_yongyou_num_label:setPositionInContainer(cc.p(534,304))
    table_qgyd_duihuanchenggong["dhcg_yongyou_num_label"] = dhcg_yongyou_num_label

    local dhcg_zr_bg2_scale9 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/wenzishuoming_diwen.png",cc.rect(134,25,2,2))
    dhcg_zr_bg2_scale9:setSize(cc.size(195,132))
    dhcg_zr_bg2_scale9:setAnchorPoint(cc.p(0.5,0.5))
    dhcg_zr_bg2_scale9:setScaleX(-1)
    qgyd_duihuanchenggong:appendComponent(dhcg_zr_bg2_scale9)
    dhcg_zr_bg2_scale9:setPositionInContainer(cc.p(575.5,419))
    table_qgyd_duihuanchenggong["dhcg_zr_bg2_scale9"] = dhcg_zr_bg2_scale9

    local dhcg_shiyong_button = fc.FScaleButton:create()
    dhcg_shiyong_button:setSize(cc.size(144,53))
    dhcg_shiyong_button:setAnchorPoint(cc.p(0.5,0.5))
    dhcg_shiyong_button:setButtonImage("batch_ui/putonganniu1_up.png")
    qgyd_duihuanchenggong:appendComponent(dhcg_shiyong_button)
    dhcg_shiyong_button:setPositionInContainer(cc.p(390,529.5))
    table_qgyd_duihuanchenggong["dhcg_shiyong_button"] = dhcg_shiyong_button

    local shi = fc.FExtensionsImage:create()
    shi:setImage("batch_ui/shi2_uizi.png")
    shi:setSize(cc.size(32,32))
    shi:setAnchorPoint(cc.p(0.5,0.5))
    dhcg_shiyong_button:appendComponent(shi)
    shi:setPositionInContainer(cc.p(33,26))
    table_qgyd_duihuanchenggong["shi"] = shi

    local yong = fc.FExtensionsImage:create()
    yong:setImage("batch_ui/yong_uizi.png")
    yong:setSize(cc.size(32,32))
    yong:setAnchorPoint(cc.p(0.5,0.5))
    dhcg_shiyong_button:appendComponent(yong)
    yong:setPositionInContainer(cc.p(58,26))
    table_qgyd_duihuanchenggong["yong"] = yong

    local wu = fc.FExtensionsImage:create()
    wu:setImage("batch_ui/wu2_uizi.png")
    wu:setSize(cc.size(32,32))
    wu:setAnchorPoint(cc.p(0.5,0.5))
    dhcg_shiyong_button:appendComponent(wu)
    wu:setPositionInContainer(cc.p(82,26))
    table_qgyd_duihuanchenggong["wu"] = wu

    local pin = fc.FExtensionsImage:create()
    pin:setImage("batch_ui/pin_uizi.png")
    pin:setSize(cc.size(32,32))
    pin:setAnchorPoint(cc.p(0.5,0.5))
    dhcg_shiyong_button:appendComponent(pin)
    pin:setPositionInContainer(cc.p(107,26))
    table_qgyd_duihuanchenggong["pin"] = pin

    local dhcg_jixu_button = fc.FScaleButton:create()
    dhcg_jixu_button:setSize(cc.size(144,53))
    dhcg_jixu_button:setAnchorPoint(cc.p(0.5,0.5))
    dhcg_jixu_button:setButtonImage("batch_ui/putonganniu1_up.png")
    qgyd_duihuanchenggong:appendComponent(dhcg_jixu_button)
    dhcg_jixu_button:setPositionInContainer(cc.p(570,529.5))
    table_qgyd_duihuanchenggong["dhcg_jixu_button"] = dhcg_jixu_button

    local ji = fc.FExtensionsImage:create()
    ji:setImage("batch_ui/ji5_uizi.png")
    ji:setSize(cc.size(32,32))
    ji:setAnchorPoint(cc.p(0.5,0.5))
    dhcg_jixu_button:appendComponent(ji)
    ji:setPositionInContainer(cc.p(33,26))
    table_qgyd_duihuanchenggong["ji"] = ji

    local xu = fc.FExtensionsImage:create()
    xu:setImage("batch_ui/xu_uizi.png")
    xu:setSize(cc.size(32,32))
    xu:setAnchorPoint(cc.p(0.5,0.5))
    dhcg_jixu_button:appendComponent(xu)
    xu:setPositionInContainer(cc.p(58,26))
    table_qgyd_duihuanchenggong["xu"] = xu

    local dui = fc.FExtensionsImage:create()
    dui:setImage("batch_ui/dui2_uizi.png")
    dui:setSize(cc.size(32,32))
    dui:setAnchorPoint(cc.p(0.5,0.5))
    dhcg_jixu_button:appendComponent(dui)
    dui:setPositionInContainer(cc.p(83,26))
    table_qgyd_duihuanchenggong["dui"] = dui

    local huan = fc.FExtensionsImage:create()
    huan:setImage("batch_ui/huan_uizi.png")
    huan:setSize(cc.size(32,32))
    huan:setAnchorPoint(cc.p(0.5,0.5))
    dhcg_jixu_button:appendComponent(huan)
    huan:setPositionInContainer(cc.p(108,26))
    table_qgyd_duihuanchenggong["huan"] = huan

    local dhcg_zr_bg1_scale9 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/wenzishuoming_diwen.png",cc.rect(134,25,2,2))
    dhcg_zr_bg1_scale9:setSize(cc.size(195,132))
    dhcg_zr_bg1_scale9:setAnchorPoint(cc.p(0.5,0.5))
    qgyd_duihuanchenggong:appendComponent(dhcg_zr_bg1_scale9)
    dhcg_zr_bg1_scale9:setPositionInContainer(cc.p(382.5,419))
    table_qgyd_duihuanchenggong["dhcg_zr_bg1_scale9"] = dhcg_zr_bg1_scale9

    local dhcg_wupin_jishao_label = fc.FLabel:createBMFont()
    dhcg_wupin_jishao_label:setSize(cc.size(348,85))
    dhcg_wupin_jishao_label:setWidth(360)
    dhcg_wupin_jishao_label:setAnchorPoint(cc.p(0.5,0.5))
    dhcg_wupin_jishao_label:setFontSize(20)
    dhcg_wupin_jishao_label:setString("步兵步兵步兵步兵步兵步兵步兵步兵步兵步兵步兵步兵步兵步兵")
    dhcg_wupin_jishao_label:setColor(cc.c3b(255,255,255))
    qgyd_duihuanchenggong:appendComponent(dhcg_wupin_jishao_label)
    dhcg_wupin_jishao_label:setPositionInContainer(cc.p(480,418.5))
    table_qgyd_duihuanchenggong["dhcg_wupin_jishao_label"] = dhcg_wupin_jishao_label

    local chenggong_label = fc.FContainerPanel:create()
    chenggong_label:setSize(cc.size(120,30))
    chenggong_label:setAnchorPoint(cc.p(0.5,0.5))
    qgyd_duihuanchenggong:appendComponent(chenggong_label)
    chenggong_label:setPositionInContainer(cc.p(480,82))
    table_qgyd_duihuanchenggong["chenggong_label"] = chenggong_label

    local dui = fc.FExtensionsImage:create()
    dui:setImage("batch_ui/dui2_uizi.png")
    dui:setSize(cc.size(32,32))
    dui:setAnchorPoint(cc.p(0.5,0.5))
    chenggong_label:appendComponent(dui)
    dui:setPositionInContainer(cc.p(16,16))
    table_qgyd_duihuanchenggong["dui"] = dui

    local huan = fc.FExtensionsImage:create()
    huan:setImage("batch_ui/huan_uizi.png")
    huan:setSize(cc.size(32,32))
    huan:setAnchorPoint(cc.p(0.5,0.5))
    chenggong_label:appendComponent(huan)
    huan:setPositionInContainer(cc.p(45,16))
    table_qgyd_duihuanchenggong["huan"] = huan

    local cheng = fc.FExtensionsImage:create()
    cheng:setImage("batch_ui/cheng_uizi.png")
    cheng:setSize(cc.size(32,32))
    cheng:setAnchorPoint(cc.p(0.5,0.5))
    chenggong_label:appendComponent(cheng)
    cheng:setPositionInContainer(cc.p(75,16))
    table_qgyd_duihuanchenggong["cheng"] = cheng

    local gong = fc.FExtensionsImage:create()
    gong:setImage("batch_ui/gong2_uizi.png")
    gong:setSize(cc.size(32,32))
    gong:setAnchorPoint(cc.p(0.5,0.5))
    chenggong_label:appendComponent(gong)
    gong:setPositionInContainer(cc.p(104,16))
    table_qgyd_duihuanchenggong["gong"] = gong

    return table_qgyd_duihuanchenggong

end

