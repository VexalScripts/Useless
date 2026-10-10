if not game:IsLoaded() then
    game.Loaded:Wait()
end

local queue = queue_on_teleport or queueonteleport
if queue then
    queue([[
        loadstring(game:HttpGet("https://raw.githubusercontent.com/VexalScripts/Useless/refs/heads/main/OnQueue.lua"))()
    ]])
end
loadstring(game:HttpGet("https://raw.githubusercontent.com/VexalScripts/scripts/refs/heads/main/v2/MvsdMainScript.lua"))()
