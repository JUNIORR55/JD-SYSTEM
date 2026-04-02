-- [[ JD SYSTEM v5.0 - MAIN ]]
shared.JD_SYSTEM = {
    Modules = {},
    Toggles = {}
}

local user = "JUNIORR55"
local universalURL = "https://raw.githubusercontent.com/"..user.."/JD-SYSTEM/main/games/universal.lua"

local success, result = pcall(function()
    return loadstring(game:HttpGet(universalURL))()
end)

if success then
    shared.JD_SYSTEM.Modules.Universal = result
    print("Modulos Universais Carregados!")
else
    warn("Erro ao carregar modulos: " .. tostring(result))
end

game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "JD SYSTEM",
    Text = "Sistema Pronto para Uso!",
    Duration = 5
})
