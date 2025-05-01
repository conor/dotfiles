-- GitHub Copilot Chat
return {
  'CopilotC-Nvim/CopilotChat.nvim',
  dependencies = {
    'zbirenbaum/copilot.lua',
    'nvim-lua/plenary.nvim',
  },
  opts = {
    debug = false,
  },
  keys = {
    { '<leader>cc', '<cmd>CopilotChat<cr>', desc = 'CopilotChat - Open' },
    { '<leader>ce', '<cmd>CopilotChatExplain<cr>', desc = 'CopilotChat - Explain code' },
    { '<leader>ct', '<cmd>CopilotChatTests<cr>', desc = 'CopilotChat - Generate tests' },
    {
      '<leader>cr',
      '<cmd>CopilotChatReview<cr>',
      mode = { 'n', 'v' },
      desc = 'CopilotChat - Review code',
    },
  },
}
