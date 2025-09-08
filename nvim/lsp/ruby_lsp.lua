local capabilities = require("cmp_nvim_lsp").default_capabilities()
return {
  -- This shell/sh command around bundle helps it find the right executable
  -- cmd = { "sh", "-c", "bundle exec ruby-lsp" },
  capabilities = capabilities,
}
