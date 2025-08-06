-- lua/plugins/gitsigns.lua
return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local gs = require("gitsigns")

    gs.setup({
      signs_staged_enable = true,
      signcolumn = false,
      numhl      = true,
      word_diff = true,
      current_line_blame = true,
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = 'eol',
        delay = 1000,
        ignore_whitespace = false,
        virt_text_priority = 100,
        use_focus = true,
      },
      current_line_blame_formatter = '<author>, <author_time:%R> - <summary>',
    })

    vim.api.nvim_set_hl(0, "GitSignsAddInline", { bg = "#32361c", fg = "#b8bb26" })
    vim.api.nvim_set_hl(0, "GitSignsChangeInline", { bg = "#3c3836", fg = "#fabd2f" })
    vim.api.nvim_set_hl(0, "GitSignsDeleteInline",  { bg = "#442d30", fg = "#fb4934" })
  end,
}
