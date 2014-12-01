function createshangcheng()

    local table_shangcheng = {}

    local shangcheng = fc.FContainerPanel:create()
    shangcheng:setSize(cc.size(960,578))
    table_shangcheng["shangcheng"] = shangcheng

    local shangcheng_bg = fc.FExtensionsImage:create()
    shangcheng_bg:setAnchorPoint(cc.p(0.5,0.5))
    shangcheng:appendComponent(shangcheng_bg)
    shangcheng_bg:setPositionInContainer(cc.p(480,320))
    table_shangcheng["shangcheng_bg"] = shangcheng_bg

    local shangcheng_meinv = fc.FExtensionsImage:create()
    shangcheng_meinv:setImage("beauty_card/wangzhaojun01.png")
    shangcheng_meinv:setSize(cc.size(522,531))
    shangcheng_meinv:setAnchorPoint(cc.p(0.5,0.5))
    shangcheng:appendComponent(shangcheng_meinv)
    shangcheng_meinv:setPositionInContainer(cc.p(91,394.5))
    table_shangcheng["shangcheng_meinv"] = shangcheng_meinv

    return table_shangcheng

end

