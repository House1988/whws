function createhuangzidujun_zongjiacheng()

    local table_huangzidujun_zongjiacheng = {}

    local huangzidujun_zongjiacheng = fc.FContainerPanel:create()
    huangzidujun_zongjiacheng:setSize(cc.size(960,640))
    table_huangzidujun_zongjiacheng["huangzidujun_zongjiacheng"] = huangzidujun_zongjiacheng

    local huangzidujun_zongjiacheng_bottom = fc.FContainerPanel:create()
    huangzidujun_zongjiacheng_bottom:setSize(cc.size(600,504))
    huangzidujun_zongjiacheng_bottom:setAnchorPoint(cc.p(0.5,0.5))
    huangzidujun_zongjiacheng:appendComponent(huangzidujun_zongjiacheng_bottom)
    huangzidujun_zongjiacheng_bottom:setPositionInContainer(cc.p(513,324.5))
    table_huangzidujun_zongjiacheng["huangzidujun_zongjiacheng_bottom"] = huangzidujun_zongjiacheng_bottom

    local sj_la = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shengzhi_ditu.png",cc.rect(40,63,4,4))
    sj_la:setSize(cc.size(480,460))
    sj_la:setAnchorPoint(cc.p(0.5,0.5))
    huangzidujun_zongjiacheng_bottom:appendComponent(sj_la)
    sj_la:setPositionInContainer(cc.p(300,254))
    table_huangzidujun_zongjiacheng["sj_la"] = sj_la

    local zhou_up = fc.FExtensionsImage:create()
    zhou_up:setImage("nobatch/shengzhi_zhou.png")
    zhou_up:setSize(cc.size(52,600))
    zhou_up:setRotation(90)
    zhou_up:setAnchorPoint(cc.p(0.5,0.5))
    huangzidujun_zongjiacheng_bottom:appendComponent(zhou_up)
    zhou_up:setPositionInContainer(cc.p(300,26))
    table_huangzidujun_zongjiacheng["zhou_up"] = zhou_up

    local hzdj_zjc_close_button = fc.FScaleButton:create()
    hzdj_zjc_close_button:setSize(cc.size(34,33))
    hzdj_zjc_close_button:setAnchorPoint(cc.p(0.5,0.5))
    hzdj_zjc_close_button:setButtonImage("batch_ui/guanbi_anniu2.png")
    huangzidujun_zongjiacheng_bottom:appendComponent(hzdj_zjc_close_button)
    hzdj_zjc_close_button:setPositionInContainer(cc.p(537,28.5))
    table_huangzidujun_zongjiacheng["hzdj_zjc_close_button"] = hzdj_zjc_close_button

    local hzdjzjc_title_bg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/xingjikuang_tangquanxinggong.png",cc.rect(72,17,2,2))
    hzdjzjc_title_bg:setSize(cc.size(260,50))
    hzdjzjc_title_bg:setAnchorPoint(cc.p(0.5,0.5))
    hzdjzjc_title_bg:setScaleY(-1)
    huangzidujun_zongjiacheng_bottom:appendComponent(hzdjzjc_title_bg)
    hzdjzjc_title_bg:setPositionInContainer(cc.p(300,25))
    table_huangzidujun_zongjiacheng["hzdjzjc_title_bg"] = hzdjzjc_title_bg

    local hzdjzjc_zong = fc.FExtensionsImage:create()
    hzdjzjc_zong:setImage("batch_ui/zong.png")
    hzdjzjc_zong:setSize(cc.size(59,59))
    hzdjzjc_zong:setAnchorPoint(cc.p(0.5,0.5))
    huangzidujun_zongjiacheng_bottom:appendComponent(hzdjzjc_zong)
    hzdjzjc_zong:setPositionInContainer(cc.p(250.5,20.5))
    table_huangzidujun_zongjiacheng["hzdjzjc_zong"] = hzdjzjc_zong

    local hzdjzjc_jia = fc.FExtensionsImage:create()
    hzdjzjc_jia:setImage("batch_ui/jia.png")
    hzdjzjc_jia:setSize(cc.size(59,59))
    hzdjzjc_jia:setAnchorPoint(cc.p(0.5,0.5))
    huangzidujun_zongjiacheng_bottom:appendComponent(hzdjzjc_jia)
    hzdjzjc_jia:setPositionInContainer(cc.p(302.5,20.5))
    table_huangzidujun_zongjiacheng["hzdjzjc_jia"] = hzdjzjc_jia

    local hzdjzjc_cheng = fc.FExtensionsImage:create()
    hzdjzjc_cheng:setImage("batch_ui/cheng1.png")
    hzdjzjc_cheng:setSize(cc.size(59,59))
    hzdjzjc_cheng:setAnchorPoint(cc.p(0.5,0.5))
    huangzidujun_zongjiacheng_bottom:appendComponent(hzdjzjc_cheng)
    hzdjzjc_cheng:setPositionInContainer(cc.p(357.5,20.5))
    table_huangzidujun_zongjiacheng["hzdjzjc_cheng"] = hzdjzjc_cheng

    local hzdjzjc_rect2 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongditu2_huodong.png",cc.rect(1,1,1,1))
    hzdjzjc_rect2:setSize(cc.size(450,410))
    hzdjzjc_rect2:setAnchorPoint(cc.p(0.5,0.5))
    huangzidujun_zongjiacheng_bottom:appendComponent(hzdjzjc_rect2)
    hzdjzjc_rect2:setPositionInContainer(cc.p(300,254))
    table_huangzidujun_zongjiacheng["hzdjzjc_rect2"] = hzdjzjc_rect2

    local hzdjzjc_rect1 = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongbiankuang2_ciguan.png",cc.rect(44,15,1,1))
    hzdjzjc_rect1:setSize(cc.size(450,410))
    hzdjzjc_rect1:setAnchorPoint(cc.p(0.5,0.5))
    huangzidujun_zongjiacheng_bottom:appendComponent(hzdjzjc_rect1)
    hzdjzjc_rect1:setPositionInContainer(cc.p(300,253))
    table_huangzidujun_zongjiacheng["hzdjzjc_rect1"] = hzdjzjc_rect1

    local zhou_down = fc.FExtensionsImage:create()
    zhou_down:setImage("nobatch/shengzhi_zhou.png")
    zhou_down:setSize(cc.size(52,600))
    zhou_down:setRotation(90)
    zhou_down:setAnchorPoint(cc.p(0.5,0.5))
    huangzidujun_zongjiacheng_bottom:appendComponent(zhou_down)
    zhou_down:setPositionInContainer(cc.p(300,478))
    table_huangzidujun_zongjiacheng["zhou_down"] = zhou_down

    local hzdj_zjc_queding_button = fc.FScaleButton:create()
    hzdj_zjc_queding_button:setSize(cc.size(144,53))
    hzdj_zjc_queding_button:setAnchorPoint(cc.p(0.5,0.5))
    hzdj_zjc_queding_button:setButtonImage("batch_ui/putonganniu1_up.png")
    huangzidujun_zongjiacheng_bottom:appendComponent(hzdj_zjc_queding_button)
    hzdj_zjc_queding_button:setPositionInContainer(cc.p(300,422.5))
    table_huangzidujun_zongjiacheng["hzdj_zjc_queding_button"] = hzdj_zjc_queding_button

    local hzdjzjc_que_ui = fc.FExtensionsImage:create()
    hzdjzjc_que_ui:setImage("batch_ui/que_uizi.png")
    hzdjzjc_que_ui:setSize(cc.size(32,32))
    hzdjzjc_que_ui:setAnchorPoint(cc.p(0.5,0.5))
    hzdj_zjc_queding_button:appendComponent(hzdjzjc_que_ui)
    hzdjzjc_que_ui:setPositionInContainer(cc.p(45,26))
    table_huangzidujun_zongjiacheng["hzdjzjc_que_ui"] = hzdjzjc_que_ui

    local hzdjzjc_ding_ui = fc.FExtensionsImage:create()
    hzdjzjc_ding_ui:setImage("batch_ui/ding_uizi.png")
    hzdjzjc_ding_ui:setSize(cc.size(32,32))
    hzdjzjc_ding_ui:setAnchorPoint(cc.p(0.5,0.5))
    hzdj_zjc_queding_button:appendComponent(hzdjzjc_ding_ui)
    hzdjzjc_ding_ui:setPositionInContainer(cc.p(98,26))
    table_huangzidujun_zongjiacheng["hzdjzjc_ding_ui"] = hzdjzjc_ding_ui

    local hzdj_zjc_container_list = fc.FContainerList:create(1)
    hzdj_zjc_container_list:setSize(cc.size(430,300))
    hzdj_zjc_container_list:setAnchorPoint(cc.p(0.5,0.5))
    huangzidujun_zongjiacheng_bottom:appendComponent(hzdj_zjc_container_list)
    hzdj_zjc_container_list:setPositionInContainer(cc.p(299,212))
    table_huangzidujun_zongjiacheng["hzdj_zjc_container_list"] = hzdj_zjc_container_list

    local downLabel = fc.FLabel:createBMFont()
    downLabel:setSize(cc.size(367,20))
    downLabel:setAnchorPoint(cc.p(0.5,0.5))
    downLabel:setFontSize(21)
    downLabel:setString("同类效果只取最大值哦！")
    downLabel:setColor(cc.c3b(255,0,0))
    huangzidujun_zongjiacheng_bottom:appendComponent(downLabel)
    downLabel:setPositionInContainer(cc.p(299.5,376))
    table_huangzidujun_zongjiacheng["downLabel"] = downLabel

    return table_huangzidujun_zongjiacheng

end

