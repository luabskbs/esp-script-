local function optimizeGraphics()
    local Lighting = game:GetService("Lighting")
    local Workspace = game:GetService("Workspace")
    local Players = game:GetService("Players")

    -- Reduce lighting effects
    Lighting.GlobalShadows = false
    Lighting.FogEnd = 500
    Lighting.Brightness = 1

    -- Simplify workspace parts
    for _, obj in ipairs(Workspace:GetDescendants()) do
        if obj:IsA("ParticleEmitter") or obj:IsA("Trail") then
            obj.Enabled = false
        elseif obj:IsA("BasePart") and obj:FindFirstChildOfClass("Decal") then
            obj:FindFirstChildOfClass("Decal").Transparency = 1
        elseif obj:IsA("BasePart") then
            obj.Material = Enum.Material.SmoothPlastic
        end
    end

    -- Optimize player character
    local player = Players.LocalPlayer
    if player.Character then
        for _, part in ipairs(player.Character:GetDescendants()) do
            if part:IsA("ParticleEmitter") or part:IsA("Trail") then
                part.Enabled = false
            elseif part:IsA("BasePart") then
                part.Material = Enum.Material.SmoothPlastic
            end
        end
    end
end

-- Apply optimizations
optimizeGraphics()
print("FPS Boost Applied!")
