function createkeju_xuanxiu_shangcheng()

    local table_keju_xuanxiu_shangcheng = {}

    local keju_xuanxiu_shangcheng = fc.FContainerPanel:create()
    keju_xuanxiu_shangcheng:setSize(cc.size(960,640))
    table_keju_xuanxiu_shangcheng["keju_xuanxiu_shangcheng"] = keju_xuanxiu_shangcheng

    local bigbig_di = fc.FScale9Image:createWithBatchUIFrame("batch_ui/banzidikuangmeinv2_tongyong.png",cc.rect(2,2,1,1))
    bigbig_di:setSize(cc.size(960,640))
    bigbig_di:setAnchorPoint(cc.p(0.5,0.5))
    keju_xuanxiu_shangcheng:appendComponent(bigbig_di)
    bigbig_di:setPositionInContainer(cc.p(480,320))
    table_keju_xuanxiu_shangcheng["bigbig_di"] = bigbig_di

    local kjxxsc_biaotidiwen_image1 = fc.FExtensionsImage:create()
    kjxxsc_biaotidiwen_image1:setImage("nobatch/title_hougong.png")
    kjxxsc_biaotidiwen_image1:setSize(cc.size(480,67))
    kjxxsc_biaotidiwen_image1:setFlipType(2)
    kjxxsc_biaotidiwen_image1:setAnchorPoint(cc.p(0.5,0.5))
    keju_xuanxiu_shangcheng:appendComponent(kjxxsc_biaotidiwen_image1)
    kjxxsc_biaotidiwen_image1:setPositionInContainer(cc.p(720,36.5))
    table_keju_xuanxiu_shangcheng["kjxxsc_biaotidiwen_image1"] = kjxxsc_biaotidiwen_image1

    local kjxxsc_biaotidiwen_image = fc.FExtensionsImage:create()
    kjxxsc_biaotidiwen_image:setImage("nobatch/title_hougong.png")
    kjxxsc_biaotidiwen_image:setSize(cc.size(480,67))
    kjxxsc_biaotidiwen_image:setAnchorPoint(cc.p(0.5,0.5))
    keju_xuanxiu_shangcheng:appendComponent(kjxxsc_biaotidiwen_image)
    kjxxsc_biaotidiwen_image:setPositionInContainer(cc.p(240,36.5))
    table_keju_xuanxiu_shangcheng["kjxxsc_biaotidiwen_image"] = kjxxsc_biaotidiwen_image

    local kjxxsc_close_button = fc.FScaleButton:create()
    kjxxsc_close_button:setSize(cc.size(56,56))
    kjxxsc_close_button:setAnchorPoint(cc.p(0.5,0.5))
    kjxxsc_close_button:setButtonImage("batch_ui/guanbi_up.png")
    keju_xuanxiu_shangcheng:appendComponent(kjxxsc_close_button)
    kjxxsc_close_button:setPositionInContainer(cc.p(931,32))
    table_keju_xuanxiu_shangcheng["kjxxsc_close_button"] = kjxxsc_close_button

    local kjxxsc_chongzhi_button = fc.FScaleButton:create()
    kjxxsc_chongzhi_button:setSize(cc.size(78,77))
    kjxxsc_chongzhi_button:setAnchorPoint(cc.p(0.5,0.5))
    kjxxsc_chongzhi_button:setButtonImage("batch_ui/chongzhi_anniu1.png")
    keju_xuanxiu_shangcheng:appendComponent(kjxxsc_chongzhi_button)
    kjxxsc_chongzhi_button:setPositionInContainer(cc.p(812,39.5))
    table_keju_xuanxiu_shangcheng["kjxxsc_chongzhi_button"] = kjxxsc_chongzhi_button

    local keju_label = fc.FContainerPanel:create()
    keju_label:setSize(cc.size(159,45))
    keju_label:setAnchorPoint(cc.p(0.5,0.5))
    keju_xuanxiu_shangcheng:appendComponent(keju_label)
    keju_label:setPositionInContainer(cc.p(121.5,34.5))
    table_keju_xuanxiu_shangcheng["keju_label"] = keju_label

    local kjxxsc_keju_button = fc.FRadioButton:create()
    kjxxsc_keju_button:setRadioButtonImage("batch_ui/qieyeanniu_down1.png","batch_ui/qieyeanniu_up1.png")
    kjxxsc_keju_button:setSize(cc.size(159,45))
    kjxxsc_keju_button:setAnchorPoint(cc.p(0.5,0.5))
    keju_label:appendComponent(kjxxsc_keju_button)
    kjxxsc_keju_button:setPositionInContainer(cc.p(79.5,22.5))
    table_keju_xuanxiu_shangcheng["kjxxsc_keju_button"] = kjxxsc_keju_button

    local ke = fc.FExtensionsImage:create()
    ke:setImage("batch_ui/ke_uizi.png")
    ke:setSize(cc.size(32,32))
    ke:setAnchorPoint(cc.p(0.5,0.5))
    keju_label:appendComponent(ke)
    ke:setPositionInContainer(cc.p(56,22))
    table_keju_xuanxiu_shangcheng["ke"] = ke

    local ju = fc.FExtensionsImage:create()
    ju:setImage("batch_ui/ju_uizi.png")
    ju:setSize(cc.size(32,32))
    ju:setAnchorPoint(cc.p(0.5,0.5))
    keju_label:appendComponent(ju)
    ju:setPositionInContainer(cc.p(104,22))
    table_keju_xuanxiu_shangcheng["ju"] = ju

    local xuanxiiu_label = fc.FContainerPanel:create()
    xuanxiiu_label:setSize(cc.size(159,45))
    xuanxiiu_label:setAnchorPoint(cc.p(0.5,0.5))
    keju_xuanxiu_shangcheng:appendComponent(xuanxiiu_label)
    xuanxiiu_label:setPositionInContainer(cc.p(297.5,34.5))
    table_keju_xuanxiu_shangcheng["xuanxiiu_label"] = xuanxiiu_label

    local kjxxsc_xuanxiu_button = fc.FRadioButton:create()
    kjxxsc_xuanxiu_button:setRadioButtonImage("batch_ui/qieyeanniu_down1.png","batch_ui/qieyeanniu_up1.png")
    kjxxsc_xuanxiu_button:setSize(cc.size(159,45))
    kjxxsc_xuanxiu_button:setAnchorPoint(cc.p(0.5,0.5))
    xuanxiiu_label:appendComponent(kjxxsc_xuanxiu_button)
    kjxxsc_xuanxiu_button:setPositionInContainer(cc.p(79.5,22.5))
    table_keju_xuanxiu_shangcheng["kjxxsc_xuanxiu_button"] = kjxxsc_xuanxiu_button

    local xuan = fc.FExtensionsImage:create()
    xuan:setImage("batch_ui/xuan_uizi.png")
    xuan:setSize(cc.size(32,32))
    xuan:setAnchorPoint(cc.p(0.5,0.5))
    xuanxiiu_label:appendComponent(xuan)
    xuan:setPositionInContainer(cc.p(56,22))
    table_keju_xuanxiu_shangcheng["xuan"] = xuan

    local xiu = fc.FExtensionsImage:create()
    xiu:setImage("batch_ui/xiu_uizi.png")
    xiu:setSize(cc.size(32,32))
    xiu:setAnchorPoint(cc.p(0.5,0.5))
    xuanxiiu_label:appendComponent(xiu)
    xiu:setPositionInContainer(cc.p(104,22))
    table_keju_xuanxiu_shangcheng["xiu"] = xiu

    local shangcheng_label = fc.FContainerPanel:create()
    shangcheng_label:setSize(cc.size(159,45))
    shangcheng_label:setAnchorPoint(cc.p(0.5,0.5))
    keju_xuanxiu_shangcheng:appendComponent(shangcheng_label)
    shangcheng_label:setPositionInContainer(cc.p(472.5,34.5))
    table_keju_xuanxiu_shangcheng["shangcheng_label"] = shangcheng_label

    local kjxxsc_shancheng_button = fc.FRadioButton:create()
    kjxxsc_shancheng_button:setRadioButtonImage("batch_ui/qieyeanniu_down1.png","batch_ui/qieyeanniu_up1.png")
    kjxxsc_shancheng_button:setSize(cc.size(159,45))
    kjxxsc_shancheng_button:setAnchorPoint(cc.p(0.5,0.5))
    shangcheng_label:appendComponent(kjxxsc_shancheng_button)
    kjxxsc_shancheng_button:setPositionInContainer(cc.p(79.5,22.5))
    table_keju_xuanxiu_shangcheng["kjxxsc_shancheng_button"] = kjxxsc_shancheng_button

    local shang = fc.FExtensionsImage:create()
    shang:setImage("batch_ui/shang_uizi (2).png")
    shang:setSize(cc.size(32,32))
    shang:setAnchorPoint(cc.p(0.5,0.5))
    shangcheng_label:appendComponent(shang)
    shang:setPositionInContainer(cc.p(56,22))
    table_keju_xuanxiu_shangcheng["shang"] = shang

    local cheng = fc.FExtensionsImage:create()
    cheng:setImage("batch_ui/cheng_uizi (2).png")
    cheng:setSize(cc.size(32,32))
    cheng:setAnchorPoint(cc.p(0.5,0.5))
    shangcheng_label:appendComponent(cheng)
    cheng:setPositionInContainer(cc.p(104,22))
    table_keju_xuanxiu_shangcheng["cheng"] = cheng

    local xxsc_di = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shuruwenzi.png",cc.rect(11,9,47,7))
    xxsc_di:setSize(cc.size(120,30))
    xxsc_di:setAnchorPoint(cc.p(0.5,0.5))
    keju_xuanxiu_shangcheng:appendComponent(xxsc_di)
    xxsc_di:setPositionInContainer(cc.p(713,38))
    table_keju_xuanxiu_shangcheng["xxsc_di"] = xxsc_di

    local kjxxsc_yuanbao = fc.FExtensionsImage:create()
    kjxxsc_yuanbao:setImage("batch_ui/yuanbao_shangcheng.png")
    kjxxsc_yuanbao:setSize(cc.size(71,44))
    kjxxsc_yuanbao:setAnchorPoint(cc.p(0.5,0.5))
    keju_xuanxiu_shangcheng:appendComponent(kjxxsc_yuanbao)
    kjxxsc_yuanbao:setPositionInContainer(cc.p(653.5,35))
    table_keju_xuanxiu_shangcheng["kjxxsc_yuanbao"] = kjxxsc_yuanbao

    local kjxxsc_chongzhi_label = fc.FLabel:createBMFont()
    kjxxsc_chongzhi_label:setSize(cc.size(70,30))
    kjxxsc_chongzhi_label:setAnchorPoint(cc.p(0.5,0.5))
    kjxxsc_chongzhi_label:setFontSize(21)
    kjxxsc_chongzhi_label:setString("9999")
    kjxxsc_chongzhi_label:setColor(cc.c3b(255,255,255))
    keju_xuanxiu_shangcheng:appendComponent(kjxxsc_chongzhi_label)
    kjxxsc_chongzhi_label:setPositionInContainer(cc.p(716,35))
    table_keju_xuanxiu_shangcheng["kjxxsc_chongzhi_label"] = kjxxsc_chongzhi_label

    return table_keju_xuanxiu_shangcheng

end

