vim.api.nvim_create_user_command("Run", function()
        local ft = vim.bo.filetype
        if (ft == "zig") then
            vim.cmd("!zig build run")
        end
    end,
    {}
)
