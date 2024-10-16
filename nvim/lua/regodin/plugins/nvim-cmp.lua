local M = {
    "hrsh7th/nvim-cmp",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-nvim-lua",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        {
            "windwp/nvim-autopairs",
            event = "InsertEnter",
            opts = {}
        },
        "saadparwaiz1/cmp_luasnip",
        {
            "L3MON4D3/LuaSnip",
            build = "make install_jsregexp",
            dependencies = {
                "rafamadriz/friendly-snippets",
            }
        },
        -- Uncomment to get snippet library [DRASTICALLY INCREASES LOAD TIMES]
    },
}

M.config = function()
    -- Luasnip config
    require("luasnip.loaders.from_vscode").lazy_load {
        include = { "html", "css" }
    }
    local ls = require("luasnip")
    ls.setup()
    -- Load snippets
    for _, ft_path in ipairs(vim.api.nvim_get_runtime_file("lua/regodin/custom/snippets/*.lua", true)) do
        loadfile(ft_path)()
    end
    -- Cmp config
    local cmp_autopairs = require("nvim-autopairs.completion.cmp")
    local cmp = require("cmp")
    vim.opt.completeopt = { "menu", "menuone", "noselect" }

    -- This is required to get automatic parenthesis after autocomplete function
    cmp.event:on(
        'confirm_done',
        cmp_autopairs.on_confirm_done()
    )
    cmp.setup({
        snippet = {
            expand = function(args)
                require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
            end,
        },
        window = {
            completion = cmp.config.window.bordered(),
            documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
            ["<C-b>"] = cmp.mapping.scroll_docs(-4),
            ["<C-f>"] = cmp.mapping.scroll_docs(4),
            ["<C-Space>"] = cmp.mapping.complete(),
            ["<C-e>"] = cmp.mapping.abort(),
            ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.

            -- Tab control for cmp and luasnip
            ["<Tab>"] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_next_item()
                elseif ls.expand_or_jumpable() then
                    ls.expand_or_jump()
                else
                    fallback()
                end
            end, { "i", "s" }),

            ["<S-Tab>"] = cmp.mapping(function(fallback)
                if ls.expand_or_jumpable() then
                    ls.expand_or_jump()
                elseif cmp.visible() then
                    cmp.select_prev_item()
                else
                    fallback()
                end
            end, { "i", "s" }),
        }),
        sources = cmp.config.sources({
            { name = "luasnip" },
            { name = "nvim_lsp" },
            { name = "nvim_lua" },
            { name = "buffer" },
            { name = "path" },
        }),
        -- sorting = {
        --     priority_weight = 1.0,
        --     comparators = {
        --         cmp.score,
        --         cmp.locality,
        --         cmp.recently_used,
        --         cmp.offset,
        --         cmp.order,
        --     }
        -- },
    })

    cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
            { name = "path" },
        }, {
            { name = "cmdline" },
        }),
    })
end

return M
