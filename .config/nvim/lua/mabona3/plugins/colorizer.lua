return {
    "catgoose/nvim-colorizer.lua",
    event = "BufReadPre",
    lazy = true,
    cmd = "Colorize",
    config = function()
        require('colorizer').setup()
    end
}
