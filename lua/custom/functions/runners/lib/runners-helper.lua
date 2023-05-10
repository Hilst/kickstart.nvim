return {
  build_term_split_string = function(cmd)
    if cmd then
      -- Open a terminal on a split
      -- bot = botright
      --  -> next vertical split go far right || horizontal split go far bottom
      -- vsp = vertical split
      -- ter = terminal
      return string.format([[ bot vsp | term { %s }]], cmd)
    end
  end,
}
