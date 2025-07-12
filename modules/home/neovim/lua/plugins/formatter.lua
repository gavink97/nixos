return {
    {
        "stevearc/conform.nvim",
        config = function()
            -- finish migration to conform
            require("conform").setup({
                formatters_by_ft = {
                    sh = {"beautysh"},
                    css = {"cssbeautifier"},
                    go = {"gofmt", "goimports"},
                    html = {"html_beautify"},
                    javascript = {"biome"},
                    javascriptreact = {"biome"},
                    lua = {"stylua"},
                    nix = {"alejandra"},

                    python = {"yapf"},
                    -- You can customize some of the format options for the filetype (:help conform.format)
                    rust = {"rustfmt", lsp_format = "fallback"},
                    swift = {"swift"},

                    templ = {"templ"},
                    typescript = {"biome"},
                    typescriptreact = {"biome"},
                    yaml = {"yamlfmt"},
                    zig = {"zigfmt"}
                }
            })

            vim.api.nvim_create_autocmd("BufWritePre", {
                pattern = "*",
                callback = function(args)
                    require("conform").format({bufnr = args.buf})
                end
            })

        end
    }
}
