vim.opt.laststatus = 2
local group        = vim.api.nvim_create_augroup("Statusline", { clear = true })


Statusline   = {}
-- mauve="#cba6f7", red="#f38ba8", maroon="#eba0ac", peach="#fab387", yellow="#f9e2af", green="#a6e3a1", sky="#89dceb", blue="#89b4fa",
local colors = require("catppuccin.palettes.mocha")

colors.white = "#ffffff"
colors.green = "#44aa44"
colors.error = "#ff7777"
colors.warn  = "#fae366"
colors.info  = "#5e94ff"
colors.hint  = colors.mauve


--- Attach a color to an display_item for the statusline
---@param hltable table { display_item, hl_name, bg, fg, blend, bold, italic, dim }
---@return string formatted statusline section
function Statusline.attach_color(hltable)
    if not hltable.display_item and true then
        error("Section Item Required!")
        return ""
    end
    -- unpack values with defaults
    local display_item = hltable.display_item or ""
    local hl_name      = hltable.hl_name or "StatusLineCustom"
    local bg           = hltable.bg or nil
    local fg           = hltable.fg or nil
    local blend        = hltable.blend or 20
    local bold         = hltable.bold or false
    local italic       = hltable.italic or false
    local dim          = hltable.dim or false

    vim.api.nvim_set_hl(0, hl_name, {
        bg     = bg,
        fg     = fg,
        bold   = bold,
        italic = italic,
        blend  = blend,
        dim    = dim,
    })

    return "%#" .. hl_name .. "#" .. display_item .. "%*"
end

--- Attach color to icon+count
--- @param symbol string icon
--- @param count number count
--- @param hl_name string hl_name
--- @param color string color
--- @return string attach color to icon+count
function Statusline.format_sym_count(symbol, count, hl_name, color)
    if count and count ~= 0 then
        return Statusline.attach_color({ display_item = symbol .. " " .. count, hl_name = hl_name, fg = color })
    end
    return ""
end

Statusline.separator = Statusline.attach_color({
    display_item = " | ",
    hl_name = "StatusLineSeperator",
    fg = colors.white,
    bold = true,
    dim = true
})

--- Attach color to icon+count
--- @return string git_status formatted git status
function Statusline.git()
    local git_info = vim.b.gitsigns_status_dict
    if not git_info or git_info.head == "" then return "" end

    local items = {
        Statusline.format_sym_count("", git_info.head, "StatusLineGitHead", colors.blue),
        Statusline.format_sym_count("", git_info.added, "StatusLineGitAdded", colors.green),
        Statusline.format_sym_count("", git_info.changed, "StatusLineGitChanged", colors.warn),
        Statusline.format_sym_count("", git_info.removed, "StatusLineGitRemoved", colors.error)
    }

    local formatted_str = table.concat(vim.tbl_filter(function(item) return item ~= "" end, items), " ")

    if formatted_str ~= "" then
        return formatted_str .. Statusline.separator
    end

    return ""
end

--- Attach color to icon+count
--- @return string diagnostics formatted diagnostics
function Statusline.diagnostic()
    local count = { 0, 0, 0, 0 }
    for _, diagnostic in ipairs(vim.diagnostic.get(0)) do
        count[diagnostic.severity] = count[diagnostic.severity] + 1
    end

    -- List of diagnostic fields with their respective symbols and colors
    local items = {
        Statusline.format_sym_count("", count[vim.diagnostic.severity.ERROR], "StatusLineDErrr", colors.error),
        Statusline.format_sym_count("", count[vim.diagnostic.severity.WARN], "StatusLineDWarn", colors.warn),
        Statusline.format_sym_count("", count[vim.diagnostic.severity.INFO], "StatusLineDInfo", colors.info),
        Statusline.format_sym_count("", count[vim.diagnostic.severity.HINT], "StatusLineDHint", colors.hint)
    }

    -- Concatenate non-empty items and add separator if necessary
    local formatted_str = table.concat(vim.tbl_filter(function(item) return item ~= "" end, items), " ")

    -- Add separator if there's any non-empty item
    if formatted_str ~= "" then
        return Statusline.separator .. formatted_str
    end

    return ""
end

--- Attach a color to an Current Vim Mode
---@return table mode { current_mode, fg_color }
function Statusline.mode()
    local modes = {
        n = { " NORMAL  ", colors.yellow },
        i = { " INSERT  ", colors.mauve },
        v = { " VISUAL  ", colors.sky },
        V = { " V-LINE  ", colors.sky },
        c = { " COMMAND ", colors.peach },
        s = { " SELECT  ", colors.maroon },
        R = { " REPLACE ", colors.red },
    }

    local m = vim.fn.mode()
    if modes[m] then
        return { modes[m][1], modes[m][2] }
    else
        return { m, "#ffffff" }
    end
end

function Statusline.lsp()
    if #vim.lsp.get_clients() > 0 then
        return vim.lsp.get_clients()[1].config.name .. Statusline.separator
    else
        return ""
    end
end

--- Concat all the sections and return
---@return string statusline formatted statusline
function Statusline.format(sections)
    local statusline = ""
    for _, s in ipairs(sections) do
        statusline = statusline .. Statusline.attach_color(s)
    end
    return statusline
end

function Statusline.active()
    local sections = {
        { display_item = Statusline.mode()[1]:upper(), hl_name = "StatusLineMode", fg = Statusline.mode()[2] },
        { display_item = "%F",                         hl_name = "StatusLineFile", fg = colors.sky,          bold = true },
        { display_item = Statusline.diagnostic(),      hl_name = "StatusLineGit",  fg = colors.sky },
        { display_item = "%=" },
        { display_item = Statusline.git(),             hl_name = "StatusLineGit",  fg = colors.sky },
        { display_item = Statusline.lsp(),             hl_name = "StatusLineLsp",  bold = true },
        { display_item = "%l:%c",                      hl_name = "StatusLinePos",  fg = colors.sky },
    }

    return Statusline.format(sections)
end

function Statusline.inactive()
    local sections = {
        { display_item = "%F",                        hl_name = "StatusLineFile", fg = colors.sky, bold = true, dim = true },
        { display_item = "%=" },
        { display_item = "%{v:lua.Statusline.git()}", hl_name = "StatusLineGit",  fg = colors.sky, dim = true },
    }

    return Statusline.format(sections)
end

vim.api.nvim_create_autocmd({ "WinEnter", "BufEnter" }, {
    group = group,
    desc = "Activate statusline on focus",
    callback = function()
        vim.opt_local.statusline = "%!v:lua.Statusline.active()"
    end,
})

vim.api.nvim_create_autocmd({ "WinLeave", "BufLeave" }, {
    group = group,
    desc = "Deactivate statusline when unfocused",
    callback = function()
        vim.opt_local.statusline = "%!v:lua.Statusline.inactive()"
    end,
})
