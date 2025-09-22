local pid = vim.fn.getpid()
return {
  cmd = {
    vim.fn.stdpath "data" .. "/mason/packages/omnisharp/omnisharp",
    "--languageserver",
    "--hostPID",
    tostring(pid),
  },
  settings = {
    formattingOptions = {
      enableEditorConfigSupport = true,
      indentationSize = 2,
      insertSpaces = true,
      organizeImports = true,
      tabSize = 2,
      useTabs = false,
    },
  },
}
