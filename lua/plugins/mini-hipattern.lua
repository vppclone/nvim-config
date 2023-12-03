return {
    "echasnovski/mini.hipatterns",
    event = "BufReadPre",
    opts = {
        highlighters = {
            hsl_colorr = {
                pattern = "hsl%(%d+,? %d+,? %d+%)",
                group = function(_, match)
                    local h, s, l = match:match("hsl%(%d+),? (%d+),? (%d+)%)")
                    local utils = require("user.utils.utils")
                    h, s, l = tonumber(h), tonumber(s), tonumber(l)
                    local hex_color = utils.hslToHex(h, s, l)
                    return MiniHipatterns.compute_hex_color_group(hex_color, "bg")
                end,
            },
        },
    },
}
