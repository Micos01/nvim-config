local lspconfig = require "lspconfig"
local nvlsp = require "nvchad.configs.lspconfig"

-- Lista de servidores para configuração padrão (TS, Python, etc)
local servers = { "vtsls", "basedpyright", "ruff_format", "taplo", "html", "cssls" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end 
