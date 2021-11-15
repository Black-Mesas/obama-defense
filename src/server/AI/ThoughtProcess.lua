local ThoughtProcess = {}

export type ThoughtProcess = {
    CurrentState: string,
    States: {
        [string]: (self: ThoughtProcess) -> string?
    },
    Think: (self: ThoughtProcess) -> ()
}

function ThoughtProcess.new()
    local self: ThoughtProcess = {}

    -- States is a table of strings to functions. Each function should return
    -- either nil (don't change state) or a string (state to change to).
    self.States = {}
    self.CurrentState = "Idle"

    function self:Think()
        local output = self.States[self.CurrentState](self)
        if output ~= nil then
            self.CurrentState = output
        end
    end

    return self
end

return ThoughtProcess
