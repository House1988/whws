function createxuanxiu_qingdianshengzhi()

    local table_xuanxiu_qingdianshengzhi = {}

    local xuanxiu_qingdianshengzhi = fc.FContainerPanel:create()
    xuanxiu_qingdianshengzhi:setSize(cc.size(960,640))
    table_xuanxiu_qingdianshengzhi["xuanxiu_qingdianshengzhi"] = xuanxiu_qingdianshengzhi

    local xx_qdsz_bantouming = fc.FScale9Image:createWithBatchUIFrame("batch_ui/juezhan_heiseditu.png",cc.rect(2,2,1,1))
    xx_qdsz_bantouming:setSize(cc.size(960,640))
    xx_qdsz_bantouming:setAnchorPoint(cc.p(0.5,0.5))
    xuanxiu_qingdianshengzhi:appendComponent(xx_qdsz_bantouming)
    xx_qdsz_bantouming:setPositionInContainer(cc.p(480,320))
    table_xuanxiu_qingdianshengzhi["xx_qdsz_bantouming"] = xx_qdsz_bantouming

    local zhou_bg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shengzhi_ditu.png",cc.rect(40,63,4,4))
    zhou_bg:setSize(cc.size(480,900))
    zhou_bg:setAnchorPoint(cc.p(0.5,0.5))
    zhou_bg:setRotation(90)
    xuanxiu_qingdianshengzhi:appendComponent(zhou_bg)
    zhou_bg:setPositionInContainer(cc.p(480,320))
    table_xuanxiu_qingdianshengzhi["zhou_bg"] = zhou_bg

    local xx_qdsz_bg_image = fc.FExtensionsImage:create()
    xx_qdsz_bg_image:setImage("nobatch/shengzhi_zhou.png")
    xx_qdsz_bg_image:setSize(cc.size(55,620))
    xx_qdsz_bg_image:setAnchorPoint(cc.p(0.5,0.5))
    xuanxiu_qingdianshengzhi:appendComponent(xx_qdsz_bg_image)
    xx_qdsz_bg_image:setPositionInContainer(cc.p(30.5,320))
    table_xuanxiu_qingdianshengzhi["xx_qdsz_bg_image"] = xx_qdsz_bg_image

    local xx_qdsz_fengtian_label = fc.FLabel:createBMFont()
    xx_qdsz_fengtian_label:setSize(cc.size(30,240))
    xx_qdsz_fengtian_label:setAnchorPoint(cc.p(0.5,0.5))
    xx_qdsz_fengtian_label:setFontSize(20)
    if LANGUAGE_TYPE == 3 then
    	 xx_qdsz_fengtian_label:setVerString("奉天承運，皇帝詔曰")
    else
    	 xx_qdsz_fengtian_label:setVerString("奉天承运，皇帝诏曰")
    end
   
    xx_qdsz_fengtian_label:setColor(cc.c3b(0,0,0))
    xuanxiu_qingdianshengzhi:appendComponent(xx_qdsz_fengtian_label)
    xx_qdsz_fengtian_label:setPositionInContainer(cc.p(815,230))
    table_xuanxiu_qingdianshengzhi["xx_qdsz_fengtian_label"] = xx_qdsz_fengtian_label

    local xx_qdsz_gongxi_label = fc.FLabel:createBMFont()
    xx_qdsz_gongxi_label:setSize(cc.size(30,340))
    xx_qdsz_gongxi_label:setAnchorPoint(cc.p(0.5,0.5))
    xx_qdsz_gongxi_label:setFontSize(20)
    if LANGUAGE_TYPE == 3 then
    	xx_qdsz_gongxi_label:setVerString("本次舉辦的科舉考試圓滿結束，")
    else	
    	xx_qdsz_gongxi_label:setVerString("本次举办的科举考试圆满结束，")
    end
    
    xx_qdsz_gongxi_label:setColor(cc.c3b(0,0,0))
    xuanxiu_qingdianshengzhi:appendComponent(xx_qdsz_gongxi_label)
    xx_qdsz_gongxi_label:setPositionInContainer(cc.p(776,328))
    table_xuanxiu_qingdianshengzhi["xx_qdsz_gongxi_label"] = xx_qdsz_gongxi_label

    local xx_qdsz_meinv_image = fc.FExtensionsImage:create()
    xx_qdsz_meinv_image:setImage("beauty_card/zhuowenjun01.png")
    xx_qdsz_meinv_image:setSize(cc.size(512,373))
    xx_qdsz_meinv_image:setAnchorPoint(cc.p(0.5,0.5))
    xuanxiu_qingdianshengzhi:appendComponent(xx_qdsz_meinv_image)
    xx_qdsz_meinv_image:setPositionInContainer(cc.p(482,345.5))
    table_xuanxiu_qingdianshengzhi["xx_qdsz_meinv_image"] = xx_qdsz_meinv_image

    local xx_qdsz_xingxingditu1_image = fc.FExtensionsImage:create()
    xx_qdsz_xingxingditu1_image:setImage("batch_ui/xingxing_ditu.png")
    xx_qdsz_xingxingditu1_image:setSize(cc.size(27,26))
    xx_qdsz_xingxingditu1_image:setAnchorPoint(cc.p(0.5,0.5))
    xuanxiu_qingdianshengzhi:appendComponent(xx_qdsz_xingxingditu1_image)
    xx_qdsz_xingxingditu1_image:setPositionInContainer(cc.p(239.5,367))
    table_xuanxiu_qingdianshengzhi["xx_qdsz_xingxingditu1_image"] = xx_qdsz_xingxingditu1_image

    local xx_qdsz_xingxingditu2_image = fc.FExtensionsImage:create()
    xx_qdsz_xingxingditu2_image:setImage("batch_ui/xingxing_ditu.png")
    xx_qdsz_xingxingditu2_image:setSize(cc.size(27,26))
    xx_qdsz_xingxingditu2_image:setAnchorPoint(cc.p(0.5,0.5))
    xuanxiu_qingdianshengzhi:appendComponent(xx_qdsz_xingxingditu2_image)
    xx_qdsz_xingxingditu2_image:setPositionInContainer(cc.p(239.5,398))
    table_xuanxiu_qingdianshengzhi["xx_qdsz_xingxingditu2_image"] = xx_qdsz_xingxingditu2_image

    local xx_qdsz_xingxingditu3_image = fc.FExtensionsImage:create()
    xx_qdsz_xingxingditu3_image:setImage("batch_ui/xingxing_ditu.png")
    xx_qdsz_xingxingditu3_image:setSize(cc.size(27,26))
    xx_qdsz_xingxingditu3_image:setAnchorPoint(cc.p(0.5,0.5))
    xuanxiu_qingdianshengzhi:appendComponent(xx_qdsz_xingxingditu3_image)
    xx_qdsz_xingxingditu3_image:setPositionInContainer(cc.p(239.5,429))
    table_xuanxiu_qingdianshengzhi["xx_qdsz_xingxingditu3_image"] = xx_qdsz_xingxingditu3_image

    local xx_qdsz_xingxingditu4_image = fc.FExtensionsImage:create()
    xx_qdsz_xingxingditu4_image:setImage("batch_ui/xingxing_ditu.png")
    xx_qdsz_xingxingditu4_image:setSize(cc.size(27,26))
    xx_qdsz_xingxingditu4_image:setAnchorPoint(cc.p(0.5,0.5))
    xuanxiu_qingdianshengzhi:appendComponent(xx_qdsz_xingxingditu4_image)
    xx_qdsz_xingxingditu4_image:setPositionInContainer(cc.p(239.5,459))
    table_xuanxiu_qingdianshengzhi["xx_qdsz_xingxingditu4_image"] = xx_qdsz_xingxingditu4_image

    local xx_qdsz_xingxingditu5_image = fc.FExtensionsImage:create()
    xx_qdsz_xingxingditu5_image:setImage("batch_ui/xingxing_ditu.png")
    xx_qdsz_xingxingditu5_image:setSize(cc.size(27,26))
    xx_qdsz_xingxingditu5_image:setAnchorPoint(cc.p(0.5,0.5))
    xuanxiu_qingdianshengzhi:appendComponent(xx_qdsz_xingxingditu5_image)
    xx_qdsz_xingxingditu5_image:setPositionInContainer(cc.p(239.5,489))
    table_xuanxiu_qingdianshengzhi["xx_qdsz_xingxingditu5_image"] = xx_qdsz_xingxingditu5_image

    local xx_qdsz_xingxing1_image = fc.FExtensionsImage:create()
    xx_qdsz_xingxing1_image:setImage("batch_ui/xingxing_xiao.png")
    xx_qdsz_xingxing1_image:setSize(cc.size(21,21))
    xx_qdsz_xingxing1_image:setAnchorPoint(cc.p(0.5,0.5))
    xuanxiu_qingdianshengzhi:appendComponent(xx_qdsz_xingxing1_image)
    xx_qdsz_xingxing1_image:setPositionInContainer(cc.p(239.5,367.5))
    table_xuanxiu_qingdianshengzhi["xx_qdsz_xingxing1_image"] = xx_qdsz_xingxing1_image

    local xx_qdsz_xingxing2_image = fc.FExtensionsImage:create()
    xx_qdsz_xingxing2_image:setImage("batch_ui/xingxing_xiao.png")
    xx_qdsz_xingxing2_image:setSize(cc.size(21,21))
    xx_qdsz_xingxing2_image:setAnchorPoint(cc.p(0.5,0.5))
    xuanxiu_qingdianshengzhi:appendComponent(xx_qdsz_xingxing2_image)
    xx_qdsz_xingxing2_image:setPositionInContainer(cc.p(238.5,398.5))
    table_xuanxiu_qingdianshengzhi["xx_qdsz_xingxing2_image"] = xx_qdsz_xingxing2_image

    local xx_qdsz_xingxing3_image = fc.FExtensionsImage:create()
    xx_qdsz_xingxing3_image:setImage("batch_ui/xingxing_xiao.png")
    xx_qdsz_xingxing3_image:setSize(cc.size(21,21))
    xx_qdsz_xingxing3_image:setAnchorPoint(cc.p(0.5,0.5))
    xuanxiu_qingdianshengzhi:appendComponent(xx_qdsz_xingxing3_image)
    xx_qdsz_xingxing3_image:setPositionInContainer(cc.p(239.5,428.5))
    table_xuanxiu_qingdianshengzhi["xx_qdsz_xingxing3_image"] = xx_qdsz_xingxing3_image

    local xx_qdsz_xingxing4_image = fc.FExtensionsImage:create()
    xx_qdsz_xingxing4_image:setImage("batch_ui/xingxing_xiao.png")
    xx_qdsz_xingxing4_image:setSize(cc.size(21,21))
    xx_qdsz_xingxing4_image:setAnchorPoint(cc.p(0.5,0.5))
    xuanxiu_qingdianshengzhi:appendComponent(xx_qdsz_xingxing4_image)
    xx_qdsz_xingxing4_image:setPositionInContainer(cc.p(239.5,459.5))
    table_xuanxiu_qingdianshengzhi["xx_qdsz_xingxing4_image"] = xx_qdsz_xingxing4_image

    local xx_qdsz_xingxing5_image = fc.FExtensionsImage:create()
    xx_qdsz_xingxing5_image:setImage("batch_ui/xingxing_xiao.png")
    xx_qdsz_xingxing5_image:setSize(cc.size(21,21))
    xx_qdsz_xingxing5_image:setAnchorPoint(cc.p(0.5,0.5))
    xuanxiu_qingdianshengzhi:appendComponent(xx_qdsz_xingxing5_image)
    xx_qdsz_xingxing5_image:setPositionInContainer(cc.p(239.5,489.5))
    table_xuanxiu_qingdianshengzhi["xx_qdsz_xingxing5_image"] = xx_qdsz_xingxing5_image

    local xx_qdsz_yinzhang_image = fc.FExtensionsImage:create()
    xx_qdsz_yinzhang_image:setImage("batch_ui/yin_shengzhi.png")
    xx_qdsz_yinzhang_image:setSize(cc.size(113,113))
    xx_qdsz_yinzhang_image:setAnchorPoint(cc.p(0.5,0.5))
    xuanxiu_qingdianshengzhi:appendComponent(xx_qdsz_yinzhang_image)
    xx_qdsz_yinzhang_image:setPositionInContainer(cc.p(141.5,447.5))
    table_xuanxiu_qingdianshengzhi["xx_qdsz_yinzhang_image"] = xx_qdsz_yinzhang_image

    local xx_qdsz_name_label = fc.FLabel:createBMFont()
    xx_qdsz_name_label:setSize(cc.size(30,120))
    xx_qdsz_name_label:setAnchorPoint(cc.p(0.5,0.5))
    xx_qdsz_name_label:setFontSize(20)
    xx_qdsz_name_label:setVerString("安陵容安安")
    xx_qdsz_name_label:setColor(cc.c3b(206,53,0))
    xuanxiu_qingdianshengzhi:appendComponent(xx_qdsz_name_label)
    xx_qdsz_name_label:setPositionInContainer(cc.p(738,230))
    table_xuanxiu_qingdianshengzhi["xx_qdsz_name_label"] = xx_qdsz_name_label

    local xx_qdsz_wei_label = fc.FLabel:createBMFont()
    xx_qdsz_wei_label:setSize(cc.size(30,220))
    xx_qdsz_wei_label:setAnchorPoint(cc.p(0.5,0.5))
    xx_qdsz_wei_label:setFontSize(20)
     if LANGUAGE_TYPE == 3 then
     	xx_qdsz_wei_label:setVerString("，人品端正，文武雙")
     else
	    xx_qdsz_wei_label:setVerString("，人品端正，文武双")
     end
    xx_qdsz_wei_label:setColor(cc.c3b(0,0,0))
    xuanxiu_qingdianshengzhi:appendComponent(xx_qdsz_wei_label)
    xx_qdsz_wei_label:setPositionInContainer(cc.p(738,385))
    table_xuanxiu_qingdianshengzhi["xx_qdsz_wei_label"] = xx_qdsz_wei_label

    local xx_qdsz_title_label = fc.FLabel:createBMFont()
    xx_qdsz_title_label:setSize(cc.size(30,290))
    xx_qdsz_title_label:setAnchorPoint(cc.p(0.5,0.5))
    xx_qdsz_title_label:setFontSize(20)
    if LANGUAGE_TYPE == 3 then
    	xx_qdsz_title_label:setVerString("全，御筆親賜，金榜題名！")
    else
    	xx_qdsz_title_label:setVerString("全，御笔亲赐，金榜题名！")
    end
    xx_qdsz_title_label:setColor(cc.c3b(0,0,0))
    xuanxiu_qingdianshengzhi:appendComponent(xx_qdsz_title_label)
    xx_qdsz_title_label:setPositionInContainer(cc.p(700,310))
    table_xuanxiu_qingdianshengzhi["xx_qdsz_title_label"] = xx_qdsz_title_label

    local xx_qdsz_bg_image = fc.FExtensionsImage:create()
    xx_qdsz_bg_image:setImage("nobatch/shengzhi_zhou.png")
    xx_qdsz_bg_image:setSize(cc.size(55,620))
    xx_qdsz_bg_image:setAnchorPoint(cc.p(0.5,0.5))
    xuanxiu_qingdianshengzhi:appendComponent(xx_qdsz_bg_image)
    xx_qdsz_bg_image:setPositionInContainer(cc.p(932.5,320))
    table_xuanxiu_qingdianshengzhi["xx_qdsz_bg_image"] = xx_qdsz_bg_image

    local qingci = fc.FExtensionsImage:create()
    qingci:setImage("batch_ui/shengzhi_qinci.png")
    qingci:setSize(cc.size(45,87))
    qingci:setAnchorPoint(cc.p(0.5,0.5))
    xuanxiu_qingdianshengzhi:appendComponent(qingci)
    qingci:setPositionInContainer(cc.p(141.5,319.5))
    table_xuanxiu_qingdianshengzhi["qingci"] = qingci

    return table_xuanxiu_qingdianshengzhi

end

