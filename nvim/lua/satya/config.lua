vim.opt.clipboard = "unnamedplus"
vim.wo.number = true
vim.wo.relativenumber = true


-- setting custom file types
vim.cmd[[autocmd BufRead, BufNewFile *.templ set filetype=html]]
