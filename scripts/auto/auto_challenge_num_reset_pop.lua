function createchallenge_num_reset_pop()

    local table_challenge_num_reset_pop = {}

    local challenge_num_reset_pop = fc.FContainerPanel:create()
    challenge_num_reset_pop:setSize(cc.size(960,640))
    table_challenge_num_reset_pop["challenge_num_reset_pop"] = challenge_num_reset_pop

    local cnrp_bottom = fc.FContainerPanel:create()
    cnrp_bottom:setSize(cc.size(534,499))
    cnrp_bottom:setAnchorPoint(cc.p(0.5,0.5))
    challenge_num_reset_pop:appendComponent(cnrp_bottom)
    cnrp_bottom:setPositionInContainer(cc.p(480,294.5))
    table_challenge_num_reset_pop["cnrp_bottom"] = cnrp_bottom

    local wen_la = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shengzhi_ditu.png",cc.rect(40,63,4,4))
    wen_la:setSize(cc.size(412,444))
    wen_la:setAnchorPoint(cc.p(0.5,0.5))
    cnrp_bottom:appendComponent(wen_la)
    wen_la:setPositionInContainer(cc.p(266,251))
    table_challenge_num_reset_pop["wen_la"] = wen_la

    local zhou_public = fc.FExtensionsImage:create()
    zhou_public:setImage("nobatch/shengzhi_zhou.png")
    zhou_public:setSize(cc.size(52,534))
    zhou_public:setRotation(90)
    zhou_public:setAnchorPoint(cc.p(0.5,0.5))
    cnrp_bottom:appendComponent(zhou_public)
    zhou_public:setPositionInContainer(cc.p(267,26))
    table_challenge_num_reset_pop["zhou_public"] = zhou_public

    local zhou_public = fc.FExtensionsImage:create()
    zhou_public:setImage("nobatch/shengzhi_zhou.png")
    zhou_public:setSize(cc.size(52,534))
    zhou_public:setRotation(90)
    zhou_public:setAnchorPoint(cc.p(0.5,0.5))
    cnrp_bottom:appendComponent(zhou_public)
    zhou_public:setPositionInContainer(cc.p(267,473))
    table_challenge_num_reset_pop["zhou_public"] = zhou_public

    local di_l = fc.FScale9Image:createWithBatchUIFrame("batch_ui/xingjikuang_tangquanxinggong.png",cc.rect(72,17,2,2))
    di_l:setSize(cc.size(260,50))
    di_l:setAnchorPoint(cc.p(0.5,0.5))
    di_l:setScaleY(-1)
    cnrp_bottom:appendComponent(di_l)
    di_l:setPositionInContainer(cc.p(267,25))
    table_challenge_num_reset_pop["di_l"] = di_l

    local close_chongzhi = fc.FScaleButton:create()
    close_chongzhi:setSize(cc.size(34,33))
    close_chongzhi:setAnchorPoint(cc.p(0.5,0.5))
    close_chongzhi:setButtonImage("batch_ui/guanbi_anniu2.png")
    cnrp_bottom:appendComponent(close_chongzhi)
    close_chongzhi:setPositionInContainer(cc.p(493,26.5))
    table_challenge_num_reset_pop["close_chongzhi"] = close_chongzhi

    local t_ui_ti = fc.FExtensionsImage:create()
    t_ui_ti:setImage("batch_ui/ti2_uizi.png")
    t_ui_ti:setSize(cc.size(32,32))
    t_ui_ti:setAnchorPoint(cc.p(0.5,0.5))
    cnrp_bottom:appendComponent(t_ui_ti)
    t_ui_ti:setPositionInContainer(cc.p(230,24))
    table_challenge_num_reset_pop["t_ui_ti"] = t_ui_ti

    local t_ui_shi = fc.FExtensionsImage:create()
    t_ui_shi:setImage("batch_ui/shi4_uizi.png")
    t_ui_shi:setSize(cc.size(32,32))
    t_ui_shi:setAnchorPoint(cc.p(0.5,0.5))
    cnrp_bottom:appendComponent(t_ui_shi)
    t_ui_shi:setPositionInContainer(cc.p(304,24))
    table_challenge_num_reset_pop["t_ui_shi"] = t_ui_shi

    local t_ui_rect1 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongditu2_huodong.png",cc.rect(1,1,1,1))
    t_ui_rect1:setSize(cc.size(384,400))
    t_ui_rect1:setAnchorPoint(cc.p(0.5,0.5))
    cnrp_bottom:appendComponent(t_ui_rect1)
    t_ui_rect1:setPositionInContainer(cc.p(266,251))
    table_challenge_num_reset_pop["t_ui_rect1"] = t_ui_rect1

    local t_ui_rect2 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongbiankuang2_ciguan.png",cc.rect(44,15,1,1))
    t_ui_rect2:setSize(cc.size(384,400))
    t_ui_rect2:setAnchorPoint(cc.p(0.5,0.5))
    cnrp_bottom:appendComponent(t_ui_rect2)
    t_ui_rect2:setPositionInContainer(cc.p(266,251))
    table_challenge_num_reset_pop["t_ui_rect2"] = t_ui_rect2

    local t_ui_rect3 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongditu_huodong.png",cc.rect(3,3,2,2))
    t_ui_rect3:setSize(cc.size(380,250))
    t_ui_rect3:setAnchorPoint(cc.p(0.5,0.5))
    cnrp_bottom:appendComponent(t_ui_rect3)
    t_ui_rect3:setPositionInContainer(cc.p(268,225))
    table_challenge_num_reset_pop["t_ui_rect3"] = t_ui_rect3

    local title = fc.FLabel:createBMFont()
    title:setSize(cc.size(130,30))
    title:setAnchorPoint(cc.p(0.5,0.5))
    title:setFontSize(20)
    title:setString("挑战次数不足")
    title:setColor(cc.c3b(106,68,19))
    cnrp_bottom:appendComponent(title)
    title:setPositionInContainer(cc.p(267,134))
    table_challenge_num_reset_pop["title"] = title

    local label_start = fc.FLabel:createBMFont()
    label_start:setSize(cc.size(60,25))
    label_start:setAnchorPoint(cc.p(0.5,0.5))
    label_start:setFontSize(20)
    label_start:setString("使用")
    label_start:setColor(cc.c3b(106,68,19))
    cnrp_bottom:appendComponent(label_start)
    label_start:setPositionInContainer(cc.p(116,181.5))
    table_challenge_num_reset_pop["label_start"] = label_start

    local use_gold = fc.FLabel:createBMFont()
    use_gold:setSize(cc.size(60,25))
    use_gold:setAnchorPoint(cc.p(0.5,0.5))
    use_gold:setFontSize(20)
    use_gold:setString("99")
    use_gold:setColor(cc.c3b(0,0,222))
    cnrp_bottom:appendComponent(use_gold)
    use_gold:setPositionInContainer(cc.p(171,181.5))
    table_challenge_num_reset_pop["use_gold"] = use_gold

    local gold_image = fc.FExtensionsImage:create()
    gold_image:setImage("batch_ui/yuanbao.png")
    gold_image:setSize(cc.size(58,43))
    gold_image:setAnchorPoint(cc.p(0.5,0.5))
    cnrp_bottom:appendComponent(gold_image)
    gold_image:setPositionInContainer(cc.p(225,180.5))
    table_challenge_num_reset_pop["gold_image"] = gold_image

    local label_2 = fc.FLabel:createBMFont()
    label_2:setSize(cc.size(160,25))
    label_2:setWidth(300)
    label_2:setAnchorPoint(cc.p(0.5,0.5))
    label_2:setFontSize(20)
    label_2:setString("可以重置本关挑战次数")
    label_2:setColor(cc.c3b(106,68,19))
    label_2:setAlignment(0)
    cnrp_bottom:appendComponent(label_2)
    label_2:setPositionInContainer(cc.p(333,181.5))
    table_challenge_num_reset_pop["label_2"] = label_2

    local label_3 = fc.FLabel:createBMFont()
    label_3:setSize(cc.size(160,25))
    label_3:setWidth(300)
    label_3:setAnchorPoint(cc.p(0.5,0.5))
    label_3:setFontSize(20)
    label_3:setString("可以重置挑战次数")
    label_3:setColor(cc.c3b(106,68,19))
    label_3:setAlignment(0)
    cnrp_bottom:appendComponent(label_3)
    label_3:setPositionInContainer(cc.p(244,233.5))
    table_challenge_num_reset_pop["label_3"] = label_3

    local remain_count = fc.FLabel:createBMFont()
    remain_count:setSize(cc.size(60,25))
    remain_count:setAnchorPoint(cc.p(0.5,0.5))
    remain_count:setFontSize(20)
    remain_count:setString("9次")
    remain_count:setColor(cc.c3b(0,0,222))
    cnrp_bottom:appendComponent(remain_count)
    remain_count:setPositionInContainer(cc.p(344,233.5))
    table_challenge_num_reset_pop["remain_count"] = remain_count

    local label4 = fc.FLabel:createBMFont()
    label4:setSize(cc.size(190,25))
    label4:setAnchorPoint(cc.p(0.5,0.5))
    label4:setFontSize(20)
    if LANGUAGE_TYPE == 3 then
	    label4:setString("vip等級越高，可使用次數越多")
    else
	    label4:setString("vip等级越高，可使用次数越多")
    end
    label4:setColor(cc.c3b(255,10,10))
    cnrp_bottom:appendComponent(label4)
    label4:setPositionInContainer(cc.p(270,277.5))
    table_challenge_num_reset_pop["label4"] = label4

    local chongzhi_btn = fc.FScaleButton:create()
    chongzhi_btn:setSize(cc.size(144,53))
    chongzhi_btn:setAnchorPoint(cc.p(0.5,0.5))
    chongzhi_btn:setButtonImage("batch_ui/putonganniu1_up.png")
    cnrp_bottom:appendComponent(chongzhi_btn)
    chongzhi_btn:setPositionInContainer(cc.p(276,399.5))
    table_challenge_num_reset_pop["chongzhi_btn"] = chongzhi_btn

    local btn_chong = fc.FShaderExtensionsImage:create(0)
    btn_chong:setAnchorPoint(cc.p(0.5,0.5))
    btn_chong:setImage("batch_ui/chong3_uizi.png")
    btn_chong:setSize(cc.size(32,32))
    chongzhi_btn:appendComponent(btn_chong)
    btn_chong:setPositionInContainer(cc.p(52,28))
    table_challenge_num_reset_pop["btn_chong"] = btn_chong

    local btn_zhi = fc.FShaderExtensionsImage:create(0)
    btn_zhi:setAnchorPoint(cc.p(0.5,0.5))
    btn_zhi:setImage("batch_ui/zhi1_uizi.png")
    btn_zhi:setSize(cc.size(32,32))
    chongzhi_btn:appendComponent(btn_zhi)
    btn_zhi:setPositionInContainer(cc.p(92,26))
    table_challenge_num_reset_pop["btn_zhi"] = btn_zhi

    return table_challenge_num_reset_pop

end

