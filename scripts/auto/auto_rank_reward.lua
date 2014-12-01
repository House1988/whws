function createrank_reward()

    local table_rank_reward = {}

    local rank_reward = fc.FContainerPanel:create()
    rank_reward:setSize(cc.size(960,640))
    table_rank_reward["rank_reward"] = rank_reward

    local panel = fc.FContainerPanel:create()
    panel:setSize(cc.size(900,600))
    panel:setAnchorPoint(cc.p(0.5,0.5))
    rank_reward:appendComponent(panel)
    panel:setPositionInContainer(cc.p(472,320))
    table_rank_reward["panel"] = panel

    local bg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shengzhi_ditu.png",cc.rect(40,63,4,4))
    bg:setSize(cc.size(650,550))
    bg:setAnchorPoint(cc.p(0.5,0.5))
    panel:appendComponent(bg)
    bg:setPositionInContainer(cc.p(450,300))
    table_rank_reward["bg"] = bg

    local zhou = fc.FExtensionsImage:create()
    zhou:setImage("nobatch/shengzhi_zhou.png")
    zhou:setSize(cc.size(52,800))
    zhou:setRotation(90)
    zhou:setAnchorPoint(cc.p(0.5,0.5))
    panel:appendComponent(zhou)
    zhou:setPositionInContainer(cc.p(450,26))
    table_rank_reward["zhou"] = zhou

    local zhou = fc.FExtensionsImage:create()
    zhou:setImage("nobatch/shengzhi_zhou.png")
    zhou:setSize(cc.size(52,800))
    zhou:setRotation(90)
    zhou:setAnchorPoint(cc.p(0.5,0.5))
    panel:appendComponent(zhou)
    zhou:setPositionInContainer(cc.p(450,574))
    table_rank_reward["zhou"] = zhou

    local dark_bg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongditu2_ciguan.png",cc.rect(1,1,2,2))
    dark_bg:setSize(cc.size(600,430))
    dark_bg:setAnchorPoint(cc.p(0.5,0.5))
    panel:appendComponent(dark_bg)
    dark_bg:setPositionInContainer(cc.p(450,262))
    table_rank_reward["dark_bg"] = dark_bg

    local out_frame = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongbiankuang2_ciguan.png",cc.rect(43,15,2,2))
    out_frame:setSize(cc.size(600,500))
    out_frame:setAnchorPoint(cc.p(0.5,0.5))
    panel:appendComponent(out_frame)
    out_frame:setPositionInContainer(cc.p(450,297))
    table_rank_reward["out_frame"] = out_frame

    local close_btn = fc.FScaleButton:create()
    close_btn:setSize(cc.size(34,33))
    close_btn:setAnchorPoint(cc.p(0.5,0.5))
    close_btn:setButtonImage("batch_ui/guanbi_anniu2.png")
    panel:appendComponent(close_btn)
    close_btn:setPositionInContainer(cc.p(792,26.5))
    table_rank_reward["close_btn"] = close_btn

    local title_bg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/zongjiachengdikuang_tangquanxinggong.png",cc.rect(62,0,2,29))
    title_bg:setSize(cc.size(350,43))
    title_bg:setAnchorPoint(cc.p(0.5,0.5))
    panel:appendComponent(title_bg)
    title_bg:setPositionInContainer(cc.p(450,25.5))
    table_rank_reward["title_bg"] = title_bg

    local title = fc.FContainerPanel:create()
    title:setSize(cc.size(240,60))
    title:setAnchorPoint(cc.p(0.5,0.5))
    panel:appendComponent(title)
    title:setPositionInContainer(cc.p(450,20))
    table_rank_reward["title"] = title

    local pai = fc.FExtensionsImage:create()
    pai:setImage("batch_ui/pai.png")
    pai:setSize(cc.size(59,59))
    pai:setAnchorPoint(cc.p(0.5,0.5))
    title:appendComponent(pai)
    pai:setPositionInContainer(cc.p(29.5,29.5))
    table_rank_reward["pai"] = pai

    local hang = fc.FExtensionsImage:create()
    hang:setImage("batch_ui/hang.png")
    hang:setSize(cc.size(59,59))
    hang:setAnchorPoint(cc.p(0.5,0.5))
    title:appendComponent(hang)
    hang:setPositionInContainer(cc.p(89.5,29.5))
    table_rank_reward["hang"] = hang

    local jiang = fc.FExtensionsImage:create()
    jiang:setImage("batch_ui/jiang.png")
    jiang:setSize(cc.size(59,59))
    jiang:setAnchorPoint(cc.p(0.5,0.5))
    title:appendComponent(jiang)
    if LANGUAGE_TYPE == 3 then
	    jiang:setPositionInContainer(cc.p(150.5,32.5))
    else
	    jiang:setPositionInContainer(cc.p(150.5,34.5))
    end
    table_rank_reward["jiang"] = jiang

    local li = fc.FExtensionsImage:create()
    li:setImage("batch_ui/li1.png")
    li:setSize(cc.size(59,59))
    li:setAnchorPoint(cc.p(0.5,0.5))
    title:appendComponent(li)
    if LANGUAGE_TYPE == 3 then
    	li:setPositionInContainer(cc.p(210.5,31.5))
    else
    	li:setPositionInContainer(cc.p(210.5,34.5))
    end
    table_rank_reward["li"] = li

    local light_bg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongditu1_ciguan.png",cc.rect(1,1,1,1))
    light_bg:setSize(cc.size(600,70))
    light_bg:setAnchorPoint(cc.p(0.5,0.5))
    panel:appendComponent(light_bg)
    light_bg:setPositionInContainer(cc.p(450,512))
    table_rank_reward["light_bg"] = light_bg

    local text = fc.FLabel:createBMFont()
    text:setSize(cc.size(350,25))
    text:setWidth(350)
    text:setAnchorPoint(cc.p(0.5,0.5))
    text:setFontSize(20)
     if LANGUAGE_TYPE == 3 then
     	text:setString("若未達到排名最低積分要求，則由系統自動調整當前積分最高可領取獎勵")
     else
	    text:setString("若未达到排名最低积分要求，则由系统自动调整当前积分最高可领取奖励")
     end
    text:setColor(cc.c3b(91,24,6))
    panel:appendComponent(text)
    text:setPositionInContainer(cc.p(450,512.5))
    table_rank_reward["text"] = text

    local list = fc.FContainerList:create(1)
    list:setSize(cc.size(600,420))
    list:setAnchorPoint(cc.p(0.5,0.5))
    panel:appendComponent(list)
    list:setPositionInContainer(cc.p(450,262))
    table_rank_reward["list"] = list

    return table_rank_reward

end

