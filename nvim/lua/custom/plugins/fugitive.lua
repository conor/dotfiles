-- Git commands in nvim
return {
  'tpope/vim-fugitive',
  event = 'VeryLazy',
  config = function()
    vim.keymap.set('n', '<leader>gs', ':Git<CR>', { desc = 'Git status' })
    vim.keymap.set('n', '<leader>gb', ':Git blame<CR>', { desc = 'Git blame' })
    vim.keymap.set('n', '<leader>gd', ':Gdiffsplit<CR>', { desc = 'Git diff split' })
    vim.keymap.set('n', '<leader>gc', ':Git commit<CR>', { desc = 'Git commit' })
    vim.keymap.set('n', '<leader>ga', ':Git add<CR>', { desc = 'Git add' })
    vim.keymap.set('n', '<leader>gph', ':Git push<CR>', { desc = 'Git push' })
    vim.keymap.set('n', '<leader>gpl', ':Git pull<CR>', { desc = 'Git pull' })
  end,
}
