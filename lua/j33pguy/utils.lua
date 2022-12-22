--local cmd = vim.cmd
--lgcal fn = vim.fn

local M = {}

M.notify = function(message,level, title)
    local notify_options = {
        title = title,
        timeout = 2000,
    }
    vim.api.nvim_notify(message,level,notify_options)
end

M.path_exists = function (path)
    local ok = vim.loop.fs_stat(path)
    return ok
end

M.telscope_find_files = function()
    local path = vim.loop.cmd() .. "/.git"
    if M.path_exists(path) then
        return "Telescope git_files"
    else
        return "Telescope find_files"
    end
end

return M
