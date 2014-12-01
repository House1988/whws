--自动生成


function createlogin_bg_panel()
	local  login_bg = fc.FContainerPanel:create()

	local loginPanelBg = fc.FExtensionsImage:create()

	local  login_bgTable = {}
	login_bgTable["login_bg_panel"] = login_bg

	login_bgTable["loginPanelBg"] = loginPanelBg

	login_bg:setSize(cc.size(960, 640))

	login_bg:appendComponent(loginPanelBg)
	loginPanelBg:setImage("nobatch/login_background.png")
	loginPanelBg:setSize(cc.size(960, 640))
	loginPanelBg:setAnchorPoint(cc.p(0.5, 0.5))
   	loginPanelBg:setPositionInContainer(cc.p(480,320))



	return login_bgTable

end
