local vimLastplace = pRequire("vim-lastplace")

if vimLastplace then
  vim.g.nvim_lastplace = {
    ignore_buftype = { "quickfix", "nofile", "help" },
    ignore_filetype = { "gitcommit", "gitrebase", "svn", "hgcommit" },
    open_folds = true,
  }
end
