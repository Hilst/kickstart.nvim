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
  end,
  auto_complete_file_func = function(_, _, _, filetype)
    if not filetype then return {} end
    local cwd = vim.fn.getcwd()
    local glob = vim.fn.globpath(cwd, "**/*")
    local s = vim.fn.split(glob, "\n")

    local r = {}
    for _, value in pairs(s) do
      local v = string.gsub(value, cwd, "")

      local foundFileType = string.find(v, "." .. filetype, nil, true)

      if foundFileType and (foundFileType + string.len(filetype)) == string.len(v) then
        table.insert(r, v)
      end
    end
    return r
  end
}
