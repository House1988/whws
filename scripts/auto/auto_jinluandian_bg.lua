function createjinluandian_bg()

    local table_jinluandian_bg = {}

    local jinluandian_bg = fc.FContainerPanel:create()
    jinluandian_bg:setSize(cc.size(960,640))
    table_jinluandian_bg["jinluandian_bg"] = jinluandian_bg

    local jld_bg_image = fc.FExtensionsImage:create()
    jld_bg_image:setAnchorPoint(cc.p(0.5,0.5))
    jinluandian_bg:appendComponent(jld_bg_image)
    jld_bg_image:setPositionInContainer(cc.p(480,320))
    table_jinluandian_bg["jld_bg_image"] = jld_bg_image

    local jld_zouzhangqiu_image = fc.FExtensionsImage:create()
    jld_zouzhangqiu_image:setImage("batch_ui/gongnenganniu_up.png")
    jld_zouzhangqiu_image:setSize(cc.size(96,96))
    jld_zouzhangqiu_image:setAnchorPoint(cc.p(0.5,0.5))
    jinluandian_bg:appendComponent(jld_zouzhangqiu_image)
    jld_zouzhangqiu_image:setPositionInContainer(cc.p(100,540))
    table_jinluandian_bg["jld_zouzhangqiu_image"] = jld_zouzhangqiu_image

    local jld_zouzhang_button = fc.FScaleButton:create()
    jld_zouzhang_button:setSize(cc.size(93,90))
    jld_zouzhang_button:setAnchorPoint(cc.p(0.5,0.5))
    jld_zouzhang_button:setButtonImage("batch_ui/zouzhang_anniu.png")
    jinluandian_bg:appendComponent(jld_zouzhang_button)
    jld_zouzhang_button:setPositionInContainer(cc.p(98.5,537))
    table_jinluandian_bg["jld_zouzhang_button"] = jld_zouzhang_button

    local jld_zouzhang_tishi_bg = fc.FExtensionsImage:create()
    jld_zouzhang_tishi_bg:setImage("batch_ui/zouzhangshumu_jinluandian.png")
    jld_zouzhang_tishi_bg:setSize(cc.size(37,37))
    jld_zouzhang_tishi_bg:setAnchorPoint(cc.p(0.5,0.5))
    jinluandian_bg:appendComponent(jld_zouzhang_tishi_bg)
    jld_zouzhang_tishi_bg:setPositionInContainer(cc.p(122.5,575.5))
    table_jinluandian_bg["jld_zouzhang_tishi_bg"] = jld_zouzhang_tishi_bg

    local jld_tuchao_button = fc.FScaleButton:create()
    jld_tuchao_button:setSize(cc.size(89,96))
    jld_tuchao_button:setAnchorPoint(cc.p(0.5,0.5))
    jld_tuchao_button:setButtonImage("batch_ui/tuichao_anniu_up.png")
    jinluandian_bg:appendComponent(jld_tuchao_button)
    jld_tuchao_button:setPositionInContainer(cc.p(914.5,52))
    table_jinluandian_bg["jld_tuchao_button"] = jld_tuchao_button

    local jld_zouzhangqiu_image = fc.FExtensionsImage:create()
    jld_zouzhangqiu_image:setImage("batch_ui/gongnenganniu_up.png")
    jld_zouzhangqiu_image:setSize(cc.size(96,96))
    jld_zouzhangqiu_image:setAnchorPoint(cc.p(0.5,0.5))
    jinluandian_bg:appendComponent(jld_zouzhangqiu_image)
    jld_zouzhangqiu_image:setPositionInContainer(cc.p(850,540))
    table_jinluandian_bg["jld_zouzhangqiu_image"] = jld_zouzhangqiu_image

    local zs_button = fc.FScaleButton:create()
    zs_button:setSize(cc.size(81,86))
    zs_button:setAnchorPoint(cc.p(0.5,0.5))
    zs_button:setButtonImage("batch_ui/zhengshui_anniu.png")
    jinluandian_bg:appendComponent(zs_button)
    zs_button:setPositionInContainer(cc.p(847.5,532))
    table_jinluandian_bg["zs_button"] = zs_button

    local jld_zouzhang_tishi_bg = fc.FExtensionsImage:create()
    jld_zouzhang_tishi_bg:setImage("batch_ui/zouzhangshumu_jinluandian.png")
    jld_zouzhang_tishi_bg:setSize(cc.size(37,37))
    jld_zouzhang_tishi_bg:setAnchorPoint(cc.p(0.5,0.5))
    jinluandian_bg:appendComponent(jld_zouzhang_tishi_bg)
    jld_zouzhang_tishi_bg:setPositionInContainer(cc.p(879.5,575.5))
    table_jinluandian_bg["jld_zouzhang_tishi_bg"] = jld_zouzhang_tishi_bg

    local zouzhang_num = fc.FLabel:createBMFont()
    zouzhang_num:setSize(cc.size(30,30))
    zouzhang_num:setAnchorPoint(cc.p(0.5,0.5))
    zouzhang_num:setFontSize(20)
    zouzhang_num:setString("5")
    zouzhang_num:setColor(cc.c3b(255,255,255))
    jinluandian_bg:appendComponent(zouzhang_num)
    zouzhang_num:setPositionInContainer(cc.p(122,573))
    table_jinluandian_bg["zouzhang_num"] = zouzhang_num

    local zs_num = fc.FLabel:createBMFont()
    zs_num:setSize(cc.size(30,30))
    zs_num:setAnchorPoint(cc.p(0.5,0.5))
    zs_num:setFontSize(20)
    zs_num:setString("5")
    zs_num:setColor(cc.c3b(255,255,255))
    jinluandian_bg:appendComponent(zs_num)
    zs_num:setPositionInContainer(cc.p(879,572))
    table_jinluandian_bg["zs_num"] = zs_num

    local label_di = fc.FExtensionsImage:create()
    label_di:setImage("batch_ui/ditu_jinluandian.png")
    label_di:setSize(cc.size(166,29))
    label_di:setAnchorPoint(cc.p(0.5,0.5))
    jinluandian_bg:appendComponent(label_di)
    label_di:setPositionInContainer(cc.p(112,608.5))
    table_jinluandian_bg["label_di"] = label_di

    local zouzhang_time = fc.FLabel:createBMFont()
    zouzhang_time:setSize(cc.size(85,30))
    zouzhang_time:setAnchorPoint(cc.p(0.5,0.5))
    zouzhang_time:setFontSize(20)
    zouzhang_time:setString("新的奏章")
    zouzhang_time:setColor(cc.c3b(255,255,255))
    jinluandian_bg:appendComponent(zouzhang_time)
    zouzhang_time:setPositionInContainer(cc.p(81.5,603))
    table_jinluandian_bg["zouzhang_time"] = zouzhang_time

    local zouzhang_time_num = fc.FLabel:createBMFont()
    zouzhang_time_num:setSize(cc.size(80,30))
    zouzhang_time_num:setAnchorPoint(cc.p(0.5,0.5))
    zouzhang_time_num:setFontSize(20)
    zouzhang_time_num:setString("00:00")
    zouzhang_time_num:setColor(cc.c3b(255,255,255))
    jinluandian_bg:appendComponent(zouzhang_time_num)
    zouzhang_time_num:setPositionInContainer(cc.p(149,604))
    table_jinluandian_bg["zouzhang_time_num"] = zouzhang_time_num

    local label_di = fc.FExtensionsImage:create()
    label_di:setImage("batch_ui/ditu_jinluandian.png")
    label_di:setSize(cc.size(166,29))
    label_di:setAnchorPoint(cc.p(0.5,0.5))
    jinluandian_bg:appendComponent(label_di)
    label_di:setPositionInContainer(cc.p(865,608.5))
    table_jinluandian_bg["label_di"] = label_di

    local zs_yuanbao_num = fc.FLabel:createBMFont()
    zs_yuanbao_num:setSize(cc.size(60,30))
    zs_yuanbao_num:setAnchorPoint(cc.p(0.5,0.5))
    zs_yuanbao_num:setFontSize(20)
    zs_yuanbao_num:setString("100")
    zs_yuanbao_num:setColor(cc.c3b(255,255,255))
    jinluandian_bg:appendComponent(zs_yuanbao_num)
    zs_yuanbao_num:setPositionInContainer(cc.p(896,607))
    table_jinluandian_bg["zs_yuanbao_num"] = zs_yuanbao_num

    local zs_yuanbao = fc.FExtensionsImage:create()
    zs_yuanbao:setImage("batch_ui/yuanbao.png")
    zs_yuanbao:setSize(cc.size(50,35))
    zs_yuanbao:setAnchorPoint(cc.p(0.5,0.5))
    jinluandian_bg:appendComponent(zs_yuanbao)
    zs_yuanbao:setPositionInContainer(cc.p(857,608.5))
    table_jinluandian_bg["zs_yuanbao"] = zs_yuanbao

    local zs_xiaohao_label = fc.FLabel:createBMFont()
    zs_xiaohao_label:setSize(cc.size(60,30))
    zs_xiaohao_label:setAnchorPoint(cc.p(0.5,0.5))
    zs_xiaohao_label:setFontSize(20)
    zs_xiaohao_label:setString("消耗")
    zs_xiaohao_label:setColor(cc.c3b(255,255,255))
    jinluandian_bg:appendComponent(zs_xiaohao_label)
    zs_xiaohao_label:setPositionInContainer(cc.p(814,606))
    table_jinluandian_bg["zs_xiaohao_label"] = zs_xiaohao_label

    return table_jinluandian_bg

end

