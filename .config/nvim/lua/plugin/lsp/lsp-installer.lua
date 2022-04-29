local status_ok, lsp_installer = pcall(require, 'nvim-lsp-installer')
if not status_ok then
	return
end

-- Register a handler to call for all installed servers
lsp_installer.on_server_ready(function(server)
	local opts = {
		on_attach = require('plugin.lsp.handlers').on_attach,
		capabilities = require('plugin.lsp.handlers').capabilities,
	}

	if server.name == "sumneko_lua" then
		local sumneko_opts = require('plugin.lsp.settings.sumneko_lua')
		opts = vim.tbl_deep_extend('force', sumneko_opts, opts)
	end

	-- The setup() function is exactly the same as lspconfig's setup function
	-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
	server:setup(opts)
end)
