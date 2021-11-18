local Players = game:GetService("Players")

return function (id: number)
    local Description: HumanoidDescription = Players:GetHumanoidDescriptionFromUserId(id)
    -- instead of loading straight from the userid, we can just load from description to specify rig type.
    return Players:CreateHumanoidModelFromDescription(Description, Enum.HumanoidRigType.R6)
end