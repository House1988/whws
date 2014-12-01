function createexchange_reward()

    local table_exchange_reward = {}

    local exchange_reward = fc.FContainerPanel:create()
    exchange_reward:setSize(cc.size(960,640))
    table_exchange_reward["exchange_reward"] = exchange_reward

    local exchange_reward_bottom = fc.FContainerPanel:create()
    exchange_reward_bottom:setSize(cc.size(605,315))
    exchange_reward_bottom:setAnchorPoint(cc.p(0.5,0.5))
    exchange_reward:appendComponent(exchange_reward_bottom)
    exchange_reward_bottom:setPositionInContainer(cc.p(480.5,319.5))
    table_exchange_reward["exchange_reward_bottom"] = exchange_reward_bottom

    local exchange_di1 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongditu2_huodong.png",cc.rect(1,1,1,1))
    exchange_di1:setSize(cc.size(560,270))
    exchange_di1:setAnchorPoint(cc.p(0.5,0.5))
    exchange_reward_bottom:appendComponent(exchange_di1)
    exchange_di1:setPositionInContainer(cc.p(302,166))
    table_exchange_reward["exchange_di1"] = exchange_di1

    local exchange_di = fc.FScale9Image:createWithBatchUIFrame("nobatch/benguanjiangli_kuang.png",cc.rect(99,113,2,2))
    exchange_di:setSize(cc.size(605,315))
    exchange_di:setAnchorPoint(cc.p(0.5,0.5))
    exchange_reward_bottom:appendComponent(exchange_di)
    exchange_di:setPositionInContainer(cc.p(302.5,157.5))
    table_exchange_reward["exchange_di"] = exchange_di

    local exchange_di2 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongditu_huodong.png",cc.rect(3,3,2,2))
    exchange_di2:setSize(cc.size(545,88))
    exchange_di2:setAnchorPoint(cc.p(0.5,0.5))
    exchange_reward_bottom:appendComponent(exchange_di2)
    exchange_di2:setPositionInContainer(cc.p(302.5,173))
    table_exchange_reward["exchange_di2"] = exchange_di2

    local exchange_close = fc.FScaleButton:create()
    exchange_close:setSize(cc.size(146,53))
    exchange_close:setAnchorPoint(cc.p(0.5,0.5))
    exchange_close:setButtonImage("batch_ui/teshuanniu.png")
    exchange_reward_bottom:appendComponent(exchange_close)
    exchange_close:setPositionInContainer(cc.p(159,253.5))
    table_exchange_reward["exchange_close"] = exchange_close

    local ui_guan = fc.FExtensionsImage:create()
    ui_guan:setImage("batch_ui/guan_uizi.png")
    ui_guan:setSize(cc.size(32,32))
    ui_guan:setAnchorPoint(cc.p(0.5,0.5))
    exchange_close:appendComponent(ui_guan)
    ui_guan:setPositionInContainer(cc.p(44,26))
    table_exchange_reward["ui_guan"] = ui_guan

    local ui_bi = fc.FExtensionsImage:create()
    ui_bi:setImage("batch_ui/bi_uizi.png")
    ui_bi:setSize(cc.size(32,32))
    ui_bi:setAnchorPoint(cc.p(0.5,0.5))
    exchange_close:appendComponent(ui_bi)
    ui_bi:setPositionInContainer(cc.p(102,26))
    table_exchange_reward["ui_bi"] = ui_bi

    local exchange_exchange_button = fc.FScaleButton:create()
    exchange_exchange_button:setSize(cc.size(146,53))
    exchange_exchange_button:setAnchorPoint(cc.p(0.5,0.5))
    exchange_exchange_button:setButtonImage("batch_ui/teshuanniu.png")
    exchange_reward_bottom:appendComponent(exchange_exchange_button)
    exchange_exchange_button:setPositionInContainer(cc.p(445,253.5))
    table_exchange_reward["exchange_exchange_button"] = exchange_exchange_button

    local ui_dui = fc.FExtensionsImage:create()
    ui_dui:setImage("batch_ui/dui2_uizi.png")
    ui_dui:setSize(cc.size(32,32))
    ui_dui:setAnchorPoint(cc.p(0.5,0.5))
    exchange_exchange_button:appendComponent(ui_dui)
    ui_dui:setPositionInContainer(cc.p(44,26))
    table_exchange_reward["ui_dui"] = ui_dui

    local ui_huan = fc.FExtensionsImage:create()
    ui_huan:setImage("batch_ui/huan_uizi.png")
    ui_huan:setSize(cc.size(32,32))
    ui_huan:setAnchorPoint(cc.p(0.5,0.5))
    exchange_exchange_button:appendComponent(ui_huan)
    ui_huan:setPositionInContainer(cc.p(102,26))
    table_exchange_reward["ui_huan"] = ui_huan

    local label_1 = fc.FLabel:createBMFont()
    label_1:setSize(cc.size(220,30))
    label_1:setAnchorPoint(cc.p(0.5,0.5))
    label_1:setFontSize(24)
    if LANGUAGE_TYPE == 3 then
	    label_1:setString("請輸入有效的兌換碼：")
    else
	    label_1:setString("请输入有效的兑换码：")
    end
    label_1:setColor(cc.c3b(91,24,6))
    exchange_reward_bottom:appendComponent(label_1)
    label_1:setPositionInContainer(cc.p(302,96))
    table_exchange_reward["label_1"] = label_1

    local exchange_close2 = fc.FScaleButton:create()
    exchange_close2:setSize(cc.size(44,45))
    exchange_close2:setAnchorPoint(cc.p(0.5,0.5))
    exchange_close2:setButtonImage("batch_ui/libaoduihuan_guanbijian.png")
    exchange_reward_bottom:appendComponent(exchange_close2)
    exchange_close2:setPositionInContainer(cc.p(521,47.5))
    table_exchange_reward["exchange_close2"] = exchange_close2

    local ui_zi_li = fc.FExtensionsImage:create()
    ui_zi_li:setImage("batch_ui/li1_uizi.png")
    ui_zi_li:setSize(cc.size(32,32))
    ui_zi_li:setAnchorPoint(cc.p(0.5,0.5))
    exchange_reward_bottom:appendComponent(ui_zi_li)
    ui_zi_li:setPositionInContainer(cc.p(260,48))
    table_exchange_reward["ui_zi_li"] = ui_zi_li

    local ui_zi_bao = fc.FExtensionsImage:create()
    ui_zi_bao:setImage("batch_ui/bao_uizi.png")
    ui_zi_bao:setSize(cc.size(32,32))
    ui_zi_bao:setAnchorPoint(cc.p(0.5,0.5))
    exchange_reward_bottom:appendComponent(ui_zi_bao)
    ui_zi_bao:setPositionInContainer(cc.p(288,48))
    table_exchange_reward["ui_zi_bao"] = ui_zi_bao

    local ui_zi_dui = fc.FExtensionsImage:create()
    ui_zi_dui:setImage("batch_ui/dui2_uizi.png")
    ui_zi_dui:setSize(cc.size(32,32))
    ui_zi_dui:setAnchorPoint(cc.p(0.5,0.5))
    exchange_reward_bottom:appendComponent(ui_zi_dui)
    ui_zi_dui:setPositionInContainer(cc.p(316,48))
    table_exchange_reward["ui_zi_dui"] = ui_zi_dui

    local ui_zi_huan = fc.FExtensionsImage:create()
    ui_zi_huan:setImage("batch_ui/huan_uizi.png")
    ui_zi_huan:setSize(cc.size(32,32))
    ui_zi_huan:setAnchorPoint(cc.p(0.5,0.5))
    exchange_reward_bottom:appendComponent(ui_zi_huan)
    ui_zi_huan:setPositionInContainer(cc.p(344,48))
    table_exchange_reward["ui_zi_huan"] = ui_zi_huan

    local exchange_num_di = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shuruwenzi.png",cc.rect(11,9,47,7))
    exchange_num_di:setSize(cc.size(307,43))
    exchange_num_di:setAnchorPoint(cc.p(0.5,0.5))
    exchange_reward_bottom:appendComponent(exchange_num_di)
    exchange_num_di:setPositionInContainer(cc.p(302.5,173.5))
    table_exchange_reward["exchange_num_di"] = exchange_num_di

    local exchange_num_input = fc.FInput:create()
    exchange_num_input:setSizeAndBackgroundImage(cc.size(307,46),"","","",false)
    exchange_num_input:setAnchorPoint(cc.p(0.5,0.5))
    exchange_num_input:setTouchEnabled(true)
    exchange_num_input:setFontSize(20)
    exchange_num_input:setFontColor(cc.c3b(0,255,255))
    exchange_reward_bottom:appendComponent(exchange_num_input)
    exchange_num_input:setPositionInContainer(cc.p(301.5,173))
    table_exchange_reward["exchange_num_input"] = exchange_num_input

    return table_exchange_reward

end

