-- [[ JD SYSTEM - MÓDULO UNIVERSAL ATUALIZADO ]]
local Universal = {}
local RunService = game:GetService("RunService")
local Player = game.Players.LocalPlayer

-- Configurações do Orbit (Você pode mudar os números para testar)
Universal.OrbitEnabled = false
Universal.OrbitConnection = nil
Universal.Radius = 10 -- Distância do giro
Universal.Speed = 5  -- Velocidade do giro
Universal.Height = 5 -- Altura do giro

function Universal.ToggleOrbit(state)
    Universal.OrbitEnabled = state
    
    if state then
        if Universal.OrbitConnection then Universal.OrbitConnection:Disconnect() end
        
        print("[JD SYSTEM] Orbit Ativado!")
        
        Universal.OrbitConnection = RunService.Heartbeat:Connect(function()
            if not Universal.OrbitEnabled then 
                if Universal.OrbitConnection then
                    Universal.OrbitConnection:Disconnect()
                    Universal.OrbitConnection = nil
                end
                return 
            end
            
            local Character = Player.Character
            local Root = Character and Character:FindFirstChild("HumanoidRootPart")
            
            if Root then
                -- MATEMÁTICA DO GIRO (Seno e Cosseno)
                local t = tick() * Universal.Speed
                local x = math.cos(t) * Universal.Radius
                local z = math.sin(t) * Universal.Radius
                
                -- Move o personagem em círculo ao redor do ponto original
                -- (Ou você pode mudar 'Root.Position' para a posição de outro jogador)
                Root.CFrame = CFrame.new(Root.Position + Vector3.new(x, math.sin(t*0.5) * Universal.Height, z), Root.Position)
            end
        end)
    else
        if Universal.OrbitConnection then
            Universal.OrbitConnection:Disconnect()
            Universal.OrbitConnection = nil
        end
        print("[JD SYSTEM] Orbit Desativado.")
    end
end

return Universal
