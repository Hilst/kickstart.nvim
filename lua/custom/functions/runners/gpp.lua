print([[
Now :Gpp command will run the following:
  $ mkdir -p build
  $ g++ -std=c++17 -I ./*.cpp ./**/*.cpp -o $PWD/build/last_dir_name-exec && $PWD/build/last_dir_name
]])

return {
  vim.api.nvim_create_user_command("Gpp", function()
    local lib = require 'custom.functions.runners.lib.runners-helper'
    local cmd = [[mkdir -p build && g++ -std=c++17 -I ./*.cpp ./**/*.cpp]]

    local pwd = vim.fn.getcwd()
    local parts = lib.split_path_string(pwd)
    local dir = parts.last
    dir = pwd .. "/build/" .. string.format("%s_exec", dir)
    cmd = cmd .. string.format(" -o %s && %s", dir, dir)

    local vim_cmd = lib.build_term_split_string(cmd)
    if vim_cmd then
      vim.cmd(vim_cmd)
    end
  end, {}),
}
