function createfirst_recharge_reward_item()

    local table_first_recharge_reward_item = {}

    local first_recharge_reward_item = fc.FContainerPanel:create()
    first_recharge_reward_item:setSize(cc.size(205,380))
    table_first_recharge_reward_item["first_recharge_reward_item"] = first_recharge_reward_item

    local fri_bg1 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongditu1_ciguan.png",cc.rect(3,3,2,2))
    fri_bg1:setSize(cc.size(170,380))
    fri_bg1:setAnchorPoint(cc.p(0.5,0.5))
    first_recharge_reward_item:appendComponent(fri_bg1)
    fri_bg1:setPositionInContainer(cc.p(85,190))
    table_first_recharge_reward_item["fri_bg1"] = fri_bg1

    local yilingqu = fc.FExtensionsImage:create()
    yilingqu:setImage("batch_ui/yilingqu_huodong.png")
    yilingqu:setSize(cc.size(114,81))
    yilingqu:setAnchorPoint(cc.p(0.5,0.5))
    first_recharge_reward_item:appendComponent(yilingqu)
    yilingqu:setPositionInContainer(cc.p(113,333.5))
    table_first_recharge_reward_item["yilingqu"] = yilingqu

    local fri_bg2 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongbiankuang2_ciguan.png",cc.rect(43,15,2,2))
    fri_bg2:setSize(cc.size(170,380))
    fri_bg2:setAnchorPoint(cc.p(0.5,0.5))
    first_recharge_reward_item:appendComponent(fri_bg2)
    fri_bg2:setPositionInContainer(cc.p(85,190))
    table_first_recharge_reward_item["fri_bg2"] = fri_bg2

    local fri_title_1 = fc.FLabel:createBMFont()
    fri_title_1:setSize(cc.size(90,25))
    fri_title_1:setAnchorPoint(cc.p(0.5,0.5))
    fri_title_1:setFontSize(21)
    if LANGUAGE_TYPE == 3 then
	    fri_title_1:setString("累計充值")
    else
	    fri_title_1:setString("累计充值")
    end
    fri_title_1:setColor(cc.c3b(135,87,51))
    first_recharge_reward_item:appendComponent(fri_title_1)
    fri_title_1:setPositionInContainer(cc.p(52,28.5))
    table_first_recharge_reward_item["fri_title_1"] = fri_title_1

    local fri_title_2_bg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shuruwenzi.png",cc.rect(10,10,46,2))
    fri_title_2_bg:setSize(cc.size(50,25))
    fri_title_2_bg:setAnchorPoint(cc.p(0.5,0.5))
    first_recharge_reward_item:appendComponent(fri_title_2_bg)
    fri_title_2_bg:setPositionInContainer(cc.p(120,31.5))
    table_first_recharge_reward_item["fri_title_2_bg"] = fri_title_2_bg

    local fri_title_2 = fc.FLabel:createBMFont()
    fri_title_2:setSize(cc.size(50,25))
    fri_title_2:setAnchorPoint(cc.p(0.5,0.5))
    fri_title_2:setFontSize(21)
    fri_title_2:setString("998")
    fri_title_2:setColor(cc.c3b(139,255,240))
    first_recharge_reward_item:appendComponent(fri_title_2)
    fri_title_2:setPositionInContainer(cc.p(118,28.5))
    table_first_recharge_reward_item["fri_title_2"] = fri_title_2

    local fri_title_3 = fc.FLabel:createBMFont()
    fri_title_3:setSize(cc.size(25,25))
    fri_title_3:setAnchorPoint(cc.p(0.5,0.5))
    fri_title_3:setFontSize(21)
    fri_title_3:setString("元")
    fri_title_3:setColor(cc.c3b(135,87,51))
    first_recharge_reward_item:appendComponent(fri_title_3)
    fri_title_3:setPositionInContainer(cc.p(155.5,28.5))
    table_first_recharge_reward_item["fri_title_3"] = fri_title_3

    local fri_arrow_image = fc.FExtensionsImage:create()
    fri_arrow_image:setImage("batch_ui/jiantou_ciguan.png")
    fri_arrow_image:setSize(cc.size(36,26))
    fri_arrow_image:setAnchorPoint(cc.p(0.5,0.5))
    first_recharge_reward_item:appendComponent(fri_arrow_image)
    fri_arrow_image:setPositionInContainer(cc.p(187,139))
    table_first_recharge_reward_item["fri_arrow_image"] = fri_arrow_image

    local fri_gift_bg = fc.FExtensionsImage:create()
    fri_gift_bg:setImage("batch_ui/lvpinzhi_kuang.png")
    fri_gift_bg:setSize(cc.size(102,102))
    fri_gift_bg:setAnchorPoint(cc.p(0.5,0.5))
    first_recharge_reward_item:appendComponent(fri_gift_bg)
    fri_gift_bg:setPositionInContainer(cc.p(87,99))
    table_first_recharge_reward_item["fri_gift_bg"] = fri_gift_bg

    local fri_gift_image = fc.FExtensionsImage:create()
    fri_gift_image:setImage("batch_ui/libao_zhandoujiangli.png")
    fri_gift_image:setSize(cc.size(92,92))
    fri_gift_image:setAnchorPoint(cc.p(0.5,0.5))
    first_recharge_reward_item:appendComponent(fri_gift_image)
    fri_gift_image:setPositionInContainer(cc.p(87,99))
    table_first_recharge_reward_item["fri_gift_image"] = fri_gift_image

    local fri_accept_btn = fc.FScaleButton:create()
    fri_accept_btn:setSize(cc.size(144,53))
    fri_accept_btn:setAnchorPoint(cc.p(0.5,0.5))
    fri_accept_btn:setButtonImage("batch_ui/putonganniu1_up.png")
    first_recharge_reward_item:appendComponent(fri_accept_btn)
    fri_accept_btn:setPositionInContainer(cc.p(84,328.5))
    table_first_recharge_reward_item["fri_accept_btn"] = fri_accept_btn

    local fri_ling = fc.FShaderExtensionsImage:create(0)
    fri_ling:setAnchorPoint(cc.p(0.5,0.5))
    fri_ling:setImage("batch_ui/cha_uizi.png")
    fri_ling:setSize(cc.size(32,32))
    fri_accept_btn:appendComponent(fri_ling)
    fri_ling:setPositionInContainer(cc.p(50,27))
    table_first_recharge_reward_item["fri_ling"] = fri_ling

    local fri_qu = fc.FShaderExtensionsImage:create(0)
    fri_qu:setAnchorPoint(cc.p(0.5,0.5))
    fri_qu:setImage("batch_ui/kan_uizi.png")
    fri_qu:setSize(cc.size(32,32))
    fri_accept_btn:appendComponent(fri_qu)
    fri_qu:setPositionInContainer(cc.p(98,27))
    table_first_recharge_reward_item["fri_qu"] = fri_qu

    local fri_detail_bg1 = fc.FExtensionsImage:create()
    fri_detail_bg1:setImage("batch_ui/shangci_sekuai.png")
    fri_detail_bg1:setSize(cc.size(144,25))
    fri_detail_bg1:setAnchorPoint(cc.p(0.5,0.5))
    first_recharge_reward_item:appendComponent(fri_detail_bg1)
    fri_detail_bg1:setPositionInContainer(cc.p(84,164.5))
    table_first_recharge_reward_item["fri_detail_bg1"] = fri_detail_bg1

    local fri_detail_bg2 = fc.FExtensionsImage:create()
    fri_detail_bg2:setImage("batch_ui/shangci_sekuai.png")
    fri_detail_bg2:setSize(cc.size(144,25))
    fri_detail_bg2:setAnchorPoint(cc.p(0.5,0.5))
    first_recharge_reward_item:appendComponent(fri_detail_bg2)
    fri_detail_bg2:setPositionInContainer(cc.p(84,194.5))
    table_first_recharge_reward_item["fri_detail_bg2"] = fri_detail_bg2

    local fri_detail_bg3 = fc.FExtensionsImage:create()
    fri_detail_bg3:setImage("batch_ui/shangci_sekuai.png")
    fri_detail_bg3:setSize(cc.size(144,25))
    fri_detail_bg3:setAnchorPoint(cc.p(0.5,0.5))
    first_recharge_reward_item:appendComponent(fri_detail_bg3)
    fri_detail_bg3:setPositionInContainer(cc.p(84,224.5))
    table_first_recharge_reward_item["fri_detail_bg3"] = fri_detail_bg3

    local fri_detail_bg4 = fc.FExtensionsImage:create()
    fri_detail_bg4:setImage("batch_ui/shangci_sekuai.png")
    fri_detail_bg4:setSize(cc.size(144,25))
    fri_detail_bg4:setAnchorPoint(cc.p(0.5,0.5))
    first_recharge_reward_item:appendComponent(fri_detail_bg4)
    fri_detail_bg4:setPositionInContainer(cc.p(84,254.5))
    table_first_recharge_reward_item["fri_detail_bg4"] = fri_detail_bg4

    local fri_detail_1 = fc.FLabel:createBMFont()
    fri_detail_1:setSize(cc.size(144,25))
    fri_detail_1:setAnchorPoint(cc.p(0.5,0.5))
    fri_detail_1:setFontSize(21)
    fri_detail_1:setString("")
    fri_detail_1:setColor(cc.c3b(80,19,1))
    first_recharge_reward_item:appendComponent(fri_detail_1)
    fri_detail_1:setPositionInContainer(cc.p(84,160.5))
    table_first_recharge_reward_item["fri_detail_1"] = fri_detail_1

    local fri_detail_2 = fc.FLabel:createBMFont()
    fri_detail_2:setSize(cc.size(144,25))
    fri_detail_2:setAnchorPoint(cc.p(0.5,0.5))
    fri_detail_2:setFontSize(21)
    fri_detail_2:setString("")
    fri_detail_2:setColor(cc.c3b(80,19,1))
    first_recharge_reward_item:appendComponent(fri_detail_2)
    fri_detail_2:setPositionInContainer(cc.p(84,190.5))
    table_first_recharge_reward_item["fri_detail_2"] = fri_detail_2

    local fri_detail_3 = fc.FLabel:createBMFont()
    fri_detail_3:setSize(cc.size(144,25))
    fri_detail_3:setAnchorPoint(cc.p(0.5,0.5))
    fri_detail_3:setFontSize(21)
    fri_detail_3:setString("")
    fri_detail_3:setColor(cc.c3b(80,19,1))
    first_recharge_reward_item:appendComponent(fri_detail_3)
    fri_detail_3:setPositionInContainer(cc.p(84,220.5))
    table_first_recharge_reward_item["fri_detail_3"] = fri_detail_3

    local fri_detail_4 = fc.FLabel:createBMFont()
    fri_detail_4:setSize(cc.size(144,25))
    fri_detail_4:setAnchorPoint(cc.p(0.5,0.5))
    fri_detail_4:setFontSize(21)
    fri_detail_4:setString("")
    fri_detail_4:setColor(cc.c3b(80,19,1))
    first_recharge_reward_item:appendComponent(fri_detail_4)
    fri_detail_4:setPositionInContainer(cc.p(84,250.5))
    table_first_recharge_reward_item["fri_detail_4"] = fri_detail_4

    local fri_detail_bg5 = fc.FExtensionsImage:create()
    fri_detail_bg5:setImage("batch_ui/shangci_sekuai.png")
    fri_detail_bg5:setSize(cc.size(144,25))
    fri_detail_bg5:setAnchorPoint(cc.p(0.5,0.5))
    first_recharge_reward_item:appendComponent(fri_detail_bg5)
    fri_detail_bg5:setPositionInContainer(cc.p(84,284.5))
    table_first_recharge_reward_item["fri_detail_bg5"] = fri_detail_bg5

    local fri_detail_5 = fc.FLabel:createBMFont()
    fri_detail_5:setSize(cc.size(144,25))
    fri_detail_5:setAnchorPoint(cc.p(0.5,0.5))
    fri_detail_5:setFontSize(21)
    fri_detail_5:setString("")
    fri_detail_5:setColor(cc.c3b(80,19,1))
    first_recharge_reward_item:appendComponent(fri_detail_5)
    fri_detail_5:setPositionInContainer(cc.p(84,280.5))
    table_first_recharge_reward_item["fri_detail_5"] = fri_detail_5

    return table_first_recharge_reward_item

end

