return {
    {
        "sbdchd/neoformat",
        config = function()
            vim.g.neoformat_sh_topiary = {
                exe = "topiary",
                stdin = 1,
                args = {
                    'format', '--merge-configuration', '--language', '"bash"'
                }
            }

            vim.g.neoformat_enabled_sh = {'topiary'}

            vim.g.neoformat_css_topiary = {
                exe = "topiary",
                args = {
                    'format', '--merge-configuration', '--language', '"css"'
                },
                stdin = 1,
                no_append = 1
            }

            vim.g.neoformat_enabled_css = {'topiary'}

            vim.g.neoformat_go_gofmt = {exe = "gofmt", stdin = 1}
            vim.g.neoformat_go_goimports = {exe = "goimports", stdin = 1}

            vim.g.neoformat_enabled_go = {'gofmt', 'goimports'}

            vim.g.neoformat_html_prettierd = {
                exe = "prettierd",
                args = {'"%:p"'},
                stdin = 1
            }

            vim.g.neoformat_enabled_html = {'prettierd'}

            local biome = {
                exe = "biome",
                args = {'format', '--stdin-file-path="%p"'},
                stdin = 1,
                no_append = 1
            }

            vim.g.neoformat_javascript_biome = biome

            vim.g.neoformat_javascriptreact_biome = biome

            vim.g.neoformat_typescript_biome = biome

            vim.g.neoformat_typescriptreact_biome = biome

            vim.g.neoformat_enabled_javascript = {'biome'}

            vim.g.neoformat_enabled_javascriptreact = {'biome'}

            vim.g.neoformat_enabled_typescript = {'biome'}

            vim.g.neoformat_enabled_typescriptreact = {'biome'}

            vim.g.neoformat_json_topiary = {
                exe = "topiary",
                no_append = 1,
                stdin = 1,
                args = {
                    'format', '--merge-configuration', '--language', '"json"'
                }
            }

            vim.g.neoformat_enabled_json = {'topiary'}

            vim.g.neoformat_lua_luaformatter = {exe = "lua-format"}

            vim.g.neoformat_enabled_lua = {'luaformatter'}

            vim.g.neoformat_markdown_prettierd = {
                exe = "prettierd",
                args = {'"%:p"'},
                stdin = 1
            }

            vim.g.neoformat_enabled_markdown = {'prettierd'}

            vim.g.neoformat_nix_alejandra = {
                exe = "alejandra",
                args = {'--quiet'},
                stdin = 1
            }

            vim.g.neoformat_enabled_nix = {'alejandra'}

            vim.g.neoformat_python_yapf = {exe = "yapf", stdin = 1}

            vim.g.neoformat_enabled_python = {'yapf'}

            vim.g.neoformat_rust_rustfmt = {exe = "rustfmt", stdin = 1}

            vim.g.neoformat_enabled_rust = {'rustfmt'}

            vim.g.neoformat_swift_swiftformat = {exe = "swiftformat", stdin = 1}

            vim.g.neoformat_enabled_swift = {'swiftformat'}

            vim.g.neoformat_templ_templfmt = {
                exe = "templ",
                args = {'fmt'},
                stdin = 1
            }

            vim.g.neoformat_enabled_templ = {'templfmt'}

            vim.g.neoformat_toml_topiary = {
                exe = "topiary",
                stdin = 1,
                args = {
                    'format', '--merge-configuration', '--language', '"toml"'
                }
            }

            vim.g.neoformat_enabled_toml = {'topiary'}

            vim.g.neoformat_yaml_prettierd = {
                exe = "prettierd",
                args = {'"%:p"'},
                stdin = 1
            }

            vim.g.neoformat_enabled_yaml = {'prettierd'}

            vim.g.neoformat_zig_zigfmt = {
                exe = "zig",
                args = {'fmt', '--stdin'},
                stdin = 1
            }

            vim.g.neoformat_enabled_zig = {'zigfmt'}

            vim.api.nvim_create_autocmd('BufWritePre', {
                pattern = '*',
                callback = function() vim.cmd('Neoformat') end
            })
        end
    }
}
