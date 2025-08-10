return {
  {
    "L3MON4D3/LuaSnip",
    version = "v2.*",
    dependencies = {
      "saadparwaiz1/cmp_luasnip", -- nvim-cmp source for luasnip
    },
    config = function()
      local luasnip = require("luasnip")
      luasnip.setup({
        history = true,
        delete_check_events = "TextChanged",
        cut_selection_keys = true,
      })
      require("luasnip.loaders.from_vscode").lazy_load({
        paths = { vim.fn.stdpath("config") .. "/snippets" },
      })
      -- Normal and selection mode keymaps for expanding and jump forward in a snippet
      vim.keymap.set({ "i", "s" }, "<C-M>", function()
        if luasnip.jumpable() then
          vim.notify("Jumped to next snippet position")
          luasnip.jump(1)
        elseif luasnip.expandable() then
          vim.notify("Expanded snippet")
          luasnip.expand()
        else
          vim.notify("No snippet action")
        end
      end, { desc = "Expand or jump next", silent = true })
      -- Normal and insert mode keymaps for jumping back in snippet placeholders
      vim.keymap.set({ "i", "s" }, "<C-,>", function()
        vim.notify("Jumped back to previous snippet position")
        luasnip.jump(-1)
      end, { desc = "Jump back", silent = true })
      -- Special keymap for visual mode to expand the snippet and use the selection in the snippet
      -- Source: https://github.com/L3MON4D3/LuaSnip/blob/de10d8414235b0a8cabfeba60d07c24304e71f5c/doc/luasnip.txt#L3532-L3545
      vim.keymap.set(
        "v",
        "<C-M>",
        [[<Esc><cmd>lua require("luasnip.util.select").pre_yank("z")<Cr>gv"zs<cmd>lua require('luasnip.util.select').post_yank("z")<Cr>]],
        { desc = "Expand snippet on selection" }
      )

      vim.keymap.set("i", "<C-n>", "<Plug>luasnip-next-choice", {})
      vim.keymap.set("s", "<C-n>", "<Plug>luasnip-next-choice", {})
      vim.keymap.set("i", "<C-p>", "<Plug>luasnip-prev-choice", {})
      vim.keymap.set("s", "<C-p>", "<Plug>luasnip-prev-choice", {})
    end,
  },
}
