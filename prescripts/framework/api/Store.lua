
local Store = {}
ccst.storeProvider = nil
local function checkCCStore()
    if not ccst.CCStore then
        echoError("framework.api.Store - CCStore not exists.")
        return false
    end
    return true
end

function Store.init(listener)
    if not checkCCStore() then return false end

    if ccst.storeProvider then
        echoError("Store.init() - store already init")
        return false
    end

    if type(listener) ~= "function" then
        echoError("Store.init() - invalid listener")
        return false
    end

    ccst.storeProvider = ccst.CCStore:sharedStore() -- avoid gc
    return ccst.storeProvider:postInitWithTransactionListenerLua(listener)
end

function Store.getReceiptVerifyMode()
    if not checkCCStore() then return false end
    return ccst.storeProvider:getReceiptVerifyMode()
end

function Store.setReceiptVerifyMode(mode, isSandbox)
    if not checkCCStore() then return false end

    if type(mode) ~= "number"
        or (mode ~= ccst.CCStoreReceiptVerifyModeNone
            and mode ~= ccst.CCStoreReceiptVerifyModeDevice
            and mode ~= ccst.CCStoreReceiptVerifyModeServer) then
        echoError("Store.setReceiptVerifyMode() - invalid mode")
        return false
    end

    if type(isSandbox) ~= "boolean" then isSandbox = true end
    ccst.storeProvider:setReceiptVerifyMode(mode, isSandbox)
end

function Store.getReceiptVerifyServerUrl()
    if not checkCCStore() then return false end
    return ccst.storeProvider:getReceiptVerifyServerUrl()
end

function Store.setReceiptVerifyServerUrl(url)
    if not checkCCStore() then return false end

    if type(url) ~= "string" then
        echoError("Store.setReceiptVerifyServerUrl() - invalid url")
        return false
    end
    ccst.storeProvider:setReceiptVerifyServerUrl(url)
end

function Store.canMakePurchases()
    if not checkCCStore() then return false end
    return ccst.storeProvider:canMakePurchases()
end

function Store.loadProducts(productsId, listener)
    if not checkCCStore() then return false end
	
    if type(listener) ~= "function" then
        echoError("Store.loadProducts() - invalid listener")
        return false
    end

    if type(productsId) ~= "table" then
        echoError("Store.loadProducts() - invalid productsId")
        return false
    end

    for i = 1, #productsId do
        if type(productsId[i]) ~= "string" then
            echoError("Store.loadProducts() - invalid id[#%d] in productsId", i)
            return false
        end
    end

    ccst.storeProvider:loadProductsLua(productsId, listener)
    return true
end

function Store.cancelLoadProducts()
    if not checkCCStore() then return false end
    ccst.storeProvider:cancelLoadProducts()
end

function Store.isProductLoaded(productId)
    if not checkCCStore() then return false end
    return ccst.storeProvider:isProductLoaded(productId)
end

function Store.purchase(productId)
    if not checkCCStore() then return false end

    if not ccst.storeProvider then
        echoError("Store.purchase() - store not init")
        return false
    end

    if type(productId) ~= "string" then
        echoError("Store.purchase() - invalid productId")
        return false
    end

    return ccst.storeProvider:purchase(productId)
end

function Store.restore()
    if not checkCCStore() then return false end
    ccst.storeProvider:restore()
end

function Store.finishTransaction(transaction)
    if not checkCCStore() then return false end

    if not ccst.storeProvider then
        echoError("Store.finishTransaction() - store not init")
        return false
    end
														
    if type(transaction) ~= "table" or type(transaction.transactionIdentifier) ~= "string" then
        echoError("Store.finishTransaction() - invalid transaction")
        return false
    end

    return ccst.storeProvider:finishTransactionLua(transaction.transactionIdentifier)
end

return Store
