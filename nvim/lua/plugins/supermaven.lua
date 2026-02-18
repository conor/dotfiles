return {
  -- Explicitly disable Copilot plugins (safety measure)
  { "zbirenbaum/copilot.lua", enabled = false },
  { "zbirenbaum/copilot-cmp", enabled = false },
  { "CopilotC-Nvim/CopilotChat.nvim", enabled = false },

  -- Custom Supermaven keymaps
  {
    "supermaven-inc/supermaven-nvim",
    opts = {
      disable_inline_completion = false, -- Enable ghost text
      keymaps = {
        accept_suggestion = "<D-l>",
        accept_word = "<D-;>",
        clear_suggestion = "<D-h>",
      },
    },
  },

  -- Disable Supermaven in nvim-cmp dropdown
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      -- Remove supermaven from sources if present
      opts.sources = vim.tbl_filter(function(source)
        return source.name ~= "supermaven"
      end, opts.sources or {})
    end,
  },
}
