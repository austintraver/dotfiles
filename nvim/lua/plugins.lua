-- local use = require('packer').use
local opts = { noremap = true, silent = true }

-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
local servers = {'rust_analyzer'} -- {'clangd' 'tsserver'}
for _, lsp in ipairs(servers) do
        require('lspconfig')[lsp].setup {
                -- on_attach = my_custom_on_attach,
                on_attach = on_attach,
                capabilities = capabilities,
                flags = { 
                        -- This will be the default in neovim 0.7+ 
                        debounce_text_changes = 150, 
                }

        }
end
