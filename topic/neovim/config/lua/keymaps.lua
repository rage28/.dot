local nnoremap = function(lhs, rhs, silent)
  vim.api.nvim_set_keymap("n", lhs, rhs, { noremap = true, silent = silent })
end

local inoremap = function(lhs, rhs, silent)
  vim.api.nvim_set_keymap("i", lhs, rhs, { noremap = true, silent = silent })
end

local snoremap = function(lhs, rhs, silent)
  vim.api.nvim_set_keymap("s", lhs, rhs, { noremap = true, silent = silent })
end

local vnoremap = function(lhs, rhs)
  vim.api.nvim_set_keymap("v", lhs, rhs, { noremap = true })
end

-- page scroll and center
nnoremap("<C-d>", "<C-d>zz", true)
nnoremap("<C-u>", "<C-u>zz", true)

-- search and center
nnoremap("n", "nzzzv", true)
nnoremap("N", "Nzzzv", true)

return {
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      { "<leader>ff", ":Telescope find_files<CR>", desc = "Find files", silent = true },
      { "<leader>fg", ":Telescope git_files<CR>", desc = "Find in git repo", silent = true },
      { "<leader>fb", ":Telescope file_browser path=%:p:h select_buffer=true<CR>", desc = "Find in git repo", silent = true },
    },
  },
  {
    "nvim-telescope/telescope-live-grep-args.nvim",
    keys = {
      { "<leader>f/", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>", desc = "Fine files via grep" },
    },
  },
}
