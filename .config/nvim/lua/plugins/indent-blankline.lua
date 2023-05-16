return {
    "lukas-reineke/indent-blankline.nvim",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
        show_trailing_blankline_indent = false,
        show_first_indent_level = false,
        indentLine_enabled = 1,
        -- space_char_blankline = " ",
        -- space_char_blankline = " ",
        -- show_current_context = true,
        -- show_current_context_start = true,
        filetype_exclude = {
            "help",
            "terminal",
            "lazy",
            "lspinfo",
            "TelescopePrompt",
            "TelescopeResults",
            "mason",
            "nvdash",
            "nvcheatsheet",
            "alpha",
            "",
        },
        buftype_exclude = { "terminal" },
    },
    config = function(_, opts)
        vim.opt.list = true
        vim.opt.listchars:append("space:⋅")

        require("indent_blankline").setup(opts)
    end,
}
