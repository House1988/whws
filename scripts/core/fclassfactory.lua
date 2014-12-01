
require("scripts.core.scene.fluascene")
require("scripts.core.layer.flualayer")
require("scripts.core.component.fluabutton")
require("scripts.core.component.fluacheckbox")
require("scripts.core.component.fluacontainerlist")
require("scripts.core.component.fluacontainerscroll")
require("scripts.core.component.fluacontainerpanel")
require("scripts.core.component.fluastencilpanel")
require("scripts.core.component.fluacontainertable")
require("scripts.core.component.fluaextensionsimage")
require("scripts.core.component.fluainput")
require("scripts.core.component.flualabel")
require("scripts.core.component.flualoadingbar")
require("scripts.core.component.fluascale9image")
require("scripts.core.component.fluaslider")
require("scripts.core.component.fluatextbutton")
require("scripts.core.component.fluaimagetextbutton")
require("scripts.core.component.fluacontainerselectpanel")
require("scripts.core.component.fluaanimationcomponent")
require("scripts.core.component.fluacontainerPage")

local FClassFactory = {}


function FClassFactory.newFLuaScene(name)
    local scene = FLuaScene.extend(cc.Scene:create())
    scene.name = name or "<unknown-scene>"
    return scene
end

function FClassFactory.newFLuaLayer(name)
    local layer = FLuaLayer.extend(cc.Layer:create())
    layer.name = name or "<unknown-scene>"
    return layer
end

function FClassFactory.newFLuaButton(name)
    local component = FLuaButton.extend(fc.FButton:create())
    component.name = name or "<unknown-scene>"
    return component
end

function FClassFactory.newFLuaCheckBox(name)
    local component = FLuaCheckBox.extend(fc.FCheckBox:create())
    component.name = name or "<unknown-scene>"
    return component
end

function FClassFactory.newFLuaContainerList(name, type)
    local component = FLuaContainerList.extend(fc.FContainerList:create(type))
    component.name = name or "<unknown-scene>"
    return component
end

function FClassFactory.newFLuaContainerPage(name, type)
    local component = FLuaContainerPage.extend(fc.FContainerPage:create(type))
    component.name = name or "<unknown-scene>"
    return component
end

function FClassFactory.newFLuaContainerScroll(name)
    local component = FLuaContainerScroll.extend(fc.FContainerScroll:create())
    component.name = name or "<unknown-scene>"
    return component
end

function FClassFactory.newFLuaContainerPanel(name)
    local component = FLuaContainerPanel.extend(fc.FContainerPanel:create())
    component.name = name or "<unknown-scene>"
    return component
end

function FClassFactory.newFLuaStencilPanel(name)
    local component = FLuaStencilPanel.extend(fc.FStencilPanel:create())
    component.name = name or "<unknown-scene>"
    return component
end

function FClassFactory.newFLuaAnimationComponent(name)
    local component = FLuaAnimationComponent.extend(fc.FAnimationComponent:create())
    component.name = name or "<unknown-scene>"
    return component
end

function FClassFactory.newFLuaContainerTable(name,type)
    local component = FLuaContainerTable.extend(fc.FContainerTable:create(type))
    component.name = name or "<unknown-scene>"
    return component
end

function FClassFactory.newFLuaExtensionsImage(name)
    local component = FLuaExtensionsImage.extend(fc.FExtensionsImage:create())
    component.name = name or "<unknown-scene>"
    return component
end

function FClassFactory.newFLuaInput(name)
    local component = FLuaInput.extend(fc.FInput:create())
    component.name = name or "<unknown-scene>"
    return component
end

function FClassFactory.newFLuaLabel(name)
    local component = FLuaLabel.extend(fc.FLabel:create())
    component.name = name or "<unknown-scene>"
    return component
end

function FClassFactory.newFLuaLoadingBar(name)
    local component = FLuaLoadingBar.extend(fc.FLoadingBar:create())
    component.name = name or "<unknown-scene>"
    return component
end

function FClassFactory.newFLuaScale9Image(name)
    local component = FLuaScale9Image.extend(fc.FScale9Image:create())
    component.name = name or "<unknown-scene>"
    return component
end

function FClassFactory.newFLuaSlider(name)
    local component = FLuaSlider.extend(fc.FSlider:create())
    component.name = name or "<unknown-scene>"
    return component
end

function FClassFactory.newFLuaTextButton(name)
    local component = FLuaTextButton.extend(fc.FTextButton:create())
    component.name = name or "<unknown-scene>"
    return component
end

function FClassFactory.newFLuaImageTextButton(name)
    local component = FLuaImageTextButton.extend(fc.FImageTextButton:create())
    component.name = name or "<unknown-scene>"
    return component
end

function FClassFactory.newFLuaContainerSelectPanel(name)
    local component = FLuaContainerSelectPanel.extend(fc.FContainerSelectPanel:create())
    component.name = name or "<unknown-scene>"
    return component
end

return FClassFactory