local DiscordLib = loadstring(game:HttpGet"https://raw.githubusercontent.com/godcraft998/RobloxScript/refs/heads/main/re-Vanis%20Lib.lua")()

local ReplicatedStorage = game:GetService("ReplicatedStorage");
local Player = game:GetService("Players").LocalPlayer;
local PlayerGui = Player.PlayerGui;
local Values = ReplicatedStorage:WaitForChild("Values"):WaitForChild("Game");
local UnitsInfo = require(ReplicatedStorage:WaitForChild("Shared"):WaitForChild("Info"):WaitForChild("Units"));
local PlayerData = ReplicatedStorage:WaitForChild("Player_Data"):WaitForChild(Player.Name):WaitForChild("Data");
local PlayerCollection = ReplicatedStorage:WaitForChild("Player_Data"):WaitForChild(Player.Name):WaitForChild("Collection");

local win = DiscordLib:Window("discord library")

local MainConfig = {
    ['auto-start'] = false,
    ['auto-replay'] = false,
    ['auto-next'] = false,
    ['unit-loadout'] = {
        ['1'] = {
            ['name'] = nil,
            ['max-upgrade'] = 0
        },
        ['2'] = {
            ['name'] = nil,
            ['max-upgrade'] = 0
        },
        ['3'] = {
            ['name'] = nil,
            ['max-upgrade'] = 0
        },
        ['4'] = {
            ['name'] = nil,
            ['max-upgrade'] = 0
        },
        ['5'] = {
            ['name'] = nil,
            ['max-upgrade'] = 0
        },
        ['6'] = {
            ['name'] = nil,
            ['max-upgrade'] = 0
        }
    }
}

local Main = win:Server("Main", "http://www.roblox.com/asset/?id=6031075938")

local Game = Main:Channel("Game");

Game:Toggle('Vote Start', false, function(toggle)
    MainConfig['auto-start'] = toggle;
end);

Game:Toggle('Auto Replay', false, function(toggle)
    MainConfig['auto-replay'] = toggle;
end);

Game:Toggle('Auto Next', false, function(toggle)
    MainConfig['auto-next'] = toggle;
end);

Game:Toggle('Auto Play Toggle', false, function(toggle)
    local args = {
        [1] = "AutoPlay",
    }

    game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Server"):WaitForChild("Units"):WaitForChild("AutoPlay"):FireServer(unpack(args))
end);

local UpgradesConfig = {
    ['1'] = {
        ['auto-deloy'] = false,
        ['auto-upgrade'] = false,
        ['deloy-if-max'] = false
    },
    ['2'] = {
        ['auto-deloy'] = false,
        ['auto-upgrade'] = false,
        ['deloy-if-max'] = false
    },
    ['3'] = {
        ['auto-deloy'] = false,
        ['auto-upgrade'] = false,
        ['deloy-if-max'] = false
    },
    ['4'] = {
        ['auto-deloy'] = false,
        ['auto-upgrade'] = false,
        ['deloy-if-max'] = false
    },
    ['5'] = {
        ['auto-deloy'] = false,
        ['auto-upgrade'] = false,
        ['deloy-if-max'] = false
    },
    ['6'] = {
        ['auto-deloy'] = false,
        ['auto-upgrade'] = false,
        ['deloy-if-max'] = false
    }
};

local Upgrades = win:Server("Upgrades", "");

local UnitLoadout1 = Upgrades:Channel("UnitLoadout 1");
local UnitLoadout2 = Upgrades:Channel("UnitLoadout 2");
local UnitLoadout3 = Upgrades:Channel("UnitLoadout 3");
local UnitLoadout4 = Upgrades:Channel("UnitLoadout 4");
local UnitLoadout5 = Upgrades:Channel("UnitLoadout 5");
local UnitLoadout6 = Upgrades:Channel("UnitLoadout 6");

UnitLoadout1:Toggle("Auto Deloy", false, function(toggle)
    UpgradesConfig['1']['auto-deloy'] = toggle;
end);

