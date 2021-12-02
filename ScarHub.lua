-- esp options
PLAYER  = game.Players.LocalPlayer
MOUSE   = PLAYER:GetMouse()
CC      = game.Workspace.CurrentCamera

ENABLED      = false
ESP_ENABLED  = false

_G.FREE_FOR_ALL = false

_G.BIND        = 50
_G.ESP_BIND    = 52
_G.CHANGE_AIM  = 'gfdkdfvdgfdgccv'

_G.AIM_AT = 'Head'

function kill(a)
   	local A_1 =
   	{
   	   	[1] = {
   	      	["RayObject"] = Ray.new(Vector3.new(845.555908, 101.429337, 2269.43945), Vector3.new(-391.152252, 8.65560055, -83.2166901)),
   	      	["Distance"] = 3.2524313926697,
   	      	["Cframe"] = CFrame.new(840.310791, 101.334137, 2267.87988, 0.0636406094, 0.151434347, -0.986416459, 0, 0.988420188, 0.151741937, 0.997972965, -0.00965694897, 0.0629036576),
   	      	["Hit"] = a.Character.Head
   	   	},
   	   	[2] = {
   	      	["RayObject"] = Ray.new(Vector3.new(845.555908, 101.429337, 2269.43945), Vector3.new(-392.481476, -8.44939327, -76.7261353)),
   	      	["Distance"] = 3.2699294090271,
   	      	["Cframe"] = CFrame.new(840.290466, 101.184189, 2267.93506, 0.0964837447, 0.0589403138, -0.993587971, 4.65661287e-10, 0.998245299, 0.0592165813, 0.995334625, -0.00571343815, 0.0963144377),
   	      	["Hit"] = a.Character.Head
   	   	},
   	   	[3] = {
   	      	["RayObject"] = Ray.new(Vector3.new(845.555908, 101.429337, 2269.43945), Vector3.new(-389.21701, -2.50536323, -92.2163162)),
   	      	["Distance"] = 3.1665518283844,
   	      	["Cframe"] = CFrame.new(840.338867, 101.236496, 2267.80371, 0.0166504811, 0.0941716284, -0.995416701, 1.16415322e-10, 0.995554805, 0.0941846818, 0.999861419, -0.00156822044, 0.0165764652),
   	      	["Hit"] = a.Character.Head
   	   	},
   	   	[4] = {
   	      	["RayObject"] = Ray.new(Vector3.new(845.555908, 101.429337, 2269.43945), Vector3.new(-393.353973, 3.13988972, -72.5452042)),
   	      	["Distance"] = 3.3218522071838,
   	      	["Cframe"] = CFrame.new(840.277222, 101.285957, 2267.9707, 0.117109694, 0.118740402, -0.985994935, -1.86264515e-09, 0.992826641, 0.119563118, 0.993119001, -0.0140019981, 0.116269611),
   	      	["Hit"] = a.Character.Head
   	   	},
   	   	[5] = {
   	      	["RayObject"] = Ray.new(Vector3.new(845.555908, 101.429337, 2269.43945), Vector3.new(-390.73172, 3.2097764, -85.5477524)),
   	      	["Distance"] = 3.222757101059,
   	      	["Cframe"] = CFrame.new(840.317993, 101.286423, 2267.86035, 0.0517584644, 0.123365127, -0.991010666, 0, 0.992340803, 0.123530701, 0.99865967, -0.00639375951, 0.0513620302),
   	      	["Hit"] = a.Character.Head
   	   }
   	}
   	local A_2 = game.Players.LocalPlayer.Backpack["Remington 870"]
   	local Event = game:GetService("ReplicatedStorage").ShootEvent
   	Event:FireServer(A_1, A_2)
   	Event:FireServer(A_1, A_2)
end

game:GetService('RunService').RenderStepped:connect(function()
	if ENABLED then
		local TARGET = GetNearestPlayerToMouse()
		if (TARGET ~= false) then
			local AIM = TARGET.Character:FindFirstChild(_G.AIM_AT)
			if AIM then
				CC.CoordinateFrame = CFrame.new(CC.CoordinateFrame.p, AIM.CFrame.p)
			end
			GUI_TARGET.Text = 'AIMBOT : '.. TARGET.Name:sub(1, 5)
		else
			GUI_TARGET.Text = 'AIMBOT : OFF'
		end
	end
end)

