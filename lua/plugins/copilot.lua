return {
    'zbirenbaum/copilot.lua',
    requires = {
        'copilotlsp-nvim/copilot-lsp', -- (optional) for NES functionality
    },
    cmd = 'Copilot',
    event = 'InsertEnter',
    config = function()
        require('copilot').setup {
            filetypes = {
                ['*'] = true,
            },
            suggestion = {
                enabled = true,
                auto_trigger = true,
            },
            -- keymap = {
            --     accept = '<C-k>',
            --     next = '<C-]>',
            --     prev = '<C-[>',
            --     dismiss = '<C-c>',
            -- },
        }

        vim.keymap.set('i', '<S-Tab>', function()
            if require('copilot.suggestion').is_visible() then
                require('copilot.suggestion').accept()
            end
        end, { silent = true })
    end,
}
