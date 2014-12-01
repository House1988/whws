function createqiandaoPanel()

    local table_qiandaoPanel = {}

    local qiandaoPanel = fc.FContainerPanel:create()
    qiandaoPanel:setSize(cc.size(960,640))
    table_qiandaoPanel["qiandaoPanel"] = qiandaoPanel

    local bg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/banzidikuangmeinv2_tongyong.png",cc.rect(2,2,1,1))
    bg:setSize(cc.size(740,465))
    bg:setAnchorPoint(cc.p(0.5,0.5))
    qiandaoPanel:appendComponent(bg)
    bg:setPositionInContainer(cc.p(481,382.5))
    table_qiandaoPanel["bg"] = bg

    local bottombar = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongbiankuang3_ciguan.png",cc.rect(40,0,2,13))
    bottombar:setSize(cc.size(730,13))
    bottombar:setAnchorPoint(cc.p(0.5,0.5))
    bottombar:setScaleY(-1)
    qiandaoPanel:appendComponent(bottombar)
    bottombar:setPositionInContainer(cc.p(477,618.5))
    table_qiandaoPanel["bottombar"] = bottombar

    local sidebar = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tangquanxinggongbar_tangquanxinggong.png",cc.rect(0,56,25,2))
    sidebar:setSize(cc.size(25,365))
    sidebar:setAnchorPoint(cc.p(0.5,0.5))
    qiandaoPanel:appendComponent(sidebar)
    sidebar:setPositionInContainer(cc.p(848.5,442.5))
    table_qiandaoPanel["sidebar"] = sidebar

    local sidebar = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tangquanxinggongbar_tangquanxinggong.png",cc.rect(0,56,25,2))
    sidebar:setSize(cc.size(25,365))
    sidebar:setAnchorPoint(cc.p(0.5,0.5))
    qiandaoPanel:appendComponent(sidebar)
    sidebar:setPositionInContainer(cc.p(113.5,442.5))
    table_qiandaoPanel["sidebar"] = sidebar

    local timebg = fc.FExtensionsImage:create()
    timebg:setImage("nobatch/rilibiao.png")
    timebg:setSize(cc.size(334,434))
    timebg:setAnchorPoint(cc.p(0.5,0.5))
    qiandaoPanel:appendComponent(timebg)
    timebg:setPositionInContainer(cc.p(297,379))
    table_qiandaoPanel["timebg"] = timebg

    local framel = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongbiankuang2_ciguan.png",cc.rect(43,15,2,2))
    framel:setSize(cc.size(334,434))
    framel:setAnchorPoint(cc.p(0.5,0.5))
    qiandaoPanel:appendComponent(framel)
    framel:setPositionInContainer(cc.p(297,379))
    table_qiandaoPanel["framel"] = framel

    local framer = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongbiankuang2_ciguan.png",cc.rect(43,15,2,2))
    framer:setSize(cc.size(350,434))
    framer:setAnchorPoint(cc.p(0.5,0.5))
    qiandaoPanel:appendComponent(framer)
    framer:setPositionInContainer(cc.p(649,379))
    table_qiandaoPanel["framer"] = framer

    local bgFrame = fc.FScale9Image:createWithBatchUIFrame("nobatch/biankuang3_chongzhiyouli.png",cc.rect(100,113,4,4))
    bgFrame:setSize(cc.size(800,332))
    bgFrame:setAnchorPoint(cc.p(0.5,0.5))
    qiandaoPanel:appendComponent(bgFrame)
    bgFrame:setPositionInContainer(cc.p(480,224))
    table_qiandaoPanel["bgFrame"] = bgFrame

    local title1 = fc.FLabel:createSystemFont()
    title1:setSize(cc.size(200,30))
    title1:setAnchorPoint(cc.p(0.5,0.5))
    title1:setFontSize(25)
    title1:setString("今日再充值")
    title1:setColor(cc.c3b(254,255, 232))
    qiandaoPanel:appendComponent(title1)
    title1:setPositionInContainer(cc.p(388,125))
    table_qiandaoPanel["title1"] = title1

    local title2 = fc.FLabel:createSystemFont()
    title2:setSize(cc.size(100,30))
    title2:setAnchorPoint(cc.p(0.5,0.5))
    title2:setFontSize(25)
    title2:setString("今日再充值")
    title2:setColor(cc.c3b(0,255, 0))
    qiandaoPanel:appendComponent(title2)
    title2:setPositionInContainer(cc.p(480,125))
    table_qiandaoPanel["title2"] = title2

    local title3 = fc.FLabel:createSystemFont()
    title3:setSize(cc.size(200,30))
    title3:setAnchorPoint(cc.p(0.5,0.5))
    title3:setFontSize(25)
    if LANGUAGE_TYPE == 3 then
	    title3:setString("即可獲贈下方獎勵")
    else
	    title3:setString("即可获赠下方奖励")
    end
    title3:setColor(cc.c3b(254,255, 232))
    qiandaoPanel:appendComponent(title3)
    title3:setPositionInContainer(cc.p(608,125))
    table_qiandaoPanel["title3"] = title3

    local waipian_left_image = fc.FExtensionsImage:create()
    waipian_left_image:setImage("nobatch/title_3.png")
    waipian_left_image:setSize(cc.size(880,89))
    waipian_left_image:setAnchorPoint(cc.p(0.5,0.5))
    qiandaoPanel:appendComponent(waipian_left_image)
    waipian_left_image:setPositionInContainer(cc.p(480,60.5))
    table_qiandaoPanel["waipian_left_image"] = waipian_left_image

    local qian1 = fc.FExtensionsImage:create()
    qian1:setImage("batch_ui/qian(1).png")
    qian1:setSize(cc.size(59,59))
    qian1:setAnchorPoint(cc.p(0.5,0.5))
    qiandaoPanel:appendComponent(qian1)
    qian1:setPositionInContainer(cc.p(506.5,60.5))
    table_qiandaoPanel["qian1"] = qian1

    local dao1 = fc.FExtensionsImage:create()
    dao1:setImage("batch_ui/dao.png")
    dao1:setSize(cc.size(59,59))
    dao1:setAnchorPoint(cc.p(0.5,0.5))
    qiandaoPanel:appendComponent(dao1)
    dao1:setPositionInContainer(cc.p(565.5,60.5))
    table_qiandaoPanel["dao1"] = dao1

    local hao1 = fc.FExtensionsImage:create()
    hao1:setImage("batch_ui/hao (2).png")
    hao1:setSize(cc.size(59,59))
    hao1:setAnchorPoint(cc.p(0.5,0.5))
    qiandaoPanel:appendComponent(hao1)
    hao1:setPositionInContainer(cc.p(388.5,60.5))
    table_qiandaoPanel["hao1"] = hao1

    local li1 = fc.FExtensionsImage:create()
    li1:setImage("batch_ui/hua.png")
    li1:setSize(cc.size(59,59))
    li1:setAnchorPoint(cc.p(0.5,0.5))
    qiandaoPanel:appendComponent(li1)
    li1:setPositionInContainer(cc.p(447.5,60.5))
    table_qiandaoPanel["li1"] = li1

    local titleBg = fc.FExtensionsImage:create()
    titleBg:setImage("batch_ui/xiaobiaotikuang.png")
    titleBg:setSize(cc.size(245,65))
    titleBg:setAnchorPoint(cc.p(0.5,0.5))
    qiandaoPanel:appendComponent(titleBg)
    titleBg:setPositionInContainer(cc.p(240.5,170.5))
    table_qiandaoPanel["titleBg"] = titleBg

    local qian = fc.FExtensionsImage:create()
    qian:setImage("batch_ui/qian_uizi (2).png")
    qian:setSize(cc.size(32,32))
    qian:setAnchorPoint(cc.p(0.5,0.5))
    qiandaoPanel:appendComponent(qian)
    qian:setPositionInContainer(cc.p(218,176))
    table_qiandaoPanel["qian"] = qian

    local dao = fc.FExtensionsImage:create()
    dao:setImage("batch_ui/dao2_uizi.png")
    dao:setSize(cc.size(32,32))
    dao:setAnchorPoint(cc.p(0.5,0.5))
    qiandaoPanel:appendComponent(dao)
    dao:setPositionInContainer(cc.p(250,176))
    table_qiandaoPanel["dao"] = dao

    local hao = fc.FExtensionsImage:create()
    hao:setImage("batch_ui/hao_uizi.png")
    hao:setSize(cc.size(32,32))
    hao:setAnchorPoint(cc.p(0.5,0.5))
    qiandaoPanel:appendComponent(hao)
    hao:setPositionInContainer(cc.p(282,176))
    table_qiandaoPanel["hao"] = hao

    local li = fc.FExtensionsImage:create()
    li:setImage("batch_ui/li1_uizi.png")
    li:setSize(cc.size(32,32))
    li:setAnchorPoint(cc.p(0.5,0.5))
    qiandaoPanel:appendComponent(li)
    li:setPositionInContainer(cc.p(314,176))
    table_qiandaoPanel["li"] = li

    local xiangqing_close_button = fc.FScaleButton:create()
    xiangqing_close_button:setSize(cc.size(52,52))
    xiangqing_close_button:setAnchorPoint(cc.p(0.5,0.5))
    xiangqing_close_button:setButtonImage("batch_ui/guanbi_up.png")
    qiandaoPanel:appendComponent(xiangqing_close_button)
    xiangqing_close_button:setPositionInContainer(cc.p(836,72))
    table_qiandaoPanel["xiangqing_close_button"] = xiangqing_close_button

    return table_qiandaoPanel

end

