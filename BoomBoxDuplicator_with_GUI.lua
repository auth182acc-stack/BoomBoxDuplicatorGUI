--!strict

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

-- GUI Settings
local GUI_SETTINGS = {
    BackgroundColor = Color3.fromRGB(40, 44, 52), -- Dark grey
    TextColor = Color3.fromRGB(171, 178, 191),    -- Light grey
    AccentColor = Color3.fromRGB(152, 195, 121),  -- Green
    BorderColor = Color3.fromRGB(62, 68, 82),    -- Slightly lighter dark grey
    Font = Enum.Font.SourceSans,
    FontSize = Enum.FontSize.Size18,
}

-- Create ScreenGui
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "BoomBoxDuplicatorGUI"
ScreenGui.Parent = PlayerGui

-- Create Main Frame
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 300, 0, 250)
MainFrame.Position = UDim2.new(0.5, -150, 0.5, -125) -- Center of screen
MainFrame.BackgroundColor3 = GUI_SETTINGS.BackgroundColor
MainFrame.BorderSizePixel = 1
MainFrame.BorderColor3 = GUI_SETTINGS.BorderColor
MainFrame.Draggable = true -- Allow dragging
MainFrame.Parent = ScreenGui

-- Add UICorner for rounded corners
local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 8)
UICorner.Parent = MainFrame

-- Add UIPadding for internal spacing
local UIPadding = Instance.new("UIPadding")
UIPadding.PaddingLeft = UDim.new(0, 10)
UIPadding.PaddingRight = UDim.new(0, 10)
UIPadding.PaddingTop = UDim.new(0, 10)
UIPadding.PaddingBottom = UDim.new(0, 10)
UIPadding.Parent = MainFrame

-- Create Title Label
local TitleLabel = Instance.new("TextLabel")
TitleLabel.Name = "TitleLabel"
TitleLabel.Size = UDim2.new(1, 0, 0, 30)
TitleLabel.Position = UDim2.new(0, 0, 0, 0)
TitleLabel.BackgroundColor3 = GUI_SETTINGS.BackgroundColor
TitleLabel.TextColor3 = GUI_SETTINGS.TextColor
TitleLabel.Font = GUI_SETTINGS.Font
TitleLabel.FontSize = Enum.FontSize.Size24
TitleLabel.Text = "BoomBox Duplicator"
TitleLabel.TextScaled = true
TitleLabel.TextXAlignment = Enum.TextXAlignment.Center
TitleLabel.Parent = MainFrame

-- Create UIListLayout for automatic arrangement
local UIListLayout = Instance.new("UIListLayout")
UIListLayout.FillDirection = Enum.FillDirection.Vertical
UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIListLayout.Padding = UDim.new(0, 5)
UIListLayout.Parent = MainFrame

-- Amount to Dupe Input
local AmountFrame = Instance.new("Frame")
AmountFrame.Name = "AmountFrame"
AmountFrame.Size = UDim2.new(1, 0, 0, 30)
AmountFrame.BackgroundColor3 = GUI_SETTINGS.BackgroundColor
AmountFrame.Parent = MainFrame

local AmountLabel = Instance.new("TextLabel")
AmountLabel.Name = "AmountLabel"
AmountLabel.Size = UDim2.new(0.6, 0, 1, 0)
AmountLabel.Position = UDim2.new(0, 0, 0, 0)
AmountLabel.BackgroundColor3 = GUI_SETTINGS.BackgroundColor
AmountLabel.TextColor3 = GUI_SETTINGS.TextColor
AmountLabel.Font = GUI_SETTINGS.Font
AmountLabel.FontSize = GUI_SETTINGS.FontSize
AmountLabel.Text = "จำนวนครั้งที่ต้องการทำซ้ำ:"
AmountLabel.TextXAlignment = Enum.TextXAlignment.Left
AmountLabel.Parent = AmountFrame

local AmountTextBox = Instance.new("TextBox")
AmountTextBox.Name = "AmountTextBox"
AmountTextBox.Size = UDim2.new(0.35, 0, 1, 0)
AmountTextBox.Position = UDim2.new(0.65, 0, 0, 0)
AmountTextBox.BackgroundColor3 = GUI_SETTINGS.BorderColor
AmountTextBox.TextColor3 = GUI_SETTINGS.TextColor
AmountTextBox.Font = GUI_SETTINGS.Font
AmountTextBox.FontSize = GUI_SETTINGS.FontSize
AmountTextBox.Text = "10"
AmountTextBox.TextEditable = true
AmountTextBox.ClearTextOnFocus = false
AmountTextBox.Parent = AmountFrame

