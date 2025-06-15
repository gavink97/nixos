return {
    {
        "danymat/neogen",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "luasnip",
        },
        config = function()
            local neogen = require("neogen")

            neogen.setup({
                snippet_engine = "luasnip"
            })

            --vim.keymap.set("n", "<leader>nf", function()
                --    neogen.generate({type = "func" })
                --end)

                --vim.keymap.set("n", "<leader>nt", function()
                    --    neogen.generate({ type = "type" })
                    --end)
                end,
            },
        }
