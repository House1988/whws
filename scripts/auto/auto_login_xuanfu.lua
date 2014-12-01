function createlogin_xuanfu()

    local table_login_xuanfu = {}

    local login_xuanfu = fc.FContainerPanel:create()
    login_xuanfu:setSize(cc.size(378,276))
    table_login_xuanfu["login_xuanfu"] = login_xuanfu

    local login_xf_kuang1_bg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/xuanzefuwuqi_dikuang1_denglu.png",cc.rect(28,30,5,5))
    login_xf_kuang1_bg:setSize(cc.size(378,94))
    login_xf_kuang1_bg:setAnchorPoint(cc.p(0.5,0.5))
    login_xuanfu:appendComponent(login_xf_kuang1_bg)
    login_xf_kuang1_bg:setPositionInContainer(cc.p(189,47))
    table_login_xuanfu["login_xf_kuang1_bg"] = login_xf_kuang1_bg

    local login_xf_close_button = fc.FScaleButton:create()
    login_xf_close_button:setSize(cc.size(34,33))
    login_xf_close_button:setAnchorPoint(cc.p(0.5,0.5))
    login_xf_close_button:setButtonImage("batch_ui/guanbi_anniu2.png")
    login_xuanfu:appendComponent(login_xf_close_button)
    login_xf_close_button:setPositionInContainer(cc.p(361,16))
    table_login_xuanfu["login_xf_close_button"] = login_xf_close_button

    local login_xf_kuang2_bg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/xuanzefuwuqi_dikuang1_denglu.png",cc.rect(28,30,5,5))
    login_xf_kuang2_bg:setSize(cc.size(378,183))
    login_xf_kuang2_bg:setAnchorPoint(cc.p(0.5,0.5))
    login_xuanfu:appendComponent(login_xf_kuang2_bg)
    login_xf_kuang2_bg:setPositionInContainer(cc.p(189,184))
    table_login_xuanfu["login_xf_kuang2_bg"] = login_xf_kuang2_bg

    local login_xf_zuijin_image = fc.FExtensionsImage:create()
    login_xf_zuijin_image:setImage("batch_ui/zuijuindenglu.png")
    login_xf_zuijin_image:setSize(cc.size(52,52))
    login_xf_zuijin_image:setAnchorPoint(cc.p(0.5,0.5))
    login_xuanfu:appendComponent(login_xf_zuijin_image)
    login_xf_zuijin_image:setPositionInContainer(cc.p(318,47))
    table_login_xuanfu["login_xf_zuijin_image"] = login_xf_zuijin_image

    return table_login_xuanfu

end

