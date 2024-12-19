-- Enable inlay hints by default in rust files
-- Source: https://github.com/neovim/neovim/discussions/28806
local bufnr = vim.api.nvim_get_current_buf()
if vim.lsp.inlay_hint then
  vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
      -- Wait for LSP server to start (just to be sure)
      vim.defer_fn(function() vim.lsp.inlay_hint.enable(true, {bufnr = bufnr}) end, 1000)
    end,
  })
end
