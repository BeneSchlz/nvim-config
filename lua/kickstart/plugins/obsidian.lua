return {
	"obsidian-nvim/obsidian.nvim",
	version = "*",
	lazy = false, -- Load immediately to avoid timing issues
	ft = "markdown",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	opts = {
		workspaces = {
			{
				name = "vault",
				path = "~/vault_obsidian/",
			},
			{
				name = "justhome",
				path = "~/justhome/",
			},
		},
		completion = {
			nvim_cmp = false,
			blink = true,
			min_chars = 2,
			create_new = true,
		},
		preferred_link_style = "wiki",
		disable_frontmatter = true,
		new_notes_location = "current_dir",
		note_id_func = function(title)
			return title ~= nil and title or "Untitled"
		end,
		daily_notes = {
			folder = "daily",
			date_format = "%Y-%m-%d",
		},
		picker = {
			name = "telescope.nvim",
			note_mappings = {
				new = "<C-x>",
				insert_link = "<C-l>",
			},
		},
		ui = { enable = false },
		checkbox = { order = { " ", "x" } },
		sort_by = "modified",
		sort_reversed = true,
		attachments = {
			img_folder = "images",
			confirm_img_paste = true,
		},
	},
	config = function()
		-- Only put custom code here, not the setup call
		vim.api.nvim_create_user_command("ObNew", function(cmd_opts)
			local title = table.concat(cmd_opts.fargs, " ")
			vim.api.nvim_cmd({
				cmd = "Obsidian",
				args = { "new", title },
			}, {})
		end, { nargs = "+" })
	end,
}