-- getfenv Toggle (Checkbox)
local GetfenvFrame = Instance.new("Frame")
GetfenvFrame.Name = "GetfenvFrame"
GetfenvFrame.Size = UDim2.new(1, 0, 0, 30)
GetfenvFrame.BackgroundColor3 = GUI_SETTINGS.BackgroundColor
GetfenvFrame.Parent = MainFrame

local GetfenvLabel = Instance.new("TextLabel")
GetfenvLabel.Name = "GetfenvLabel"
GetfenvLabel.Size = UDim2.new(0.8, 0, 1, 0)
GetfenvLabel.Position = UDim2.new(0, 0, 0, 0)
GetfenvLabel.BackgroundColor3 = GUI_SETTINGS.BackgroundColor
GetfenvLabel.TextColor3 = GUI_SETTINGS.TextColor
GetfenvLabel.Font = GUI_SETTINGS.Font
GetfenvLabel.FontSize = GUI_SETTINGS.FontSize
GetfenvLabel.Text = "เปิดใช้งานสภาพแวดล้อมการทำซ้ำ:"
GetfenvLabel.TextXAlignment = Enum.TextXAlignment.Left
GetfenvLabel.Parent = GetfenvFrame

local GetfenvCheckBox = Instance.new("TextButton")
GetfenvCheckBox.Name = "GetfenvCheckBox"
GetfenvCheckBox.Size = UDim2.new(0.15, 0, 1, 0)
GetfenvCheckBox.Position = UDim2.new(0.85, 0, 0, 0)
GetfenvCheckBox.BackgroundColor3 = GUI_SETTINGS.AccentColor
GetfenvCheckBox.TextColor3 = Color3.fromRGB(255, 255, 255)
GetfenvCheckBox.Font = GUI_SETTINGS.Font
GetfenvCheckBox.FontSize = GUI_SETTINGS.FontSize
GetfenvCheckBox.Text = "✔"
GetfenvCheckBox.Parent = GetfenvFrame

local getfenvEnabled = true
GetfenvCheckBox.MouseButton1Click:Connect(function()
    getfenvEnabled = not getfenvEnabled
    if getfenvEnabled then
        GetfenvCheckBox.BackgroundColor3 = GUI_SETTINGS.AccentColor
        GetfenvCheckBox.Text = "✔"
    else
        GetfenvCheckBox.BackgroundColor3 = GUI_SETTINGS.BorderColor
        GetfenvCheckBox.Text = ""
    end
end)

-- Start Duplication Button
local StartButton = Instance.new("TextButton")
StartButton.Name = "StartButton"
StartButton.Size = UDim2.new(1, 0, 0, 40)
StartButton.BackgroundColor3 = GUI_SETTINGS.AccentColor
StartButton.TextColor3 = Color3.fromRGB(255, 255, 255)
StartButton.Font = GUI_SETTINGS.Font
StartButton.FontSize = Enum.FontSize.Size24
StartButton.Text = "เริ่มการทำซ้ำ"
StartButton.Parent = MainFrame

-- Console Output Area
local ConsoleFrame = Instance.new("Frame")
ConsoleFrame.Name = "ConsoleFrame"
ConsoleFrame.Size = UDim2.new(1, 0, 0, 80)
ConsoleFrame.BackgroundColor3 = GUI_SETTINGS.BorderColor
ConsoleFrame.Parent = MainFrame

local ConsoleOutput = Instance.new("TextLabel")
ConsoleOutput.Name = "ConsoleOutput"
ConsoleOutput.Size = UDim2.new(1, 0, 1, 0)
ConsoleOutput.Position = UDim2.new(0, 0, 0, 0)
ConsoleOutput.BackgroundColor3 = GUI_SETTINGS.BorderColor
ConsoleOutput.TextColor3 = GUI_SETTINGS.TextColor
ConsoleOutput.Font = GUI_SETTINGS.Font
ConsoleOutput.FontSize = Enum.FontSize.Size14
ConsoleOutput.Text = ""
ConsoleOutput.TextXAlignment = Enum.TextXAlignment.Left
ConsoleOutput.TextYAlignment = Enum.TextYAlignment.Top
ConsoleOutput.TextWrapped = true
ConsoleOutput.Parent = ConsoleFrame

local ScrollBar = Instance.new("ScrollingFrame")
ScrollBar.Name = "ScrollBar"
ScrollBar.Size = UDim2.new(1, 0, 1, 0)
ScrollBar.CanvasSize = UDim2.new(0, 0, 0, 0) -- Will be updated dynamically
ScrollBar.BackgroundColor3 = GUI_SETTINGS.BorderColor
ScrollBar.Parent = ConsoleFrame

