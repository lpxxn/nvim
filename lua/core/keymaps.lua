vim.g.mapleader = " "
local keymap = vim.keymap

-- ---------视觉模式----------
-- 单行或多行移动
--         模式  改后  改前
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- ----------正常模式-----------
-- 窗口
keymap.set("n", "<leader>sv", "<C-w>v") --水平新增窗口
keymap.set("n", "<leader>sh", "<C-w>s") --垂直新增窗口

-- 取消高亮
keymap.set("n", "<leader>nh", ":nohl<CR>")

keymap.set("n", "<leader>cf", ":let @+=expand('%:p')<CR>")
-- ----------插件----------------
-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")

-- 切换 buffer
keymap.set("n", "<C-S-L>", ":bnext<CR>")
keymap.set("n", "<C-S-H>", ":bprevious<CR>")
keymap.set("n", "<leader>q", ":bdelete<CR>")

-- signiture
keymap.set({ 'n' }, '<C-k>', function()       require('lsp_signature').toggle_float_win()
    end, { silent = true, noremap = true, desc = 'toggle signature' })

keymap.set({ 'n' }, '<Leader>k', function()
     vim.lsp.buf.signature_help()
    end, { silent = true, noremap = true, desc = 'toggle signature' })

-- go
keymap.set("n", "<leader>gd", ":GoDef<CR>")
keymap.set("n", "<leader>gi", ":GoInfo<CR>")
keymap.set("n", "<leader>gr", ":GoReferrers<CR>")

