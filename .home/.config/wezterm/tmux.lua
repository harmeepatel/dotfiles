local wezterm = require 'wezterm'
local M = {}

function M.run_tmux_on_startup(config)
    local tmux_version_handle = io.popen("\\ls /usr/local/Cellar/tmux | awk '{print$0}' | head -1")
    local tmux_session_handle = io.popen("tmux a")

    if tmux_version_handle == '' or tmux_version_handle == nil then
        wezterm.log_error('tmux_version_handle not found')
        return config
    end

    if tmux_session_handle == '' or tmux_session_handle == nil then
        wezterm.log_error('tmux_session_handle not found')
        return config
    end

    local tmux_version = string.gsub(tmux_version_handle:read('*a'), '%s+', '') -- remove whitespaces '%s+'

    wezterm.log_error("tmux_session_handle: " .. string.gsub(tmux_session_handle:read('*a'), '%s+', ''))

    if string.gsub(tmux_session_handle:read('*a'), '%s+', '') == 'no sessions' or string.gsub(tmux_session_handle:read('*a'), '%s+', '') == '' then
        local username_handle = io.popen('echo $USER')
        if username_handle == nil then
            return config
        end
        local username = string.gsub(username_handle:read('*a'), '%s+', '')
        config.default_prog = { '/usr/local/Cellar/tmux/' .. tmux_version .. '/bin/tmux', 'new', '-s', username }
        username_handle:close()
    else
        config.default_prog = { '/usr/local/Cellar/tmux/' .. tmux_version .. '/bin/tmux', 'a' }
    end

    tmux_version_handle:close()
    tmux_session_handle:close()

    return config
end

return M
