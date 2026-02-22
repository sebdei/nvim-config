# Add new Language server

1. Add a new lua files to this directory using configurations on configs of [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md)
2. Go to `/lua/plugins/lspconfig.lua` and add the new language to the `language_servers` list in `opts`
3. Install language server using Mason e.g. :MasonInstall 