UnitLoadout1:Toggle("Auto Upgrade", false, function(toggle)
    UpgradesConfig['1']['auto-upgrade'] = toggle;
end);

UnitLoadout1:Toggle("Deloy If Max", false, function(toggle)
    UpgradesConfig['1']['deloy-if-max'] = toggle;
end);

UnitLoadout2:Toggle("Auto Deloy", false, function(toggle)
    UpgradesConfig['2']['auto-deloy'] = toggle;
end);

UnitLoadout2:Toggle("Auto Upgrade", false, function(toggle)
    UpgradesConfig['2']['auto-upgrade'] = toggle;
end);

UnitLoadout2:Toggle("Deloy If Max", false, function(toggle)
    UpgradesConfig['2']['deloy-if-max'] = toggle;
end);

UnitLoadout3:Toggle("Auto Deloy", false, function(toggle)
    UpgradesConfig['3']['auto-deloy'] = toggle;
end);

UnitLoadout3:Toggle("Auto Upgrade", false, function(toggle)
    UpgradesConfig['3']['auto-upgrade'] = toggle;
end);

UnitLoadout3:Toggle("Deloy If Max", false, function(toggle)
    UpgradesConfig['3']['deloy-if-max'] = toggle;
end);

UnitLoadout4:Toggle("Auto Deloy", false, function(toggle)
    UpgradesConfig['4']['auto-deloy'] = toggle;
end);

UnitLoadout4:Toggle("Auto Upgrade", false, function(toggle)
    UpgradesConfig['4']['auto-upgrade'] = toggle;
end);

UnitLoadout4:Toggle("Deloy If Max", false, function(toggle)
    UpgradesConfig['4']['deloy-if-max'] = toggle;
end);

UnitLoadout5:Toggle("Auto Deloy", false, function(toggle)
    UpgradesConfig['5']['auto-deloy'] = toggle;
end);

UnitLoadout5:Toggle("Auto Upgrade", false, function(toggle)
    UpgradesConfig['5']['auto-upgrade'] = toggle;
end);

UnitLoadout5:Toggle("Deloy If Max", false, function(toggle)
    UpgradesConfig['5']['deloy-if-max'] = toggle;
end);

UnitLoadout6:Toggle("Auto Deloy", false, function(toggle)
    UpgradesConfig['6']['auto-deloy'] = toggle;
end);

UnitLoadout6:Toggle("Auto Upgrade", false, function(toggle)
    UpgradesConfig['6']['auto-upgrade'] = toggle;
end);

UnitLoadout6:Toggle("Deloy If Max", false, function(toggle)
    UpgradesConfig['6']['deloy-if-max'] = toggle;
end);

local function GetInfo(unitName)
    local unitInfo = UnitsInfo[unitName];
    if unitInfo then
        return unitInfo;
    else
        error("Unit not found: " .. unitName);
    end
end

local function GetMaxUpgrade(unitName)
    local unitInfo = GetInfo(unitName);
    if unitInfo and unitInfo.Upgrade then
        return #unitInfo.Upgrade + 1;
    else
        error("Max upgrade not found for unit: " .. unitName);
    end
end

local function GetUnitLoadout(slot)
    local tag = PlayerData:WaitForChild("UnitLoadout" .. slot).Value;
    local name = nil;

    for _, unit in pairs(PlayerCollection:GetChildren()) do
        if (unit.Tag.Value == tag) then
            name = unit.Name;
            break;
        end
    end

    return name;
end

PlayerGui.ChildAdded:Connect(function(child)
    if (child.Name == 'GameEndedAnimationUI') or (child.Name == 'Flash') then
        child:Destroy();
    end
end)