ConsoleOutput.Parent = ScrollBar

local function logMessage(message: string)
    ConsoleOutput.Text = ConsoleOutput.Text .. "\n" .. message
    -- Auto-scroll to bottom
    ScrollBar.CanvasSize = UDim2.new(0, 0, 0, ConsoleOutput.TextBounds.Y)
    ScrollBar.CanvasPosition = Vector2.new(0, ConsoleOutput.TextBounds.Y - ScrollBar.AbsoluteSize.Y)
end

-- Override print and warn to output to GUI console
local originalPrint = print
local originalWarn = warn

_G.print = function(...)
    local args = {...}
    local message = table.concat(args, "\t")
    logMessage("[PRINT] " .. message)
    originalPrint(message)
end

_G.warn = function(...)
    local args = {...}
    local message = table.concat(args, "\t")
    logMessage("[WARN] " .. message)
    originalWarn(message)
end

-- Original Duplication Script Logic, adapted for GUI

local function isBoomBox(tool)
    return tool:IsA("Tool") and tool.Name == "BoomBox"
end

local function dupeBoombox(amountToDupe, getfenvEnabled)
    logMessage("[✔] Starting dupe cycle...")

    if not getfenvEnabled then
        logMessage("[!] Duplication environment disabled (getfenv=false). Script will not run.")
        return
    end

    -- Find BoomBoxes in backpack only
    local foundAny = false
    for _, tool in pairs(LocalPlayer.Backpack:GetChildren()) do
        if isBoomBox(tool) then
            foundAny = true
            tool.Parent = LocalPlayer.Character
            task.wait(0.2)
            if tool:FindFirstChild("Handle") then
                local handle = tool.Handle
                -- Position the handle near the player's root
                handle.CFrame = LocalPlayer.Character.HumanoidRootPart.CFrame + Vector3.new(0, 2, 0)
                tool.Parent = workspace
                logMessage("[✔] Dropped BoomBox.")
            end
        end
    end

    if not foundAny then
        logMessage("[!] No BoomBoxes found in backpack.")
    end

    -- Kill the player only if we still need to dupe more
    if amountToDupe > 0 then
        local humanoid = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid")
        if humanoid then
            humanoid.Health = 0
            logMessage("[✔] Reset player.")
        end
    end
end

StartButton.MouseButton1Click:Connect(function()
    local amountToDupe = tonumber(AmountTextBox.Text) or 0
    local getfenvStatus = getfenvEnabled

    if amountToDupe <= 0 then
        logMessage("[!] โปรดระบุจำนวนครั้งที่ต้องการทำซ้ำที่ถูกต้อง (มากกว่า 0).")
        return
    end

    logMessage("----------------------------------")
    logMessage("[✔] เริ่มการทำซ้ำ BoomBox...")
    logMessage("จำนวนครั้ง: " .. amountToDupe)
    logMessage("เปิดใช้งาน getfenv: " .. tostring(getfenvStatus))
    logMessage("----------------------------------")

    -- Wait for game and character to load
    logMessage("[...] กำลังรอเกมและตัวละครโหลด...")
    repeat task.wait() until game:IsLoaded()
    repeat task.wait() until LocalPlayer and LocalPlayer.Character and LocalPlayer:FindFirstChild("Backpack") and LocalPlayer.Character:FindFirstChild("Humanoid")
    task.wait(3)
    logMessage("[✔] เกมและตัวละครโหลดแล้ว.")

    -- Duplication loop
    for i = 1, amountToDupe do
        logMessage("[...] รอบการทำซ้ำ: " .. i .. "/" .. amountToDupe)
        repeat task.wait() until LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        task.wait(2)
        dupeBoombox(amountToDupe, getfenvStatus)
        task.wait(6) -- Respawn time
        logMessage("[✔] รอบการทำซ้ำเสร็จสิ้น: " .. i)
    end

    -- Collect only BoomBoxes that are still Tools
    task.wait(3)
    logMessage("[✔] กำลังเก็บ BoomBoxes ที่ถูกดรอป...")
    for _, obj in pairs(workspace:GetChildren()) do
        if isBoomBox(obj) and not obj:FindFirstAncestorWhichIsA("Player") then
            obj.Parent = LocalPlayer.Backpack
            logMessage("[✔] เก็บ BoomBox แล้ว.")
        end
    end

    logMessage("[✔] การทำซ้ำเสร็จสมบูรณ์.")
    logMessage("----------------------------------")
end

-- Initial log message
logMessage("[✔] GUI โหลดแล้ว. พร้อมใช้งาน.")

