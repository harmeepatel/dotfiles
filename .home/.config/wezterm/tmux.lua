local wezterm = require 'wezterm'
local io = require 'io'

local M = {}

local basename = function(str)
    local name = string.gsub(str, "(.*/)(.*)", "%2")
    return name
end

local is_tmux_running = function()
    local tmux_pid_handle = io.popen("pgrep -o tmux")
    if tmux_pid_handle == nil then
        wezterm.log_error "PROBLEM RUNNING `pgrep -o tmux`"
        return false, true
    end
    local tmux_pid = tmux_pid_handle:read("*a")
    tmux_pid_handle:close()
    return string.gsub(tmux_pid, "\n", '') ~= '' or false, false
end

local get_tmux_bin_path = function()
    local tmux_hb_version_handle = io.popen("\\ls /usr/local/Cellar/tmux | awk '{print$0}' | head -1")
    if tmux_hb_version_handle == nil then
        wezterm.log_error "tmux version handler is nil"
        return '', true
    end
    local tmux_bin_path = "/usr/local/Cellar/tmux/" ..
        string.gsub(tmux_hb_version_handle:read("*a"), "\n", '') ..
        "/bin/tmux"

    tmux_hb_version_handle:close()
    return tmux_bin_path
end

function M.run_tmux_on_startup(config)
    local tmux_bin_path, bin_path_err = get_tmux_bin_path()
    if bin_path_err then
        print("PROBLEM getting tmux bin path.")
        return config
    end

    local tmux_running, tmux_pid_err = is_tmux_running()
    if tmux_pid_err then
        print("PROBLEM running tmux.")
        return config
    end

    if tmux_running then
        config.default_prog = { tmux_bin_path, 'a' }
    else
        config.default_prog = { tmux_bin_path, 'new', '-s', basename(os.getenv("HOME")) }
    end

    return config
end

return M
