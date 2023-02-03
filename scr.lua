local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("SCR AUTOPILOT", "BloodTheme")
local Tab = Window:NewTab("Main")
local Section = Tab:NewSection("Autopilot")

local q = 81
local s = 83
local t = 84
local w = 87
trainMaxSpeed = 100

Section:NewToggle("Autopilot On/Off", "Autopilot", function(state)
    if state then
        run = true
    else
        run = false
    end
end)

Section:NewTextBox("Max train speed", "Defaults to 100", function(txt)
	trainMaxSpeed = txt
end)

local Section = Tab:NewSection("UI Toggle")


Section:NewKeybind("UI Toggle", "UI Toggle", Enum.KeyCode.G, function()
	Library:ToggleUI()
end)

run = false
runLoop = true
braking = false
redSignal = false
brakeOnce = true
yellow = false

while true do wait(1)
    while run == true do wait(0.01)
        local signalName = game.Players.LocalPlayer.PlayerGui.MainGui.TrainHUD.MainFrame2x.NextSignalFrame.SignalName.Text
        local signal = tostring(game.Players.LocalPlayer.PlayerGui.MainGui.TrainHUD.MainFrame2x.NextSignalFrame.Danger.ImageColor3)
        local yellowSignal = tostring(game.Players.LocalPlayer.PlayerGui.MainGui.TrainHUD.MainFrame2x.NextSignalFrame.Caution.ImageColor3)
        local preYellowSignal = tostring(game.Players.LocalPlayer.PlayerGui.MainGui.TrainHUD.MainFrame2x.NextSignalFrame.Precaution.ImageColor3)
        local trainSpeed = tonumber(game.Players.LocalPlayer.PlayerGui.MainGui.TrainHUD.MainFrame2x.StatusFrame.Speed.SpeedLabel.Text)
        local stationName = tostring(game.Players.LocalPlayer.PlayerGui.MainGui.TrainHUD.MainFrame2x.DestinationFrame.StopLabel.Text)
        local playerX = game.Workspace.CurrentCamera.CFrame.Position.X
        local playerZ = game.Workspace.CurrentCamera.CFrame.Position.Z
        local stationDistance = tonumber(string.split(string.split(game.Players.LocalPlayer.PlayerGui.MainGui.TrainHUD.MainFrame2x.DestinationFrame.DistanceLabel.Text, "in ")[2], "miles")[1])
        brakingDistance = (200-(trainMaxSpeed+100))*-1

        if signalName ~= "----" then 
            runLoop = true
            local signalX = game.Workspace.Signals[signalName]:WaitForChild("ID", 100).CFrame.Position.X
            local signalZ = game.Workspace.Signals[signalName]:WaitForChild("ID", 100).CFrame.Position.Z

            differenceX = (playerX - signalX) ^ 2
            differenceZ = (playerZ - signalZ) ^ 2

            if differenceX < 0 then
                differenceX = differenceX * -1
            end
            if differenceZ < 0 then
                differenceZ = differenceZ * -1
            end

            distance = math.sqrt(differenceX + differenceZ)
            
            if distance == nil then
                distance = 0
            end

            if braking == false then
                keyrelease(w)
                keypress(w)
                brakeOnce = true
            end

            if brakeOnce == true then
                if stationDistance == 0.14 or stationDistance == 0.08 or stationDistance == 0.01 then  
                    braking = true
                    brakeOnce = false
                    keyrelease(w)
                    keyrelease(s)
                    keypress(s)
                    wait(1.75)
                    keyrelease(s)
                end
            end
            
            if distance ~= nil then
                if distance < 220+brakingDistance*4 and stationDistance <= 0.01 then
                    braking = true
                    keyrelease(w)
                    keyrelease(s)
                    keypress(s)
                end
            end

            if trainSpeed == 0 and redSignal == false then
                keyrelease(t)
                keypress(t)
                brakeOnce = true
                braking = false
                keyrelease(w)
                keypress(w)
            end

            if trainSpeed == 0 and redSignal == true then
                keyrelease(t)
                keypress(t)
                brakeOnce = true
            end

            if trainSpeed == 0 then
                keyrelease(t)
                keypress(t)
                keyrelease(w)
                keypress(w)
                braking = false
                brakeOnce = true
            end

            if trainSpeed == 0 and stationDistance < 0.04 then
                firesignal(game.Players.LocalPlayer.PlayerGui.MainGui.TrainHUD.SummaryWindow.NextSchedule['Activated'])
                wait(1.5)
            end

            if trainSpeed == 0 and yellowSignal ~= "1, 0.745098, 0" and preYellowSignal ~= "0.407843, 0.407843, 0.407843" then
                braking = false
            end

            if signal == "1, 0, 0" and stationDistance > 0.19 and distance < 1500 and brakeOnce == false then
                brakeOnce = true
                redSignal = true
                yellow = false
                braking = true
                keyrelease(w)
                keyrelease(s)
                keypress(s)
                wait(1.75)
                keyrelease(s)
            end
            
            if signal == "1, 0, 0" and distance < 230+brakingDistance*4 then
                redSignal = true
                yellow = false
                braking = true
                keyrelease(w)
                keyrelease(s)
                keypress(s)
            end

            if signal ~= "1, 0, 0" then
                redSignal = false
            end

            if yellowSignal == "0.407843, 0.407843, 0.407843" and preYellowSignal == "0.407843, 0.407843, 0.407843" and yellow == true and stationDistance > 0.19 then
                brakeOnce = true
                braking = false
                yellow = false
                keyrelease(w)
                keypress(w)

            end

            if ((yellowSignal == "1, 0.745098, 0" and preYellowSignal == "0.407843, 0.407843, 0.407843") or (signal == "1, 0, 0")) and brakeOnce == true and trainSpeed > 55 then
                braking = true
                brakeOnce = false
                yellow = true
                keyrelease(w)
                keyrelease(s)
                keypress(s)
                wait(1.75)
                keyrelease(s)
            end

            keypress(q)
            keyrelease(q)
            
        else
            if runLoop == true then
                for i, child in pairs(game.Workspace.TrackSensors:GetChildren()) do
                    if tostring(child) == "BufferTrap" then
                        local signalX = child.CFrame.Position.X
                        local signalZ = child.CFrame.Position.Z

                        differenceX = (playerX - signalX) ^ 2
                        differenceZ = (playerZ - signalZ) ^ 2

                        if differenceX < 0 then
                            differenceX = differenceX * -1
                        end
                        if differenceZ < 0 then
                            differenceZ = differenceZ * -1
                        end

                        distance = math.sqrt(differenceX + differenceZ)
                        print(distance)

                        if distance < 230+brakingDistance*4 and stationName ~= "Leighton City"  and stationName ~= "Benton" then
                            keyrelease(w)
                            print(230+brakingDistance*4)
                            keyrelease(s)
                            keypress(s)
                        end
                        
                        if stationName == "Benton" and stationDistance <= 0.03 then
                            keyrelease(w)
                            keyrelease(s)
                            keypress(s)
                        end

                        if distance < 600 and brakeOnce == true and stationName ~= "Leighton City" then
                            brakeOnce = false
                            keyrelease(w)
                            keypress(w)
                            keyrelease(w)
                            keyrelease(s)
                            keypress(s)
                            wait(1.75)
                            keyrelease(s)
                        end
                    end
                end
            end
            if trainSpeed == 0 then
                keyrelease(t)
                keypress(t)
                firesignal(game.Players.LocalPlayer.PlayerGui.MainGui.TrainHUD.SummaryWindow.NextSchedule['Activated'])
                wait(1) 
                keyrelease(w)
                keypress(w)
                wait(3)
                keyrelease(s)
                keypress(s)
                runloop = true
            end
        end
    end
end
