local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer

-- === Loading Screen ===
local loadingGui = Instance.new("ScreenGui")
loadingGui.Name = "LoadingScreen"
loadingGui.ResetOnSpawn = false
loadingGui.Parent = player:WaitForChild("PlayerGui")

local loadingFrame = Instance.new("Frame")
loadingFrame.Size = UDim2.new(1,0,1,0)
loadingFrame.Position = UDim2.new(0,0,0,0)
loadingFrame.BackgroundColor3 = Color3.fromRGB(25,25,30)
loadingFrame.BorderSizePixel = 0
loadingFrame.Parent = loadingGui

local loadingLabel = Instance.new("TextLabel")
loadingLabel.Size = UDim2.new(1,0,0,50)
loadingLabel.Position = UDim2.new(0,0,0.5,-25)
loadingLabel.BackgroundTransparency = 1
loadingLabel.Text = "Loading 999MS..."
loadingLabel.TextColor3 = Color3.fromRGB(255,255,255)
loadingLabel.Font = Enum.Font.Code
loadingLabel.TextSize = 24
loadingLabel.TextStrokeTransparency = 0.7
loadingLabel.Parent = loadingFrame

-- Progress Bar
local progressBarBack = Instance.new("Frame")
progressBarBack.Size = UDim2.new(0.6,0,0,20)
progressBarBack.Position = UDim2.new(0.2,0,0.6,0)
progressBarBack.BackgroundColor3 = Color3.fromRGB(40,40,50)
progressBarBack.BorderSizePixel = 0
progressBarBack.Parent = loadingFrame

local progressBar = Instance.new("Frame")
progressBar.Size = UDim2.new(0,0,1,0)
progressBar.Position = UDim2.new(0,0,0,0)
progressBar.BackgroundColor3 = Color3.fromRGB(0,170,255)
progressBar.BorderSizePixel = 0
progressBar.Parent = progressBarBack

-- Tween progress bar over 4 seconds
TweenService:Create(progressBar, TweenInfo.new(4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = UDim2.new(1,0,1,0)}):Play()

