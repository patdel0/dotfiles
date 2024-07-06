-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Coding
vim.keymap.set(
  "n",
  "<leader>gd",
  "<cmd>lua vim.lsp.buf.definition()<CR>",
  { noremap = true, silent = true, desc = "Go to definition" }
)

vim.keymap.set("n", "<leader>fs", ":w<CR>", { noremap = true, silent = true, desc = "Save file" })
-- vim.keymap.set("n", "<leader>gg", ":Neogit<CR>", { noremap = true, silent = true, desc = "Open Neogit" })

-- Window management
vim.keymap.set("n", "<leader>wh", "<C-w>h", { noremap = true, silent = true, desc = "Switch window left" })
vim.keymap.set("n", "<leader>wj", "<C-w>j", { noremap = true, silent = true, desc = "Switch window down" })
vim.keymap.set("n", "<leader>wk", "<C-w>k", { noremap = true, silent = true, desc = "Switch window up" })
vim.keymap.set("n", "<leader>wl", "<C-w>l", { noremap = true, silent = true, desc = "Switch window right" })
vim.keymap.set("n", "<leader>wv", ":vsplit<CR>", { noremap = true, silent = true, desc = "Create vertical window" })
vim.keymap.set("n", "<leader>wb", ":split<CR>", { noremap = true, silent = true, desc = "Create horizontal window" })
vim.keymap.set("n", "<leader>wc", ":close<CR>", { noremap = true, silent = true, desc = "Close window" })
vim.keymap.set(
  "n",
  "<leader>wmm",
  "<C-W>_<C-W><Bar>",
  { noremap = true, silent = true, desc = "Maximize current window" }
)
vim.keymap.set("n", "<leader>wmn", "<C-w>=<CR>", { noremap = true, silent = true, desc = "Minimize current window" })

-- Buffer management
vim.keymap.set("n", "<leader>bk", ":bdelete<CR>", { noremap = true, silent = true, desc = "Close buffer" })

-- Notes
