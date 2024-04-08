return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("lsp_signature").setup()
  --   end,
  -- },

-- Custom Parameters (with defaults)
  {
      "David-Kunz/gen.nvim",
      opts = {
          model = "dolphin-mixtral", -- The default model to use.
          display_mode = "float", -- The display mode. Can be "float" or "split".
          show_prompt = false, -- Shows the Prompt submitted to Ollama.
          show_model = true, -- Displays which model you are using at the beginning of your chat session.
          no_auto_close = false, -- Never closes the window automatically.
          init = function(options) pcall(io.popen, "ollama serve > /dev/null 2>&1 &") end,
          -- Function to initialize Ollama
          -- The command for the Ollama service. You can use placeholders $prompt, $model and $body (shellescaped).
          -- This can also be a lua function returning a command string, with options as the input parameter.
          -- The executed command must return a JSON object with { response, context }
          -- (context property is optional).
          command = "curl --silent --no-buffer -X POST http://localhost:11434/api/generate -d $body",
          list_models = '<omitted lua function>', -- Retrieves a list of model names
          debug = false -- Prints errors and the command which is run.
      }
  },
  -- {
  --     'mrcjkb/rustaceanvim',
  --     version = '^4', -- Recommended
  --     ft = { 'rust' },
  -- },
}
