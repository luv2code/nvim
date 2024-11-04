return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function ()
		local harpoon = require("harpoon")

		-- REQUIRED
		harpoon:setup()
		-- REQUIRED

		vim.keymap.set("n", "<leader>lx", function() harpoon:list():add() end, { desc = "Add mark (Harpoon)" })
		vim.keymap.set("n", "<leader>ll", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Open menu (Harpoon)" })

		vim.keymap.set("n", "<leader>la", function() harpoon:list():select(1) end, { desc = "Open mark 1 (Harpoon)" })
		vim.keymap.set("n", "<leader>ls", function() harpoon:list():select(2) end, { desc = "Open mark 2 (Harpoon)" })
		vim.keymap.set("n", "<leader>ld", function() harpoon:list():select(3) end, { desc = "Open mark 3 (Harpoon)" })
		vim.keymap.set("n", "<leader>lf", function() harpoon:list():select(4) end, { desc = "Open mark 4 (Harpoon)" })

		-- Toggle previous & next buffers stored within Harpoon list
		vim.keymap.set("n", "<leader>lp", function() harpoon:list():prev() end, { desc = "Previous mark (Harpoon)" })
		vim.keymap.set("n", "<leader>ln", function() harpoon:list():next() end, { desc = "Next mark (Harpoon)" })
	end,
}
