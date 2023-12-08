require'lspconfig'.lua_ls.setup{
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT"
      }
    }
  }
}
