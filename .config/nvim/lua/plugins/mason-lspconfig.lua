

return {{
'williamboman/mason-lspconfig.nvim', opts = {
  automatic_installation = true,
  ensure_installed = {
    'tsserver',
    'luaformatter',
    'lua_ls',
    'vimls'

  },
}, config = function(_, opts)
  require("mason-lspconfig").setup(opts)
  -- print(1 / 0);
 -- local registry = require("mason-registry")
 -- registry.refresh()
 -- registry.update()
 -- local packages = registry.get_all_packages()
 -- for _, pkg in ipairs(packages) do
 --  if pkg:is_installed() then
 --    pkg:install()
 --  end
 -- end



end,
dependencies = {
"williamboman/mason.nvim"
},
 {
   'WhoIsSethDaniel/mason-tool-installer.nvim',
   opts = {
   auto_update = true,
   ensure_installed = {
         'shellcheck',
 'luacheck',
 'luaformatter',
   },
  },
 config = function (_, opts)
  require('mason-tool-installer').setup(opts)
 end,
dependencies = {
"williamboman/mason.nvim"
}
}
}}
