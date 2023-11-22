return {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    opts = {
        plugins = {
            gitsigns = false,
            tmux = true,
        },
    },
    keys = {
        {
            "<leader>z",
            "<cmd>ZenMode<CR>",
            desc = "Zen Mode",
        },
    },
}
