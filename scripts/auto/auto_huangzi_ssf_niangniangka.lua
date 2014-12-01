function createhuangzi_ssf_niangniangka()

    local table_huangzi_ssf_niangniangka = {}

    local huangzi_ssf_niangniangka = fc.FContainerPanel:create()
    huangzi_ssf_niangniangka:setSize(cc.size(157,240))
    table_huangzi_ssf_niangniangka["huangzi_ssf_niangniangka"] = huangzi_ssf_niangniangka

    local hz_nnk_zhi_bg_scale9 = fc.FExtensionsImage:create()
    hz_nnk_zhi_bg_scale9:setImage("nobatch/touxiangdikuang_meinv1.png")
    hz_nnk_zhi_bg_scale9:setSize(cc.size(140,150))
    hz_nnk_zhi_bg_scale9:setAnchorPoint(cc.p(0.5,0.5))
    huangzi_ssf_niangniangka:appendComponent(hz_nnk_zhi_bg_scale9)
    hz_nnk_zhi_bg_scale9:setPositionInContainer(cc.p(81,103))
    table_huangzi_ssf_niangniangka["hz_nnk_zhi_bg_scale9"] = hz_nnk_zhi_bg_scale9

    local hz_nnk_card_head_pinzhi_image = fc.FExtensionsImage:create()
    hz_nnk_card_head_pinzhi_image:setImage("batch_ui/baipinzhi_kuang.png")
    hz_nnk_card_head_pinzhi_image:setSize(cc.size(104,104))
    hz_nnk_card_head_pinzhi_image:setAnchorPoint(cc.p(0.5,0.5))
    huangzi_ssf_niangniangka:appendComponent(hz_nnk_card_head_pinzhi_image)
    hz_nnk_card_head_pinzhi_image:setPositionInContainer(cc.p(82,90))
    table_huangzi_ssf_niangniangka["hz_nnk_card_head_pinzhi_image"] = hz_nnk_card_head_pinzhi_image

    local hz_nnk_card_image = fc.FExtensionsImage:create()
    hz_nnk_card_image:setImage("nobatch/tupian.png")
    hz_nnk_card_image:setSize(cc.size(93,93))
    hz_nnk_card_image:setAnchorPoint(cc.p(0.5,0.5))
    huangzi_ssf_niangniangka:appendComponent(hz_nnk_card_image)
    hz_nnk_card_image:setPositionInContainer(cc.p(82.5,90.5))
    table_huangzi_ssf_niangniangka["hz_nnk_card_image"] = hz_nnk_card_image

    local hz_nnk_xueshi_bg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongdi1.png",cc.rect(70,12,2,2))
    hz_nnk_xueshi_bg:setSize(cc.size(140,38))
    hz_nnk_xueshi_bg:setAnchorPoint(cc.p(0.5,0.5))
    huangzi_ssf_niangniangka:appendComponent(hz_nnk_xueshi_bg)
    hz_nnk_xueshi_bg:setPositionInContainer(cc.p(81,163))
    table_huangzi_ssf_niangniangka["hz_nnk_xueshi_bg"] = hz_nnk_xueshi_bg

    local hz_nnk_name_bg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongdi1.png",cc.rect(70,12,2,2))
    hz_nnk_name_bg:setSize(cc.size(140,30))
    hz_nnk_name_bg:setAnchorPoint(cc.p(0.5,0.5))
    huangzi_ssf_niangniangka:appendComponent(hz_nnk_name_bg)
    hz_nnk_name_bg:setPositionInContainer(cc.p(81,21))
    table_huangzi_ssf_niangniangka["hz_nnk_name_bg"] = hz_nnk_name_bg

    local card_rect = fc.FScale9Image:createWithBatchUIFrame("batch_ui/touxiangdikuang_meinv2.png",cc.rect(53,54,2,2))
    card_rect:setSize(cc.size(157,191))
    card_rect:setAnchorPoint(cc.p(0.5,0.5))
    huangzi_ssf_niangniangka:appendComponent(card_rect)
    card_rect:setPositionInContainer(cc.p(78.5,90.5))
    table_huangzi_ssf_niangniangka["card_rect"] = card_rect

    local hz_nnk_xueshi_num_label = fc.FLabel:createBMFont()
    hz_nnk_xueshi_num_label:setSize(cc.size(100,25))
    hz_nnk_xueshi_num_label:setAnchorPoint(cc.p(0.5,0.5))
    hz_nnk_xueshi_num_label:setFontSize(20)
    hz_nnk_xueshi_num_label:setString("999")
    hz_nnk_xueshi_num_label:setColor(cc.c3b(137,32,18))
    huangzi_ssf_niangniangka:appendComponent(hz_nnk_xueshi_num_label)
    hz_nnk_xueshi_num_label:setPositionInContainer(cc.p(81,155.5))
    table_huangzi_ssf_niangniangka["hz_nnk_xueshi_num_label"] = hz_nnk_xueshi_num_label

    local hz_nnk_name_label = fc.FLabel:createBMFont()
    hz_nnk_name_label:setSize(cc.size(120,25))
    hz_nnk_name_label:setAnchorPoint(cc.p(0.5,0.5))
    hz_nnk_name_label:setFontSize(20)
    hz_nnk_name_label:setString("步兵步兵")
    hz_nnk_name_label:setColor(cc.c3b(137,32,18))
    huangzi_ssf_niangniangka:appendComponent(hz_nnk_name_label)
    hz_nnk_name_label:setPositionInContainer(cc.p(78,20.5))
    table_huangzi_ssf_niangniangka["hz_nnk_name_label"] = hz_nnk_name_label

    local hz_nnk_jiaoyu_button = fc.FScaleButton:create()
    hz_nnk_jiaoyu_button:setSize(cc.size(144,53))
    hz_nnk_jiaoyu_button:setAnchorPoint(cc.p(0.5,0.5))
    hz_nnk_jiaoyu_button:setButtonImage("batch_ui/putonganniu1_up.png")
    huangzi_ssf_niangniangka:appendComponent(hz_nnk_jiaoyu_button)
    hz_nnk_jiaoyu_button:setPositionInContainer(cc.p(80,210.5))
    table_huangzi_ssf_niangniangka["hz_nnk_jiaoyu_button"] = hz_nnk_jiaoyu_button

    local jiao = fc.FShaderExtensionsImage:create(0)
    jiao:setAnchorPoint(cc.p(0.5,0.5))
    hz_nnk_jiaoyu_button:appendComponent(jiao)
    jiao:setPositionInContainer(cc.p(44,26))
    table_huangzi_ssf_niangniangka["jiao"] = jiao

    jiao:setImage("batch_ui/jiao_uizi.png")
    jiao:setSize(cc.size(32,32))
    local yu = fc.FShaderExtensionsImage:create(0)
    yu:setAnchorPoint(cc.p(0.5,0.5))
    hz_nnk_jiaoyu_button:appendComponent(yu)
    yu:setPositionInContainer(cc.p(102,26))
    table_huangzi_ssf_niangniangka["yu"] = yu

    yu:setImage("batch_ui/yu_uizi.png")
    yu:setSize(cc.size(32,32))
    local hz_nnk_xueshi_shu_image = fc.FExtensionsImage:create()
    hz_nnk_xueshi_shu_image:setImage("batch_ui/xueshi_tubiao.png")
    hz_nnk_xueshi_shu_image:setSize(cc.size(50,50))
    hz_nnk_xueshi_shu_image:setAnchorPoint(cc.p(0.5,0.5))
    huangzi_ssf_niangniangka:appendComponent(hz_nnk_xueshi_shu_image)
    hz_nnk_xueshi_shu_image:setPositionInContainer(cc.p(25,159))
    table_huangzi_ssf_niangniangka["hz_nnk_xueshi_shu_image"] = hz_nnk_xueshi_shu_image

    local hz_nnk_eniang_imag = fc.FExtensionsImage:create()
    hz_nnk_eniang_imag:setImage("batch_ui/eniang.png")
    hz_nnk_eniang_imag:setSize(cc.size(64,32))
    hz_nnk_eniang_imag:setAnchorPoint(cc.p(0.5,0.5))
    huangzi_ssf_niangniangka:appendComponent(hz_nnk_eniang_imag)
    hz_nnk_eniang_imag:setPositionInContainer(cc.p(126,54))
    table_huangzi_ssf_niangniangka["hz_nnk_eniang_imag"] = hz_nnk_eniang_imag

    return table_huangzi_ssf_niangniangka

end

