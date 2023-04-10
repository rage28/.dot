return {
  "folke/trouble.nvim",
  dependencies = {
    "nvim-telescope/telescope.nvim",
  },
  -- opts will be merged with the parent spec
  opts = { use_diagnostic_signs = true },
  keys = {
    {
      "<C-t>",
      function()
        local actions = require("telescope.actions")
        local trouble = require("trouble.providers.telescope")
        local telescope = require("telescope")

        trouble.open_with_trouble()
      end,
    },
    {
      "<C-t>",
      function()
        local actions = require("telescope.actions")
        local trouble = require("trouble.providers.telescope")
        local telescope = require("telescope")

        trouble.open_with_trouble()
      end,
      mode = "i",
    },
  },
}
