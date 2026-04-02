-- [[ JD SYSTEM - MÓDULO UNIVERSAL ]]
local Universal = {}
local RunService = game:GetService("RunService")
local Player = game.Players.LocalPlayer

-- Variáveis de controle para o Orbit
Universal.OrbitEnabled = false
Universal.OrbitConnection = nil

-- Função para Ligar/Desligar o Orbit
function Universal.ToggleOrbit(state)
    Universal.OrbitEnabled = state
    
    if state then
        -- Se já houver algo rodando, a gente limpa antes de começar
        if Universal.OrbitConnection then 
            Universal.OrbitConnection:Disconnect() 
        end
        
        print("[JD SYSTEM] Orbit Ativado!")
        
        -- Criamos a conexão que roda a cada quadro do jogo (Heartbeat)
        Universal.OrbitConnection = RunService.Heartbeat:Connect(function()
            -- CHECAGEM DE SEGURANÇA: Se a chave geral virar 'false', o loop morre na hora
            if not Universal.OrbitEnabled then 
                if Universal.OrbitConnection then
                    Universal.OrbitConnection:Disconnect()
                    Universal.OrbitConnection = nil
                end
                return 
            end
            
            -- AQUI VOCÊ PODE COLOCAR A LÓGICA DE MOVIMENTO DO SEU ORBIT
            -- Exemplo: print("Orbitando...")
        end)
    else
        -- DESLIGAR E LIMPAR TUDO
        if Universal.OrbitConnection then
            Universal.OrbitConnection:Disconnect()
            Universal.OrbitConnection = nil
        end
        print("[JD SYSTEM] Orbit Desativado com sucesso.")
    end
end

-- Retorna a tabela para o Main.lua conseguir enxergar as funções
return Universal
