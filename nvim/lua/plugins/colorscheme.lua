local palettes = {
    -- Everything defined under `all` will be applied to each style.
    all = {
        -- Each palette defines these colors:
        --   black, gray, blue, green, magenta, pink, red, white, yellow, cyan
        --
        -- These colors have 2 shades: base, and bright

        -- Passing a string sets the base
        red = {
            base = '#8e1519',
            bright = '#ee0000',
        },
    },
}

local specs = {
    -- As with palettes, the values defined under `all` will be applied to every style.
    all = {
        syntax = {
            -- Specs allow you to define a value using either a color or template. If the string does
            -- start with `#` the string will be used as the path of the palette table. Defining just
            -- a color uses the base version of that color.
            keywords = 'red.base',

            -- Adding either `.bright` will change the value
            conditional = 'red.bright',
            number = 'orange',
        },
    }
}


return {
    'projekt0n/github-nvim-theme',
    lazy = false,    -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
        require('github-theme').setup({
            specs = specs,
            palettes = palettes,
            options = {
                transparent = true,
                styles = {
                    comments = 'italic',
                    keywords = 'bold',
                    types = 'italic,bold',
                },
            },
        })

        vim.cmd('colorscheme github_dark_colorblind')
    end,
}
