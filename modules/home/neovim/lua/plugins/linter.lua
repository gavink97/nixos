return {
    {
        "mfussenegger/nvim-lint",
        config = function()
            require('lint').linters_by_ft = {
                css = {'stylelint'},
                go = {'golangcilint'},
                html = {'htmlhint'},
                javascript = {'biomejs'},
                javascriptreact = {'biomejs'},
                typescript = {'biomejs'},
                typescriptreact = {'biomejs'},
                lua = {'luacheck'},
                nix = {'deadnix', 'statix'},
                python = {'flake8', 'mypy'},
                sh = {'shellcheck'}
            }

            vim.api.nvim_create_autocmd({"BufWritePost"}, {
                callback = function()
                    require("lint").try_lint()

                    require("lint").try_lint("alex")
                end
            })
        end
    }
}