for i = 1, 6 do
    local slot = tostring(i);
    local unitName = GetUnitLoadout(slot);
    if (unitName ~= nil) then
        print("Unit Name: ", unitName);
        local maxUpgrade = GetMaxUpgrade(unitName);

        MainConfig['unit-loadout'][slot]['name'] = unitName;
        MainConfig['unit-loadout'][slot]['max-upgrade'] = maxUpgrade;
    
        PlayerData:WaitForChild("UnitLoadout" .. slot).Changed:Connect(function()
            local slot = tostring(i);
            local unitName = GetUnitLoadout(slot);
            local maxUpgrade = GetMaxUpgrade(unitName);
    
            MainConfig['unit-loadout'][slot]['name'] = unitName;
            MainConfig['unit-loadout'][slot]['max-upgrade'] = maxUpgrade;
        end)
    end
end

while (true) do
    if (MainConfig['auto-start']) and (Values:WaitForChild("VotePlaying"):WaitForChild("VoteEnabled").Value) then
        game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Server"):WaitForChild("OnGame"):WaitForChild("Voting"):WaitForChild("VotePlaying"):FireServer()
    end

    if (MainConfig['auto-replay']) and (Values:WaitForChild("VoteRetry"):WaitForChild("VoteEnabled").Value) then
        game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Server"):WaitForChild("OnGame"):WaitForChild("Voting"):WaitForChild("VoteRetry"):FireServer()
    end

    if (MainConfig['auto-next']) and (Values:WaitForChild("VoteNext"):WaitForChild("VoteEnabled").Value) then
        game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Server"):WaitForChild("OnGame"):WaitForChild("Voting"):WaitForChild("VoteNext"):FireServer()
    end

    if (Values:WaitForChild("GameRunning").Value) then
        for i = 1, 6 do
            if (UpgradesConfig[tostring(i)]['auto-upgrade']) then
                local unitName = MainConfig['unit-loadout'][tostring(i)]['name'];
                local level = Player:WaitForChild("UnitsFolder"):WaitForChild(unitName):WaitForChild("Upgrade_Folder"):WaitForChild("Level").Value;
                local maxUpgrade = MainConfig['unit-loadout'][tostring(i)]['max-upgrade'];

                if (level < maxUpgrade) then
                    local args = {
                        Player:WaitForChild("UnitsFolder"):WaitForChild(unitName),
                        true
                    }
    
                    game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Server"):WaitForChild("Units"):WaitForChild("Upgrade"):FireServer(unpack(args))
                end
            end
            if (UpgradesConfig[tostring(i)]['auto-deloy']) then
                local unitName = MainConfig['unit-loadout'][tostring(i)]['name'];
                local level = Player:WaitForChild("UnitsFolder"):WaitForChild(unitName):WaitForChild("Upgrade_Folder"):WaitForChild("Level").Value;
                local maxUpgrade = MainConfig['unit-loadout'][tostring(i)]['max-upgrade'];

                if (UpgradesConfig[tostring(i)]['deloy-if-max'] and (level >= maxUpgrade)) or not (UpgradesConfig[tostring(i)]['deloy-if-max']) then
                    local args = {
                        Player:WaitForChild("UnitsFolder"):WaitForChild(unitName),
                        true
                    }

                    game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Server"):WaitForChild("Units"):WaitForChild("Deployment"):FireServer(unpack(args))
                end
            end
            if (UpgradesConfig[tostring(i)]['deloy-if-max']) then
                local unitName = MainConfig['unit-loadout'][tostring(i)]['name'];
                local level = Player:WaitForChild("UnitsFolder"):WaitForChild(unitName):WaitForChild("Upgrade_Folder"):WaitForChild("Level").Value;
                local maxUpgrade = MainConfig['unit-loadout'][tostring(i)]['max-upgrade'];
    
                print("Unit Name: ", unitName);

                if (level >= maxUpgrade) then
                    local args = {
                        Player:WaitForChild("UnitsFolder"):WaitForChild(unitName),
                        true
                    }
    
                    game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Server"):WaitForChild("Units"):WaitForChild("Deployment"):FireServer(unpack(args))
                end
            end
        end
    end

    wait(0.5);
end