repeat
	wait()
	if ESP_ENABLED == true then
		FIND()
	end
until ESP_ENABLED == false
function GetNearestPlayerToMouse()
	local PLAYERS      = {}
	local PLAYER_HOLD  = {}
	local DISTANCES    = {}
	for i, v in pairs(game.Players:GetPlayers()) do
		if v ~= PLAYER then
			table.insert(PLAYERS, v)
		end
	end
	for i, v in pairs(PLAYERS) do
		if _G.FREE_FOR_ALL == false then
			if v and (v.Character) ~= nil and v.TeamColor ~= PLAYER.TeamColor then
				local AIM = v.Character:FindFirstChild(_G.AIM_AT)
				if AIM ~= nil then
					local DISTANCE                 = (AIM.Position - game.Workspace.CurrentCamera.CoordinateFrame.p).magnitude
					local RAY                      = Ray.new(game.Workspace.CurrentCamera.CoordinateFrame.p, (MOUSE.Hit.p - CC.CoordinateFrame.p).unit * DISTANCE)
					local HIT,POS                  = game.Workspace:FindPartOnRay(RAY, game.Workspace)
					local DIFF                     = math.floor((POS - AIM.Position).magnitude)
					PLAYER_HOLD[v.Name .. i]       = {}
					PLAYER_HOLD[v.Name .. i].dist  = DISTANCE
					PLAYER_HOLD[v.Name .. i].plr   = v
					PLAYER_HOLD[v.Name .. i].diff  = DIFF
					table.insert(DISTANCES, DIFF)
				end
			end
		elseif _G.FREE_FOR_ALL == true then
			local AIM = v.Character:FindFirstChild(_G.AIM_AT)
			if AIM ~= nil then
				local DISTANCE                 = (AIM.Position - game.Workspace.CurrentCamera.CoordinateFrame.p).magnitude
				local RAY                      = Ray.new(game.Workspace.CurrentCamera.CoordinateFrame.p, (MOUSE.Hit.p - CC.CoordinateFrame.p).unit * DISTANCE)
				local HIT,POS                  = game.Workspace:FindPartOnRay(RAY, game.Workspace)
				local DIFF                     = math.floor((POS - AIM.Position).magnitude)
				PLAYER_HOLD[v.Name .. i]       = {}
				PLAYER_HOLD[v.Name .. i].dist  = DISTANCE
				PLAYER_HOLD[v.Name .. i].plr   = v
				PLAYER_HOLD[v.Name .. i].diff  = DIFF
				table.insert(DISTANCES, DIFF)
			end
		end
	end
	
	if unpack(DISTANCES) == nil then
		return false
	end
	
	local L_DISTANCE = math.floor(math.min(unpack(DISTANCES)))
	if L_DISTANCE > 20 then
		return false
	end
	
	for i, v in pairs(PLAYER_HOLD) do
		if v.diff == L_DISTANCE then
			return v.plr
		end
	end
	return false
end

local TRACK = false

function CREATE(BASE, TEAM)
	local ESP_MAIN                   = Instance.new('BillboardGui', PLAYER.PlayerGui)
	local ESP_DOT                    = Instance.new('Frame', ESP_MAIN)
	local ESP_NAME                   = Instance.new('TextLabel', ESP_MAIN)
	
	ESP_MAIN.Name                    = 'ESP'
	ESP_MAIN.Adornee                 = BASE
	ESP_MAIN.AlwaysOnTop             = true
	ESP_MAIN.ExtentsOffset           = Vector3.new(0, 1, 0)
	ESP_MAIN.Size                    = UDim2.new(0, 5, 0, 5)
	
	ESP_DOT.Name                     = 'DOT'
	ESP_DOT.BackgroundColor          = BrickColor.new('Bright red')
	ESP_DOT.BackgroundTransparency   = 0.3
	ESP_DOT.BorderSizePixel          = 0
	ESP_DOT.Position                 = UDim2.new(-0.5, 0, -0.5, 0)
	ESP_DOT.Size                     = UDim2.new(2, 0, 2, 0)
	ESP_DOT.Visible                  = true
	ESP_DOT.ZIndex                   = 10
	
	ESP_NAME.Name                    = 'NAME'
	ESP_NAME.BackgroundColor3        = Color3.new(255, 255, 255)
	ESP_NAME.BackgroundTransparency  = 1
	ESP_NAME.BorderSizePixel         = 0
	ESP_NAME.Position                = UDim2.new(0, 0, 0, -40)
	ESP_NAME.Size                    = UDim2.new(1, 0, 10, 0)
	ESP_NAME.Visible                 = true
	ESP_NAME.ZIndex                  = 10
	ESP_NAME.Font                    = 'ArialBold'
	ESP_NAME.FontSize                = 'Size14'
	ESP_NAME.Text                    = BASE.Parent.Name:upper()
	ESP_NAME.TextColor               = BrickColor.new('Bright red')
