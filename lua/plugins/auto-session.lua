return {
	{
		"rmagatti/auto-session",
		opts = {
			log_level = "error",
			auo_session_enabled = true,
			auto_session_create_enabled = true,
			auto_save_enabled = true,
			auto_restore_enabled = true,
			-- auto_session_allowed_dirs = {"~/.config", "~/the_odin_project/", "~/shopify/", "~/JavaProjects/"},
			auto_session_suppress_dirs = { "~" },
			cwd_change_handling = {
				post_cwd_changed_hook = function() -- example refreshing the lualine status line _after_ the cwd changes
					require("lualine").refresh() -- refresh lualine so the new session name is displayed in the status bar
				end,
			},
			lazy_support = true,
		},
		config = function(_, opts)
			require("auto-session").setup(opts)
		end,
	},
}
