return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        config = function() require("telescope").load_extension("fzf") end,
      },
    },
  },
  {
    "nvim-telescope/telescope-live-grep-args.nvim",
    config = function() require("telescope").load_extension("live_grep_args") end,
  },
  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = {
      { "nvim-telescope/telescope.nvim" },
    },
    config = function()
      local telescope = require("telescope")

      telescope.load_extension("file_browser")
      telescope.setup = {
        extensions = {
          file_browser = {
            hijack_netrw = true,
          }
        }
      }
    end,
  },
}
