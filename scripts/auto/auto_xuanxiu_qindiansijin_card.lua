function createxuanxiu_qindiansijin_card()

    local table_xuanxiu_qindiansijin_card = {}

    local xuanxiu_qindiansijin_card = fc.FContainerPanel:create()
    xuanxiu_qindiansijin_card:setSize(cc.size(228,449))
    table_xuanxiu_qindiansijin_card["xuanxiu_qindiansijin_card"] = xuanxiu_qindiansijin_card

    local xx_qdsj_bg_middle = fc.FExtensionsImage:create()
    xx_qdsj_bg_middle:setImage("nobatch/qindian_juanzhou_2.png")
    xx_qdsj_bg_middle:setSize(cc.size(198,412))
    xx_qdsj_bg_middle:setAnchorPoint(cc.p(0.5,0.5))
    xuanxiu_qindiansijin_card:appendComponent(xx_qdsj_bg_middle)
    xx_qdsj_bg_middle:setPositionInContainer(cc.p(114,228))
    table_xuanxiu_qindiansijin_card["xx_qdsj_bg_middle"] = xx_qdsj_bg_middle

    local xx_qdsj_bg_top = fc.FExtensionsImage:create()
    xx_qdsj_bg_top:setImage("nobatch/qindian_juanzhou_1.png")
    xx_qdsj_bg_top:setSize(cc.size(228,76))
    xx_qdsj_bg_top:setAnchorPoint(cc.p(0.5,0.5))
    xuanxiu_qindiansijin_card:appendComponent(xx_qdsj_bg_top)
    xx_qdsj_bg_top:setPositionInContainer(cc.p(114,38))
    table_xuanxiu_qindiansijin_card["xx_qdsj_bg_top"] = xx_qdsj_bg_top

    local xx_qdsj_bg_bottom = fc.FExtensionsImage:create()
    xx_qdsj_bg_bottom:setImage("batch_ui/qindian_juanzhou_3.png")
    xx_qdsj_bg_bottom:setSize(cc.size(218,27))
    xx_qdsj_bg_bottom:setAnchorPoint(cc.p(0.5,0.5))
    xuanxiu_qindiansijin_card:appendComponent(xx_qdsj_bg_bottom)
    xx_qdsj_bg_bottom:setPositionInContainer(cc.p(114,435.5))
    table_xuanxiu_qindiansijin_card["xx_qdsj_bg_bottom"] = xx_qdsj_bg_bottom

    local xx_qdsj_meinv_name_label = fc.FLabel:createBMFont()
    xx_qdsj_meinv_name_label:setSize(cc.size(120,30))
    xx_qdsj_meinv_name_label:setAnchorPoint(cc.p(0.5,0.5))
    xx_qdsj_meinv_name_label:setFontSize(20)
    xx_qdsj_meinv_name_label:setString("美女的名称")
    xx_qdsj_meinv_name_label:setColor(cc.c3b(126,72,20))
    xuanxiu_qindiansijin_card:appendComponent(xx_qdsj_meinv_name_label)
    xx_qdsj_meinv_name_label:setPositionInContainer(cc.p(113,54))
    table_xuanxiu_qindiansijin_card["xx_qdsj_meinv_name_label"] = xx_qdsj_meinv_name_label

    local xx_qdsj_jinbian = fc.FExtensionsImage:create()
    xx_qdsj_jinbian:setImage("batch_ui/touxiangkuang_2.png")
    xx_qdsj_jinbian:setSize(cc.size(104,104))
    xx_qdsj_jinbian:setAnchorPoint(cc.p(0.5,0.5))
    xuanxiu_qindiansijin_card:appendComponent(xx_qdsj_jinbian)
    xx_qdsj_jinbian:setPositionInContainer(cc.p(114,160))
    table_xuanxiu_qindiansijin_card["xx_qdsj_jinbian"] = xx_qdsj_jinbian

    local xx_qdsj_xingxingditu3_image = fc.FExtensionsImage:create()
    xx_qdsj_xingxingditu3_image:setImage("batch_ui/xingxing_ditu.png")
    xx_qdsj_xingxingditu3_image:setSize(cc.size(27,26))
    xx_qdsj_xingxingditu3_image:setAnchorPoint(cc.p(0.5,0.5))
    xuanxiu_qindiansijin_card:appendComponent(xx_qdsj_xingxingditu3_image)
    xx_qdsj_xingxingditu3_image:setPositionInContainer(cc.p(113.5,257))
    table_xuanxiu_qindiansijin_card["xx_qdsj_xingxingditu3_image"] = xx_qdsj_xingxingditu3_image

    local xx_qdsj_xingxingditu2_image = fc.FExtensionsImage:create()
    xx_qdsj_xingxingditu2_image:setImage("batch_ui/xingxing_ditu.png")
    xx_qdsj_xingxingditu2_image:setSize(cc.size(27,26))
    xx_qdsj_xingxingditu2_image:setAnchorPoint(cc.p(0.5,0.5))
    xuanxiu_qindiansijin_card:appendComponent(xx_qdsj_xingxingditu2_image)
    xx_qdsj_xingxingditu2_image:setPositionInContainer(cc.p(84.5,257))
    table_xuanxiu_qindiansijin_card["xx_qdsj_xingxingditu2_image"] = xx_qdsj_xingxingditu2_image

    local xx_qdsj_xingxingditu1_image = fc.FExtensionsImage:create()
    xx_qdsj_xingxingditu1_image:setImage("batch_ui/xingxing_ditu.png")
    xx_qdsj_xingxingditu1_image:setSize(cc.size(27,26))
    xx_qdsj_xingxingditu1_image:setAnchorPoint(cc.p(0.5,0.5))
    xuanxiu_qindiansijin_card:appendComponent(xx_qdsj_xingxingditu1_image)
    xx_qdsj_xingxingditu1_image:setPositionInContainer(cc.p(54.5,257))
    table_xuanxiu_qindiansijin_card["xx_qdsj_xingxingditu1_image"] = xx_qdsj_xingxingditu1_image

    local xx_qdsj_xingxingditu4_image = fc.FExtensionsImage:create()
    xx_qdsj_xingxingditu4_image:setImage("batch_ui/xingxing_ditu.png")
    xx_qdsj_xingxingditu4_image:setSize(cc.size(27,26))
    xx_qdsj_xingxingditu4_image:setAnchorPoint(cc.p(0.5,0.5))
    xuanxiu_qindiansijin_card:appendComponent(xx_qdsj_xingxingditu4_image)
    xx_qdsj_xingxingditu4_image:setPositionInContainer(cc.p(142.5,257))
    table_xuanxiu_qindiansijin_card["xx_qdsj_xingxingditu4_image"] = xx_qdsj_xingxingditu4_image

    local xx_qdsj_xingxingditu5_image = fc.FExtensionsImage:create()
    xx_qdsj_xingxingditu5_image:setImage("batch_ui/xingxing_ditu.png")
    xx_qdsj_xingxingditu5_image:setSize(cc.size(27,26))
    xx_qdsj_xingxingditu5_image:setAnchorPoint(cc.p(0.5,0.5))
    xuanxiu_qindiansijin_card:appendComponent(xx_qdsj_xingxingditu5_image)
    xx_qdsj_xingxingditu5_image:setPositionInContainer(cc.p(172.5,257))
    table_xuanxiu_qindiansijin_card["xx_qdsj_xingxingditu5_image"] = xx_qdsj_xingxingditu5_image

    local xx_qdsj_xingxing1_image = fc.FExtensionsImage:create()
    xx_qdsj_xingxing1_image:setImage("batch_ui/xingxing_xiao.png")
    xx_qdsj_xingxing1_image:setSize(cc.size(21,21))
    xx_qdsj_xingxing1_image:setAnchorPoint(cc.p(0.5,0.5))
    xuanxiu_qindiansijin_card:appendComponent(xx_qdsj_xingxing1_image)
    xx_qdsj_xingxing1_image:setPositionInContainer(cc.p(54.5,257.5))
    table_xuanxiu_qindiansijin_card["xx_qdsj_xingxing1_image"] = xx_qdsj_xingxing1_image

    local xx_qdsj_xingxing2_image = fc.FExtensionsImage:create()
    xx_qdsj_xingxing2_image:setImage("batch_ui/xingxing_xiao.png")
    xx_qdsj_xingxing2_image:setSize(cc.size(21,21))
    xx_qdsj_xingxing2_image:setAnchorPoint(cc.p(0.5,0.5))
    xuanxiu_qindiansijin_card:appendComponent(xx_qdsj_xingxing2_image)
    xx_qdsj_xingxing2_image:setPositionInContainer(cc.p(84.5,257.5))
    table_xuanxiu_qindiansijin_card["xx_qdsj_xingxing2_image"] = xx_qdsj_xingxing2_image

    local xx_qdsj_xingxing3_image = fc.FExtensionsImage:create()
    xx_qdsj_xingxing3_image:setImage("batch_ui/xingxing_xiao.png")
    xx_qdsj_xingxing3_image:setSize(cc.size(21,21))
    xx_qdsj_xingxing3_image:setAnchorPoint(cc.p(0.5,0.5))
    xuanxiu_qindiansijin_card:appendComponent(xx_qdsj_xingxing3_image)
    xx_qdsj_xingxing3_image:setPositionInContainer(cc.p(113.5,257.5))
    table_xuanxiu_qindiansijin_card["xx_qdsj_xingxing3_image"] = xx_qdsj_xingxing3_image

    local xx_qdsj_xingxing4_image = fc.FExtensionsImage:create()
    xx_qdsj_xingxing4_image:setImage("batch_ui/xingxing_xiao.png")
    xx_qdsj_xingxing4_image:setSize(cc.size(21,21))
    xx_qdsj_xingxing4_image:setAnchorPoint(cc.p(0.5,0.5))
    xuanxiu_qindiansijin_card:appendComponent(xx_qdsj_xingxing4_image)
    xx_qdsj_xingxing4_image:setPositionInContainer(cc.p(142.5,257.5))
    table_xuanxiu_qindiansijin_card["xx_qdsj_xingxing4_image"] = xx_qdsj_xingxing4_image

    local xx_qdsj_xingxing5_image = fc.FExtensionsImage:create()
    xx_qdsj_xingxing5_image:setImage("batch_ui/xingxing_xiao.png")
    xx_qdsj_xingxing5_image:setSize(cc.size(21,21))
    xx_qdsj_xingxing5_image:setAnchorPoint(cc.p(0.5,0.5))
    xuanxiu_qindiansijin_card:appendComponent(xx_qdsj_xingxing5_image)
    xx_qdsj_xingxing5_image:setPositionInContainer(cc.p(172.5,257.5))
    table_xuanxiu_qindiansijin_card["xx_qdsj_xingxing5_image"] = xx_qdsj_xingxing5_image

    local xx_qdsj_xiangqing_button = fc.FTextButton:create()
    xx_qdsj_xiangqing_button:setSize(cc.size(144,51))
    xx_qdsj_xiangqing_button:setAnchorPoint(cc.p(0.5,0.5))
    xx_qdsj_xiangqing_button:setTextButtonImage("batch_ui/gongjizhiduihuan_anniu.png","batch_ui/gongjizhiduihuan_anniu.png","batch_ui/gongjizhiduihuan_anniu.png")
    if LANGUAGE_TYPE == 3 then
	    xx_qdsj_xiangqing_button:setText("查看詳情",cc.c3b(189,74,22))    
    else
	    xx_qdsj_xiangqing_button:setText("查看详情",cc.c3b(189,74,22))
    end
    xx_qdsj_xiangqing_button:setSelectActionEnbaled(true)
    xuanxiu_qindiansijin_card:appendComponent(xx_qdsj_xiangqing_button)
    xx_qdsj_xiangqing_button:setPositionInContainer(cc.p(115,318.5))
    table_xuanxiu_qindiansijin_card["xx_qdsj_xiangqing_button"] = xx_qdsj_xiangqing_button

    local xx_qdsj_qingdian_button = fc.FTextButton:create()
    xx_qdsj_qingdian_button:setSize(cc.size(144,51))
    xx_qdsj_qingdian_button:setAnchorPoint(cc.p(0.5,0.5))
    xx_qdsj_qingdian_button:setTextButtonImage("batch_ui/gongjizhiduihuan_anniu.png","batch_ui/gongjizhiduihuan_anniu.png","batch_ui/gongjizhiduihuan_anniu.png")
    if LANGUAGE_TYPE == 3 then
	    xx_qdsj_qingdian_button:setText("欽點",cc.c3b(189,74,22))
    else
	    xx_qdsj_qingdian_button:setText("钦点",cc.c3b(189,74,22))
    end
    xx_qdsj_qingdian_button:setSelectActionEnbaled(true)
    xuanxiu_qindiansijin_card:appendComponent(xx_qdsj_qingdian_button)
    xx_qdsj_qingdian_button:setPositionInContainer(cc.p(115,379.5))
    table_xuanxiu_qindiansijin_card["xx_qdsj_qingdian_button"] = xx_qdsj_qingdian_button

    local frame = fc.FExtensionsImage:create()
    frame:setImage("batch_ui/baipinzhi_kuang.png")
    frame:setSize(cc.size(104,104))
    frame:setAnchorPoint(cc.p(0.5,0.5))
    xuanxiu_qindiansijin_card:appendComponent(frame)
    frame:setPositionInContainer(cc.p(115,160))
    table_xuanxiu_qindiansijin_card["frame"] = frame

    local xx_qdsj_renwu_image = fc.FExtensionsImage:create()
    xx_qdsj_renwu_image:setImage("nobatch/tupian.png")
    xx_qdsj_renwu_image:setSize(cc.size(93,93))
    xx_qdsj_renwu_image:setAnchorPoint(cc.p(0.5,0.5))
    xuanxiu_qindiansijin_card:appendComponent(xx_qdsj_renwu_image)
    xx_qdsj_renwu_image:setPositionInContainer(cc.p(114.5,160.5))
    table_xuanxiu_qindiansijin_card["xx_qdsj_renwu_image"] = xx_qdsj_renwu_image

    return table_xuanxiu_qindiansijin_card

end

