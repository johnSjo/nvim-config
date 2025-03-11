require 'core.options'
require 'core.keymaps'

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
    local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
    if vim.v.shell_error ~= 0 then
        error('Error cloning lazy.nvim:\n' .. out)
    end
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup {
    require 'plugins.neo-tree',
    require 'plugins.lazygit',
    require 'plugins.misc',
    require 'plugins.gitsigns',
    require 'plugins.which-key',
    require 'plugins.telescope',
    require 'plugins.treesitter',
    require 'plugins.mini',
    require 'plugins.todo-comments',
    require 'plugins.colorscheme',
    require 'plugins.autocompletion',
    require 'plugins.autoformat',
    require 'plugins.lsp',
    require 'plugins.lazydev',
    require 'plugins.lint',

    -- Plugins not yet activated
    -- require 'kickstart.plugins.debug',
    -- require 'kickstart.plugins.indent_line',
    -- require 'kickstart.plugins.autopairs',
}
