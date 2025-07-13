require "nvchad.mappings"

local map = vim.keymap.set

-- move chunks of text up/down within the file
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

-- move down/up the page and recentre the cursor to the middle of the screen
-- same with search terms, and paragraph
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")
map("n", "}", "}zz")
map("n", "{", "{zz")

-- <leader>p to paste without overwriting current buffer
map("x", "<leader>p", "\"_dP")

-- <leader>y to copy to system clipboard
map("n", "<leader>y", "\"+y")
map("v", "<leader>y", "\"+y")
map("n", "<leader>Y", "\"+Y")

-- replaces the currently selected word in the entire file
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
-- disables the wretched Q
map("n", "Q", "<nop>")

-- exit insert mode using "jk"
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
