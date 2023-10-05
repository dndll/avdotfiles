return {
  -- Add the community repository of plugin specifications
  "AstroNvim/astrocommunity",
  -- example of importing a plugin, comment out to use it or add your own
  -- available plugins can be found at https://github.com/AstroNvim/astrocommunity

  { import = "astrocommunity.pack.rust" },
  { import = "astrocommunity.pack.python" },

  { import = "astrocommunity.motion.hop-nvim"},

  { import = "astrocommunity.code-runner.sniprun" },
  { import = "astrocommunity.color.twilight-nvim" },

  { import = "astrocommunity.colorscheme.github-nvim-theme" },

  -- { import = "astrocommunity.completion.copilot-lua" },
  -- { import = "astrocommunity.completion.copilot-lua-cmp" },
  -- { import = "astrocommunity.completion.codeium-vim" },
  { import = "astrocommunity.completion.cmp-cmdline"},

  { import = "astrocommunity.diagnostics.lsp_lines-nvim"},
  { import = "astrocommunity.diagnostics.trouble-nvim"},

  { import = "astrocommunity.editing-support.auto-save-nvim"},
  { import = "astrocommunity.editing-support.comment-box-nvim"},
  { import = "astrocommunity.editing-support.cutlass-nvim"},
  { import = "astrocommunity.editing-support.rainbow-delimiters-nvim"},
  { import = "astrocommunity.editing-support.todo-comments-nvim"},
  { import = "astrocommunity.editing-support.ultimate-autopair-nvim"},
  { import = "astrocommunity.editing-support.vim-move"},
  
  { import = "astrocommunity.motion.nvim-spider"},
  { import = "astrocommunity.motion.portal-nvim"},
  { import = "astrocommunity.motion.marks-nvim"},

  { import = "astrocommunity.indent.mini-indentscope"},

  { import = "astrocommunity.lsp.lsp-inlayhints-nvim" },

  { import = "astrocommunity.syntax.vim-sandwich" },

  { import = "astrocommunity.utility.noice-nvim" },


  { import = "astrocommunity.bars-and-lines.smartcolumn-nvim" },
  -- { import = "astrocommunity.colorscheme.catppuccin" },
}
