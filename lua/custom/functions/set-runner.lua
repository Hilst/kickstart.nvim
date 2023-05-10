print('parse set-runner')

return {
  vim.api.nvim_create_user_command("SetRunner", function(opts)
    local runner = opts.args
    local runners_table = {
      gpp = function()
        require ''
      end,
      golang = function()
        require ''
      end,
      default = function()
        print('Invalid runner')
      end
    }

    local runner_cmd = runners_table[runner]
    if runner_cmd then
      runner_cmd()
    else
      runners_table['default']()
    end
  end, { nargs = 1 })
}
