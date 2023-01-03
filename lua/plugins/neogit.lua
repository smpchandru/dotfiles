local M = {
	"TimUntersberger/neogit",
	dependencies = {
		{
			"sindrets/diffview.nvim",
			cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles" },
		},
	},
	config = {
		disable_signs = false,
		disable_context_highlighting = false,
		disable_commit_confirmation = false,
		-- customize displayed signs
		signs = {
			-- { CLOSED, OPENED }
			section = { ">", "v" },
			item = { ">", "v" },
			hunk = { "", "" },
		},
		integrations = {
			diffview = true,
		},
		-- override/add mappings
		mappings = {
			-- modify status buffer mappings
			status = {
				-- Adds a mapping with "B" as key that does the "BranchPopup" command
				["B"] = "BranchPopup",
			},
		},
	},
}
return M