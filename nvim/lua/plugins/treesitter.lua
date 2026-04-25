return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  opts = {
    ensure_installed = { "c", "cpp", "cuda", "python", "lua", "vim", "vimdoc" },
    highlight = { enable = true },
  },
  config = function(_, opts)
    require("nvim-treesitter").setup(opts)
  end,
}
