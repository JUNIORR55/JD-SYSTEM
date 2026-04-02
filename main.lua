-- [[ JD SYSTEM v5.0 - MAIN COM SUB-PAINEL ]]
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "🚀 JD SYSTEM v5.0",
   LoadingTitle = "Carregando Interface...",
   LoadingSubtitle = "by Junior (JD)",
   Theme = "Default"
})

-- Puxando os módulos do seu GitHub
local user = "JUNIORR55"
local universalURL = "https://raw.githubusercontent.com/"..user.."/JD-SYSTEM/main/games/universal.lua"
local Universal = loadstring(game:HttpGet(universalURL))()

-- ABA PRINCIPAL
local MainTab = Window:CreateTab("Combate & Orbit", 4483362458)

-- SEÇÃO DO ORBIT (O "Sub-Painel")
MainTab:CreateSection("Configurações do Orbit")

local OrbitToggle = MainTab:CreateToggle({
   Name = "Ativar Item Orbit",
   CurrentValue = false,
   Flag = "OrbitFlag",
   Callback = function(Value)
      Universal.ToggleOrbit(Value)
   end,
})

-- Slider para o Raio (Distância)
MainTab:CreateSlider({
   Name = "Distância do Orbit (Raio)",
   Range = {1, 20},
   Increment = 1,
   Suffix = "Blocos",
   CurrentValue = 5,
   Flag = "RadiusFlag",
   Callback = function(Value)
      Universal.Radius = Value -- Isso altera a variável direto no universal.lua!
   end,
})

-- Slider para a Velocidade
MainTab:CreateSlider({
   Name = "Velocidade do Giro",
   Range = {1, 50},
   Increment = 1,
   Suffix = "Velo",
   CurrentValue = 5,
   Flag = "SpeedFlag",
   Callback = function(Value)
      Universal.Speed = Value
   end,
})

Rayfield:Notify({
   Title = "JD SYSTEM",
   Content = "Painel de Controle Carregado!",
   Duration = 5
})