end

function CLEAR()
	for _,v in pairs(PLAYER.PlayerGui:children()) do
		if v.Name == 'ESP' and v:IsA('BillboardGui') then
			v:Destroy()
		end
	end
end

function FIND()
	CLEAR()
	TRACK = true
	spawn(function()
		while wait() do
			if TRACK then
				CLEAR()
				for i,v in pairs(game.Players:GetChildren()) do
					if v.Character and v.Character:FindFirstChild('Head') then
						if _G.FREE_FOR_ALL == false then
							if v.TeamColor ~= PLAYER.TeamColor then
								if v.Character:FindFirstChild('Head') then
									CREATE(v.Character.Head, true)
								end
							end
						else
							if v.Character:FindFirstChild('Head') then
								CREATE(v.Character.Head, true)
							end
						end
					end
				end
			end
		end
		wait(1)
	end)
end

-- color
local colors = {
    SchemeColor = Color3.fromRGB(140, 0, 255),
    Background = Color3.fromRGB(100, 100, 100),
    Header = Color3.fromRGB(27, 27, 27),
    TextColor = Color3.fromRGB(255, 255, 255),
    ElementColor = Color3.fromRGB(45, 45, 45)
}

-- loading libraries
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("ScarHub", colors)

-- tabs
local global = Window:NewTab("Main")
local plife2 = Window:NewTab("Prison Life")
local aimvisual = Window:NewTab("Aim & Visuals")
local config = Window:NewTab("Config")

-- sections
local main = global:NewSection("Localplayer")
local gunsettings = plife2:NewSection("Gun options")
local misc = plife2:NewSection("Misc")
local keybinds = config:NewSection("Keybinds")
local aimssec = aimvisual:NewSection("Aim")
local visualssec = aimvisual:NewSection("Visuals")

-- aimvisuals
aimssec:NewToggle("Aimbot enabled", "Aims at enemyes automatically.", function(state)
	if state then
		ENABLED = true
	else
		ENABLED = false
	end
end)
aimssec:NewToggle("Aim on key", "Aims when key pressed.", function(state)
	if state then
		aimonkey = true
	else
		aimonkey = false
	end
end)
aimssec:NewToggle("Team check", "FFA Mode.", function(state)
	if state then
		FREE_FOR_ALL = true
	else
		FREE_FOR_ALL = false
	end
end)
aimssec:NewDropdown("Aim at", "Aim spot.", {"Head", "Torso"}, function(currentOption)
	if currentOption == "Head" then
		AIM_AT = "Head"
	else
		AIM_AT = "Torso"
	end
end)
aimssec:NewButton("Kill all", "Kills everyone.", function()
	workspace.Remote.TeamEvent:FireServer("Medium stone grey")

	game.Workspace.Remote.ItemHandler:InvokeServer(workspace.Prison_ITEMS.giver["Remington 870"].ITEMPICKUP)
	
	wait(0.5)
	
	for i,v in pairs(game.Players:GetChildren())do
	   	if v.Name ~= game.Players.LocalPlayer.Name then
	   	   	kill(v)
	   	end
	end
	wait(1)
end)
-- visualssec
visualssec:NewToggle("ESP", "Wallhack", function(state)
    if state then
        ESP_ENABLED = true
    else
        ESP_ENABLED = false
    end
end)

