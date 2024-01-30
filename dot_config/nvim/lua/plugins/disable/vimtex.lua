return {
  {
    "lervag/vimtex",
    -- Lervag recommends putting configuration here:
    -- https://github.com/lervag/vimtex/issues/2698
    -- https://github.com/lervag/vimtex/issues/2699
    init = function()
      ------ Viewer ------
      vim.g.vimtex_view_method = "skim"
      vim.g.vimtex_view_general_viewer = "okular"
      -- Set this option to 1 to highlight current line in PDF after command
      vim.g.vimtex_view_skim_reading_bar = 0
      -- Perform a forward search after successful compilation
      -- vim.g.vimtex_view_skim_sync = 1
      -- Make Skim have focus after command |:VimtexView|
      -- vim.g.vimtex_view_skim_activate = 1
      -- Don't automatically open PDF viewer after first compilation
      -- vim.g.vimtex_view_automatic = 0

      -- vim.g.vimtex_imaps_leader = ";"
      vim.g.vimtex_imaps_leader = "\\"

      -- g:vimtex_parser_bib_backend -- Default backend for parsing bibliographies
      -- g:vimtex_complete_bib -- This option is a dictionary for controlling the citation completion.
      -- g:vimtex_complete_ref -- This option is a dictionary for controlling the label completion.

      -- g:vimtex_delim_toggle_mod_list Defines a list of delimiter modifiers to toggle (e.g. add \big)
      vim.g.vimtex_delim_stopline = 200 -- A tolerance for the number of lines to search for matching delimiters in each direction.
      vim.g.vimtex_echo_verbose_input = 1 -- For 'sr' mappings

      ------ Compilation ------
      vim.g.vimtex_compiler_latexmk = {
        options = {
          "-verbose",
          "-file-line-error",
          "-synctex=1",
          "-interaction=nonstopmode",
          "-shell-escape",
        },
      }

      ------ Folding ------
      -- See :h vimtex-folding
      vim.g.vimtex_fold_enabled = 1
      -- g:vimtex_fold_manual

      -- g:vimtex_indent_on_ampersands -- By default, VimTeX will align on `leading` ampersands e.g. in math aligned environments or in tabular environments.

      ------ Subfiles
      vim.g.vimtex_subfile_start_local = 0

      ------ Quickfix ------
      -- g:vimtex_quickfix_method # TODO: look up pplatex
      -- g:vimtex_quickfix_open_on_warning = 1

      vim.g.vimtex_quickfix_ignore_filters = {
        "Overfull",
        "Underfull",
      }
      -- vim.g.vimtex_quickfix_ignore_filters = [
      --             \ 'Overfull',
      --             \ 'Underfull',
      --             \ 'Reference',
      --             \ 'undefined references',
      --             \ 'Font shape',
      --             \]
      --             -- \ 'Marginpar on page',
      --             -- \ 'overfull',
      --             -- \ 'underfull',
      --             -- \ 'package',
      --             -- \ 'reference',

      ------ Syntax ------
      vim.g.vimtex_syntax_nospell_comments = 0

      ------ Completion ------
      -- g:vimtex_complete_bib
      -- g:vimtex_complete_close_braces
      -- g:vimtex_complete_enabled
      -- g:vimtex_complete_ignore_case
      -- g:vimtex_complete_ref
      -- g:vimtex_complete_smart_case

      ------ Events ------
      -- Compile on initialization, cleanup on quit
      -- augroup vimtex_event_1
      --   au!
      --   au User VimtexEventQuit     VimtexClean
      --   -- au User VimtexEventInitPost VimtexCompile
      -- augroup END
      vim.api.nvim_create_augroup("vimtex_clean", { clear = true })
      vim.api.nvim_create_autocmd("User", {
        group = "vimtex_clean",
        pattern = "VimtexEventQuit",
        command = "VimtexClean",
      })
      -- See `:h vimtex-events` for more ideas, e.g.
      -- -- Specify extra behaviour after reverse goto
      -- augroup vimtex_event_4
      --   au!
      --   au User VimtexEventViewReverse normal! zMzvzz
      -- augroup END

      -- TODO: Port to Lua
      vim.cmd([[
        function! s:TexFocusVim() abort
        execute "!open -a iTerm"
        " Use silent to suppress "Press ENTER or type command to continue" messages
        " silent execute "!open -a iTerm"
        redraw!
        endfunction

        augroup vimtex_event_focus
        au!
        au User VimtexEventViewReverse call s:TexFocusVim()
        augroup END
      ]])
    end,
  },

  -- Disable treesitter in vimtex (:h vimtex-faq-treesitter)
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ignore_install = { "latex" },
    },
  },
}
