print('parse set-runner')

local runners_table = {
  gpp = function()
    require 'custom.functions.runners.gpp'
  end,
  golang = function()
    require 'custom.functions.runners.golang'
  end,
  default = function()
    print('Invalid runner')
  end
}

return {
  vim.api.nvim_create_user_command("SetRunner", function(opts)
    local runner = opts.args

    local runner_cmd = runners_table[runner]
    if runner_cmd then
      runner_cmd()
    else
      runners_table['default']()
    end
  end, {
    nargs = 1,
    complete = function()
      local keys = {}
      for key, _ in pairs(runners_table) do
        if key == 'default' then goto continue end
        table.insert(keys, key)
        ::continue::
      end
      return keys
    end
  })
}
