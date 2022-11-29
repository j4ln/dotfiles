local status_ok, nvim_tree = pcall(require, 'nvim-tree')
if not status_ok then
	return
end

local config_status_ok, nvim_tree_config = pcall(require, 'nvim-tree.config')
if not config_status_ok then
	return
end

local tree_cb = nvim_tree_config.nvim_tree_callback

nvim_tree.setup {
	disable_netrw = true,
	hijack_netrw = true,
	update_cwd = true,
	view = {
	mappings = {
		custom_only = false,
			list = {
				{ key = "<S-v>", cb = tree_cb "split"},
				{ key = "v", cb = tree_cb "vsplit" },
			},
		},
	},
	update_focused_file = {
		enable = true,
		update_cwd = true,
		ignore_list = {},
	},
	ignore_ft_on_setup = {
		"alpha",
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
