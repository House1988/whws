function createfirst_recharge_reward()

    local table_first_recharge_reward = {}

    local first_recharge_reward = fc.FContainerPanel:create()
    first_recharge_reward:setSize(cc.size(960,518))
    table_first_recharge_reward["first_recharge_reward"] = first_recharge_reward

    local fr_bg1 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongditu3_ciguan.png",cc.rect(3,3,2,2))
    fr_bg1:setSize(cc.size(906,498))
    fr_bg1:setAnchorPoint(cc.p(0.5,0.5))
    first_recharge_reward:appendComponent(fr_bg1)
    fr_bg1:setPositionInContainer(cc.p(480,263))
    table_first_recharge_reward["fr_bg1"] = fr_bg1

    local fr_bg2 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongbiankuang_ciguan.png",cc.rect(11,11,3,3))
    fr_bg2:setSize(cc.size(906,498))
    fr_bg2:setAnchorPoint(cc.p(0.5,0.5))
    first_recharge_reward:appendComponent(fr_bg2)
    fr_bg2:setPositionInContainer(cc.p(480,263))
    table_first_recharge_reward["fr_bg2"] = fr_bg2

    local fr_eave = fc.FScale9Image:createWithBatchUIFrame("nobatch/biankuang3_chongzhiyouli.png",cc.rect(122,0,65,361))
    fr_eave:setSize(cc.size(960,361))
    fr_eave:setAnchorPoint(cc.p(0.5,0.5))
    first_recharge_reward:appendComponent(fr_eave)
    fr_eave:setPositionInContainer(cc.p(480,180.5))
    table_first_recharge_reward["fr_eave"] = fr_eave

    local fr_countdown_lbl = fc.FLabel:createBMFont()
    fr_countdown_lbl:setSize(cc.size(350,25))
    fr_countdown_lbl:setAnchorPoint(cc.p(0.5,0.5))
    fr_countdown_lbl:setFontSize(20)
    fr_countdown_lbl:setString("活动倒计时：活动已结束")
    fr_countdown_lbl:setColor(cc.c3b(250,255,165))
    first_recharge_reward:appendComponent(fr_countdown_lbl)
    fr_countdown_lbl:setPositionInContainer(cc.p(271,66.5))
    table_first_recharge_reward["fr_countdown_lbl"] = fr_countdown_lbl

    local fr_turnover_lbl = fc.FLabel:createBMFont()
    fr_turnover_lbl:setSize(cc.size(300,25))
    fr_turnover_lbl:setAnchorPoint(cc.p(0.5,0.5))
    fr_turnover_lbl:setFontSize(20)
    fr_turnover_lbl:setString("活动期间已累计充值0元")
    fr_turnover_lbl:setColor(cc.c3b(250,255,165))
    first_recharge_reward:appendComponent(fr_turnover_lbl)
    fr_turnover_lbl:setPositionInContainer(cc.p(602,66.5))
    table_first_recharge_reward["fr_turnover_lbl"] = fr_turnover_lbl

    local fr_chong_btn = fc.FScaleButton:create()
    fr_chong_btn:setSize(cc.size(78,77))
    fr_chong_btn:setAnchorPoint(cc.p(0.5,0.5))
    fr_chong_btn:setButtonImage("batch_ui/chongzhi_anniu1.png")
    first_recharge_reward:appendComponent(fr_chong_btn)
    fr_chong_btn:setPositionInContainer(cc.p(813,68.5))
    table_first_recharge_reward["fr_chong_btn"] = fr_chong_btn

    return table_first_recharge_reward

end