-- global
main:NewSlider("WalkSpeed", "Changes localplayer`s walkspeed.", 500, 16, function(s)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end)
main:NewSlider("JumpPower", "Changes localplayer`s jumppower.", 500, 50, function(s)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = s
end)
-- prison life
main:NewButton("BTools", "Gives the localplayer an builder tools.", function()
    local tool1 = Instance.new("HopperBin", game.Players.LocalPlayer.Backpack)
    local tool2 = Instance.new("HopperBin", game.Players.LocalPlayer.Backpack)
    local tool3 = Instance.new("HopperBin", game.Players.LocalPlayer.Backpack)
    local tool4 = Instance.new("HopperBin", game.Players.LocalPlayer.Backpack)
    local tool5 = Instance.new("HopperBin", game.Players.LocalPlayer.Backpack)

    tool1.BinType = "Clone"
    tool2.BinType = "GameTool"
    tool3.BinType = "Hammer"
    tool4.BinType = "Script"
    tool5.BinType = "Grab"
end)

-- prison life 2
gunsettings:NewDropdown("Give gun", "Gives the localplayer a gun.", {"M9", "Remington 870", "AK-47"}, function(currentOption)
    Workspace.Remote.ItemHandler:InvokeServer(Workspace.Prison_ITEMS.giver[currentOption].ITEMPICKUP)
end)
gunsettings:NewDropdown("Gun modify", "Changes the gun states to max.", {"M9", "Remington 870", "AK-47"}, function(currentOption)
    local player = game:GetService("Players").LocalPlayer
    local gun = player.Backpack:FindFirstChild(currentOption)
    local sM = require(gun:FindFirstChild("GunStates"))
    sM["Damage"] = math.huge
    sM["MaxAmmo"] = math.huge
    sM["StoredAmmo"] = math.huge
    sM["FireRate"] = 0.000001
    sM["AmmoPerClip"] = 7
    sM["Range"] = math.huge
    sM["ReloadTime"] = 0.000001
    sM["Bullets"] = 7
    sM["AutoFire"] = true
end)
gunsettings:NewDropdown("Damage hack", "Damage hacking.", {"M9", "Remington 870", "AK-47"}, function(currentOption)
    local player = game:GetService("Players").LocalPlayer
    local gun = player.Backpack:FindFirstChild(currentOption)
    local sM = require(gun:FindFirstChild("GunStates"))
    sM["Damage"] = 1337
end)

-- misc
misc:NewToggle("Garage", "You can open and close the garage.", function(state)
    if state then
        workspace.Remote.ItemHandler:InvokeServer(unpack({
            [1] = workspace["Prison_ITEMS"].buttons["Garage Buttons"].open,
        }))
    else
        workspace.Remote.ItemHandler:InvokeServer(unpack({
            [1] = workspace["Prison_ITEMS"].buttons["Garage Buttons"].close,
        }))
    end
end)
misc:NewButton("No doors", "Removes doors.", function()
    game.Workspace.Doors:Destroy()
end)
misc:NewButton("No walls", "Removes walls", function()
    game.Workspace.Prison_Guard_Outpost:Remove()
    game.Workspace.Prison_Cafeteria.building:Remove()
    game.Workspace.Prison_Cafeteria.glass:Remove()
    game.Workspace.Prison_Cafeteria.oven:Remove()
    game.Workspace.Prison_Cafeteria.shelves:Remove()
    game.Workspace.Prison_Cafeteria.vents:Remove()
    game.Workspace.Prison_Cafeteria.accents:Remove()
    game.Workspace.Prison_Cafeteria.vendingmachine:Remove()
    game.Workspace.Prison_Cafeteria.Prison_table1:Remove()
    game.Workspace.Prison_Cafeteria.counter:Remove()
    game.Workspace.Prison_Cafeteria.boxes:Remove()
end)
misc:NewDropdown("Team", "Switch your team.", {"Police", "Prisoner"}, function(currentOption)
    if currentOption == "Police" then
        Workspace.Remote.TeamEvent:FireServer("Bright blue")
    elseif currentOption == "Prisoner" then
        Workspace.Remote.TeamEvent:FireServer("Bright orange")
    end
end)

-- config
keybinds:NewKeybind("Menu", "Toggles UI.", Enum.KeyCode.Z, function()
    Library:ToggleUI()
end)
keybinds:NewKeybind("Aimbot", "Aims at enemyes.", Enum.KeyCode.F, function()
	if aimonkey == true then
		ENABLED = true
	else
		ENABLED = false
	end
end)
