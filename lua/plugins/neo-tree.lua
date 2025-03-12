return {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
        'MunifTanjim/nui.nvim',
        -- {"3rd/image.nvim", opts = {}}, -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    keys = {
        { '\\', ':Neotree reveal<CR>', desc = 'NeoTree reveal', silent = true },
    },
    config = function()
        require('neo-tree').setup {
            event_handlers = {
                {
                    event = 'file_opened',
                    handler = function()
                        -- auto close
                        -- vimc.cmd("Neotree close")
                        -- OR
                        require('neo-tree.command').execute { action = 'close' }
                    end,
                },
            },
        }
    end,
}
