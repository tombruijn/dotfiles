vim.filetype.add({
  extension = {
    -- Add alias for mdx to markdown to enable syntax highlighting
    mdx = "markdown",
    gitconfig = "gitconfig",
  },
})

vim.filetype.add({
  filename = {
    Brewfile = "ruby",
  },
})
