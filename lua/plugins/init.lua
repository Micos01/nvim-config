return {
  -- Suporte avançado para Rust (LSP, Debug, Cargo.toml)
  {
    "mrcjkb/rustaceanvim",
    version = "^4", -- Versão recomendada para 2026
    ft = { "rust" },
  },

  -- Ferramentas de Python e IA (Opcional, mas recomendado em 2026)
  {
    "linux-cultist/venv-selector.nvim",
    dependencies = { "neovim/nvim-lspconfig", "nvim-telescope/telescope.nvim", "mfussenegger/nvim-dap-python" },
    opts = { name = "venv" },
    event = "VeryLazy",
  },

  -- Debugging (DAP) - Essencial para Tauri
{
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
    },
    config = function(_, opts)
      local mason_path = vim.fn.stdpath("data") .. "/mason/packages/debugpy/venv"
      local python_path = ""

      if vim.fn.has("win32") == 1 then
        -- Caminho Windows
        python_path = mason_path .. "/Scripts/python.exe"
      else
        -- Caminho Linux (WSL)
        python_path = mason_path .. "/bin/python"
      end

      require("dap-python").setup(python_path)
    end,
  },
  
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"},
    config = function()
      require("dapui").setup()
    end
  },

  -- Formatação (Conform.nvim) - O NvChad já costuma vir com ele, 
  -- mas certifique-se de configurar Rust e Python:
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        rust = { "rustfmt" },
        python = { "ruff_format" },
        typescript = { "prettier" },
        typescriptreact = { "prettier" },
      },
    },
  },

  -- Zen Mode (Focar Código)
  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    opts = {
      window = {
        backdrop = 0.95,
        width = 120, 
      },
    },
  },

  -- Gemini AI (CodeCompanion)
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {
      strategies = {
        chat = {
          adapter = "gemini",
        },
        inline = {
          adapter = "gemini",
        },
        agent = {
          adapter = "gemini",
        },
      },
    },
  },
}

