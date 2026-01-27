-- Helper function to open a command in a floating window
local function open_in_float(cmd)
  return function()
    -- Run the command first to create the buffer
    vim.cmd(cmd)

    -- Get the current buffer (fugitive's buffer)
    local buf = vim.api.nvim_get_current_buf()
    local current_win = vim.api.nvim_get_current_win()

    -- Close the split window that fugitive created
    vim.api.nvim_win_close(current_win, false)

    -- Calculate window size (80% of editor)
    local width = math.floor(vim.o.columns * 0.8)
    local height = math.floor(vim.o.lines * 0.8)
    local col = math.floor((vim.o.columns - width) / 2)
    local row = math.floor((vim.o.lines - height) / 2)

    -- Window options
    local opts = {
      relative = "editor",
      width = width,
      height = height,
      col = col,
      row = row,
      style = "minimal",
      border = "rounded",
    }

    -- Open the fugitive buffer in a floating window
    vim.api.nvim_open_win(buf, true, opts)

    -- Set up keymaps to close the float
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = buf, silent = true })
    vim.keymap.set("n", "<Esc>", "<cmd>close<cr>", { buffer = buf, silent = true })
  end
end

return {
  {
    "tpope/vim-fugitive",
    cmd = { "Git", "G", "Gdiffsplit", "Gvdiffsplit", "Gread", "Gwrite", "Ggrep", "GMove", "GDelete", "GBrowse" },
    keys = {
      { "<leader>gF", "", desc = "+fugitive", mode = "n" },
      { "<leader>gFs", open_in_float("Git"), desc = "Status" },
      { "<leader>gFb", open_in_float("Git blame"), desc = "Blame" },
      { "<leader>gFd", open_in_float("Gdiffsplit"), desc = "Diff Split" },
      { "<leader>gFl", open_in_float("Git log"), desc = "Log" },
      { "<leader>gFp", "<cmd>Git push<cr>", desc = "Push" },
      { "<leader>gFP", "<cmd>Git pull<cr>", desc = "Pull" },
    },
  },
}
