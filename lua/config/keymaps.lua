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

-- tab
keymaps.set("n", "ta", ":$tabnew<CR>", opts)
keymaps.set("n", "tc", ":tabclose<CR>", opts)
keymaps.set("n", "to", ":tabonly<CR>", opts)
keymaps.set("n", "tmp", ":-tabmove<CR>", opts)
keymaps.set("n", "tmn", ":+tabmove<CR>", opts)
keymaps.set("n", "tn", ":tabn<CR>", opts)
keymaps.set("n", "tp", ":tabp<CR>", opts)

-- buffer
keymaps.set("n", "<leader>kw", ":%bd|e#<CR>", opts)
keymaps.set("n", "<leader>kq", ":bd<CR>", opts)
keymaps.set("n", "<Tab>", ":BufferLineCycleNext<CR>", opts)
keymaps.set("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", opts)

-- Split
keymaps.set("n", "ws", ":split<CR>", opts)
keymaps.set("n", "wv", ":vsplit<CR>", opts)

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

-- Sort
keymaps.set("v", "<C-A>", ":'<,'>Sort i<CR>", opts)

-- Diffview
keymaps.set("n", "<leader>gg", ":DiffviewOpen<CR>", opts)

-- Search
keymaps.set("v", "/", '"fy/\\V<C-R>f<CR>N', opts)
keymaps.set("n", "<C-d>", "*N", opts)

-- Window keymaps
-- For windows enthusiasts
-- Me ? mostly use <C-x> to delete single line (faster than dd)
-- Copy
keymaps.set("v", "<C-c>", "y", opts)
keymaps.set("n", "<C-c>", "yy", opts)

-- Paste
keymaps.set("v", "<C-v>", "p", opts)
keymaps.set("n", "<C-v>", "p", opts)
keymaps.set("i", "<C-v>", "<C-r>*", opts)

-- Cut
keymaps.set("v", "<C-x>", "d", opts)
keymaps.set("n", "<C-x>", "dd", opts)
