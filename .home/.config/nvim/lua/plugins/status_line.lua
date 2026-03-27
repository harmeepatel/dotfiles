vim.opt.laststatus = 2
local group        = vim.api.nvim_create_augroup("Statusline", { clear = true })

Statusline         = {}

-- mauve="#cba6f7", red="#f38ba8", maroon="#eba0ac", peach="#fab387", yellow="#f9e2af", green="#a6e3a1", sky="#89dceb", blue="#89b4fa",
local colors       = require("catppuccin.palettes.mocha")

colors.white       = "#ffffff"
colors.green       = "#44aa44"
colors.error       = "#ff7777"
colors.warn        = "#fae366"
colors.info        = "#5e94ff"
colors.hint        = colors.mauve


-- {
local Section = {}
Section.__index = Section

--- Constructor
---@param opts table { display_item, hl_name, bg, fg, bold, italic, dim }
function Section:new(opts)
    local obj = {
        display_item = opts.display_item or "",
        hl_name      = opts.hl_name or "StatusLineCustom",
        bg           = opts.bg,
        fg           = opts.fg,
        bold         = opts.bold or false,
        italic       = opts.italic or false,
        dim          = opts.dim or false,
    }
    setmetatable(obj, self)
    return obj
end

--- Attach a color to an display_item for the statusline
---@return string formatted statusline section
function Section:attach_color()
    if self.display_item == "" then
        return ""
    end

    vim.api.nvim_set_hl(0, self.hl_name, {
        bg     = self.bg,
        fg     = self.fg,
        bold   = self.bold,
        italic = self.italic,
        dim    = self.dim,
    })

    return "%#" .. self.hl_name .. "#" .. self.display_item .. "%*"
end

--- Attach color to icon+count
--- @param icon string icon
--- @param count number count
--- @param hl_name string hl_name
--- @param color string color
--- @return string attach color to icon+count
function Section:format_icon(icon, count, hl_name, color)
    local fmt_icon = Section:new({ display_item = icon .. " " .. count, hl_name = hl_name, fg = color })
    if count and count ~= 0 then
        return fmt_icon:attach_color()
    end
    return ""
end

--}

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

--- Attach color to icon+count
--- @param dim boolean dim the git status
--- @return string git_status formatted git status
function Statusline.git(dim)
    local git_info = vim.b.gitsigns_status_dict
    if not git_info or git_info.head == "" then return "" end

    local git_fields = {
        { icon = "", key = "head", hl_name = "StatusLineGitHead", fg = colors.blue },
        { icon = "", key = "added", hl_name = "StatusLineGitAdded", fg = colors.green },
        { icon = "", key = "changed", hl_name = "StatusLineGitChanged", fg = colors.warn },
        { icon = "", key = "removed", hl_name = "StatusLineGitRemoved", fg = colors.error },
    }

    local items = {}

    for _, field in ipairs(git_fields) do
        local val = git_info[field.key]
        if val and val ~= 0 and val ~= "" then
            table.insert(items, Section:new({
                display_item = field.icon .. " " .. val,
                hl_name      = field.hl_name,
                fg           = dim and colors.white or field.fg,
                dim          = dim,
            }))
        end
    end

    local formatted_str = table.concat(vim.tbl_map(function(sec)
        return sec:attach_color()
    end, items), " ")

    if formatted_str ~= "" then
        return Statusline.separator .. formatted_str
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

    local diag_types = {
        { icon = "", severity = vim.diagnostic.severity.ERROR, hl_name = "StatusLineDErrr", fg = colors.error },
        { icon = "", severity = vim.diagnostic.severity.WARN, hl_name = "StatusLineDWarn", fg = colors.warn },
        { icon = "", severity = vim.diagnostic.severity.INFO, hl_name = "StatusLineDInfo", fg = colors.info },
        { icon = "", severity = vim.diagnostic.severity.HINT, hl_name = "StatusLineDHint", fg = colors.hint },
    }

    local items = {}

    for _, dt in ipairs(diag_types) do
        local n = count[dt.severity]
        if n > 0 then
            table.insert(items, Section:new({
                display_item = dt.icon .. " " .. n,
                hl_name      = dt.hl_name,
                fg           = dt.fg,
            }))
        end
    end

    local formatted_str = table.concat(vim.tbl_map(function(sec) return sec:attach_color() end, items), " ")

    if formatted_str ~= "" then
        return Statusline.separator .. formatted_str
    end

    return ""
end

function Statusline.lsp()
    if #vim.lsp.get_clients() > 0 then
        return Statusline.separator .. vim.lsp.get_clients()[1].config.name
    else
        return ""
    end
end

--- Concat all the sections and return
---@return Section sections statusline formatted statusline
function Statusline.generate_statusline(sections)
    local statusline = ""
    for _, section in ipairs(sections) do
        statusline = statusline .. section:attach_color()
    end
    return statusline
end

Statusline.separator = Section:new({
    display_item = " | ",
    hl_name = "StatusLineSeperator",
    fg = colors.white,
    bold = true,
    dim = true
}):attach_color()

function Statusline.active()
    return Statusline.generate_statusline({
        Section:new({ display_item = Statusline.mode()[1]:upper(), hl_name = "StatusLineMode", fg = Statusline.mode()[2] }),
        Section:new({ display_item = "%f", hl_name = "StatusLineFile", fg = colors.sky, bold = true }),
        Section:new({ display_item = Statusline.git(false), hl_name = "StatusLineGit", fg = colors.sky }),
        Section:new({ display_item = Statusline.diagnostic(), hl_name = "StatusLineGit", fg = colors.sky }),
        Section:new({ display_item = "%=" }),
        Section:new({ display_item = "%l:%c", hl_name = "StatusLinePos", fg = colors.sky }),
        Section:new({ display_item = Statusline.lsp(), hl_name = "StatusLineLsp", bold = true }),
    })
end

function Statusline.inactive()
    return Statusline.generate_statusline({
        Section:new({ display_item = "%f", hl_name = "StatusLineFile", fg = colors.white, bold = true, dim = true }),
        Section:new({ display_item = Statusline.git(true), hl_name = "StatusLineGit" }),
    })
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
