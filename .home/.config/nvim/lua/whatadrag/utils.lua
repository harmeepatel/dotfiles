local M = {}

function M.Get_file_extension(file_name)
    local parts = {}
    for i in string.gmatch(file_name, ".[^.]+$") do
        parts[#parts + 1] = i
    end
    return parts[1]
end

function M.Get_file_name_without_extension(file_name)
    return string.gsub(file_name, ".[^.]+$", "", 1)
end

return M
