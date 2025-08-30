return {
  {
    "zbirenbaum/copilot-cmp",
    enabled = false,
  },
  {
    "zbirenbaum/copilot.lua",
    opts = {
      suggestion = {
        enabled = true,
        auto_trigger = true,
        keymap = {
          accept = "<D-l>",
          accept_line = "<D-;>",
          next = "<D-j>",
          prev = "<D-k>",
          dismiss = "<D-h>",
        },
      },
    },
  },
}

