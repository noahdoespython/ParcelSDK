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
	return print(response)

end

function SDK.AddUserToWhitelist(hub_secret_key : string, productID : string, robloxID: string)
	local URL = BASE_URL .. "api/wl/add"
	local header = {
		["hub-secret-key"] = hub_secret_key,
	}
	local finalheader = fetch:JSONEncode(header)

	local data = {
		productID = productID,
		robloxID = robloxID
	}
	local finaldata = fetch:JSONEncode(data)
	local response = fetch:PostAsync(URL, finaldata, Enum.HttpContentType.ApplicationJson, finalheader)
	return print(response)
end



function SDK.GetProductsList(hubSecretKey : string)
	local URL = BASE_URL .. "api/hub/getproducts"
	local header = {
	
		["hub-secret-key"] = hubSecretKey
	}
	local final = fetch:JSONEncode(header)

	local response = fetch:GetAsync(URL, false,header)
	return print(response)
end

function SDK.GetSpecificProducts(robloxID: string, hubSecretKey : string)
	local URL = BASE_URL .. "api/hub/getproducts/"..robloxID
	local header = {
		["hub-secret-key"] = hubSecretKey
	}
	local finalheader = fetch:JSONEncode(header)
	local response = fetch:GetAsync(URL, false,finalheader)
	return print(response)

end

return SDK
