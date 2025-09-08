local capabilities = require("cmp_nvim_lsp").default_capabilities()
return {
  capabilities = capabilities,
  settings = {
    ["harper-ls"] = {
      userDictPath = _G.harper_dictionary_path(),
      linters = {
        ToDoHyphen = false,
      },
    },
  },
}
