require("nvim-treesitter.configs").setup({
  ensure_installed = "all",

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = { "org" },
  },

  indent = {
    enable = true,
  },

  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = nil,
  },

  context_commentstring = {
    enable = true,
    enable_autocmd = true,
  },
})

--  incremental_selection = { enable = true },
--  indentation = { enable = true },
--  textobjects = { enable = true }
