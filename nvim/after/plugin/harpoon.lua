local harpoon = require("harpoon")

harpoon:setup()

local list = harpoon:list()

vim.keymap.set("n", "<leader>a", function() list:add() end)
vim.keymap.set("n", "<C-e>", function() require("harpoon.ui").toggle_quick_menu(list) end)

vim.keymap.set("n", "<C-h>", function() list:select(1) end)
vim.keymap.set("n", "<C-t>", function() list:select(2) end)
vim.keymap.set("n", "<C-n>", function() list:select(3) end)
vim.keymap.set("n", "<C-s>", function() list:select(4) end)

