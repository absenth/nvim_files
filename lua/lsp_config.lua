vim.cmd [[ packadd completion-nvim ]]

local lsp = require('lspconfig')
local completion = require('completion')

local mapper = function(mode, key, result)
    vim.api.nvim_buff_set_keymap(0, mode, key, "<cmd>lua "..result.." <cr>", {noremap = true, silent = true})
end

local custom_attach = function()
    completion.on_attach()
    -- move cursorto next and previous diagnostic
    mapper('n', '<leader>dn', 'vim.lsp.diagnostic.goto_next()')
    mapper('n', '<leader>dp', 'vim.lsp.diagnostic.goto_prev()')
end

