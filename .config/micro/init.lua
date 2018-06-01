function cutSelectionOrLine()
    local view = CurView()
    if view.Cursor:HasSelection() then
        view:Cut(true)
    else
        view:CutLine(true)
    end
end

function replace()
    local input, canceled = messenger:Prompt("> ", "replace ", "", 0)
    if not canceled then
        HandleCommand(input)
    end
end