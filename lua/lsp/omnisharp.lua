local pid = vim.fn.getpid()
return {
  cmd = { vim.fn.stdpath("data") .. "/mason/packages/omnisharp/omnisharp", '--languageserver', '--hostPID', tostring(pid) },
}
