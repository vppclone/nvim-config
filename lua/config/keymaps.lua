-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymaps = vim.keymap
local opts = {
    noremap = true,
    silent = true,
}
local tp = require("telescope.builtin")

function vim.getVisualSelection()
    vim.cmd('noau normal! "vy"')
    local text = vim.fn.getreg("v")
    vim.fn.setreg("v", {})

    if text == nil then
        return ""
    end

    text = string.gsub(text, "\n", "")
    if #text > 0 then
        return text
    else
        return ""
    end
end

-- inc/desc number
keymaps.set("n", "+", "<C-a>")
keymaps.set("n", "-", "<C-x>")

-- redo
keymaps.set("n", "r", "<C-r>", opts)

-- Select all
keymaps.set("n", "<C-a>", "gg<S-v>G")

-- bufferline
keymaps.set("n", "<tab>", ":BufferLineCycleNext<CR>", opts)
keymaps.set("n", "<s-tab>", ":BufferLineCyclePrev<CR>", opts)
keymaps.set("n", "<leader>1", ":BufferLineGoToBuffer 1<CR>", opts)
keymaps.set("n", "<leader>2", ":BufferLineGoToBuffer 2<CR>", opts)
keymaps.set("n", "<leader>3", ":BufferLineGoToBuffer 3<CR>", opts)
keymaps.set("n", "<leader>4", ":BufferLineGoToBuffer 4<CR>", opts)
keymaps.set("n", "<leader>5", ":BufferLineGoToBuffer 5<CR>", opts)
keymaps.set("n", "<C-q>", ":bd<CR>", opts)

-- Split
keymaps.set("n", "ss", ":split<CR>", opts)
keymaps.set("n", "sv", ":vsplit<CR>", opts)

-- Window
keymaps.set("n", "wh", "<C-w>h", opts)
keymaps.set("n", "wj", "<C-w>j", opts)
keymaps.set("n", "wk", "<C-w>k", opts)
keymaps.set("n", "wl", "<C-w>l", opts)
keymaps.set("n", "wq", "<C-w>q", opts)

-- Diagnostic
keymaps.set("n", "<C-j>", function()
    vim.diagnostic.goto_next()
end, opts)

keymaps.set("n", "<C-k>", function()
    vim.diagnostic.goto_prev()
end, opts)

-- Telescope keymap
keymaps.set("n", "<C-p>", function()
    tp.git_files()
end, opts)

keymaps.set("n", "<C-g>", function()
    tp.live_grep()
end, opts)

keymaps.set("v", "<C-g>", function()
    local text = vim.getVisualSelection()
    tp.live_grep({ default_text = text })
end, opts)

-- Aerial
keymaps.set("n", "<leader>a", ":AerialNavToggle<CR>", opts)

-- Move line
keymaps.set("n", "<M-down>", ":m+2<CR>", opts)
keymaps.set("n", "<M-up>", ":m-2<CR>", opts)
keymaps.set("v", "<M-down>", ":<','>m+2<CR>", opts)
keymaps.set("v", "<M-up>", ":<','>m-2<CR>", opts)

-- Diffview
keymaps.set("n", "<leader>gg", ":DiffviewOpen<CR>", opts)

-- Search
keymaps.set("v", "/", '"fy/\\V<C-R>f<CR>N', opts)
