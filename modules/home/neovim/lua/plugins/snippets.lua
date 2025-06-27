return {
    {
        "luasnip",
        dev = true,
        dependencies = {
            "rafamadriz/friendly-snippets",
            config = function()
                require("luasnip.loaders.from_vscode").lazy_load()
            end
        },
        config = function()
            local ls = require("luasnip")
            ls.filetype_extend("python", {"pydoc"})

            vim.keymap.set({"i"}, "<C-K>", function() ls.expand() end,
                           {silent = true})
            vim.keymap.set({"i", "s"}, "<leader>;", function()
                ls.jump(1)
            end, {silent = true})
            vim.keymap.set({"i", "s"}, "<leader>,", function()
                ls.jump(-1)
            end, {silent = true})

            vim.keymap.set({"i", "s"}, "<C-E>", function()
                if ls.choice_active() then ls.change_choice(1) end
            end, {silent = true})
        end
    }
}
