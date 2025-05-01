local ReplicatedStorage = game:GetService("ReplicatedStorage");
local UnitsInfo = require(ReplicatedStorage:WaitForChild("Shared"):WaitForChild("Info"):WaitForChild("Units"));

local module = {};

function module:GetInfo(unitName)
    local unitInfo = UnitsInfo[unitName];
    if unitInfo then
        return unitInfo;
    else
        error("Unit not found: " .. unitName);
    end
end

function module:GetMaxUpgrade(unitName)
    local unitInfo = self:GetUnitInfo(unitName);
    if unitInfo and unitInfo.Upgrade then
        return #unitInfo.Upgrade;
    else
        error("Max upgrade not found for unit: " .. unitName);
    end
end

return module;
