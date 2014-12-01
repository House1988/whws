function createhougong_tangquangong_bg()

    local table_hougong_tangquangong_bg = {}

    local hougong_tangquangong_bg = fc.FContainerPanel:create()
    hougong_tangquangong_bg:setSize(cc.size(960,640))
    table_hougong_tangquangong_bg["hougong_tangquangong_bg"] = hougong_tangquangong_bg

    local hg_tqg_bg_scale9 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/banzidikuangmeinv2_tongyong.png",cc.rect(2,2,1,1))
    hg_tqg_bg_scale9:setSize(cc.size(960,640))
    hg_tqg_bg_scale9:setAnchorPoint(cc.p(0.5,0.5))
    hougong_tangquangong_bg:appendComponent(hg_tqg_bg_scale9)
    hg_tqg_bg_scale9:setPositionInContainer(cc.p(480,320))
    table_hougong_tangquangong_bg["hg_tqg_bg_scale9"] = hg_tqg_bg_scale9

    local tiao_left = fc.FExtensionsImage:create()
    tiao_left:setImage("nobatch/title_hougong.png")
    tiao_left:setSize(cc.size(480,67))
    tiao_left:setAnchorPoint(cc.p(0.5,0.5))
    hougong_tangquangong_bg:appendComponent(tiao_left)
    tiao_left:setPositionInContainer(cc.p(240,33.5))
    table_hougong_tangquangong_bg["tiao_left"] = tiao_left

    local tiao_right = fc.FExtensionsImage:create()
    tiao_right:setImage("nobatch/title_hougong.png")
    tiao_right:setSize(cc.size(480,67))
    tiao_right:setFlipType(2)
    tiao_right:setAnchorPoint(cc.p(0.5,0.5))
    hougong_tangquangong_bg:appendComponent(tiao_right)
    tiao_right:setPositionInContainer(cc.p(720,33.5))
    table_hougong_tangquangong_bg["tiao_right"] = tiao_right

    local hg_tqg_xinggong_button = fc.FRadioButton:create()
    hg_tqg_xinggong_button:setRadioButtonImage("batch_ui/qieyeanniu_down1.png","batch_ui/qieyeanniu_up1.png")
    hg_tqg_xinggong_button:setSize(cc.size(159,45))
    hg_tqg_xinggong_button:setAnchorPoint(cc.p(0.5,0.5))
    hougong_tangquangong_bg:appendComponent(hg_tqg_xinggong_button)
    hg_tqg_xinggong_button:setPositionInContainer(cc.p(238.5,40.5))
    table_hougong_tangquangong_bg["hg_tqg_xinggong_button"] = hg_tqg_xinggong_button

    local hg_tqg_chuxiu_button = fc.FRadioButton:create()
    hg_tqg_chuxiu_button:setRadioButtonImage("batch_ui/qieyeanniu_down1.png","batch_ui/qieyeanniu_up1.png")
    hg_tqg_chuxiu_button:setSize(cc.size(159,45))
    hg_tqg_chuxiu_button:setAnchorPoint(cc.p(0.5,0.5))
    hougong_tangquangong_bg:appendComponent(hg_tqg_chuxiu_button)
    hg_tqg_chuxiu_button:setPositionInContainer(cc.p(415.5,40.5))
    table_hougong_tangquangong_bg["hg_tqg_chuxiu_button"] = hg_tqg_chuxiu_button

    local hg_tqg_kunning_button = fc.FRadioButton:create()
    hg_tqg_kunning_button:setRadioButtonImage("batch_ui/qieyeanniu_down1.png","batch_ui/qieyeanniu_up1.png")
    hg_tqg_kunning_button:setSize(cc.size(159,45))
    hg_tqg_kunning_button:setAnchorPoint(cc.p(0.5,0.5))
    hougong_tangquangong_bg:appendComponent(hg_tqg_kunning_button)
    hg_tqg_kunning_button:setPositionInContainer(cc.p(593.5,40.5))
    table_hougong_tangquangong_bg["hg_tqg_kunning_button"] = hg_tqg_kunning_button

    local wen_left = fc.FExtensionsImage:create()
    wen_left:setImage("nobatch/banzidikuangmeinv_tongyong.png")
    wen_left:setSize(cc.size(220,163))
    wen_left:setAnchorPoint(cc.p(0.5,0.5))
    hougong_tangquangong_bg:appendComponent(wen_left)
    wen_left:setPositionInContainer(cc.p(110,147.5))
    table_hougong_tangquangong_bg["wen_left"] = wen_left

    local wen_r = fc.FExtensionsImage:create()
    wen_r:setImage("nobatch/banzidikuangmeinv_tongyong.png")
    wen_r:setSize(cc.size(220,163))
    wen_r:setFlipType(2)
    wen_r:setAnchorPoint(cc.p(0.5,0.5))
    hougong_tangquangong_bg:appendComponent(wen_r)
    wen_r:setPositionInContainer(cc.p(850,147.5))
    table_hougong_tangquangong_bg["wen_r"] = wen_r

    local wen_lb = fc.FExtensionsImage:create()
    wen_lb:setImage("nobatch/banzidikuangmeinv_tongyong.png")
    wen_lb:setSize(cc.size(220,163))
    wen_lb:setFlipType(4)
    wen_lb:setAnchorPoint(cc.p(0.5,0.5))
    hougong_tangquangong_bg:appendComponent(wen_lb)
    wen_lb:setPositionInContainer(cc.p(110,558.5))
    table_hougong_tangquangong_bg["wen_lb"] = wen_lb

    local wen_rb = fc.FExtensionsImage:create()
    wen_rb:setImage("nobatch/banzidikuangmeinv_tongyong.png")
    wen_rb:setSize(cc.size(220,163))
    wen_rb:setFlipType(8)
    wen_rb:setAnchorPoint(cc.p(0.5,0.5))
    hougong_tangquangong_bg:appendComponent(wen_rb)
    wen_rb:setPositionInContainer(cc.p(850,558.5))
    table_hougong_tangquangong_bg["wen_rb"] = wen_rb

    local lian_left = fc.FExtensionsImage:create()
    lian_left:setImage("batch_ui/title_mingchen_2.png")
    lian_left:setSize(cc.size(62,121))
    lian_left:setAnchorPoint(cc.p(0.5,0.5))
    hougong_tangquangong_bg:appendComponent(lian_left)
    lian_left:setPositionInContainer(cc.p(31,68.5))
    table_hougong_tangquangong_bg["lian_left"] = lian_left

    local lian_right = fc.FExtensionsImage:create()
    lian_right:setImage("batch_ui/title_mingchen_2.png")
    lian_right:setSize(cc.size(62,121))
    lian_right:setFlipType(2)
    lian_right:setAnchorPoint(cc.p(0.5,0.5))
    hougong_tangquangong_bg:appendComponent(lian_right)
    lian_right:setPositionInContainer(cc.p(929,68.5))
    table_hougong_tangquangong_bg["lian_right"] = lian_right

    local hg_tqg_close_button = fc.FScaleButton:create()
    hg_tqg_close_button:setSize(cc.size(52,52))
    hg_tqg_close_button:setAnchorPoint(cc.p(0.5,0.5))
    hg_tqg_close_button:setButtonImage("batch_ui/guanbi_up.png")
    hougong_tangquangong_bg:appendComponent(hg_tqg_close_button)
    hg_tqg_close_button:setPositionInContainer(cc.p(930,36))
    table_hougong_tangquangong_bg["hg_tqg_close_button"] = hg_tqg_close_button

    local btn_piece = fc.FRadioButton:create()
    btn_piece:setRadioButtonImage("batch_ui/qieyeanniu_down1.png","batch_ui/qieyeanniu_up1.png")
    btn_piece:setSize(cc.size(159,45))
    btn_piece:setAnchorPoint(cc.p(0.5,0.5))
    hougong_tangquangong_bg:appendComponent(btn_piece)
    btn_piece:setPositionInContainer(cc.p(770.5,40.5))
    table_hougong_tangquangong_bg["btn_piece"] = btn_piece

    local tangquan_label = fc.FContainerPanel:create()
    tangquan_label:setSize(cc.size(120,30))
    tangquan_label:setAnchorPoint(cc.p(0.5,0.5))
    hougong_tangquangong_bg:appendComponent(tangquan_label)
    tangquan_label:setPositionInContainer(cc.p(240,40))
    table_hougong_tangquangong_bg["tangquan_label"] = tangquan_label

    local tang = fc.FExtensionsImage:create()
    tang:setImage("batch_ui/tang_uizi.png")
    tang:setSize(cc.size(32,32))
    tang:setAnchorPoint(cc.p(0.5,0.5))
    tangquan_label:appendComponent(tang)
    tang:setPositionInContainer(cc.p(16,16))
    table_hougong_tangquangong_bg["tang"] = tang

    local quan = fc.FExtensionsImage:create()
    quan:setImage("batch_ui/quan3_uizi.png")
    quan:setSize(cc.size(32,32))
    quan:setAnchorPoint(cc.p(0.5,0.5))
    tangquan_label:appendComponent(quan)
    quan:setPositionInContainer(cc.p(45,16))
    table_hougong_tangquangong_bg["quan"] = quan

    local xing = fc.FExtensionsImage:create()
    xing:setImage("batch_ui/xing_uizi.png")
    xing:setSize(cc.size(32,32))
    xing:setAnchorPoint(cc.p(0.5,0.5))
    tangquan_label:appendComponent(xing)
    xing:setPositionInContainer(cc.p(75,16))
    table_hougong_tangquangong_bg["xing"] = xing

    local gong = fc.FExtensionsImage:create()
    gong:setImage("batch_ui/gong_uizi.png")
    gong:setSize(cc.size(32,32))
    gong:setAnchorPoint(cc.p(0.5,0.5))
    tangquan_label:appendComponent(gong)
    gong:setPositionInContainer(cc.p(104,16))
    table_hougong_tangquangong_bg["gong"] = gong

    local kunning_label = fc.FContainerPanel:create()
    kunning_label:setSize(cc.size(100,30))
    kunning_label:setAnchorPoint(cc.p(0.5,0.5))
    hougong_tangquangong_bg:appendComponent(kunning_label)
    kunning_label:setPositionInContainer(cc.p(594,40))
    table_hougong_tangquangong_bg["kunning_label"] = kunning_label

    local gong = fc.FExtensionsImage:create()
    gong:setImage("batch_ui/gong_uizi.png")
    gong:setSize(cc.size(32,32))
    gong:setAnchorPoint(cc.p(0.5,0.5))
    kunning_label:appendComponent(gong)
    gong:setPositionInContainer(cc.p(84,16))
    table_hougong_tangquangong_bg["gong"] = gong

    local kun = fc.FExtensionsImage:create()
    kun:setImage("batch_ui/kun_uizi.png")
    kun:setSize(cc.size(32,32))
    kun:setAnchorPoint(cc.p(0.5,0.5))
    kunning_label:appendComponent(kun)
    kun:setPositionInContainer(cc.p(16,16))
    table_hougong_tangquangong_bg["kun"] = kun

    local ning = fc.FExtensionsImage:create()
    ning:setImage("batch_ui/ning_uizi.png")
    ning:setSize(cc.size(32,32))
    ning:setAnchorPoint(cc.p(0.5,0.5))
    kunning_label:appendComponent(ning)
    ning:setPositionInContainer(cc.p(50,16))
    table_hougong_tangquangong_bg["ning"] = ning

    local chuxiu_label = fc.FContainerPanel:create()
    chuxiu_label:setSize(cc.size(100,30))
    chuxiu_label:setAnchorPoint(cc.p(0.5,0.5))
    hougong_tangquangong_bg:appendComponent(chuxiu_label)
    chuxiu_label:setPositionInContainer(cc.p(416,40))
    table_hougong_tangquangong_bg["chuxiu_label"] = chuxiu_label

    local gong = fc.FExtensionsImage:create()
    gong:setImage("batch_ui/gong_uizi.png")
    gong:setSize(cc.size(32,32))
    gong:setAnchorPoint(cc.p(0.5,0.5))
    chuxiu_label:appendComponent(gong)
    gong:setPositionInContainer(cc.p(84,16))
    table_hougong_tangquangong_bg["gong"] = gong

    local chu = fc.FExtensionsImage:create()
    chu:setImage("batch_ui/chu3_uizi.png")
    chu:setSize(cc.size(32,32))
    chu:setAnchorPoint(cc.p(0.5,0.5))
    chuxiu_label:appendComponent(chu)
    chu:setPositionInContainer(cc.p(16,16))
    table_hougong_tangquangong_bg["chu"] = chu

    local xiu = fc.FExtensionsImage:create()
    xiu:setImage("batch_ui/xiu_uizi.png")
    xiu:setSize(cc.size(32,32))
    xiu:setAnchorPoint(cc.p(0.5,0.5))
    chuxiu_label:appendComponent(xiu)
    xiu:setPositionInContainer(cc.p(50,16))
    table_hougong_tangquangong_bg["xiu"] = xiu

    local yinfeng_label = fc.FContainerPanel:create()
    yinfeng_label:setSize(cc.size(100,30))
    yinfeng_label:setAnchorPoint(cc.p(0.5,0.5))
    hougong_tangquangong_bg:appendComponent(yinfeng_label)
    yinfeng_label:setPositionInContainer(cc.p(770,40))
    table_hougong_tangquangong_bg["yinfeng_label"] = yinfeng_label

    local yin = fc.FExtensionsImage:create()
    yin:setImage("batch_ui/yin_uizi.png")
    yin:setSize(cc.size(32,32))
    yin:setAnchorPoint(cc.p(0.5,0.5))
    yinfeng_label:appendComponent(yin)
    yin:setPositionInContainer(cc.p(16,16))
    table_hougong_tangquangong_bg["yin"] = yin

    local feng = fc.FExtensionsImage:create()
    feng:setImage("batch_ui/feng2_uizi.png")
    feng:setSize(cc.size(32,32))
    feng:setAnchorPoint(cc.p(0.5,0.5))
    yinfeng_label:appendComponent(feng)
    feng:setPositionInContainer(cc.p(50,16))
    table_hougong_tangquangong_bg["feng"] = feng

    local ge = fc.FExtensionsImage:create()
    ge:setImage("batch_ui/ge1_uizi.png")
    ge:setSize(cc.size(32,32))
    ge:setAnchorPoint(cc.p(0.5,0.5))
    yinfeng_label:appendComponent(ge)
    ge:setPositionInContainer(cc.p(84,16))
    table_hougong_tangquangong_bg["ge"] = ge

    return table_hougong_tangquangong_bg

end

