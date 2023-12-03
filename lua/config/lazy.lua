local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

require("lazy").setup({
    spec = {
        {
            "LazyVim/LazyVim",
            import = "lazyvim.plugins",
        },
        { import = "lazyvim.plugins.extras.lang.typescript" },
        { import = "lazyvim.plugins.extras.lang.json" },
        { import = "lazyvim.plugins.extras.ui.alpha" },
        { import = "lazyvim.plugins.extras.formatting.prettier" },
        { import = "lazyvim.plugins.extras.util.mini-hipatterns" },

        -- No need to config plugins
        {
            "ThePrimeagen/vim-be-good",
            event = "VeryLazy",
        },
        {
            "sindrets/diffview.nvim",
            event = "VeryLazy",
        },
        {
            "sQVe/sort.nvim",
            event = "VeryLazy",
        },

        -- Override
        { import = "plugins" },
    },
    defaults = {
        lazy = false,
        version = false,
    },
    install = {},
    checker = { enabled = true },
    performance = {
        rtp = {
            -- disable some rtp plugins
            disabled_plugins = {
                "gzip",
                -- "matchit",
                -- "matchparen",
                -- "netrwPlugin",
                "tarPlugin",
                "tohtml",
                "tutor",
                "zipPlugin",
            },
        },
    },
})

require("user.git.diffview")
require("user.ui.dashboard")
