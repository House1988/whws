function createchoujiang_rank_panel()

    local table_choujiang_rank_panel = {}

    local choujiang_rank_panel = fc.FContainerPanel:create()
    choujiang_rank_panel:setSize(cc.size(960,640))
    table_choujiang_rank_panel["choujiang_rank_panel"] = choujiang_rank_panel

    local rp_panel = fc.FContainerPanel:create()
    rp_panel:setSize(cc.size(534,600))
    rp_panel:setAnchorPoint(cc.p(0.5,0.5))
    choujiang_rank_panel:appendComponent(rp_panel)
    rp_panel:setPositionInContainer(cc.p(480,313))
    table_choujiang_rank_panel["rp_panel"] = rp_panel

    local bg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/shengzhi_ditu.png",cc.rect(40,63,4,4))
    bg:setSize(cc.size(412,550))
    bg:setAnchorPoint(cc.p(0.5,0.5))
    rp_panel:appendComponent(bg)
    bg:setPositionInContainer(cc.p(267,300))
    table_choujiang_rank_panel["bg"] = bg

    local zhou = fc.FExtensionsImage:create()
    zhou:setImage("nobatch/shengzhi_zhou.png")
    zhou:setSize(cc.size(52,534))
    zhou:setRotation(90)
    zhou:setAnchorPoint(cc.p(0.5,0.5))
    rp_panel:appendComponent(zhou)
    zhou:setPositionInContainer(cc.p(267,26))
    table_choujiang_rank_panel["zhou"] = zhou

    local top_Bg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongditu1_ciguan.png",cc.rect(1,1,1,1))
    top_Bg:setSize(cc.size(370,500))
    top_Bg:setAnchorPoint(cc.p(0.5,0.5))
    rp_panel:appendComponent(top_Bg)
    top_Bg:setPositionInContainer(cc.p(267,302))
    table_choujiang_rank_panel["top_Bg"] = top_Bg

    local zhou = fc.FExtensionsImage:create()
    zhou:setImage("nobatch/shengzhi_zhou.png")
    zhou:setSize(cc.size(52,534))
    zhou:setRotation(90)
    zhou:setAnchorPoint(cc.p(0.5,0.5))
    rp_panel:appendComponent(zhou)
    zhou:setPositionInContainer(cc.p(267,574))
    table_choujiang_rank_panel["zhou"] = zhou

    local close_btn = fc.FScaleButton:create()
    close_btn:setSize(cc.size(34,33))
    close_btn:setAnchorPoint(cc.p(0.5,0.5))
    close_btn:setButtonImage("batch_ui/guanbi_anniu2.png")
    rp_panel:appendComponent(close_btn)
    close_btn:setPositionInContainer(cc.p(497,26.5))
    table_choujiang_rank_panel["close_btn"] = close_btn

    local title_bg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/zongjiachengdikuang_tangquanxinggong.png",cc.rect(62,0,2,29))
    title_bg:setSize(cc.size(350,43))
    title_bg:setAnchorPoint(cc.p(0.5,0.5))
    rp_panel:appendComponent(title_bg)
    title_bg:setPositionInContainer(cc.p(267,21.5))
    table_choujiang_rank_panel["title_bg"] = title_bg

    local rp_title = fc.FContainerPanel:create()
    rp_title:setSize(cc.size(280,60))
    rp_title:setAnchorPoint(cc.p(0.5,0.5))
    rp_panel:appendComponent(rp_title)
    rp_title:setPositionInContainer(cc.p(267,16))
    table_choujiang_rank_panel["rp_title"] = rp_title

    local pai = fc.FExtensionsImage:create()
    pai:setImage("batch_ui/pai.png")
    pai:setSize(cc.size(59,59))
    pai:setAnchorPoint(cc.p(0.5,0.5))
    rp_title:appendComponent(pai)
    pai:setPositionInContainer(cc.p(139.5,29.5))
    table_choujiang_rank_panel["pai"] = pai

    local hang = fc.FExtensionsImage:create()
    hang:setImage("batch_ui/hang.png")
    hang:setSize(cc.size(59,59))
    hang:setAnchorPoint(cc.p(0.5,0.5))
    rp_title:appendComponent(hang)
    hang:setPositionInContainer(cc.p(195.5,29.5))
    table_choujiang_rank_panel["hang"] = hang

    local ji = fc.FExtensionsImage:create()
    ji:setImage("batch_ui/ji (2).png")
    ji:setSize(cc.size(59,59))
    ji:setAnchorPoint(cc.p(0.5,0.5))
    rp_title:appendComponent(ji)
    ji:setPositionInContainer(cc.p(29.5,29.5))
    table_choujiang_rank_panel["ji"] = ji

    local fen = fc.FExtensionsImage:create()
    fen:setImage("batch_ui/fen.png")
    fen:setSize(cc.size(59,59))
    fen:setAnchorPoint(cc.p(0.5,0.5))
    rp_title:appendComponent(fen)
    fen:setPositionInContainer(cc.p(84.5,29.5))
    table_choujiang_rank_panel["fen"] = fen

    local bang = fc.FExtensionsImage:create()
    bang:setImage("batch_ui/bang.png")
    bang:setSize(cc.size(59,59))
    bang:setAnchorPoint(cc.p(0.5,0.5))
    rp_title:appendComponent(bang)
    bang:setPositionInContainer(cc.p(250.5,29.5))
    table_choujiang_rank_panel["bang"] = bang

    local rp_titleBg = fc.FScale9Image:createWithBatchUIFrame("batch_ui/zongjiachengdikuang_tangquanxinggong.png",cc.rect(62,0,2,29))
    rp_titleBg:setSize(cc.size(370,35))
    rp_titleBg:setAnchorPoint(cc.p(0.5,0.5))
    rp_titleBg:setScaleY(-1)
    rp_panel:appendComponent(rp_titleBg)
    rp_titleBg:setPositionInContainer(cc.p(267,70.5))
    table_choujiang_rank_panel["rp_titleBg"] = rp_titleBg

    local rp_leiji = fc.FLabel:createBMFont()
    rp_leiji:setSize(cc.size(100,24))
    rp_leiji:setAnchorPoint(cc.p(0.5,0.5))
    rp_leiji:setFontSize(20)
    if LANGUAGE_TYPE == 3 then
	    rp_leiji:setString("累計積分：")
    else
	    rp_leiji:setString("累计积分：")
    end
    rp_leiji:setColor(cc.c3b(0,255,0))
    rp_panel:appendComponent(rp_leiji)
    rp_leiji:setPositionInContainer(cc.p(147,67))
    table_choujiang_rank_panel["rp_leiji"] = rp_leiji

    local rp_wodejifen = fc.FLabel:createBMFont()
    rp_wodejifen:setSize(cc.size(100,24))
    rp_wodejifen:setAnchorPoint(cc.p(0.5,0.5))
    rp_wodejifen:setFontSize(20)
	rp_wodejifen:setString("朕的排行：")
    rp_wodejifen:setColor(cc.c3b(0,255,0))
    rp_panel:appendComponent(rp_wodejifen)
    rp_wodejifen:setPositionInContainer(cc.p(324,67))
    table_choujiang_rank_panel["rp_wodejifen"] = rp_wodejifen

    local rp_leiji_number = fc.FLabel:createBMFont()
    rp_leiji_number:setSize(cc.size(50,24))
    rp_leiji_number:setAnchorPoint(cc.p(0.5,0.5))
    rp_leiji_number:setFontSize(20)
    if LANGUAGE_TYPE == 3 then
	    rp_leiji_number:setString("累計積分")
    else
	    rp_leiji_number:setString("累计积分")
    end
    rp_leiji_number:setColor(cc.c3b(255,255,0))
    rp_panel:appendComponent(rp_leiji_number)
    rp_leiji_number:setPositionInContainer(cc.p(226,67))
    table_choujiang_rank_panel["rp_leiji_number"] = rp_leiji_number

    local rp_jifen_number = fc.FLabel:createBMFont()
    rp_jifen_number:setSize(cc.size(50,24))
    rp_jifen_number:setAnchorPoint(cc.p(0.5,0.5))
    rp_jifen_number:setFontSize(20)
    if LANGUAGE_TYPE == 3 then
	    rp_jifen_number:setString("累計積分")
    else
	    rp_jifen_number:setString("累计积分")
    end
    rp_jifen_number:setColor(cc.c3b(255,255,0))
    rp_panel:appendComponent(rp_jifen_number)
    rp_jifen_number:setPositionInContainer(cc.p(393,68))
    table_choujiang_rank_panel["rp_jifen_number"] = rp_jifen_number

    local rp_mingci = fc.FLabel:createBMFont()
    rp_mingci:setSize(cc.size(50,24))
    rp_mingci:setAnchorPoint(cc.p(0.5,0.5))
    rp_mingci:setFontSize(20)
    rp_mingci:setString("名次")
    rp_mingci:setColor(cc.c3b(255,0,0))
    rp_panel:appendComponent(rp_mingci)
    rp_mingci:setPositionInContainer(cc.p(131,104))
    table_choujiang_rank_panel["rp_mingci"] = rp_mingci

    local rp_jifen = fc.FLabel:createBMFont()
    rp_jifen:setSize(cc.size(50,24))
    rp_jifen:setAnchorPoint(cc.p(0.5,0.5))
    rp_jifen:setFontSize(20)
    if LANGUAGE_TYPE == 3 then
    	rp_jifen:setString("積分")
    else
    	rp_jifen:setString("积分")
    end
    
    rp_jifen:setColor(cc.c3b(255,0,0))
    rp_panel:appendComponent(rp_jifen)
    rp_jifen:setPositionInContainer(cc.p(390,104))
    table_choujiang_rank_panel["rp_jifen"] = rp_jifen

    local rp_xingming = fc.FLabel:createBMFont()
    rp_xingming:setSize(cc.size(50,24))
    rp_xingming:setAnchorPoint(cc.p(0.5,0.5))
    rp_xingming:setFontSize(20)
    rp_xingming:setString("姓名")
    rp_xingming:setColor(cc.c3b(255,0,0))
    rp_panel:appendComponent(rp_xingming)
    rp_xingming:setPositionInContainer(cc.p(263,104))
    table_choujiang_rank_panel["rp_xingming"] = rp_xingming

    local rp_list = fc.FContainerList:create(1)
    rp_list:setSize(cc.size(370,420))
    rp_list:setAnchorPoint(cc.p(0.5,0.5))
    rp_panel:appendComponent(rp_list)
    rp_list:setPositionInContainer(cc.p(267,338))
    table_choujiang_rank_panel["rp_list"] = rp_list

    local out_frame = fc.FScale9Image:createWithBatchUIFrame("batch_ui/tongyongbiankuang2_ciguan.png",cc.rect(43,15,2,2))
    out_frame:setSize(cc.size(370,500))
    out_frame:setAnchorPoint(cc.p(0.5,0.5))
    rp_panel:appendComponent(out_frame)
    out_frame:setPositionInContainer(cc.p(267,302))
    table_choujiang_rank_panel["out_frame"] = out_frame

    return table_choujiang_rank_panel

end

