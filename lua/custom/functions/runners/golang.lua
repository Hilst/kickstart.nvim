print([[
Now :GoRun command will run the following:
  $ go run main.go
]])


return {
  vim.api.nvim_create_user_command("GoRun", function(opts)
    local cmd = [[go run %s]]
    local file = opts.args or "main.go"
    local pwd = vim.fn.getcwd()
    cmd = string.format(cmd, pwd .. "/" .. file)
    local lib = require 'custom.functions.runners.lib.runners-helper'
    local vim_cmd = lib.build_term_split_string(cmd)
    if vim_cmd then
      vim.cmd(vim_cmd)
    end
  end, {
    nargs = '?',
    complete = function(ArgLead, CmdLine, CursorPos)
      local lib = require 'custom.functions.runners.lib.runners-helper'
      return lib.auto_complete_file_func(ArgLead, CmdLine, CursorPos, "go")
    end
  }
  ),
}
