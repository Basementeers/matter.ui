local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Matter = require(ReplicatedStorage.Packages.matter)
local MatterUI = require(ReplicatedStorage["matter-ui"])

local world = Matter.World.new()

local loop = Matter.Loop.new(world)

local systems = {}
for _, child in ipairs(script.systems:GetChildren()) do
    if child:IsA("ModuleScript") then
        table.insert(systems, require(child))
    end
end

loop:scheduleSystems(systems)
loop:scheduleSystems(MatterUI.systems)

loop:begin({
    default = RunService.RenderStepped.Heartbeat,
})