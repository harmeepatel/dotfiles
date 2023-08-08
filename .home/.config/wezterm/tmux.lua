local wezterm = require 'wezterm'
local mux = wezterm.mux
local M = {}

function M.run_tmux_on_startup(config)
    local tmux_hb_version_handle = io.popen("\\ls /usr/local/Cellar/tmux | awk '{print$0}' | head -1")
    -- local echo_tmux = string.gsub(io.popen("echo $TMUX"):read("*a"), "%s+", "")
    local echo_tmux = string.gsub(io.popen("tmux list-sessions &> /dev/null | wc -l"):read("*a"), "%s+", "")

    if tmux_hb_version_handle == '' or tmux_hb_version_handle == nil then
        wezterm.log_error('tmux_hb_version_handle not found')
        return config
    end

    if echo_tmux == nil then
        wezterm.log_error('echo_tmux not found')
        return config
    end

    local tmux_hb_read = tmux_hb_version_handle:read("*a")

    local tmux_hb_version = string.gsub(tmux_hb_read, "%s+", "") -- remove whitespaces '%s+'
    local tmux_bin_path = '/usr/local/Cellar/tmux/' .. tmux_hb_version .. '/bin/tmux'


    wezterm.log_info("TMUX: " .. echo_tmux)

    -- if echo_tmux == '' then
    --     wezterm.log_info("inside: if tmux_env == nil")
    --     wezterm.log_info("TMUX: " .. echo_tmux)
    --     -- config.default_prog = { tmux_bin_path, 'new', '-s', os.getenv("USER") }
    -- else
    --     config.default_prog = { tmux_bin_path, 'a' }
    -- end

    tmux_hb_version_handle:close()

    wezterm.on('gui-startup', function(cmd)
        local _tab, _pane, window = mux.spawn_window({
            args = { tmux_bin_path, 'a' }
        } or {})
        -- window:gui_window()
    end)

    return config
end

return M
