return {
  'neovim/nvim-lspconfig',
  config = function(_, opts)
    local lspconfig = require('lspconfig')
    lspconfig.tsserver.setup {}
  end
}
