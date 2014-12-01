function createxunfangRewardDetial()

    local table_xunfangRewardDetial = {}

    local xunfangRewardDetial = fc.FContainerPanel:create()
    xunfangRewardDetial:setSize(cc.size(960,640))
    table_xunfangRewardDetial["xunfangRewardDetial"] = xunfangRewardDetial

    local panel = fc.FContainerPanel:create()
    panel:setSize(cc.size(534,600))
    panel:setAnchorPoint(cc.p(0.5,0.5))
    xunfangRewardDetial:appendComponent(panel)
    panel:setPositionInContainer(cc.p(480,327))
    table_xunfangRewardDetial["panel"] = panel

    local bg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shengzhi_ditu.png",cc.rect(40,63,4,4))
    bg:setSize(cc.size(412,550))
    bg:setAnchorPoint(cc.p(0.5,0.5))
    panel:appendComponent(bg)
    bg:setPositionInContainer(cc.p(267,300))
    table_xunfangRewardDetial["bg"] = bg

    local zhou = fc.FExtensionsImage:create()
    zhou:setImage("nobatch/shengzhi_zhou.png")
    zhou:setSize(cc.size(52,534))
    zhou:setRotation(90)
    zhou:setAnchorPoint(cc.p(0.5,0.5))
    panel:appendComponent(zhou)
    zhou:setPositionInContainer(cc.p(267,26))
    table_xunfangRewardDetial["zhou"] = zhou

    local zhou = fc.FExtensionsImage:create()
    zhou:setImage("nobatch/shengzhi_zhou.png")
    zhou:setSize(cc.size(52,534))
    zhou:setRotation(90)
    zhou:setAnchorPoint(cc.p(0.5,0.5))
    panel:appendComponent(zhou)
    zhou:setPositionInContainer(cc.p(267,574))
    table_xunfangRewardDetial["zhou"] = zhou

    local dark_bg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongditu2_ciguan.png",cc.rect(1,1,2,2))
    dark_bg:setSize(cc.size(370,70))
    dark_bg:setAnchorPoint(cc.p(0.5,0.5))
    panel:appendComponent(dark_bg)
    dark_bg:setPositionInContainer(cc.p(267,515))
    table_xunfangRewardDetial["dark_bg"] = dark_bg

    local light_bg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongditu1_ciguan.png",cc.rect(1,1,1,1))
    light_bg:setSize(cc.size(370,430))
    light_bg:setAnchorPoint(cc.p(0.5,0.5))
    panel:appendComponent(light_bg)
    light_bg:setPositionInContainer(cc.p(267,265))
    table_xunfangRewardDetial["light_bg"] = light_bg

    local out_frame = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongbiankuang2_ciguan.png",cc.rect(43,15,2,2))
    out_frame:setSize(cc.size(370,500))
    out_frame:setAnchorPoint(cc.p(0.5,0.5))
    panel:appendComponent(out_frame)
    out_frame:setPositionInContainer(cc.p(267,300))
    table_xunfangRewardDetial["out_frame"] = out_frame

    local btnqueding = fc.FScaleButton:create()
    btnqueding:setSize(cc.size(144,53))
    btnqueding:setAnchorPoint(cc.p(0.5,0.5))
    btnqueding:setButtonImage("batch_ui/putonganniu1_up.png")
    panel:appendComponent(btnqueding)
    btnqueding:setPositionInContainer(cc.p(267,514.5))
    table_xunfangRewardDetial["btnqueding"] = btnqueding

    local que = fc.FExtensionsImage:create()
    que:setImage("batch_ui/que_uizi.png")
    que:setSize(cc.size(32,32))
    que:setAnchorPoint(cc.p(0.5,0.5))
    btnqueding:appendComponent(que)
    que:setPositionInContainer(cc.p(43,26))
    table_xunfangRewardDetial["que"] = que

    local ding = fc.FExtensionsImage:create()
    ding:setImage("batch_ui/ding_uizi.png")
    ding:setSize(cc.size(32,32))
    ding:setAnchorPoint(cc.p(0.5,0.5))
    btnqueding:appendComponent(ding)
    ding:setPositionInContainer(cc.p(95,26))
    table_xunfangRewardDetial["ding"] = ding

    local close_btn = fc.FScaleButton:create()
    close_btn:setSize(cc.size(34,33))
    close_btn:setAnchorPoint(cc.p(0.5,0.5))
    close_btn:setButtonImage("batch_ui/guanbi_anniu2.png")
    panel:appendComponent(close_btn)
    close_btn:setPositionInContainer(cc.p(497,26.5))
    table_xunfangRewardDetial["close_btn"] = close_btn

    local title_bg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/zongjiachengdikuang_tangquanxinggong.png",cc.rect(62,0,2,29))
    title_bg:setSize(cc.size(350,43))
    title_bg:setAnchorPoint(cc.p(0.5,0.5))
    panel:appendComponent(title_bg)
    title_bg:setPositionInContainer(cc.p(267,21.5))
    table_xunfangRewardDetial["title_bg"] = title_bg

    local title_label1 = fc.FContainerPanel:create()
    title_label1:setSize(cc.size(200,60))
    title_label1:setAnchorPoint(cc.p(0.5,0.5))
    panel:appendComponent(title_label1)
    title_label1:setPositionInContainer(cc.p(267,16))
    table_xunfangRewardDetial["title_label1"] = title_label1

    local jiang = fc.FExtensionsImage:create()
    jiang:setImage("batch_ui/jiang.png")
    jiang:setSize(cc.size(59,59))
    jiang:setAnchorPoint(cc.p(0.5,0.5))
    title_label1:appendComponent(jiang)
    jiang:setPositionInContainer(cc.p(29.5,29.5))
    table_xunfangRewardDetial["jiang"] = jiang

    local li = fc.FExtensionsImage:create()
    li:setImage("batch_ui/li1.png")
    li:setSize(cc.size(59,59))
    li:setAnchorPoint(cc.p(0.5,0.5))
    title_label1:appendComponent(li)
    li:setPositionInContainer(cc.p(170.5,29.5))
    table_xunfangRewardDetial["li"] = li

    return table_xunfangRewardDetial

end

