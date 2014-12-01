function createkeju_qingdian_card()

    local table_keju_qingdian_card = {}

    local keju_qingdian_card = fc.FContainerPanel:create()
    keju_qingdian_card:setSize(cc.size(423,260))
    table_keju_qingdian_card["keju_qingdian_card"] = keju_qingdian_card

    local keju_qingdian_bg = fc.FExtensionsImage:create()
    keju_qingdian_bg:setImage("nobatch/shijuan_qindian.png")
    keju_qingdian_bg:setSize(cc.size(423,260))
    keju_qingdian_bg:setAnchorPoint(cc.p(0.5,0.5))
    keju_qingdian_card:appendComponent(keju_qingdian_bg)
    keju_qingdian_bg:setPositionInContainer(cc.p(211.5,130))
    table_keju_qingdian_card["keju_qingdian_bg"] = keju_qingdian_bg

    local keju_card_xingxingditu3_image = fc.FExtensionsImage:create()
    keju_card_xingxingditu3_image:setImage("batch_ui/xingxing_dark.png")
    keju_card_xingxingditu3_image:setSize(cc.size(20,19))
    keju_card_xingxingditu3_image:setAnchorPoint(cc.p(0.5,0.5))
    keju_qingdian_card:appendComponent(keju_card_xingxingditu3_image)
    keju_card_xingxingditu3_image:setPositionInContainer(cc.p(334,163.5))
    table_keju_qingdian_card["keju_card_xingxingditu3_image"] = keju_card_xingxingditu3_image

    local keju_frame = fc.FExtensionsImage:create()
    keju_frame:setImage("batch_ui/baipinzhi_kuang.png")
    keju_frame:setSize(cc.size(104,104))
    keju_frame:setAnchorPoint(cc.p(0.5,0.5))
    keju_qingdian_card:appendComponent(keju_frame)
    keju_frame:setPositionInContainer(cc.p(334,79))
    table_keju_qingdian_card["keju_frame"] = keju_frame

    local keju_card_xingxingditu2_image = fc.FExtensionsImage:create()
    keju_card_xingxingditu2_image:setImage("batch_ui/xingxing_dark.png")
    keju_card_xingxingditu2_image:setSize(cc.size(20,19))
    keju_card_xingxingditu2_image:setAnchorPoint(cc.p(0.5,0.5))
    keju_qingdian_card:appendComponent(keju_card_xingxingditu2_image)
    keju_card_xingxingditu2_image:setPositionInContainer(cc.p(305,163.5))
    table_keju_qingdian_card["keju_card_xingxingditu2_image"] = keju_card_xingxingditu2_image

    local keju_card_xingxingditu1_image = fc.FExtensionsImage:create()
    keju_card_xingxingditu1_image:setImage("batch_ui/xingxing_dark.png")
    keju_card_xingxingditu1_image:setSize(cc.size(20,19))
    keju_card_xingxingditu1_image:setAnchorPoint(cc.p(0.5,0.5))
    keju_qingdian_card:appendComponent(keju_card_xingxingditu1_image)
    keju_card_xingxingditu1_image:setPositionInContainer(cc.p(275,163.5))
    table_keju_qingdian_card["keju_card_xingxingditu1_image"] = keju_card_xingxingditu1_image

    local keju_card_xingxingditu4_image = fc.FExtensionsImage:create()
    keju_card_xingxingditu4_image:setImage("batch_ui/xingxing_dark.png")
    keju_card_xingxingditu4_image:setSize(cc.size(20,19))
    keju_card_xingxingditu4_image:setAnchorPoint(cc.p(0.5,0.5))
    keju_qingdian_card:appendComponent(keju_card_xingxingditu4_image)
    keju_card_xingxingditu4_image:setPositionInContainer(cc.p(363,163.5))
    table_keju_qingdian_card["keju_card_xingxingditu4_image"] = keju_card_xingxingditu4_image

    local keju_card_xingxingditu5_image = fc.FExtensionsImage:create()
    keju_card_xingxingditu5_image:setImage("batch_ui/xingxing_dark.png")
    keju_card_xingxingditu5_image:setSize(cc.size(20,19))
    keju_card_xingxingditu5_image:setAnchorPoint(cc.p(0.5,0.5))
    keju_qingdian_card:appendComponent(keju_card_xingxingditu5_image)
    keju_card_xingxingditu5_image:setPositionInContainer(cc.p(393,163.5))
    table_keju_qingdian_card["keju_card_xingxingditu5_image"] = keju_card_xingxingditu5_image

    local keju_card_xingxing1_image = fc.FExtensionsImage:create()
    keju_card_xingxing1_image:setImage("batch_ui/xingxing.png")
    keju_card_xingxing1_image:setSize(cc.size(20,19))
    keju_card_xingxing1_image:setAnchorPoint(cc.p(0.5,0.5))
    keju_qingdian_card:appendComponent(keju_card_xingxing1_image)
    keju_card_xingxing1_image:setPositionInContainer(cc.p(275,163.5))
    table_keju_qingdian_card["keju_card_xingxing1_image"] = keju_card_xingxing1_image

    local keju_card_xingxing2_image = fc.FExtensionsImage:create()
    keju_card_xingxing2_image:setImage("batch_ui/xingxing.png")
    keju_card_xingxing2_image:setSize(cc.size(20,19))
    keju_card_xingxing2_image:setAnchorPoint(cc.p(0.5,0.5))
    keju_qingdian_card:appendComponent(keju_card_xingxing2_image)
    keju_card_xingxing2_image:setPositionInContainer(cc.p(305,163.5))
    table_keju_qingdian_card["keju_card_xingxing2_image"] = keju_card_xingxing2_image

    local keju_card_xingxing3_image = fc.FExtensionsImage:create()
    keju_card_xingxing3_image:setImage("batch_ui/xingxing.png")
    keju_card_xingxing3_image:setSize(cc.size(20,19))
    keju_card_xingxing3_image:setAnchorPoint(cc.p(0.5,0.5))
    keju_qingdian_card:appendComponent(keju_card_xingxing3_image)
    keju_card_xingxing3_image:setPositionInContainer(cc.p(334,163.5))
    table_keju_qingdian_card["keju_card_xingxing3_image"] = keju_card_xingxing3_image

    local keju_card_xingxing4_image = fc.FExtensionsImage:create()
    keju_card_xingxing4_image:setImage("batch_ui/xingxing.png")
    keju_card_xingxing4_image:setSize(cc.size(20,19))
    keju_card_xingxing4_image:setAnchorPoint(cc.p(0.5,0.5))
    keju_qingdian_card:appendComponent(keju_card_xingxing4_image)
    keju_card_xingxing4_image:setPositionInContainer(cc.p(363,163.5))
    table_keju_qingdian_card["keju_card_xingxing4_image"] = keju_card_xingxing4_image

    local keju_card_xingxing5_image = fc.FExtensionsImage:create()
    keju_card_xingxing5_image:setImage("batch_ui/xingxing.png")
    keju_card_xingxing5_image:setSize(cc.size(20,19))
    keju_card_xingxing5_image:setAnchorPoint(cc.p(0.5,0.5))
    keju_qingdian_card:appendComponent(keju_card_xingxing5_image)
    keju_card_xingxing5_image:setPositionInContainer(cc.p(393,163.5))
    table_keju_qingdian_card["keju_card_xingxing5_image"] = keju_card_xingxing5_image

    local keju_card_qindian_button = fc.FTextButton:create()
    keju_card_qindian_button:setSize(cc.size(144,51))
    keju_card_qindian_button:setAnchorPoint(cc.p(0.5,0.5))
    keju_card_qindian_button:setTextButtonImage("batch_ui/gongjizhiduihuan_anniu.png","batch_ui/gongjizhiduihuan_anniu.png","batch_ui/gongjizhiduihuan_anniu.png")
  	if LANGUAGE_TYPE == 3 then
  		 keju_card_qindian_button:setText("欽   點",cc.c3b(189,74,22))
  	else
  		 keju_card_qindian_button:setText("钦   点",cc.c3b(189,74,22))
  	end	
    keju_card_qindian_button:setSelectActionEnbaled(true)
    keju_qingdian_card:appendComponent(keju_card_qindian_button)
    keju_card_qindian_button:setPositionInContainer(cc.p(336,214.5))
    table_keju_qingdian_card["keju_card_qindian_button"] = keju_card_qindian_button

    local keju_card_chen_label = fc.FLabel:createBMFont()
    keju_card_chen_label:setSize(cc.size(30,30))
    keju_card_chen_label:setAnchorPoint(cc.p(0.5,0.5))
    keju_card_chen_label:setFontSize(20)
    keju_card_chen_label:setString("臣")
    keju_card_chen_label:setColor(cc.c3b(119,46,17))
    keju_qingdian_card:appendComponent(keju_card_chen_label)
    keju_card_chen_label:setPositionInContainer(cc.p(200,81))
    table_keju_qingdian_card["keju_card_chen_label"] = keju_card_chen_label

    local keju_card_name_label = fc.FLabel:createBMFont()
    keju_card_name_label:setSize(cc.size(30,140))
    keju_card_name_label:setWidth(25)
    keju_card_name_label:setAnchorPoint(cc.p(0.5,0.5))
    keju_card_name_label:setFontSize(20)
    keju_card_name_label:setString("臣臣臣臣臣")
    keju_card_name_label:setColor(cc.c3b(10,69,218))
    keju_qingdian_card:appendComponent(keju_card_name_label)
    keju_card_name_label:setPositionInContainer(cc.p(200,159))
    table_keju_qingdian_card["keju_card_name_label"] = keju_card_name_label

    local keju_card_other1_label = fc.FLabel:createBMFont()
    keju_card_other1_label:setSize(cc.size(30,200))
    keju_card_other1_label:setWidth(25)
    keju_card_other1_label:setAnchorPoint(cc.p(0.5,0.5))
    keju_card_other1_label:setFontSize(20)
    keju_card_other1_label:setString("臣臣臣臣臣臣臣臣")
    keju_card_other1_label:setColor(cc.c3b(119,46,17))
    keju_qingdian_card:appendComponent(keju_card_other1_label)
    keju_card_other1_label:setPositionInContainer(cc.p(155,130))
    table_keju_qingdian_card["keju_card_other1_label"] = keju_card_other1_label

    local keju_card_other2_label = fc.FLabel:createBMFont()
    keju_card_other2_label:setSize(cc.size(30,200))
    keju_card_other2_label:setWidth(25)
    keju_card_other2_label:setAnchorPoint(cc.p(0.5,0.5))
    keju_card_other2_label:setFontSize(20)
    keju_card_other2_label:setString("臣臣臣臣臣臣臣臣")
    keju_card_other2_label:setColor(cc.c3b(119,46,17))
    keju_qingdian_card:appendComponent(keju_card_other2_label)
    keju_card_other2_label:setPositionInContainer(cc.p(108,130))
    table_keju_qingdian_card["keju_card_other2_label"] = keju_card_other2_label

    local keju_card_other3_label = fc.FLabel:createBMFont()
    keju_card_other3_label:setSize(cc.size(30,120))
    keju_card_other3_label:setWidth(25)
    keju_card_other3_label:setAnchorPoint(cc.p(0.5,0.5))
    keju_card_other3_label:setFontSize(20)
    keju_card_other3_label:setString("臣臣臣臣臣")
    keju_card_other3_label:setColor(cc.c3b(119,46,17))
    keju_qingdian_card:appendComponent(keju_card_other3_label)
    keju_card_other3_label:setPositionInContainer(cc.p(61,110))
    table_keju_qingdian_card["keju_card_other3_label"] = keju_card_other3_label

    local image_btn = fc.FContainerPanel:create()
    image_btn:setSize(cc.size(93,93))
    image_btn:setAnchorPoint(cc.p(0.5,0.5))
    keju_qingdian_card:appendComponent(image_btn)
    image_btn:setPositionInContainer(cc.p(334.5,78.5))
    table_keju_qingdian_card["image_btn"] = image_btn

    local keju_touxiang = fc.FExtensionsImage:create()
    keju_touxiang:setImage("nobatch/tupian.png")
    keju_touxiang:setSize(cc.size(93,93))
    keju_touxiang:setAnchorPoint(cc.p(0.5,0.5))
    keju_qingdian_card:appendComponent(keju_touxiang)
    keju_touxiang:setPositionInContainer(cc.p(334.5,78.5))
    table_keju_qingdian_card["keju_touxiang"] = keju_touxiang

    local keju_type = fc.FExtensionsImage:create()
    keju_type:setImage("batch_ui/bu_bingzhong_anniu.png")
    keju_type:setSize(cc.size(49,49))
    keju_type:setAnchorPoint(cc.p(0.5,0.5))
    keju_qingdian_card:appendComponent(keju_type)
    keju_type:setPositionInContainer(cc.p(379.5,33.5))
    table_keju_qingdian_card["keju_type"] = keju_type

    return table_keju_qingdian_card

end

