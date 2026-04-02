-- [[ JD SYSTEM v5.0 - MAIN UI ]]
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "🚀 JD SYSTEM v5.0",
   LoadingTitle = "Carregando Módulos...",
   LoadingSubtitle = "por Junior (JD)",
   Theme = "Default" -- Você pode mudar para 'Ocean', 'Midnight', etc.
})

-- Puxando os módulos do seu GitHub
local user = "JUNIORR55"
local universalURL = "https://raw.githubusercontent.com/"..user.."/JD-SYSTEM/main/games/universal.lua"
local Universal = loadstring(game:HttpGet(universalURL))()

-- Aba Principal
local MainTab = Window:CreateTab("Principal", 4483362458) -- Ícone de casa

-- Criando o Toggle do Orbit
local OrbitToggle = MainTab:CreateToggle({
   Name = "Orbit Control (JD)",
   CurrentValue = false,
   Flag = "OrbitFlag",
   Callback = function(Value)
      -- Aqui usamos a função que está no seu arquivo universal.lua
      Universal.ToggleOrbit(Value)
   end,
})

Rayfield:Notify({
   Title = "JD SYSTEM Ativo",
   Content = "Módulos carregados com sucesso!",
   Duration = 5,
   Image = 4483362458,
})
