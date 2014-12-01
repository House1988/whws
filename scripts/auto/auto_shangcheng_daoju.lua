function createshangcheng_daoju()

    local table_shangcheng_daoju = {}

    local shangcheng_daoju = fc.FContainerPanel:create()
    shangcheng_daoju:setSize(cc.size(344,228))
    table_shangcheng_daoju["shangcheng_daoju"] = shangcheng_daoju

    local sc_dj_bg_image = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongdikuang1.png",cc.rect(25,25,4,4))
    sc_dj_bg_image:setSize(cc.size(344,228))
    sc_dj_bg_image:setAnchorPoint(cc.p(0.5,0.5))
    shangcheng_daoju:appendComponent(sc_dj_bg_image)
    sc_dj_bg_image:setPositionInContainer(cc.p(172,114))
    table_shangcheng_daoju["sc_dj_bg_image"] = sc_dj_bg_image

    local sc_dj_jinbian = fc.FExtensionsImage:create()
    sc_dj_jinbian:setImage("batch_ui/touxiangkuang_2.png")
    sc_dj_jinbian:setSize(cc.size(104,104))
    sc_dj_jinbian:setAnchorPoint(cc.p(0.5,0.5))
    shangcheng_daoju:appendComponent(sc_dj_jinbian)
    sc_dj_jinbian:setPositionInContainer(cc.p(74,97))
    table_shangcheng_daoju["sc_dj_jinbian"] = sc_dj_jinbian

    local sc_dj_miaoshu_label = fc.FLabel:createBMFont()
    sc_dj_miaoshu_label:setSize(cc.size(180,90))
    sc_dj_miaoshu_label:setWidth(180)
    sc_dj_miaoshu_label:setAnchorPoint(cc.p(0.5,0.5))
    sc_dj_miaoshu_label:setFontSize(20)
    sc_dj_miaoshu_label:setString("步兵步兵步兵步兵步兵步兵步兵步兵步兵步兵步兵步兵")
    sc_dj_miaoshu_label:setColor(cc.c3b(117,70,20))
    shangcheng_daoju:appendComponent(sc_dj_miaoshu_label)
    sc_dj_miaoshu_label:setPositionInContainer(cc.p(226,98))
    table_shangcheng_daoju["sc_dj_miaoshu_label"] = sc_dj_miaoshu_label

    local ss_dj_goumai_button = fc.FScaleButton:create()
    ss_dj_goumai_button:setSize(cc.size(144,51))
    ss_dj_goumai_button:setAnchorPoint(cc.p(0.5,0.5))
    ss_dj_goumai_button:setButtonImage("batch_ui/goumai_anniu.png")
    shangcheng_daoju:appendComponent(ss_dj_goumai_button)
    ss_dj_goumai_button:setPositionInContainer(cc.p(83,184.5))
    table_shangcheng_daoju["ss_dj_goumai_button"] = ss_dj_goumai_button

    local gou = fc.FExtensionsImage:create()
    gou:setImage("batch_ui/gou_uizi.png")
    gou:setSize(cc.size(32,32))
    gou:setAnchorPoint(cc.p(0.5,0.5))
    ss_dj_goumai_button:appendComponent(gou)
    gou:setPositionInContainer(cc.p(47,22))
    table_shangcheng_daoju["gou"] = gou

    local mai = fc.FExtensionsImage:create()
    mai:setImage("batch_ui/mai_uizi.png")
    mai:setSize(cc.size(32,32))
    mai:setAnchorPoint(cc.p(0.5,0.5))
    ss_dj_goumai_button:appendComponent(mai)
    mai:setPositionInContainer(cc.p(94,22))
    table_shangcheng_daoju["mai"] = mai

    local ss_dj_yuanbao_xianjia_bg = fc.FExtensionsImage:create()
    ss_dj_yuanbao_xianjia_bg:setImage("batch_ui/yuanbaoshuliangdiwwen_shangcheng2.png")
    ss_dj_yuanbao_xianjia_bg:setSize(cc.size(166,36))
    ss_dj_yuanbao_xianjia_bg:setAnchorPoint(cc.p(0.5,0.5))
    shangcheng_daoju:appendComponent(ss_dj_yuanbao_xianjia_bg)
    ss_dj_yuanbao_xianjia_bg:setPositionInContainer(cc.p(248,184))
    table_shangcheng_daoju["ss_dj_yuanbao_xianjia_bg"] = ss_dj_yuanbao_xianjia_bg

    local sc_dj_xianjia_label = fc.FLabel:createBMFont()
    sc_dj_xianjia_label:setSize(cc.size(70,30))
    sc_dj_xianjia_label:setAnchorPoint(cc.p(0.5,0.5))
    sc_dj_xianjia_label:setFontSize(21)
    sc_dj_xianjia_label:setString("9999")
    sc_dj_xianjia_label:setColor(cc.c3b(107,52,18))
    shangcheng_daoju:appendComponent(sc_dj_xianjia_label)
    sc_dj_xianjia_label:setPositionInContainer(cc.p(283,180))
    table_shangcheng_daoju["sc_dj_xianjia_label"] = sc_dj_xianjia_label

    local sc_dj_title1_bg1 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/daojukuangdiwen_shangcheng.png",cc.rect(74,18,2,2))
    sc_dj_title1_bg1:setSize(cc.size(220,32))
    sc_dj_title1_bg1:setAnchorPoint(cc.p(0.5,0.5))
    shangcheng_daoju:appendComponent(sc_dj_title1_bg1)
    sc_dj_title1_bg1:setPositionInContainer(cc.p(172,24))
    table_shangcheng_daoju["sc_dj_title1_bg1"] = sc_dj_title1_bg1

    local vip_xq_jinshou_bg_image = fc.FExtensionsImage:create()
    vip_xq_jinshou_bg_image:setImage("batch_ui/xianjia_vip.png")
    vip_xq_jinshou_bg_image:setSize(cc.size(70,50))
    vip_xq_jinshou_bg_image:setAnchorPoint(cc.p(0.5,0.5))
    shangcheng_daoju:appendComponent(vip_xq_jinshou_bg_image)
    vip_xq_jinshou_bg_image:setPositionInContainer(cc.p(184,183))
    table_shangcheng_daoju["vip_xq_jinshou_bg_image"] = vip_xq_jinshou_bg_image

    local ss_dj_yuanbao_xianjia = fc.FExtensionsImage:create()
    ss_dj_yuanbao_xianjia:setImage("batch_ui/yuanbao2_shangcheng.png")
    ss_dj_yuanbao_xianjia:setSize(cc.size(45,32))
    ss_dj_yuanbao_xianjia:setAnchorPoint(cc.p(0.5,0.5))
    shangcheng_daoju:appendComponent(ss_dj_yuanbao_xianjia)
    ss_dj_yuanbao_xianjia:setPositionInContainer(cc.p(226.5,182))
    table_shangcheng_daoju["ss_dj_yuanbao_xianjia"] = ss_dj_yuanbao_xianjia

    local sc_dj_name_label = fc.FLabel:createBMFont()
    sc_dj_name_label:setSize(cc.size(120,30))
    sc_dj_name_label:setAnchorPoint(cc.p(0.5,0.5))
    sc_dj_name_label:setFontSize(20)
    sc_dj_name_label:setString("道具名称")
    sc_dj_name_label:setColor(cc.c3b(140,27,4))
    shangcheng_daoju:appendComponent(sc_dj_name_label)
    sc_dj_name_label:setPositionInContainer(cc.p(172,20))
    table_shangcheng_daoju["sc_dj_name_label"] = sc_dj_name_label

    local frame = fc.FExtensionsImage:create()
    frame:setImage("batch_ui/baipinzhi_kuang.png")
    frame:setSize(cc.size(104,104))
    frame:setAnchorPoint(cc.p(0.5,0.5))
    shangcheng_daoju:appendComponent(frame)
    frame:setPositionInContainer(cc.p(74,97))
    table_shangcheng_daoju["frame"] = frame

    local sc_dj_renwu_image = fc.FExtensionsImage:create()
    sc_dj_renwu_image:setImage("nobatch/tupian.png")
    sc_dj_renwu_image:setSize(cc.size(93,93))
    sc_dj_renwu_image:setAnchorPoint(cc.p(0.5,0.5))
    shangcheng_daoju:appendComponent(sc_dj_renwu_image)
    sc_dj_renwu_image:setPositionInContainer(cc.p(74.5,96.5))
    table_shangcheng_daoju["sc_dj_renwu_image"] = sc_dj_renwu_image

    local jin = fc.FExtensionsImage:create()
    jin:setImage("batch_ui/jin (2).png")
    jin:setSize(cc.size(32,34))
    jin:setAnchorPoint(cc.p(0.5,0.5))
    shangcheng_daoju:appendComponent(jin)
    jin:setPositionInContainer(cc.p(173,184))
    table_shangcheng_daoju["jin"] = jin

    local shou = fc.FExtensionsImage:create()
    shou:setImage("batch_ui/shou (3).png")
    shou:setSize(cc.size(32,34))
    shou:setAnchorPoint(cc.p(0.5,0.5))
    shangcheng_daoju:appendComponent(shou)
    shou:setPositionInContainer(cc.p(199,184))
    table_shangcheng_daoju["shou"] = shou

    return table_shangcheng_daoju

end

