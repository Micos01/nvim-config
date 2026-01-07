require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")


map("n", "<leader>db", "<cmd>DapToggleBreakpoint<CR>", { desc = "Add breakpoint at line" })
map("n", "<leader>dr", "<cmd>DapContinue<CR>", { desc = "Start or continue debugger" })
map("n", "<leader>du", function() require("dapui").toggle() end, { desc = "Toggle Debug UI" })


-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
