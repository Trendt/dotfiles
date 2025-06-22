local opt = vim.opt

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

opt.mouse = ""
opt.clipboard = ""

vim.opt.signcolumn = "yes:1"
opt.number = true
opt.relativenumber = true

opt.scrolloff = 8

vim.opt.expandtab = true -- convert tabs to spaces
opt.shiftwidth = 4
opt.tabstop = 4

-- colors & transparency
opt.background = "dark"
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })
