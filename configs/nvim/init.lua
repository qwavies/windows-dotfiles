vim.g.mapleader = " "

vim.o.number = true
vim.o.relativenumber = true
vim.o.scrolloff = 6
vim.o.undofile = true

-- set tabs to 3 spaces
vim.opt.expandtab = true
vim.opt.tabstop = 3
vim.opt.shiftwidth = 3
vim.opt.softtabstop = 3

-- replaces the "~" on left sidebar with nothing
vim.opt.fillchars = { eob = " " }

-- disables nvims inbuilt status bar (replacing with lualine) and makes status bar flush with bottom
vim.opt.cmdheight = 0
vim.opt.showmode = false

require("config.lazy")

vim.schedule(function()
   vim.o.clipboard = "unnamedplus"
   require("config.mappings")
   require("config.autocmds")
end)

