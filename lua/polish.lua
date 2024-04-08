if true then return end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- This will run last in the setup process and is a good place to configure
-- things like custom filetypes. This just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

-- Set up custom filetypes
vim.filetype.add {
  extension = {
    foo = "fooscript",
  },
  filename = {
    ["Foofile"] = "fooscript",
  },
  pattern = {
    ["~/%.config/foo/.*"] = "fooscript",
  },
}

-- Setup float diagnostics
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local cmd = vim.api.nvim_create_user_command
local namespace = vim.api.nvim_create_namespace

local utils = require "astrocore"
local is_available = utils.is_available
local astroevent = utils.event

-- Function to check if a floating dialog exists and if not
-- then check for diagnostics under the cursor
function OpenDiagnosticIfNoFloat()
  for _, winid in pairs(vim.api.nvim_tabpage_list_wins(0)) do
    if vim.api.nvim_win_get_config(winid).zindex then
      return
    end
  end
  -- THIS IS FOR BUILTIN LSP
  vim.diagnostic.open_float(0, {
    scope = "cursor",
    focusable = false,
    close_events = {
      "CursorMoved",
      "CursorMovedI",
      "BufHidden",
      "InsertCharPre",
      "WinLeave",
    },
  })
end

local lsp_diagnostics_hold_group = augroup("lsp_diagnostics_hold", { clear = true })
return function()
    autocmd({ "CursorHold" }, {
      desc = "Open Diagnostic on hold",
      group = lsp_diagnostics_hold_group,
      pattern = "*",
      command = "lua OpenDiagnosticIfNoFloat()",
    })
    vim.g.copilot_filetypes = {
          markdown = true
    }
end

-- TODO
-- vim.g.rustaceanvim = {
--   dap = {
--     autoload_configurations = false
--   },
--   server = {
--     on_attach = require("astrolsp").on_attach,
--     default_settings = {
--       ['rust-analyzer'] = {
--         cargo = {
--           extraEnv = { CARGO_PROFILE_RUST_ANALYZER_INHERITS = 'dev', },
--           extraArgs = { "--profile", "rust-analyzer", },
--         },
--       },
--       procMacro = {
--         enable = true, -- set this to false to disable completely
--         ignored = {
--           ['async-trait'] = { 'async_trait' },
--           ['napi-derive'] = { 'napi' },
--           ['async-recursion'] = { 'async_recursion' },
--         },
--       },
--     },
--   },
--   -- Plugin configuration
--   tools = {
--   },
--   -- LSP configuration
--   server = {
--   },
--   -- DAP configuration
--   dap = {
--   },
-- }

