
return function (Model: Instance)
    assert(Model:FindFirstChildOfClass("Humanoid"), "No humanoid found!")
    return Model:FindFirstChildOfClass("Humanoid")
end