-- Delay 4s, sau đó ẩn loading và hiển thị UI chính
delay(4, function()
    loadingGui:Destroy()

    -- === Main GUI ===
    local gui = Instance.new("ScreenGui")
    gui.Name = "999MS"
    gui.ResetOnSpawn = false
    gui.Parent = player:WaitForChild("PlayerGui")

    -- Main Frame
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, 450, 0, 300)
    frame.Position = UDim2.new(0.5, -225, 0.5, -150)
    frame.BackgroundColor3 = Color3.fromRGB(25, 30, 40)
    frame.BorderSizePixel = 0
    frame.Active = true
    frame.Draggable = true
    frame.Parent = gui

    -- Top Bar
    local topBar = Instance.new("Frame", frame)
    topBar.Size = UDim2.new(1, 0, 0, 25)
    topBar.BackgroundColor3 = Color3.fromRGB(20, 25, 35)
    topBar.BorderSizePixel = 0

    -- Minimize Button
    local minimizeBtn = Instance.new("TextButton", topBar)
    minimizeBtn.Font = Enum.Font.SourceSans
    minimizeBtn.Size = UDim2.new(0, 25, 1, 0)
    minimizeBtn.BackgroundTransparency = 1
    minimizeBtn.Text = "v"
    minimizeBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
    minimizeBtn.TextSize = 18

    -- Title
    local title = Instance.new("TextLabel", topBar)
    title.Size = UDim2.new(1, -25, 1, 0)
    title.Position = UDim2.new(0, 25, 0, 0)
    title.BackgroundTransparency = 1
    title.Text = "999MS"
    title.TextColor3 = Color3.fromRGB(180, 180, 180)
    title.Font = Enum.Font.Code
    title.TextSize = 16
    title.TextXAlignment = Enum.TextXAlignment.Left

    -- ScrollFrame
    local scrollFrame = Instance.new("ScrollingFrame", frame)
    scrollFrame.Position = UDim2.new(0, 10, 0, 35)
    scrollFrame.Size = UDim2.new(1, -20, 1, -80)
    scrollFrame.BackgroundColor3 = Color3.fromRGB(15, 20, 30)
    scrollFrame.BorderSizePixel = 0
    scrollFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
    scrollFrame.ScrollBarThickness = 6
    scrollFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
    scrollFrame.ClipsDescendants = true

    -- CodeBox
    local codeBox = Instance.new("TextBox", scrollFrame)
    codeBox.Size = UDim2.new(1, 0, 1, 0)
    codeBox.BackgroundTransparency = 1
    codeBox.TextColor3 = Color3.fromRGB(220, 220, 220)
    codeBox.Font = Enum.Font.Code
    codeBox.TextSize = 15
    codeBox.TextXAlignment = Enum.TextXAlignment.Left
    codeBox.TextYAlignment = Enum.TextYAlignment.Top
    codeBox.ClearTextOnFocus = false
    codeBox.MultiLine = true
    codeBox.TextWrapped = false
    codeBox.Text = "-- type your script here"
    codeBox:GetPropertyChangedSignal("Text"):Connect(function()
        local textBounds = codeBox.TextBounds
        codeBox.Size = UDim2.new(1, 0, 0, textBounds.Y + 20)
        scrollFrame.CanvasSize = UDim2.new(0, 0, 0, codeBox.Size.Y.Offset)
    end)

    -- Execute Button
    local execBtn = Instance.new("TextButton", frame)
    execBtn.Size = UDim2.new(0, 90, 0, 22)
    execBtn.Position = UDim2.new(0, 10, 1, -35)
    execBtn.BackgroundColor3 = Color3.fromRGB(0, 120, 215)
    execBtn.Text = "Execute"
    execBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    execBtn.Font = Enum.Font.Code
    execBtn.TextSize = 14
    execBtn.BorderSizePixel = 0

    -- Clear Button
    local clearBtn = Instance.new("TextButton", frame)
    clearBtn.Size = UDim2.new(0, 90, 0, 22)
    clearBtn.Position = UDim2.new(0, 110, 1, -35)
    clearBtn.BackgroundColor3 = Color3.fromRGB(0, 100, 200)
    clearBtn.Text = "Clear"
    clearBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    clearBtn.Font = Enum.Font.Code
    clearBtn.TextSize = 14
    clearBtn.BorderSizePixel = 0

    -- Insert toggle
    local guiVisible = true
    UserInputService.InputBegan:Connect(function(input, gp)
        if not gp and input.KeyCode == Enum.KeyCode.Insert then
            guiVisible = not guiVisible
            local goal = { Size = guiVisible and UDim2.new(0, 450, 0, 300) or UDim2.new(0, 0, 0, 0), 
                Position = guiVisible and UDim2.new(0.5, -225, 0.5, -150) or UDim2.new(0.5, 0, 0.5, 0) }
            TweenService:Create(frame, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), goal):Play()
        end
    end)

    -- Minimize Logic
    local minimized = false
    local originalSize = frame.Size

    minimizeBtn.MouseButton1Click:Connect(function()
        minimized = not minimized
        if minimized then
            originalSize = frame.Size
            scrollFrame.Visible = false
            execBtn.Visible = false
            clearBtn.Visible = false
            frame:TweenSize(UDim2.new(originalSize.X.Scale, originalSize.X.Offset, 0, 25), "Out", "Quad", 0.25, true)
            minimizeBtn.Text = ">"
        else
            scrollFrame.Visible = true
            execBtn.Visible = true
            clearBtn.Visible = true
            frame:TweenSize(originalSize, "Out", "Quad", 0.25, true)
            minimizeBtn.Text = "v"
        end
    end)

    -- Button Actions
    execBtn.MouseButton1Click:Connect(function()
        loadstring(codeBox.Text)()
    end)

    clearBtn.MouseButton1Click:Connect(function()
        codeBox.Text = ""
    end)

end)
