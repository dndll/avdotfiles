if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.pack.lua" },
  -- import/override with your plugins folder
  
  { import = "astrocommunity.code-runner.overseer-nvim"},
 
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.rust" },
  -- { import = "astrocommunity.pack.python" },
  { import = "astrocommunity.pack.nix" },
  { import = "astrocommunity.pack.toml" },

  -- { import = "astrocommunity.code-runner.sniprun" },
  { import = "astrocommunity.color.twilight-nvim" },
  { import = "astrocommunity.colorscheme.github-nvim-theme" },

  -- { import = "astrocommunity.completion.copilot-lua" },
  -- { import = "astrocommunity.completion.copilot-lua-cmp" },
  -- { import = "astrocommunity.completion.codeium-vim" },
  -- { import = "astrocommunity.completion.cmp-cmdline"},
  { import = "astrocommunity.diagnostics.trouble-nvim"},

  { import = "astrocommunity.editing-support.auto-save-nvim"},
  { import = "astrocommunity.editing-support.comment-box-nvim"},
  { import = "astrocommunity.editing-support.cutlass-nvim"}, -- TODO: learn to use this
  { import = "astrocommunity.editing-support.rainbow-delimiters-nvim"},
  { import = "astrocommunity.editing-support.ultimate-autopair-nvim"},
  { import = "astrocommunity.editing-support.vim-move"},
  
  { import = "astrocommunity.motion.hop-nvim"},
  { import = "astrocommunity.motion.nvim-spider"},
  { import = "astrocommunity.motion.portal-nvim"},
  { import = "astrocommunity.motion.marks-nvim"},

  -- { import = "astrocommunity.indent.mini-indentscope"},

  -- Messages
  { import = "astrocommunity.utility.noice-nvim" },

  -- { import = "astrocommunity.utility.debugging.nvim-chainsaw" },

  { import = "astrocommunity.project.nvim-spectre" },

  -- { import = "astrocommunity.bars-and-lines.smartcolumn-nvim" },
}
