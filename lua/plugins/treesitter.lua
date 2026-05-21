return {
    'nvim-treesitter/nvim-treesitter',
    branch = 'main',
    build = ':TSUpdate',
    config = function()
        require('nvim-treesitter').setup()

        require('nvim-treesitter').install {
            'rust',
            'javascript',
            'zig',
            'bash',
            'c',
            'diff',
            'html',
            'lua',
            'luadoc',
            'markdown',
            'markdown_inline',
            'query',
            'vim',
            'vimdoc',
            'typescript',
            'tsx',
        }

        -- Handle MDX manually without an extra plugin
        vim.filetype.add { extension = { mdx = 'mdx' } }
        vim.treesitter.language.register('markdown', 'mdx')

        vim.api.nvim_create_autocmd('FileType', {
            callback = function()
                pcall(vim.treesitter.start)
            end,
        })
    end,
}
