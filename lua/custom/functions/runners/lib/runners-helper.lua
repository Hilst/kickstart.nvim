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
  split_path_string = function(path, sep)
    sep = sep or "/"

    if string.len(path) < 2 then
      print(string.format([[Invalid path: %s]], path))
    end

    local r = {}
    local c = 0
    local f = ""
    local l = ""
    for partition in string.gmatch(path, "([^" .. sep .. "]+)") do
      if f == "" then f = partition end
      l = partition
      table.insert(r, partition)
      c = c + 1
    end

    return {
      parts = r,
      size = c,
      first = f,
      last = l
    }
  end
}
