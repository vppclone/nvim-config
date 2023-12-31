return {
    "telescope.nvim",
    dependencies = {
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make",
        },
        "nvim-telescope/telescope-file-browser.nvim",
    },
    keys = {
        {
            "<leader>fp",
            function()
                require("telescope.builtin").find_files({
                    cwd = require("lazy.core.config").options.root,
                })
            end,
            desc = "Find Plugin File",
        },
        {
            "<C-p>",
            function()
                local builtin = require("telescope.builtin")
                builtin.find_files({
                    no_ignore = false,
                    hidden = true,
                })
            end,
            desc = "Lists files in your current working directory, respects .gitignore",
        },
        {
            "<C-g>",
            function()
                local builtin = require("telescope.builtin")
                builtin.live_grep()
            end,
            desc = "Search for a string in your current working directory and get results live as you type, respects .gitignore",
        },
        {
            "sh",
            function()
                local builtin = require("telescope.builtin")
                builtin.help_tags()
            end,
            desc = "Lists available help tags and opens a new window with the relevant help info on <cr>",
        },
        {
            "sa",
            function()
                local builtin = require("telescope.builtin")
                builtin.treesitter()
            end,
            desc = "Lists Function names, variables, from Treesitter",
        },
        {
            "sf",
            function()
                local telescope = require("telescope")

                local function telescope_buffer_dir()
                    return vim.fn.expand("%:p:h")
                end

                telescope.extensions.file_browser.file_browser({
                    path = "%:p:h",
                    cwd = telescope_buffer_dir(),
                    respect_gitignore = false,
                    hidden = true,
                    grouped = true,
                    previewer = false,
                    initial_mode = "normal",
                    layout_config = { height = 40 },
                })
            end,
            desc = "Open File Browser with the path of the current buffer",
        },
    },
    config = function(_, opts)
        local telescope = require("telescope")
        local actions = require("telescope.actions")
        local fb_actions = require("telescope").extensions.file_browser.actions

        opts.defaults = vim.tbl_deep_extend("force", opts.defaults, {
            wrap_results = true,
            layout_strategy = "horizontal",
            layout_config = { prompt_position = "top" },
            sorting_strategy = "ascending",
            winblend = 0,
            mappings = {
                n = {},
            },
        })
        opts.pickers = {
            diagnostics = {
                theme = "ivy",
                initial_mode = "normal",
                layout_config = {
                    preview_cutoff = 9999,
                },
            },
        }
        opts.extensions = {
            file_browser = {
                theme = "dropdown",
                hijack_netrw = true,
                mappings = {
                    ["n"] = {
                        ["c"] = fb_actions.create,
                        ["h"] = fb_actions.goto_parent_dir,
                        ["/"] = function()
                            vim.cmd("startinsert")
                        end,
                        ["<C-u>"] = function(prompt_bufnr)
                            for _ = 1, 10 do
                                actions.move_selection_previous(prompt_bufnr)
                            end
                        end,
                        ["<C-d>"] = function(prompt_bufnr)
                            for _ = 1, 10 do
                                actions.move_selection_next(prompt_bufnr)
                            end
                        end,
                        ["<PageUp>"] = actions.preview_scrolling_up,
                        ["<PageDown>"] = actions.preview_scrolling_down,
                    },
                },
            },
        }
        telescope.setup(opts)
        telescope.load_extension("fzf")
        telescope.load_extension("file_browser")
    end,
}
