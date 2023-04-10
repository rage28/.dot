local opt = vim.opt

-- general
opt.autowrite = true -- Enable auto write
opt.termguicolors = true -- True color support

-- line numbering
opt.number = true
opt.relativenumber = true

-- syntax
opt.smartcase = true -- Do not ignore case with capitals
opt.smartindent = true -- Insert indents automatically
opt.cursorline = true -- Highlight current line
opt.expandtab = true -- Use spaces instead of tabs
opt.shiftwidth = 2 -- Indent size
opt.tabstop = 2 -- Number of spaces tabs to count for
opt.formatoptions = "jcroqlnt" -- tcqj format

-- completion
opt.completeopt = { "menu", "menuone", "noselect" }

-- others
vim.g.markdown_recommended_style = 0 -- Fix markdown indentation settings
