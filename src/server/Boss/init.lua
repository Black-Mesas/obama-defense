local CollectionService = game:GetService("CollectionService")

local FetchHumanoid = require(script.Parent.Util.FetchHumanoid)

local Boss = {}

-- FIXME: I would use metatables, but I want this code to be a bit easier to read
function Boss.new(Model, ThoughtProcess)
    local self = {}
    self.ThoughtProcess = ThoughtProcess
    self.Model = Model
    self.Humanoid = FetchHumanoid(Model)

    CollectionService:AddTag(self.Model, "BossBarOwner")

    function self:Think()
        self.ThoughtProcess:Think()
    end

    function self:OnDeath(func: () -> ())
        self.Humanoid.Died:Connect(func)
    end

    return self
end


return Boss
