vim.g.mapleader = ","
vim.g.maplocalleader = ","

local map = vim.api.nvim_set_keymap
local opt = {noremap = true, silent = true}

map("n", "<leader>v", ":vsp<CR>", opt)
map("n", "<leader>h", ":sp<CR>", opt)
map("n", "<leader>c", "<C-w>c", opt)
map("n", "<leader>o", "<C-w>o", opt)

map("n", "<A-h>", "<C-w>h", opt)
map("n", "<A-j>", "<C-w>j", opt)
map("n", "<A-k>", "<C-w>k", opt)
map("n", "<A-l>", "<C-w>l", opt)

map("n", "<leader>p", ":resize +2<cr>", opt)
map("n", "<leader>m", ":resize -2<cr>", opt)
map("n", "<leader>f", ":HopChar2<cr>",opt)


-- 插件快捷键
local pluginKeys = {}

-- Tab切换 buffer
map("n", "<C-tab>", ":BufferLineCycleNext<CR>", opt)
map("n", "<C-S-tab>", ":BufferLineCyclePrev<CR>", opt)
-- 关闭
--"moll/vim-bbye"
map("n", "<C-w>", ":Bdelete!<CR>", opt)
-- map("n", "<leader>bl", ":BufferLineCloseRight<CR>", opt)
-- map("n", "<leader>bh", ":BufferLineCloseLeft<CR>", opt)
-- map("n", "<leader>bc", ":BufferLinePickClose<CR>", opt)

-- nvim-tree
-- alt + m 键打开关闭tree
map("n", "<A-1>", ":NvimTreeToggle<CR>", opt)
-- 列表快捷键
pluginKeys.nvimTreeList = {
  -- 打开文件或文件夹
  { key = {"<CR>", "o", "<2-LeftMouse>"}, action = "edit" },
  -- 分屏打开文件
  { key = "v", action = "vsplit" },
  { key = "h", action = "split" },
  -- 文件操作
  { key = "<F5>", action = "refresh" },
  { key = "a", action = "create" },
  -- { key = "d", action = "remove" },
  { key = "r", action = "rename" },
  { key = "x", action = "cut" },
  { key = "c", action = "copy" },
  { key = "p", action = "paste" },
}

-- Telescope
-- 查找文件
map("n", "<C-p>", ":Telescope find_files<CR>", opt)
-- 全局搜索
map("n", "<C-S-f>", ":Telescope live_grep<CR>", opt)

pluginKeys.telescopeList = {
  i = {
    -- 预览窗口上下滚动
    ["<C-u>"] = "preview_scrolling_up",
    ["<C-d>"] = "preview_scrolling_down",
  },
}

-- lsp 回调函数快捷键设置
-- pluginKeys.mapLSP = function(mapbuf)
  -- rename
  map("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opt)
  -- code action
  -- mapbuf("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opt)
  -- go xx
  map("n", "<C-k>", "<cmd>lua vim.lsp.buf.definition()<CR>", opt)
  map("n", "<C-h>", "<cmd>lua vim.lsp.buf.hover()<CR>", opt)
  map("n", "<leader>r", "<cmd>lua vim.lsp.buf.references()<CR>", opt)
  -- 这几个不起作用。。
  -- mapbuf("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opt)
  -- mapbuf("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opt)
  -- diagnostic
  -- mapbuf("n", "gp", "<cmd>lua vim.diagnostic.open_float()<CR>", opt)
  -- mapbuf("n", "gk", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opt)
  -- mapbuf("n", "gj", "<cmd>lua vim.diagnostic.goto_next()<CR>", opt)
  -- mapbuf("n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opt)
-- end

pluginKeys.cmp = function(cmp)
    return {
        -- 上一个
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        -- 下一个
        ["<C-n>"] = cmp.mapping.select_next_item(),
        -- 确认
        ["<CR>"] = cmp.mapping.confirm({
            select = true,
            behavior = cmp.ConfirmBehavior.Replace
        }),
        ["<Tab>"] = cmp.mapping.confirm({
            select = true,
            behavior = cmp.ConfirmBehavior.Replace
        }),
    }
end


return pluginKeys

