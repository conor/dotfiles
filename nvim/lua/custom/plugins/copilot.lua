-- GitHub Copilot
return {
  'zbirenbaum/copilot.lua',
  event = 'InsertEnter',
  config = function()
    require('copilot').setup {
      suggestion = {
        auto_trigger = true,
        keymap = {
          accept = '<D-l>', -- command+l
          accept_line = '<D-;>', -- command+;
          next = '<D-j>', -- command+j
          prev = '<D-k>', -- command+k
          dismiss = '<D-h>', -- command+h
        },
      },
      panel = {
        enabled = false,
      },
    }
  end,
}
