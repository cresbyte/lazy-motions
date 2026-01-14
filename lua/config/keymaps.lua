-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", "<leader>bd", function()
  -- Save if buffer is modified
  if vim.bo.modified then
    vim.cmd("write")
  end
  vim.cmd("bd")
end, { desc = "Delete buffer (auto-save)" })

-- Open terminal in a 30% high horizontal split at the bottom
vim.keymap.set("n", "<leader>tt", ":belowright 30split | terminal<CR>", { desc = "Open terminal (30% split)" })
