require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- Sistema
map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>", { desc = "Save file" })

-- Debugging (DAP)
map("n", "<leader>db", "<cmd>DapToggleBreakpoint<CR>", { desc = "Add breakpoint at line" })
map("n", "<leader>dr", "<cmd>DapContinue<CR>", { desc = "Start or continue debugger" })
map("n", "<leader>du", function() require("dapui").toggle() end, { desc = "Toggle Debug UI" })
map("n", "<leader>dt", function() require("dap").terminate() end, { desc = "Terminate debugger" })
map("n", "<F10>", function() require("dap").step_over() end, { desc = "Step Over" })

-- Python & Rust
map("n", "<leader>vs", "<cmd>VenvSelect<cr>", { desc = "Select VirtualEnv" })
map("n", "<leader>gm", "<cmd>CodeCompanionChat gemini<cr>", { desc = "Gemini AI Chat" })
-- Nota: 'gl' (Verificar Erro) e 'Space ra' (Renomear) já são padrões ou LSP defaults, 
-- mas 'Space /' (Comentar) é padrão do NvChad.

-- Janelas / Visual
map("n", "<leader>z", "<cmd>ZenMode<cr>", { desc = "Zen Mode (Focar Código)" })