function createreward_btn_Item()

    local table_reward_btn_Item = {}

    local reward_btn_Item = fc.FContainerPanel:create()
    reward_btn_Item:setSize(cc.size(100,100))
    table_reward_btn_Item["reward_btn_Item"] = reward_btn_Item

    local rewardBtn = fc.FScaleButton:create()
    rewardBtn:setSize(cc.size(100,100))
    rewardBtn:setAnchorPoint(cc.p(0.5,0.5))
    rewardBtn:setButtonImage("batch_ui/guanbi_up.png")
    reward_btn_Item:appendComponent(rewardBtn)
    rewardBtn:setPositionInContainer(cc.p(50,50))
    table_reward_btn_Item["rewardBtn"] = rewardBtn

    return table_reward_btn_Item

end

