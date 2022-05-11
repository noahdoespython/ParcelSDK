local SDK = {}
SDK.__index = SDK
local BASE_URL = "https://api.parcelroblox.com/";
local fetch = game:GetService('HttpService')


function SDK.CheckProductWhitelist(hubID : string, productID : string, robloxID: string)
    local URL = BASE_URL .. "api/wl/check";
    local data = {
        hubID = hubID,
        productID = productID,
        robloxID = robloxID
    }
    local finaldata = fetch:JSONEncode(data)
    local response = fetch:PostAsync(URL, finaldata)
    print(response)
    
end

function SDK.AddUserToWhitelist(hub_secret_key : string, productID : string, robloxID: string)
    local URL = BASE_URL .. "api/wl/add"
    local header = {
        hub_secret_key = hub_secret_key,
    }
    local finalheader = fetch:JSONEncode(header)

    local data = {
        productID = productID,
        robloxID = robloxID
    }
    local finaldata = fetch:JSONEncode(data)
    local response = fetch:PostAsync(URL, finaldata, Enum.HttpContentType.ApplicationJson, finalheader)
    print(response)
end

function SDK.GetProductsList(hub_secret_key : string)
    local URL = BASE_URL .. "api/hub/getproducts"
    local header = {
        hub_secret_key = hub_secret_key
    }
    local finalheader = fetch:JSONEncode(header)
    local response = fetch:GetAsync(URL, finalheader)
    print(response)
end

function SDK.GetSpecificProducts(robloxID: string, hub_secret_key : string)
    local URL = BASE_URL .. "api/hub/getproducts/"..robloxID
    local header = {
        hub_secret_key = hub_secret_key
    }
    local finalheader = fetch:JSONEncode(header)
    local response = fetch:GetAsync(URL, finalheader)
    print(response)
    
end

return SDK
