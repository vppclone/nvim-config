local M = {}

function M.setup()
    local ok, alpha = pcall(require, "alpha")
    if not ok then
        return
    end

    local dashboard = require("alpha.themes.dashboard")
    dashboard.opts.opts.noautocmd = true

    local logo = [[
██╗      ██████╗ ██╗    ██╗    ████████╗██╗███████╗██████╗     ██╗   ██╗██╗███╗   ███╗
██║     ██╔═══██╗██║    ██║    ╚══██╔══╝██║██╔════╝██╔══██╗    ██║   ██║██║████╗ ████║
██║     ██║   ██║██║ █╗ ██║       ██║   ██║█████╗  ██████╔╝    ██║   ██║██║██╔████╔██║
██║     ██║   ██║██║███╗██║       ██║   ██║██╔══╝  ██╔══██╗    ╚██╗ ██╔╝██║██║╚██╔╝██║
███████╗╚██████╔╝╚███╔███╔╝       ██║   ██║███████╗██║  ██║     ╚████╔╝ ██║██║ ╚═╝ ██║
╚══════╝ ╚═════╝  ╚══╝╚══╝        ╚═╝   ╚═╝╚══════╝╚═╝  ╚═╝      ╚═══╝  ╚═╝╚═╝     ╚═╝
             _____                                                   _____ 
            ( ___ )                                                 ( ___ )
             |   |~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|   | 
             |   |           My controller isnt' working             |   | 
             |   |  And if they were, you were playing dishonorably  |   |
             |   | And if you weren't, you were playing without skill|   |
             |   |    And if you were, it's not fun to play that way |   |
             |   |      And if it is, you only care about winning    |   |
             |___|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|___| 
            (_____)                                                 (_____)
	]]
    dashboard.section.header.val = vim.split(logo, "\n")
end

M.setup()
