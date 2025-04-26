-- TypeScript tools for neovim - alternative to typescript language server
return {
  'pmizio/typescript-tools.nvim',
  dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
  ft = {
    'javascript',
    'javascriptreact',
    'typescript',
    'typescriptreact',
  },
  opts = {},
  config = function()
    require("typescript-tools").setup {}
  end,
}