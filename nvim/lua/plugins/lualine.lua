return {
  "nvim-lualine/lualine.nvim",
  config = function()
    require('lualine').setup({
      options = {
        theme = 'gruvbox-material',
        globalstatus = true,
      },
    })
  end
}
