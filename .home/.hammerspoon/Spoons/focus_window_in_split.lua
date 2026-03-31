local function getVisibleWindows()
    local winFilter = hs.window.filter.new():setCurrentSpace(true)
    return winFilter:getWindows()
end

local function focusLeftWindow()
    local wins = getVisibleWindows()
    if #wins == 0 then return end

    table.sort(wins, function(a, b)
        return a:frame().x < b:frame().x
    end)

    wins[1]:focus()
end

local function focusRightWindow()
    local wins = getVisibleWindows()
    if #wins == 0 then return end

    table.sort(wins, function(a, b)
        return a:frame().x < b:frame().x
    end)

    wins[#wins]:focus()
end

-- Keybindings
hs.hotkey.bind({ "ctrl", "cmd" }, "h", focusLeftWindow)
hs.hotkey.bind({ "ctrl", "cmd" }, "l", focusRightWindow)
