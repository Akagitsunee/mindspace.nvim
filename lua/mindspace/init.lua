return {
    'Akagitsunee/mindspace.nvim',
    lazy = true,
    priority = 1000,
    config = function()
      -- Define colors that promote focus and reduce visual noise
      local colors = {
        -- Main editor colors
        bg = "#1E1F22",          -- Darker background like WebStorm
        fg = "#A9B7C6",          -- Softer foreground for less eye strain
        border = "#2B2D30",      -- Distinct but subtle borders
        cursor_line = "#2B2D30", -- Subtle cursor line
        
        -- Syntax highlighting
        keyword = "#CC7832",     -- Orange for keywords (less harsh than purple)
        func = "#FFC66D",        -- Warm yellow for functions
        string = "#6A8759",      -- Soft green for strings
        number = "#6897BB",      -- Soft blue for numbers
        comment = "#808080",     -- Muted gray for comments
        
        -- UI elements
        selection = "#214283",    -- Visible but not overwhelming selection
        line_nr = "#606366",     -- Visible but muted line numbers
        line_nr_cursor = "#A9B7C6", -- Brighter current line number
        
        -- Diagnostic colors
        error = "#BC3F3C",       -- Soft red for errors
        warn = "#BE9117",        -- Warm yellow for warnings
        info = "#3592C4",        -- Calm blue for info
        hint = "#437F54",        -- Subtle green for hints
      }
  
      -- Set up highlight groups
      local highlights = {
        -- Editor UI
        Normal = { fg = colors.fg, bg = colors.bg },
        NormalFloat = { fg = colors.fg, bg = colors.bg },
        FloatBorder = { fg = colors.border, bg = colors.bg },
        CursorLine = { bg = colors.cursor_line },
        LineNr = { fg = colors.line_nr },
        CursorLineNr = { fg = colors.line_nr_cursor },
        SignColumn = { bg = colors.bg },
        VertSplit = { fg = colors.border, bg = colors.bg },
        
        -- Syntax
        Keyword = { fg = colors.keyword, bold = true },
        Function = { fg = colors.func },
        String = { fg = colors.string },
        Number = { fg = colors.number },
        Comment = { fg = colors.comment, italic = true },
        
        -- Selection
        Visual = { bg = colors.selection },
        Search = { bg = colors.selection },
        
        -- Diagnostics
        DiagnosticError = { fg = colors.error },
        DiagnosticWarn = { fg = colors.warn },
        DiagnosticInfo = { fg = colors.info },
        DiagnosticHint = { fg = colors.hint },
        
        -- Window borders for better visual separation
        WinSeparator = { fg = colors.border, bold = true },
      }
  
      -- Apply highlights
      for group, opts in pairs(highlights) do
        vim.api.nvim_set_hl(0, group, opts)
      end
  
      -- Set some visual preferences for ADHD-friendly experience
      vim.opt.linespace = 1
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
      vim.opt.relativenumber = false -- Absolute numbers are less distracting
  
      -- Additional floating window settings for better visual hierarchy
      local float_opts = {
        style = "minimal",
        border = "rounded",
        title_pos = "center",
      }
  
      -- Override floating window creation
      local orig_open_float = vim.lsp.util.open_floating_preview
      vim.lsp.util.open_floating_preview = function(contents, syntax, opts, ...)
        opts = vim.tbl_deep_extend("force", opts or {}, float_opts)
        return orig_open_float(contents, syntax, opts, ...)
      end
  
      -- Set colorscheme name
      vim.g.colors_name = "mindspace"
    end
  }