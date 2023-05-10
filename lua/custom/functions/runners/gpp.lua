print(
  [[
Now :Gpp command will run the following:
  g++ -std=c++17 -I ./*.cpp ./**/*.cpp -o $PWD-exec
]]
)

return {
  vim.api.nvim_create_user_command("Gpp", function()
    local lib = require 'custom.functions.runners.lib.runners-helper'
    local cmd = [[g++ -std=c++17 -I ./*.cpp ./**/*.cpp -o $PWD-exec]]
    local vim_cmd = lib.build_term_split_string(cmd)
    if vim_cmd then
      vim.cmd(vim_cmd)
    end
  end, {}),
}
