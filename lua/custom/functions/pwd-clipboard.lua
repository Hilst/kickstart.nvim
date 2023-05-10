print('parse pwd-clipboard')

return {
  vim.api.nvim_create_user_command("Pwd", function()
    local pwd = vim.fn.getcwd()

    -- Exit execution:
    -- print pwd result in lines
    -- register it in '+' vim register (clipboard)
    print(pwd)
    vim.fn.setreg('+', pwd)
  end, {}),

  -- Remap :Pwd command
  vim.keymap.set('n', '<leader>qw', function()
    print('working ...')
    vim.cmd([[Pwd]])
  end)

}
