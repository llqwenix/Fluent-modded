local function disableAcrylicCanQuery()
    local Fluent = getgenv().Fluent
    if Fluent and Fluent.Window then
        local acrylic = Fluent.Window.AcrylicPaint
        if acrylic and acrylic.Model then
            acrylic.Model.CanQuery = false
            return true
        end
    end
    return false
end

if not disableAcrylicCanQuery() then
    local conn
    conn = game:GetService("RunService").Heartbeat:Connect(function()
        if disableAcrylicCanQuery() then
            conn:Disconnect()
        end
    end)
end
