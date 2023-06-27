local status_ok, nvim_tree = pcall(require, 'nvim-tree')
if not status_ok then
	return
end

local api_status_ok, api = pcall(require, 'nvim-tree.api')
if not api_status_ok then
	return
end

local function on_attach(bufnr)
	local function opts(desc)
		return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
	end

	api.config.mappings.default_on_attach(bufnr)
	vim.keymap.set('n', '<S-v>', api.node.open.horizontal, opts('Open: Horizontal Split'))
	vim.keymap.set('n', 'v', api.node.open.vertical, opts('Open: Vertical Split'))
end

nvim_tree.setup {
	disable_netrw = true,
	hijack_netrw = true,
	update_cwd = true,
	on_attach = on_attach,
	update_focused_file = {
		enable = true,
		update_cwd = true,
		ignore_list = {},
	},
	diagnostics = {
		enable = true,
	},
	filters = {
		custom = {
			"^\\.git$",
		},
	},
	actions = {
		open_file = {
			resize_window = true,
		},
	},
	trash = {
		cmd = "gio trash",
		require_confirm = true,
	},
	renderer = {
		icons = {
			glyphs = {
				default = "",
				symlink = "",
				git = {
					unstaged = "",
					staged = "S",
					unmerged = "",
					renamed = "➜",
					deleted = "",
					untracked = "U",
					ignored = "◌",
				},
				folder = {
					default = "",
					open = "",
					empty = "",
					empty_open = "",
					symlink = "",
				},
			},
		},
	},
}
