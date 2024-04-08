if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- Customize None-ls sources

---@type LazySpec
return {
  'mrcjkb/rustaceanvim',
  version = '^4', -- Recommended
  ft = { 'rust' },
  opts = function(_, config)
    config = function ()
        vim.g.rustaceanvim = {
          dap = {
            autoload_configurations = false
          },
          server = {
            on_attach = require("astronvim.utils.lsp").on_attach,
            default_settings = {
              ['rust-analyzer'] = {
                cargo = {
                  extraEnv = { CARGO_PROFILE_RUST_ANALYZER_INHERITS = 'dev', },
                  extraArgs = { "--profile", "rust-analyzer", },
                },
              },
              procMacro = {
                enable = true, -- set this to false to disable completely
                ignored = {
                  ['async-trait'] = { 'async_trait' },
                  ['napi-derive'] = { 'napi' },
                  ['async-recursion'] = { 'async_recursion' },
                },
              },
            },
          },
          -- Plugin configuration
          tools = {
          },
          -- LSP configuration
          server = {
          },
          -- DAP configuration
          dap = {
          },
        }
    end
    return config -- return final config table
  end,
}
