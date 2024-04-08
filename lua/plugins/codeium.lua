---@type LazySpec
return {
  "Exafunction/codeium.vim",
  event = "BufEnter",
  ---@type AstroUIOpts
  config = function()
  end
    -- config = function()
    --   vim.keymap.set("i", "<C-g>", function() return vim.api.nvim_call_function("codeium#Accept", {}) end, { expr = true })
    -- end
    -- vim.keymap.set("i", "<c-;>", function() return vim.fn["codeium#CycleCompletions"](1) end, { expr = true })
    -- vim.keymap.set("i", "<c-,>", function() return vim.fn["codeium#CycleCompletions"](-1) end, { expr = true })
    -- vim.keymap.set("i", "<c-x>", function() return vim.fn["codeium#Clear"]() end, { expr = true })
    -- vim.keymap.set("n", "<leader>;", function()
    --   if vim.g.codeium_enabled == true then
    --     vim.cmd "CodeiumDisable"
    --   else
    --     vim.cmd "CodeiumEnable"
    --   end
    -- end, { noremap = true, desc = "Toggle Codeium active" })
}
