return {

    { -- Linting
        'mfussenegger/nvim-lint',
        event = { 'BufReadPre', 'BufNewFile' },
        config = function()
            local lint = require 'lint'
            lint.linters_by_ft = {
                markdown = { 'markdownlint' },
                typescriptreact = { 'eslint_d' },
                typescript = { 'eslint_d' },
                -- go = { 'sonarlint' },
            }

            -- To allow other plugins to add linters to require('lint').linters_by_ft,
            -- instead set linters_by_ft like this:
            -- lint.linters_by_ft = lint.linters_by_ft or {}
            -- lint.linters_by_ft['markdown'] = { 'markdownlint' }
            --
            -- However, note that this will enable a set of default linters,
            -- which will cause errors unless these tools are available:
            -- {
            --   clojure = { "clj-kondo" },
            --   dockerfile = { "hadolint" },
            --   inko = { "inko" },
            --   janet = { "janet" },
            --   json = { "jsonlint" },
            --   markdown = { "vale" },
            --   rst = { "vale" },
            --   ruby = { "ruby" },
            --   terraform = { "tflint" },
            --   text = { "vale" }
            -- }
            --
            -- You can disable the default linters by setting their filetypes to nil:
            -- lint.linters_by_ft['clojure'] = nil
            -- lint.linters_by_ft['dockerfile'] = nil
            -- lint.linters_by_ft['inko'] = nil
            -- lint.linters_by_ft['janet'] = nil
            -- lint.linters_by_ft['json'] = nil
            -- lint.linters_by_ft['markdown'] = nil
            -- lint.linters_by_ft['rst'] = nil
            -- lint.linters_by_ft['ruby'] = nil
            -- lint.linters_by_ft['terraform'] = nil
            -- lint.linters_by_ft['text'] = nil

            -- Create autocommand which carries out the actual linting
            -- on the specified events.
            local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })
            vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
                group = lint_augroup,
                callback = function()
                    -- Only run the linter in buffers that you can modify in order to
                    -- avoid superfluous noise, notably within the handy LSP pop-ups that
                    -- describe the hovered symbol using Markdown.
                    if vim.opt_local.modifiable:get() then
                        lint.try_lint()
                    end
                end,
            })

            -- vim.api.nvim_create_autocmd('BufWritePre', {
            --   pattern = { '*.tsx', '*.ts', '*.jsx', '*.js' },
            --   -- command = 'silent! EslintFixAll',
            --   group = vim.api.nvim_create_augroup('MyAutocmdsJavaScripFormatting', {}),
            --   callback = function()
            --     -- Escape the file path to prevent shell globbing issues
            --     local escaped_filename = vim.fn.shellescape(vim.api.nvim_buf_get_name(0))
            --     -- Run eslint_d with the --fix flag, using the escaped filename
            --     vim.cmd('silent! %!eslint_d --fix-to-stdout --stdin --stdin-filename ' .. escaped_filename)
            --   end,
            -- })
        end,
    },
}
