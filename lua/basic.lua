vim.o.background = 'dark'

-- utf8
vim.g.encoding = 'utf-8'
vim.o.fileencoding = 'utf-8'
-- jk 移动保留行数
vim.o.scrolloff = 8
vim.o.sidescrolloff = 8
-- 相对行号
vim.wo.number = true
vim.wo.relativenumber = true
-- 高亮当前行
vim.wo.cursorline = true
-- 左侧图标
vim.wo.signcolumn = 'yes'
-- 参考线
vim.wo.colorcolumn = '80'
-- 缩进空格
vim.o.tabstop = 4
vim.bo.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftround = true
-- >> << 移动长度
vim.o.shiftwidth = 4
vim.bo.shiftwidth = 4
-- 新行对齐当前行, 空格替代 tab
vim.o.expandtab = true
vim.bo.expandtab = true
vim.o.autoindent = true
vim.bo.autoindent = true
vim.o.smartindent = true
-- 搜索大小写不敏感, 除非包含大写
vim.o.ignorecase = true
vim.o.smartcase = true
-- 搜索高亮
vim.o.hlsearch = false
-- 边输入边搜索
vim.o.incsearch = true
-- 使用增强状态栏后不再需要 vim 的模式
vim.o.showmode = false
-- 命令行高
vim.o.cmdheight = 1
-- 文件修改自动加载
vim.o.autoread = true
vim.bo.autoread = true
-- 禁止折行
vim.o.wrap = false
vim.wo.wrap = false
-- 行结尾可以跳到下一行
-- vim.o.whichwrap = 'b,s,<,>,[,],h,l'
-- 允许隐藏修改过的 buffer
vim.o.hidden = true
-- 鼠标支持
vim.o.mouse = 'a'
-- 禁止备份
vim.o.backup = false
vim.o.writebackup = false
vim.o.swapfile = false
vim.o.updatetime = 250
vim.o.timeoutlen = 250
-- split window 从下边和右边出现
vim.o.splitbelow = true
vim.o.splitright = true
vim.g.completeopt = 'menu,menuone,noselect,noinsert'
-- 样式
vim.o.termguicolors = true
-- 补全增强
vim.o.wildmenu = true
-- Dont' pass messages to |ins-completin menu|
vim.o.shortmess = vim.o.shortmess .. 'c'
vim.o.pumheight = 10
-- always show tabline
-- vim.o.showtabline = 2
vim.g.undofile = true
vim.o.cursorcolumn = true

vim.diagnostic.config({
  virtual_text = false,
  severity_sort = true
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = '*',
  callback = function()
    local bufnr = vim.api.nvim_get_current_buf()
    local ft = vim.api.nvim_buf_get_option(bufnr, 'filetype')

    local width = 4
    if ft == 'dart' or ft == 'javascript' or ft == 'lua' or ft == 'c' or ft == 'cpp' or ft == 'yaml' then
      width = 2
    end

    vim.o.tabstop = width
    vim.bo.tabstop = width
    vim.o.softtabstop = width
    vim.o.shiftwidth = width
    vim.bo.shiftwidth = width
  end
})
