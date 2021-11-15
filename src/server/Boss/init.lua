local CollectionService = game:GetService("CollectionService")

local Boss = {}

local function FetchHumanoid(Model: Instance)
    assert(Model:FindFirstChildOfClass("Humanoid"), "No humanoid found!")
    return Model:FindFirstChildOfClass("Humanoid")
end

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
