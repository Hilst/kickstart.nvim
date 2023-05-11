print([[
:CargoRun command will run the following:
  $ cargo run <args>

:CargoBuild command will run the following:
  $ cargo build

:CargoCheck command will run the following:
  $ cargo check
]])

return {
  vim.api.nvim_create_user_command("CargoRun", function(opts)
    local lib = require 'custom.functions.runners.lib.runners-helper'
    local cmd = [[cargo run]]

    if opts.args then
      print(opts.args)
      cmd = cmd .. string.format(" %s", opts.args)
      print(cmd)
    end

    local vim_cmd = lib.build_term_split_string(cmd)
    if vim_cmd then
      vim.cmd(vim_cmd)
    end
  end, { nargs = '?' }),
  vim.api.nvim_create_user_command("CargoBuild", function()
    local lib = require 'custom.functions.runners.lib.runners-helper'
    local cmd = [[cargo build]]

    local vim_cmd = lib.build_term_split_string(cmd)
    if vim_cmd then
      vim.cmd(vim_cmd)
    end
  end, {}),
  vim.api.nvim_create_user_command("CargoCheck", function()
    local lib = require 'custom.functions.runners.lib.runners-helper'
    local cmd = [[cargo check]]

    local vim_cmd = lib.build_term_split_string(cmd)
    if vim_cmd then
      vim.cmd(vim_cmd)
    end
  end, {}),
}
