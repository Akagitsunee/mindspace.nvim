local M = {}

local colors = {
  bg = "#1E1F22",
  fg = "#A9B7C6",
  border = "#2B2D30",
  cursor_line = "#2B2D30",
  keyword = "#CC7832",
  func = "#FFC66D",
  string = "#6A8759",
  number = "#6897BB",
  comment = "#808080",
  selection = "#214283",
  line_nr = "#606366",
  line_nr_cursor = "#A9B7C6",
  error = "#BC3F3C",
  warn = "#BE9117",
  info = "#3592C4",
  hint = "#437F54",
}

function M.setup()
  -- Reset existing highlights
  vim.cmd("highlight clear")
  if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
  end

  local hi = function(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
  end

  -- Editor UI
  hi("Normal", { fg = colors.fg, bg = colors.bg })
  hi("NormalFloat", { fg = colors.fg, bg = colors.bg })
  hi("FloatBorder", { fg = colors.border, bg = colors.bg })
  hi("CursorLine", { bg = colors.cursor_line })
  hi("LineNr", { fg = colors.line_nr })
  hi("CursorLineNr", { fg = colors.line_nr_cursor })
  hi("SignColumn", { bg = colors.bg })
  hi("VertSplit", { fg = colors.border, bg = colors.bg })
  hi("WinSeparator", { fg = colors.border, bold = true })

  -- Syntax
  hi("Keyword", { fg = colors.keyword, bold = true })
  hi("Function", { fg = colors.func })
  hi("String", { fg = colors.string })
  hi("Number", { fg = colors.number })
  hi("Comment", { fg = colors.comment, italic = true })

  -- Selection
  hi("Visual", { bg = colors.selection })
  hi("Search", { bg = colors.selection })

  -- Diagnostics
  hi("DiagnosticError", { fg = colors.error })
  hi("DiagnosticWarn", { fg = colors.warn })
  hi("DiagnosticInfo", { fg = colors.info })
  hi("DiagnosticHint", { fg = colors.hint })

  -- Set options
  vim.opt.list = true
  vim.opt.listchars:append({
    tab = "│ ",
    trail = "·",
    extends = "›",
    precedes = "‹",
  })
  vim.opt.signcolumn = "yes"
  vim.opt.cursorline = true
  vim.opt.number = true
  vim.opt.relativenumber = false

  -- Set colorscheme name
  vim.g.colors_name = "mindspace"
end

return M