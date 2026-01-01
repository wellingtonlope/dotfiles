-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", "<leader>aa", function()
  require("lazyvim.util").terminal({ "opencode" }, {
    cwd = require("lazyvim.util").root(),
    border = "rounded",
  })
end, { desc = "OpenCode (cwd)" })
