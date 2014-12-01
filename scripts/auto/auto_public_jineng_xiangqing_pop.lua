function createpublic_jineng_xiangqing_pop()

    local table_public_jineng_xiangqing_pop = {}

    local public_jineng_xiangqing_pop = fc.FContainerPanel:create()
    public_jineng_xiangqing_pop:setSize(cc.size(960,640))
    table_public_jineng_xiangqing_pop["public_jineng_xiangqing_pop"] = public_jineng_xiangqing_pop

    local jineng_bottom_panel = fc.FContainerPanel:create()
    jineng_bottom_panel:setSize(cc.size(534,550))
    jineng_bottom_panel:setAnchorPoint(cc.p(0.5,0.5))
    public_jineng_xiangqing_pop:appendComponent(jineng_bottom_panel)
    jineng_bottom_panel:setPositionInContainer(cc.p(480,320))
    table_public_jineng_xiangqing_pop["jineng_bottom_panel"] = jineng_bottom_panel

    local jn_juanzhou_la = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shengzhi_ditu.png",cc.rect(40,63,4,4))
    jn_juanzhou_la:setSize(cc.size(412,520))
    jn_juanzhou_la:setAnchorPoint(cc.p(0.5,0.5))
    jineng_bottom_panel:appendComponent(jn_juanzhou_la)
    jn_juanzhou_la:setPositionInContainer(cc.p(267,273))
    table_public_jineng_xiangqing_pop["jn_juanzhou_la"] = jn_juanzhou_la

    local jineng_juanzhou_up = fc.FExtensionsImage:create()
    jineng_juanzhou_up:setImage("nobatch/shengzhi_zhou.png")
    jineng_juanzhou_up:setSize(cc.size(52,534))
    jineng_juanzhou_up:setRotation(90)
    jineng_juanzhou_up:setAnchorPoint(cc.p(0.5,0.5))
    jineng_bottom_panel:appendComponent(jineng_juanzhou_up)
    jineng_juanzhou_up:setPositionInContainer(cc.p(267,26))
    table_public_jineng_xiangqing_pop["jineng_juanzhou_up"] = jineng_juanzhou_up

    local jineng_juanzhou_down = fc.FExtensionsImage:create()
    jineng_juanzhou_down:setImage("nobatch/shengzhi_zhou.png")
    jineng_juanzhou_down:setSize(cc.size(52,534))
    jineng_juanzhou_down:setRotation(90)
    jineng_juanzhou_down:setAnchorPoint(cc.p(0.5,0.5))
    jineng_bottom_panel:appendComponent(jineng_juanzhou_down)
    jineng_juanzhou_down:setPositionInContainer(cc.p(267,524))
    table_public_jineng_xiangqing_pop["jineng_juanzhou_down"] = jineng_juanzhou_down

    local jineng_title_bg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/xingjikuang_tangquanxinggong.png",cc.rect(72,0,2,29))
    jineng_title_bg:setSize(cc.size(260,50))
    jineng_title_bg:setAnchorPoint(cc.p(0.5,0.5))
    jineng_bottom_panel:appendComponent(jineng_title_bg)
    jineng_title_bg:setPositionInContainer(cc.p(277,25))
    table_public_jineng_xiangqing_pop["jineng_title_bg"] = jineng_title_bg

    local jn_ui_ji = fc.FExtensionsImage:create()
    jn_ui_ji:setImage("batch_ui/ji7_uizi.png")
    jn_ui_ji:setSize(cc.size(32,32))
    jn_ui_ji:setAnchorPoint(cc.p(0.5,0.5))
    jineng_bottom_panel:appendComponent(jn_ui_ji)
    jn_ui_ji:setPositionInContainer(cc.p(224,24))
    table_public_jineng_xiangqing_pop["jn_ui_ji"] = jn_ui_ji

    local jn_ui_neng = fc.FExtensionsImage:create()
    jn_ui_neng:setImage("batch_ui/neng_uizi.png")
    jn_ui_neng:setSize(cc.size(32,32))
    jn_ui_neng:setAnchorPoint(cc.p(0.5,0.5))
    jineng_bottom_panel:appendComponent(jn_ui_neng)
    jn_ui_neng:setPositionInContainer(cc.p(253,24))
    table_public_jineng_xiangqing_pop["jn_ui_neng"] = jn_ui_neng

    local jn_ui_xiang = fc.FExtensionsImage:create()
    jn_ui_xiang:setImage("batch_ui/xiang_uizi.png")
    jn_ui_xiang:setSize(cc.size(32,32))
    jn_ui_xiang:setAnchorPoint(cc.p(0.5,0.5))
    jineng_bottom_panel:appendComponent(jn_ui_xiang)
    jn_ui_xiang:setPositionInContainer(cc.p(281,24))
    table_public_jineng_xiangqing_pop["jn_ui_xiang"] = jn_ui_xiang

    local jn_ui_qing = fc.FExtensionsImage:create()
    jn_ui_qing:setImage("batch_ui/qing_uizi.png")
    jn_ui_qing:setSize(cc.size(32,32))
    jn_ui_qing:setAnchorPoint(cc.p(0.5,0.5))
    jineng_bottom_panel:appendComponent(jn_ui_qing)
    jn_ui_qing:setPositionInContainer(cc.p(310,24))
    table_public_jineng_xiangqing_pop["jn_ui_qing"] = jn_ui_qing

    local jineng_close_btn = fc.FScaleButton:create()
    jineng_close_btn:setSize(cc.size(34,33))
    jineng_close_btn:setAnchorPoint(cc.p(0.5,0.5))
    jineng_close_btn:setButtonImage("batch_ui/guanbi_anniu2.png")
    jineng_bottom_panel:appendComponent(jineng_close_btn)
    jineng_close_btn:setPositionInContainer(cc.p(490,29.5))
    table_public_jineng_xiangqing_pop["jineng_close_btn"] = jineng_close_btn

    local jhneng_bg_kuang3 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongditu2_huodong.png",cc.rect(1,1,1,1))
    jhneng_bg_kuang3:setSize(cc.size(384,454))
    jhneng_bg_kuang3:setAnchorPoint(cc.p(0.5,0.5))
    jineng_bottom_panel:appendComponent(jhneng_bg_kuang3)
    jhneng_bg_kuang3:setPositionInContainer(cc.p(267,275))
    table_public_jineng_xiangqing_pop["jhneng_bg_kuang3"] = jhneng_bg_kuang3

    local jineng_bg_kuang2 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongbiankuang2_ciguan.png",cc.rect(44,15,1,1))
    jineng_bg_kuang2:setSize(cc.size(384,454))
    jineng_bg_kuang2:setAnchorPoint(cc.p(0.5,0.5))
    jineng_bottom_panel:appendComponent(jineng_bg_kuang2)
    jineng_bg_kuang2:setPositionInContainer(cc.p(267,275))
    table_public_jineng_xiangqing_pop["jineng_bg_kuang2"] = jineng_bg_kuang2

    local jineng_bg_kuang1 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongbiankuang2_ciguan.png",cc.rect(44,15,1,1))
    jineng_bg_kuang1:setSize(cc.size(384,251))
    jineng_bg_kuang1:setAnchorPoint(cc.p(0.5,0.5))
    jineng_bottom_panel:appendComponent(jineng_bg_kuang1)
    jineng_bg_kuang1:setPositionInContainer(cc.p(267,376.5))
    table_public_jineng_xiangqing_pop["jineng_bg_kuang1"] = jineng_bg_kuang1

    local wenzi_di_1 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongditu_huodong.png",cc.rect(3,3,2,2))
    wenzi_di_1:setSize(cc.size(380,119))
    wenzi_di_1:setAnchorPoint(cc.p(0.5,0.5))
    jineng_bottom_panel:appendComponent(wenzi_di_1)
    wenzi_di_1:setPositionInContainer(cc.p(267,157.5))
    table_public_jineng_xiangqing_pop["wenzi_di_1"] = wenzi_di_1

    local jineng_icon_name_label = fc.FLabel:createBMFont()
    jineng_icon_name_label:setSize(cc.size(120,30))
    jineng_icon_name_label:setAnchorPoint(cc.p(0.5,0.5))
    jineng_icon_name_label:setFontSize(20)
    jineng_icon_name_label:setString("道具名字")
    jineng_icon_name_label:setColor(cc.c3b(91,24,6))
    jineng_bottom_panel:appendComponent(jineng_icon_name_label)
    jineng_icon_name_label:setPositionInContainer(cc.p(267,68))
    table_public_jineng_xiangqing_pop["jineng_icon_name_label"] = jineng_icon_name_label

    local jineng_icon_bg = fc.FExtensionsImage:create()
    jineng_icon_bg:setImage("batch_ui/baipinzhi_kuang.png")
    jineng_icon_bg:setSize(cc.size(104,104))
    jineng_icon_bg:setAnchorPoint(cc.p(0.5,0.5))
    jineng_bottom_panel:appendComponent(jineng_icon_bg)
    jineng_icon_bg:setPositionInContainer(cc.p(267,156))
    table_public_jineng_xiangqing_pop["jineng_icon_bg"] = jineng_icon_bg

    local jineng_icon_image = fc.FExtensionsImage:create()
    jineng_icon_image:setAnchorPoint(cc.p(0.5,0.5))
    jineng_bottom_panel:appendComponent(jineng_icon_image)
    jineng_icon_image:setPositionInContainer(cc.p(267,156))
    table_public_jineng_xiangqing_pop["jineng_icon_image"] = jineng_icon_image

    local wenzi_di_2 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongditu_huodong.png",cc.rect(3,3,2,2))
    wenzi_di_2:setSize(cc.size(380,49))
    wenzi_di_2:setAnchorPoint(cc.p(0.5,0.5))
    jineng_bottom_panel:appendComponent(wenzi_di_2)
    wenzi_di_2:setPositionInContainer(cc.p(268,333.5))
    table_public_jineng_xiangqing_pop["wenzi_di_2"] = wenzi_di_2

    local wenzi_di_2 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongditu_huodong.png",cc.rect(3,3,2,2))
    wenzi_di_2:setSize(cc.size(380,49))
    wenzi_di_2:setAnchorPoint(cc.p(0.5,0.5))
    jineng_bottom_panel:appendComponent(wenzi_di_2)
    wenzi_di_2:setPositionInContainer(cc.p(268,382.5))
    table_public_jineng_xiangqing_pop["wenzi_di_2"] = wenzi_di_2

    local icon_desc1 = fc.FLabel:createBMFont()
    icon_desc1:setSize(cc.size(300,25))
    icon_desc1:setAnchorPoint(cc.p(0.5,0.5))
    icon_desc1:setFontSize(20)
    icon_desc1:setString("道具名字")
    icon_desc1:setColor(cc.c3b(91,24,6))
    jineng_bottom_panel:appendComponent(icon_desc1)
    icon_desc1:setPositionInContainer(cc.p(263,286.5))
    table_public_jineng_xiangqing_pop["icon_desc1"] = icon_desc1

    local icon_desc2 = fc.FLabel:createBMFont()
    icon_desc2:setSize(cc.size(300,25))
    icon_desc2:setAnchorPoint(cc.p(0.5,0.5))
    icon_desc2:setFontSize(20)
    icon_desc2:setString("道具名字")
    icon_desc2:setColor(cc.c3b(206,53,0))
    icon_desc2:setAlignment(0)
    jineng_bottom_panel:appendComponent(icon_desc2)
    icon_desc2:setPositionInContainer(cc.p(267,333.5))
    table_public_jineng_xiangqing_pop["icon_desc2"] = icon_desc2

    local icon_desc3 = fc.FLabel:createBMFont()
    icon_desc3:setSize(cc.size(300,25))
    icon_desc3:setAnchorPoint(cc.p(0.5,0.5))
    icon_desc3:setFontSize(20)
    icon_desc3:setString("道具名字")
    icon_desc3:setColor(cc.c3b(206,53,0))
    icon_desc3:setAlignment(0)
    jineng_bottom_panel:appendComponent(icon_desc3)
    icon_desc3:setPositionInContainer(cc.p(267,380.5))
    table_public_jineng_xiangqing_pop["icon_desc3"] = icon_desc3

    local zhuzhen_num_di = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shuruwenzi.png",cc.rect(11,9,47,7))
    zhuzhen_num_di:setSize(cc.size(60,28))
    zhuzhen_num_di:setAnchorPoint(cc.p(0.5,0.5))
    jineng_bottom_panel:appendComponent(zhuzhen_num_di)
    zhuzhen_num_di:setPositionInContainer(cc.p(391,334))
    table_public_jineng_xiangqing_pop["zhuzhen_num_di"] = zhuzhen_num_di

    local zhuzhen_num_di = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shuruwenzi.png",cc.rect(11,9,47,7))
    zhuzhen_num_di:setSize(cc.size(60,28))
    zhuzhen_num_di:setAnchorPoint(cc.p(0.5,0.5))
    jineng_bottom_panel:appendComponent(zhuzhen_num_di)
    zhuzhen_num_di:setPositionInContainer(cc.p(391,381))
    table_public_jineng_xiangqing_pop["zhuzhen_num_di"] = zhuzhen_num_di

    local zhuzhen_num1 = fc.FLabel:createBMFont()
    zhuzhen_num1:setSize(cc.size(80,25))
    zhuzhen_num1:setAnchorPoint(cc.p(0.5,0.5))
    zhuzhen_num1:setFontSize(20)
    zhuzhen_num1:setString("11")
    zhuzhen_num1:setColor(cc.c3b(139,255,240))
    zhuzhen_num1:setAlignment(0)
    jineng_bottom_panel:appendComponent(zhuzhen_num1)
    zhuzhen_num1:setPositionInContainer(cc.p(405,333.5))
    table_public_jineng_xiangqing_pop["zhuzhen_num1"] = zhuzhen_num1

    local zhuzhen_num2 = fc.FLabel:createBMFont()
    zhuzhen_num2:setSize(cc.size(80,25))
    zhuzhen_num2:setAnchorPoint(cc.p(0.5,0.5))
    zhuzhen_num2:setFontSize(20)
    zhuzhen_num2:setString("12")
    zhuzhen_num2:setColor(cc.c3b(139,255,240))
    zhuzhen_num2:setAlignment(0)
    jineng_bottom_panel:appendComponent(zhuzhen_num2)
    zhuzhen_num2:setPositionInContainer(cc.p(405,380.5))
    table_public_jineng_xiangqing_pop["zhuzhen_num2"] = zhuzhen_num2

    local jineng_queding = fc.FScaleButton:create()
    jineng_queding:setSize(cc.size(144,53))
    jineng_queding:setAnchorPoint(cc.p(0.5,0.5))
    jineng_queding:setButtonImage("batch_ui/putonganniu1_up.png")
    jineng_bottom_panel:appendComponent(jineng_queding)
    jineng_queding:setPositionInContainer(cc.p(267,460.5))
    table_public_jineng_xiangqing_pop["jineng_queding"] = jineng_queding

    local jn_ui_que = fc.FShaderExtensionsImage:create(0)
    jn_ui_que:setAnchorPoint(cc.p(0.5,0.5))
    jn_ui_que:setImage("batch_ui/que_uizi.png")
    jn_ui_que:setSize(cc.size(32,32))
    jineng_queding:appendComponent(jn_ui_que)
    jn_ui_que:setPositionInContainer(cc.p(54,26))
    table_public_jineng_xiangqing_pop["jn_ui_que"] = jn_ui_que

    local jn_ui_ding = fc.FShaderExtensionsImage:create(0)
    jn_ui_ding:setAnchorPoint(cc.p(0.5,0.5))
    jn_ui_ding:setImage("batch_ui/ding_uizi.png")
    jn_ui_ding:setSize(cc.size(32,32))
    jineng_queding:appendComponent(jn_ui_ding)
    jn_ui_ding:setPositionInContainer(cc.p(90,26))
    table_public_jineng_xiangqing_pop["jn_ui_ding"] = jn_ui_ding

    local skillLocak = fc.FLabel:createBMFont()
    skillLocak:setSize(cc.size(59,19))
    skillLocak:setAnchorPoint(cc.p(0.5,0.5))
    skillLocak:setFontSize(22)
     if LANGUAGE_TYPE == 3 then
     	skillLocak:setString("天賦解鎖")
     else
     	skillLocak:setString("天赋解锁")
     end
    
    skillLocak:setColor(cc.c3b(0,255,0))
    jineng_bottom_panel:appendComponent(skillLocak)
    skillLocak:setPositionInContainer(cc.p(267.5,183.5))
    table_public_jineng_xiangqing_pop["skillLocak"] = skillLocak

    local lockDes = fc.FLabel:createBMFont()
    lockDes:setSize(cc.size(59,19))
    lockDes:setAnchorPoint(cc.p(0.5,0.5))
    lockDes:setFontSize(22)
    if LANGUAGE_TYPE == 3 then
    	lockDes:setString("天賦解鎖")
    else
    	lockDes:setString("天赋解锁")
    end
    
    lockDes:setColor(cc.c3b(0,255,0))
    jineng_bottom_panel:appendComponent(lockDes)
    lockDes:setPositionInContainer(cc.p(267.5,231.5))
    table_public_jineng_xiangqing_pop["lockDes"] = lockDes

    return table_public_jineng_xiangqing_pop

end

