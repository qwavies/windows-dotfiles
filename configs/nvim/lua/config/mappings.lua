-- -----------------------
-- Different key mappings
-- -----------------------

-- vim.g.mapleader = " "

-- move chunks of text up/down within the file
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- move down/up the page and recentre the cursor to the middle of the screen
-- same with search terms, and paragraph
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "}", "}zz")
vim.keymap.set("n", "{", "{zz")

-- <leader>p to paste without overwriting current buffer
vim.keymap.set("x", "<leader>p", "\"_dP")

-- <leader>y to copy to system clipboard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

-- replaces the currently selected word in the entire file
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- disables the wretched Q
vim.keymap.set("n", "Q", "<nop>")

-- exit insert mode using "jk"
vim.keymap.set("i", "jk", "<ESC>")

-- vim.keymap.set({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
