local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local cmd = vim.api.nvim_create_user_command
local namespace = vim.api.nvim_create_namespace

local utils = require "astronvim.utils"
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

